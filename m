Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFF6AFA06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 00:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWWG73ymVz3f41
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 10:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=XFdlLT2q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=XFdlLT2q;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWWFC5M8yz3bhJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 10:02:55 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C8E5F37E2EEAEC;
	Tue,  7 Mar 2023 17:02:50 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id FQPbnyViRQ7x; Tue,  7 Mar 2023 17:02:50 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1F86237E2EEAE9;
	Tue,  7 Mar 2023 17:02:50 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1F86237E2EEAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678230170; bh=axszmPS1SmBEyyKijsv3+OMSLd1RAFJa3JJFkvUQwI8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=XFdlLT2qka19mnTWCsj/sl9oqo0ntBaB5VHTMYzIwyLPY68Wz1T5jHqui3lrhyvEU
	 jX2u7YKrSN/4422IImThgEcKjfjqr69ixYWSDLq8r9VwKdolFb9m+FphmKIkPyBcP+
	 wxvydTF/ddH9JzzgwxQ5sFqhu588WE3IqAOCKVB0=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ovDIoYhBbRA1; Tue,  7 Mar 2023 17:02:50 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id ECE3837E2EEAE6;
	Tue,  7 Mar 2023 17:02:49 -0600 (CST)
Date: Tue, 7 Mar 2023 17:02:48 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Message-ID: <1167019171.17313594.1678230168160.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] Check for IOMMU table validity in error handler
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC111 (Linux)/8.5.0_GA_3042)
Thread-Index: 16Rw4CWOU+ViWflRkxTny/P6bTpyWw==
Thread-Topic: Check for IOMMU table validity in error handler
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

If tce_iommu_take_ownership is unable to take ownership of
a specific IOMMU table, the unwinder in the error handler
could attempt to release ownership of an invalid table.

Check validity of each table in the unwinder before attempting
to release ownership.  Thanks to Alex Williamson for the initial
observation!

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/vfio/vfio_iommu_spapr_tce.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index 60a50ce8701e..c012ecb42ebc 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -1219,10 +1219,15 @@ static int tce_iommu_take_ownership(struct tce_container *container,
 
 		rc = iommu_take_ownership(tbl);
 		if (rc) {
-			for (j = 0; j < i; ++j)
-				iommu_release_ownership(
-						table_group->tables[j]);
+			for (j = 0; j < i; ++j) {
+				struct iommu_table *tbl =
+					table_group->tables[j];
 
+				if (!tbl || !tbl->it_map)
+					continue;
+
+				iommu_release_ownership(table_group->tables[j]);
+			}
 			return rc;
 		}
 	}
-- 
2.30.2
