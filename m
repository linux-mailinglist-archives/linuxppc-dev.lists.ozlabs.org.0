Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9631D3D74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 21:27:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NM4W5jWSzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 05:27:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=nl5WZ3PV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NLMj1DYgzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 04:55:28 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5BEC2076A;
 Thu, 14 May 2020 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589482526;
 bh=UCbMAnvwx/g0V4i48SPEWakU9xn/Zshm3MNAPzY7n98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nl5WZ3PVcrcMlV2pFRMKPM5S7dwW12XgUiO+Nj3xfJl7JaDVih6+tcjQu6K17B/8d
 rDiwano7soNmCMAE+eJMiGA0pj8No72FQGOfSLvH+KjvmtFZHwoUcUMsTZ/aLYC6Uz
 DQ749G8IOzhuf4YKBW2waoMh6Yh8CB623eX2b2nY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 21/39] scsi: ibmvscsi: Fix WARN_ON during event
 pool release
Date: Thu, 14 May 2020 14:54:38 -0400
Message-Id: <20200514185456.21060-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514185456.21060-1-sashal@kernel.org>
References: <20200514185456.21060-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tyrel Datwyler <tyreld@linux.ibm.com>

[ Upstream commit b36522150e5b85045f868768d46fbaaa034174b2 ]

While removing an ibmvscsi client adapter a WARN_ON like the following is
seen in the kernel log:

drmgr: drmgr: -r -c slot -s U9080.M9S.783AEC8-V11-C11 -w 5 -d 1
WARNING: CPU: 9 PID: 24062 at ../kernel/dma/mapping.c:311 dma_free_attrs+0x78/0x110
Supported: No, Unreleased kernel
CPU: 9 PID: 24062 Comm: drmgr Kdump: loaded Tainted: G               X 5.3.18-12-default
NIP:  c0000000001fa758 LR: c0000000001fa744 CTR: c0000000001fa6e0
REGS: c0000002173375d0 TRAP: 0700   Tainted: G               X (5.3.18-12-default)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28088282  XER: 20000000
CFAR: c0000000001fbf0c IRQMASK: 1
GPR00: c0000000001fa744 c000000217337860 c00000000161ab00 0000000000000000
GPR04: 0000000000000000 c000011e12250000 0000000018010000 0000000000000000
GPR08: 0000000000000000 0000000000000001 0000000000000001 c0080000190f4fa8
GPR12: c0000000001fa6e0 c000000007fc2a00 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: 000000011420e310 0000000000000000 0000000000000000 0000000018010000
GPR28: c00000000159de50 c000011e12250000 0000000000006600 c000011e5c994848
NIP [c0000000001fa758] dma_free_attrs+0x78/0x110
LR [c0000000001fa744] dma_free_attrs+0x64/0x110
Call Trace:
[c000000217337860] [000000011420e310] 0x11420e310 (unreliable)
[c0000002173378b0] [c0080000190f0280] release_event_pool+0xd8/0x120 [ibmvscsi]
[c000000217337930] [c0080000190f3f74] ibmvscsi_remove+0x6c/0x160 [ibmvscsi]
[c000000217337960] [c0000000000f3cac] vio_bus_remove+0x5c/0x100
[c0000002173379a0] [c00000000087a0a4] device_release_driver_internal+0x154/0x280
[c0000002173379e0] [c0000000008777cc] bus_remove_device+0x11c/0x220
[c000000217337a60] [c000000000870fc4] device_del+0x1c4/0x470
[c000000217337b10] [c0000000008712a0] device_unregister+0x30/0xa0
[c000000217337b80] [c0000000000f39ec] vio_unregister_device+0x2c/0x60
[c000000217337bb0] [c00800001a1d0964] dlpar_remove_slot+0x14c/0x250 [rpadlpar_io]
[c000000217337c50] [c00800001a1d0bcc] remove_slot_store+0xa4/0x110 [rpadlpar_io]
[c000000217337cd0] [c000000000c091a0] kobj_attr_store+0x30/0x50
[c000000217337cf0] [c00000000057c934] sysfs_kf_write+0x64/0x90
[c000000217337d10] [c00000000057be10] kernfs_fop_write+0x1b0/0x290
[c000000217337d60] [c000000000488c4c] __vfs_write+0x3c/0x70
[c000000217337d80] [c00000000048c648] vfs_write+0xd8/0x260
[c000000217337dd0] [c00000000048ca8c] ksys_write+0xdc/0x130
[c000000217337e20] [c00000000000b488] system_call+0x5c/0x70
Instruction dump:
7c840074 f8010010 f821ffb1 20840040 eb830218 7c8407b4 48002019 60000000
2fa30000 409e003c 892d0988 792907e0 <0b090000> 2fbd0000 419e0028 2fbc0000
---[ end trace 5955b3c0cc079942 ]---
rpadlpar_io: slot U9080.M9S.783AEC8-V11-C11 removed

This is tripped as a result of irqs being disabled during the call to
dma_free_coherent() by release_event_pool(). At this point in the code path
we have quiesced the adapter and it is overly paranoid to be holding the
host lock.

[mkp: fixed build warning reported by sfr]

Link: https://lore.kernel.org/r/1588027793-17952-1-git-send-email-tyreld@linux.ibm.com
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 07c23bbd968c5..83645a1c6f82e 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2299,16 +2299,12 @@ static int ibmvscsi_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 static int ibmvscsi_remove(struct vio_dev *vdev)
 {
 	struct ibmvscsi_host_data *hostdata = dev_get_drvdata(&vdev->dev);
-	unsigned long flags;
 
 	srp_remove_host(hostdata->host);
 	scsi_remove_host(hostdata->host);
 
 	purge_requests(hostdata, DID_ERROR);
-
-	spin_lock_irqsave(hostdata->host->host_lock, flags);
 	release_event_pool(&hostdata->pool, hostdata);
-	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 
 	ibmvscsi_release_crq_queue(&hostdata->queue, hostdata,
 					max_events);
-- 
2.20.1

