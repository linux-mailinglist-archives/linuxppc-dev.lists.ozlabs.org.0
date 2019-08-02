Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F197FBDE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 16:15:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Thm4kThzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 00:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="2A+t2vxa"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Scm2fpjzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 23:27:04 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43CF321874;
 Fri,  2 Aug 2019 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564752422;
 bh=J5CYI7fhl0cw3YAPWG669inFrbneWOgsZL6tUna83Ic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2A+t2vxa9SVKT4/ktw0/XJsDG8RsuuBhX3D6g41YcotEzQo3PPRJjECQQdn9gekrG
 cc6mNFGL2vasXdV/EXW4u4cbwlVRCtTN0vpGcALnPGggX3h7PzLLqprMFHNZVlH5Dq
 52X1bet6szFkkoWnAFWZ1ksXZBAV6y+Y4If3HzwY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 15/17] scsi: ibmvfc: fix WARN_ON during event pool
 release
Date: Fri,  2 Aug 2019 09:26:32 -0400
Message-Id: <20190802132635.14885-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132635.14885-1-sashal@kernel.org>
References: <20190802132635.14885-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

[ Upstream commit 5578257ca0e21056821e6481bd534ba267b84e58 ]

While removing an ibmvfc client adapter a WARN_ON like the following
WARN_ON is seen in the kernel log:

WARNING: CPU: 6 PID: 5421 at ./include/linux/dma-mapping.h:541
ibmvfc_free_event_pool+0x12c/0x1f0 [ibmvfc]
CPU: 6 PID: 5421 Comm: rmmod Tainted: G            E     4.17.0-rc1-next-20180419-autotest #1
NIP:  d00000000290328c LR: d00000000290325c CTR: c00000000036ee20
REGS: c000000288d1b7e0 TRAP: 0700   Tainted: G            E      (4.17.0-rc1-next-20180419-autotest)
MSR:  800000010282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44008828  XER: 20000000
CFAR: c00000000036e408 SOFTE: 1
GPR00: d00000000290325c c000000288d1ba60 d000000002917900 c000000289d75448
GPR04: 0000000000000071 c0000000ff870000 0000000018040000 0000000000000001
GPR08: 0000000000000000 c00000000156e838 0000000000000001 d00000000290c640
GPR12: c00000000036ee20 c00000001ec4dc00 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 00000100276901e0 0000000010020598
GPR20: 0000000010020550 0000000010020538 0000000010020578 00000000100205b0
GPR24: 0000000000000000 0000000000000000 0000000010020590 5deadbeef0000100
GPR28: 5deadbeef0000200 d000000002910b00 0000000000000071 c0000002822f87d8
NIP [d00000000290328c] ibmvfc_free_event_pool+0x12c/0x1f0 [ibmvfc]
LR [d00000000290325c] ibmvfc_free_event_pool+0xfc/0x1f0 [ibmvfc]
Call Trace:
[c000000288d1ba60] [d00000000290325c] ibmvfc_free_event_pool+0xfc/0x1f0 [ibmvfc] (unreliable)
[c000000288d1baf0] [d000000002909390] ibmvfc_abort_task_set+0x7b0/0x8b0 [ibmvfc]
[c000000288d1bb70] [c0000000000d8c68] vio_bus_remove+0x68/0x100
[c000000288d1bbb0] [c0000000007da7c4] device_release_driver_internal+0x1f4/0x2d0
[c000000288d1bc00] [c0000000007da95c] driver_detach+0x7c/0x100
[c000000288d1bc40] [c0000000007d8af4] bus_remove_driver+0x84/0x140
[c000000288d1bcb0] [c0000000007db6ac] driver_unregister+0x4c/0xa0
[c000000288d1bd20] [c0000000000d6e7c] vio_unregister_driver+0x2c/0x50
[c000000288d1bd50] [d00000000290ba0c] cleanup_module+0x24/0x15e0 [ibmvfc]
[c000000288d1bd70] [c0000000001dadb0] sys_delete_module+0x220/0x2d0
[c000000288d1be30] [c00000000000b284] system_call+0x58/0x6c
Instruction dump:
e8410018 e87f0068 809f0078 e8bf0080 e8df0088 2fa30000 419e008c e9230200
2fa90000 419e0080 894d098a 794a07e0 <0b0a0000> e9290008 2fa90000 419e0028

This is tripped as a result of irqs being disabled during the call to
dma_free_coherent() by ibmvfc_free_event_pool(). At this point in the code path
we have quiesced the adapter and its overly paranoid anyways to be holding the
host lock.

Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 1f9f9e5af2072..0526a47e30a3f 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -4869,8 +4869,8 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	ibmvfc_purge_requests(vhost, DID_ERROR);
-	ibmvfc_free_event_pool(vhost);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+	ibmvfc_free_event_pool(vhost);
 
 	ibmvfc_free_mem(vhost);
 	spin_lock(&ibmvfc_driver_lock);
-- 
2.20.1

