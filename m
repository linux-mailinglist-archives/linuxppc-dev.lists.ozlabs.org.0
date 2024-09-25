Return-Path: <linuxppc-dev+bounces-1584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B80985960
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 13:52:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDFTn44Xfz2y8l;
	Wed, 25 Sep 2024 21:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727265165;
	cv=none; b=i+7LdjpGzh2yQE2Y7eYy9S3ftkXnVNiPsRNVxcvxmWAZ0VpKqqBQhEJJPfVXT4+epgAnhiwgf9EIvcqThJFHpFMWXrWQxdTOTGMTQZHjRx1++7juZpH+HtagHQZ/s/kHmVNw2+ApipxWgWob01aYXNcwJAQakVxHOJWJz8rCOk0HTHKT2ZcXKl6Wgwu2iAG9j6RC/LX05+9T1JuuT7bJqEG/BxoBG/hAhsqF5V/1PAv+hvdsx9iPYXOfEok5ZJ3y4wwH7GqtYiNAXCMcalauottfdE2Yqihg4BV0FvLPAIZcJ4sQ5DvDVgnvVl2u+FjzLuaYaMtnrJdnnBzGUtY1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727265165; c=relaxed/relaxed;
	bh=m3RUqadWXx1a/47arDRgAjYVT0SBSelO4eFMcbm+vLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYEYYARyYkHRhbvwHABbSe4njdmUJ7d+uW5R0c4r87NzL1+T3OxywvdGqde2Rz+Fnj/Iso7Yubmq/Ot+M0SeQGw7M63S5TkGIMcCfJtCdKnjB9fm5bMfd4Uuc0yDSM3bDpPe7eXPkh0jDHTZ5WdTliVjnHotuDgbtcSEAUZ6uQ4S9P8aLc4jsP4txHFd07MDNRK2FYew28LXIoeJnK6YGR6wo4/FwwekBG9s5XccvUKoZafWCrgSaAbQ0LiJIlTOn5GBfxZ0vv2XR/DeLPvp+6W0Le/+dFJRkbY5nTqxd0r6wPF6uID8L+5eUeYCV6vRMTFc8Y+5w/Ohzi5D+G/51A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fl2iBLTr; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fl2iBLTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDFTn16ZRz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 21:52:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF76A5C5B02;
	Wed, 25 Sep 2024 11:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64E5C4CECD;
	Wed, 25 Sep 2024 11:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265161;
	bh=dbDoaenS2JiEt3m25szAgyBcrRLV6AE6DACT1SCRILc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fl2iBLTrbOT2X2MIdK7i7WTTBakFS67UhcXXa6wQyOu7f5QEcomp+xvBQ8HVHbqeq
	 djSUfVALLKDoFbxNemghPAFV22ABHM2K47Q2xq09QbKdswGmyUsr5aLzX3gp6BByin
	 ycSvbfywzG8ymKZluaHEjvnLS2fylzYWKhSukDsS5ow6CVSnAUTtbH1m2wJrWJzRm9
	 S1UzAfNV33IT0artlSAXS3UgkDsBRRapOXmJuo7E1F+xctuCatCUcJ17pSNrOu8BdG
	 /PdOSTAdufBk4iNJaGBfHhLrRT8QNBEaxS1I/C9+Ms6RTGEgBHgFxg6sZnvRU6FnIS
	 kCfyr0WeMwpKA==
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
Subject: [PATCH AUTOSEL 6.11 221/244] powerpc/pseries: Use correct data types from pseries_hp_errorlog struct
Date: Wed, 25 Sep 2024 07:27:22 -0400
Message-ID: <20240925113641.1297102-221-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
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
X-stable-base: Linux 6.11
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


