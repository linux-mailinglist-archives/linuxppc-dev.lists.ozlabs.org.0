Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A474845D8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 17:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSyNV3D2Pz3bY9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 03:14:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pYHLsyIm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=pYHLsyIm; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSyMr33pMz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 03:13:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6552B81732;
 Tue,  4 Jan 2022 16:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22AAC36AED;
 Tue,  4 Jan 2022 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641312803;
 bh=SYOuq4QCCHRXMqkBPeDi3N8aojaaAmUTN11Y3EnSLFw=;
 h=From:To:Cc:Subject:Date:From;
 b=pYHLsyIm8sARB68IALsDq2lM3CKxWn0HOloWJV3XcM4qEMMoYkv2dcGfky+i0LQbc
 V1M1BIUHVg8Lqhn6T9xTLvtxY4KfqG7lf+VDq2jpgMfyOcX4eaSEwyYQMnBekJIS2g
 8SRn8ewVsVk2FZH1j7J5hW5/HDl0+Jk2ot0Ls1hs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/opal: use default_groups in kobj_type
Date: Tue,  4 Jan 2022 17:13:18 +0100
Message-Id: <20220104161318.1306023-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; h=from:subject;
 bh=SYOuq4QCCHRXMqkBPeDi3N8aojaaAmUTN11Y3EnSLFw=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIlXimSKZzZG+yy2btCZqf84QsThxyN37qzlcya9+bVsoo3Z
 a1f9jlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIiQ0M82zfLUqMnKpaOVWOXT/89Y
 LI3d+v7GOYZ2MqfORJ7oMAySLG9TpRi1fKT1n/BgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the powerpc opal dump and elog sysfs code to use
default_groups field which has been the preferred way since aa30f47cf666
("kobject: Add support for default attribute groups to kobj_type") so
that we can soon get rid of the obsolete default_attrs field.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/platforms/powernv/opal-dump.c | 3 ++-
 arch/powerpc/platforms/powernv/opal-elog.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 717d1d30ade5..410ed5b9de29 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -208,11 +208,12 @@ static struct attribute *dump_default_attrs[] = {
 	&ack_attribute.attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(dump_default);
 
 static struct kobj_type dump_ktype = {
 	.sysfs_ops = &dump_sysfs_ops,
 	.release = &dump_release,
-	.default_attrs = dump_default_attrs,
+	.default_groups = dump_default_groups,
 };
 
 static int64_t dump_read_info(uint32_t *dump_id, uint32_t *dump_size, uint32_t *dump_type)
diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 5821b0fa8614..554fdd7f88b8 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -144,11 +144,12 @@ static struct attribute *elog_default_attrs[] = {
 	&ack_attribute.attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(elog_default);
 
 static struct kobj_type elog_ktype = {
 	.sysfs_ops = &elog_sysfs_ops,
 	.release = &elog_release,
-	.default_attrs = elog_default_attrs,
+	.default_groups = elog_default_groups,
 };
 
 /* Maximum size of a single log on FSP is 16KB */
-- 
2.34.1

