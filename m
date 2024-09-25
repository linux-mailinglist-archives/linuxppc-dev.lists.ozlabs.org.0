Return-Path: <linuxppc-dev+bounces-1585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14565985A86
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 14:08:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDFrB5ZPvz2yL0;
	Wed, 25 Sep 2024 22:08:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727266122;
	cv=none; b=NVsk32877Vt+WDII4hsAvXQCLv4FLfQwO0v45/6gVH10oRv8fKsWXk6C3aI79xFngOjCWkkjtKOKa2GmAxwmsbh1pfiaE0xmBFHWMfsuz95Bleg8kCq5UE/yCDkyqx6JyenG0HXK7Z3qt29SGXCWnNLSCQpnCbUexiy8Vje8GTmF0yZavymYsrTZNVe+mmtlmjXL+GZOewixVAo8m5YgngyJ77oeXkKXlOs5jKvUklENxoaE081dP4VWtPYFWvljdjLwt7VX+cbQ28WTdabl1YQQWv1LjBCiK/qFz29HGTcmy6eAk8ND40TVbNrz7PGAw37aUenBz6K+wDFVYI00DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727266122; c=relaxed/relaxed;
	bh=m3RUqadWXx1a/47arDRgAjYVT0SBSelO4eFMcbm+vLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3HNCmnR25aFTbujjBYkhZZcnVdDtFxCy9cPOdpeztdWrlex9EYGGxXYLjtJFCHxo/jioIdhuKvr/Q5cpcDi9kRJbv+6QUalehoXf3OoCJ46wrD8r2SC0tuRtRrEKjpysMUVCYM6Vv9wyczzIpblv4ipEjsygynFVb+CjjcViJqysggtLSYVkZ+gUJIn4azIQ+HVxLIHjEqT38B+vjq+oHaPF5Z07pkPs9OY2yvPTWQBDe3P/2plEXR1k9SkU0Rxbdk6eDUsmg3XeWQxZ77BeIZxFuSQJv29e/4kym5r6OKwL0IlJVBB9DYq7VjgrRNzk+7+lxeWFt58sa9XIf1UBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XLYJsA1r; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XLYJsA1r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDFrB2HfSz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 22:08:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA1C0A4415B;
	Wed, 25 Sep 2024 12:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFE3C4CECD;
	Wed, 25 Sep 2024 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266119;
	bh=dbDoaenS2JiEt3m25szAgyBcrRLV6AE6DACT1SCRILc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XLYJsA1rpsbcXagiD/T3093EscnIeZu31T5lnIkDJ1YSYO0231LSOan1eaUB14brT
	 mygVtcY2z7JPfHIgbKWPm246MbSAgziOkGsVD7SN6WnBXokelu7+74y+mUdoETkxow
	 mFTxEUGqBA1jw+cLmdf96JpftNXQqwEr6G6Hj1c7qYNo1K2+rAXywdZxnb+KP2BIrT
	 0TZbYrF3S4FlAxZOldfsO5J+d427fNecJpQFbPt103dme5B2Haxm9JlmvXo6px5b8+
	 OzwfQJHzF8OoZjRrLlNYmn0pH/rz+TMrxe1Bc/tqkceTG95ggvn9AccFCmhTxc5jYk
	 FUEBgJTcR4uVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Haren Myneni <haren@linux.ibm.com>,
	kernel test robot <lkp@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	nathanl@linux.ibm.com,
	bgray@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.10 178/197] powerpc/pseries: Use correct data types from pseries_hp_errorlog struct
Date: Wed, 25 Sep 2024 07:53:17 -0400
Message-ID: <20240925115823.1303019-178-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit

From: Haren Myneni <haren@linux.ibm.com>

[ Upstream commit b76e0d4215b6b622127ebcceaa7f603313ceaec4 ]

_be32 type is defined for some elements in pseries_hp_errorlog
struct but also used them u32 after be32_to_cpu() conversion.

Example: In handle_dlpar_errorlog()
hp_elog->_drc_u.drc_index = be32_to_cpu(hp_elog->_drc_u.drc_index);

And later assigned to u32 type
dlpar_cpu() - u32 drc_index = hp_elog->_drc_u.drc_index;

This incorrect usage is giving the following warnings and the
patch resolve these warnings with the correct assignment.

arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse: sparse:
incorrect type in argument 1 (different base types) @@
expected unsigned int [usertype] drc_index @@
got restricted __be32 [usertype] drc_index @@
...
arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse: sparse:
incorrect type in assignment (different base types) @@
expected restricted __be32 [usertype] drc_count @@
got unsigned int [usertype] @@

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408182142.wuIKqYae-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202408182302.o7QRO45S-lkp@intel.com/
Signed-off-by: Haren Myneni <haren@linux.ibm.com>

v3:
- Fix warnings from using incorrect data types in pseries_hp_errorlog
  struct
v2:
- Remove pr_info() and TODO comments
- Update more information in the commit logs

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240822025028.938332-1-haren@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/dlpar.c          | 17 -----------------
 arch/powerpc/platforms/pseries/hotplug-cpu.c    |  2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c | 16 ++++++++--------
 arch/powerpc/platforms/pseries/pmem.c           |  2 +-
 4 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 47f8eabd1bee3..9873b916b2370 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -334,23 +334,6 @@ int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_elog)
 {
 	int rc;
 
-	/* pseries error logs are in BE format, convert to cpu type */
-	switch (hp_elog->id_type) {
-	case PSERIES_HP_ELOG_ID_DRC_COUNT:
-		hp_elog->_drc_u.drc_count =
-				be32_to_cpu(hp_elog->_drc_u.drc_count);
-		break;
-	case PSERIES_HP_ELOG_ID_DRC_INDEX:
-		hp_elog->_drc_u.drc_index =
-				be32_to_cpu(hp_elog->_drc_u.drc_index);
-		break;
-	case PSERIES_HP_ELOG_ID_DRC_IC:
-		hp_elog->_drc_u.ic.count =
-				be32_to_cpu(hp_elog->_drc_u.ic.count);
-		hp_elog->_drc_u.ic.index =
-				be32_to_cpu(hp_elog->_drc_u.ic.index);
-	}
-
 	switch (hp_elog->resource) {
 	case PSERIES_HP_ELOG_RESOURCE_MEM:
 		rc = dlpar_memory(hp_elog);
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index e62835a12d73f..6838a0fcda296 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -757,7 +757,7 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
 	u32 drc_index;
 	int rc;
 
-	drc_index = hp_elog->_drc_u.drc_index;
+	drc_index = be32_to_cpu(hp_elog->_drc_u.drc_index);
 
 	lock_device_hotplug();
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 3fe3ddb30c04b..38dc4f7c9296b 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -817,16 +817,16 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 	case PSERIES_HP_ELOG_ACTION_ADD:
 		switch (hp_elog->id_type) {
 		case PSERIES_HP_ELOG_ID_DRC_COUNT:
-			count = hp_elog->_drc_u.drc_count;
+			count = be32_to_cpu(hp_elog->_drc_u.drc_count);
 			rc = dlpar_memory_add_by_count(count);
 			break;
 		case PSERIES_HP_ELOG_ID_DRC_INDEX:
-			drc_index = hp_elog->_drc_u.drc_index;
+			drc_index = be32_to_cpu(hp_elog->_drc_u.drc_index);
 			rc = dlpar_memory_add_by_index(drc_index);
 			break;
 		case PSERIES_HP_ELOG_ID_DRC_IC:
-			count = hp_elog->_drc_u.ic.count;
-			drc_index = hp_elog->_drc_u.ic.index;
+			count = be32_to_cpu(hp_elog->_drc_u.ic.count);
+			drc_index = be32_to_cpu(hp_elog->_drc_u.ic.index);
 			rc = dlpar_memory_add_by_ic(count, drc_index);
 			break;
 		default:
@@ -838,16 +838,16 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 	case PSERIES_HP_ELOG_ACTION_REMOVE:
 		switch (hp_elog->id_type) {
 		case PSERIES_HP_ELOG_ID_DRC_COUNT:
-			count = hp_elog->_drc_u.drc_count;
+			count = be32_to_cpu(hp_elog->_drc_u.drc_count);
 			rc = dlpar_memory_remove_by_count(count);
 			break;
 		case PSERIES_HP_ELOG_ID_DRC_INDEX:
-			drc_index = hp_elog->_drc_u.drc_index;
+			drc_index = be32_to_cpu(hp_elog->_drc_u.drc_index);
 			rc = dlpar_memory_remove_by_index(drc_index);
 			break;
 		case PSERIES_HP_ELOG_ID_DRC_IC:
-			count = hp_elog->_drc_u.ic.count;
-			drc_index = hp_elog->_drc_u.ic.index;
+			count = be32_to_cpu(hp_elog->_drc_u.ic.count);
+			drc_index = be32_to_cpu(hp_elog->_drc_u.ic.index);
 			rc = dlpar_memory_remove_by_ic(count, drc_index);
 			break;
 		default:
diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
index 3c290b9ed01b3..0f1d45f32e4a4 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -121,7 +121,7 @@ int dlpar_hp_pmem(struct pseries_hp_errorlog *hp_elog)
 		return -EINVAL;
 	}
 
-	drc_index = hp_elog->_drc_u.drc_index;
+	drc_index = be32_to_cpu(hp_elog->_drc_u.drc_index);
 
 	lock_device_hotplug();
 
-- 
2.43.0


