Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F5484593
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 16:55:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSxzH4YHfz3bhd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 02:55:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2ZXswZm9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=2ZXswZm9; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSxyZ02cWz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 02:55:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F191DB81716;
 Tue,  4 Jan 2022 15:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3537EC36AE9;
 Tue,  4 Jan 2022 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641311694;
 bh=biHEX3X1hiu8B4U2lZ3rsIg7VqX3ceREmxqvAchS3/s=;
 h=From:To:Cc:Subject:Date:From;
 b=2ZXswZm9iTOA241CvC6ePPkA4hAeiwxRNOKGEDFazRIuOxnVCGM9bxOX4rA3VhiWz
 QJwGo9QIyy952lyPRUyMq2zaPSZvQr9t6r3uVwizqsOD6EsRUDdd1IVv0HMo86vMDK
 DLl5e1eOYrjeQaOxVyWfAPTrW0ktUpwR1T0z24iU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/cacheinfo: use default_groups in kobj_type
Date: Tue,  4 Jan 2022 16:54:50 +0100
Message-Id: <20220104155450.1291277-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2193; h=from:subject;
 bh=biHEX3X1hiu8B4U2lZ3rsIg7VqX3ceREmxqvAchS3/s=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIlXck+Viv2o4LX4zCS7zOTRWbm055lfFAL3Xv5UWOdQ7nO4
 8550RywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAExE6BvD/Br3U4Zfl0e77jhWYePw3j
 N9R8itaIYFF3fbrVPx8ZRdfPj+24veDNsO+/EoAAA=
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
Cc: Parth Shah <parth@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the powerpc cacheinfo sysfs code to use default_groups
field which has been the preferred way since aa30f47cf666 ("kobject: Add
support for default attribute groups to kobj_type") so that we can soon
get rid of the obsolete default_attrs field.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Cc: Parth Shah <parth@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/kernel/cacheinfo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index cf1be75b7833..00b0992be3e7 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -710,7 +710,7 @@ static struct kobj_attribute cache_shared_cpu_list_attr =
 	__ATTR(shared_cpu_list, 0444, shared_cpu_list_show, NULL);
 
 /* Attributes which should always be created -- the kobject/sysfs core
- * does this automatically via kobj_type->default_attrs.  This is the
+ * does this automatically via kobj_type->default_groups.  This is the
  * minimum data required to uniquely identify a cache.
  */
 static struct attribute *cache_index_default_attrs[] = {
@@ -720,6 +720,7 @@ static struct attribute *cache_index_default_attrs[] = {
 	&cache_shared_cpu_list_attr.attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(cache_index_default);
 
 /* Attributes which should be created if the cache device node has the
  * right properties -- see cacheinfo_create_index_opt_attrs
@@ -738,7 +739,7 @@ static const struct sysfs_ops cache_index_ops = {
 static struct kobj_type cache_index_type = {
 	.release = cache_index_release,
 	.sysfs_ops = &cache_index_ops,
-	.default_attrs = cache_index_default_attrs,
+	.default_groups = cache_index_default_groups,
 };
 
 static void cacheinfo_create_index_opt_attrs(struct cache_index_dir *dir)
-- 
2.34.1

