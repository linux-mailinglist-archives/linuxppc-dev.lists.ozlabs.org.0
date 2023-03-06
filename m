Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 326696ACA8D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 18:33:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVlyz0hJQz3chS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 04:32:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=PiV7TdGr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=PiV7TdGr;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVlxJ3Rd8z3f4C
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 04:31:32 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BF64737E2D6111;
	Mon,  6 Mar 2023 11:31:29 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SmH_P4v-Vbwj; Mon,  6 Mar 2023 11:31:29 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0AAB037E2D610E;
	Mon,  6 Mar 2023 11:31:29 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0AAB037E2D610E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678123889; bh=fTU8lI8Un7GOGF+BJicHxq+cOFMCDRta41UtYHK65M0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=PiV7TdGr8IO82iim6h2i3e1dweRFs3Ez0um5+JxUVhcNp/hijecIMQpaBGOivT6GA
	 TuU5CaDqM5dO8d/Ynk2UM2qUlbfLnCNJauVdKA9W1at+xrlpu8Is1vf4l2swJFwpj+
	 +ji3t8sWm4pG2waH4jHQ9XT4X4YgtlHWgou0r3UE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MEEI5Y3J0Rx7; Mon,  6 Mar 2023 11:31:28 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E327937E2D6101;
	Mon,  6 Mar 2023 11:31:28 -0600 (CST)
Date: Mon, 6 Mar 2023 11:31:28 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Message-ID: <256219069.16998525.1678123888896.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 4/4] Add myself to MAINTAINERS for Power VFIO support
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC110 (Linux)/8.5.0_GA_3042)
Thread-Index: AKxleKwX8tG6hTXHlIF77Cy3UrdaGA==
Thread-Topic: Add myself to MAINTAINERS for Power VFIO support
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d5bc223f305..876f96e82d66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9836,6 +9836,11 @@ F:	drivers/crypto/vmx/ghash*
 F:	drivers/crypto/vmx/ppc-xlate.pl
 F:	drivers/crypto/vmx/vmx.c
 
+IBM Power VFIO Support
+M:	Timothy Pearson <tpearson@raptorengineering.com>
+S:	Supported
+F:	drivers/vfio/vfio_iommu_spapr_tce.c
+
 IBM ServeRAID RAID DRIVER
 S:	Orphan
 F:	drivers/scsi/ips.*
-- 
2.30.2
