Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267B454700E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:38:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKcpw6nYfz3dxl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 09:38:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mwLnMfCV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mwLnMfCV;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKclg562qz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 09:35:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654904143; x=1686440143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qDvqVZ/A3fM/nZiMoOHgbdE/phpXdySZH6n5Muy9S6I=;
  b=mwLnMfCVU5F66grfUShIX/g/RlcA15xLtAbEOLBk5cgf9mAKiX9BzvKh
   SCBu8mfrP2z+Evspn7E62GwTere/dulm8/3Zwtw87mEzzJFG3Fhtdx1d3
   kAC4xUMn+aE3rtlzXjqwsM8iLZM8T82nKPGqKVbQ6gWSv3CpjlBaVhGv2
   /NOFedGeunVDL6lFk6VuCia8F/il2rHv0ZINDYNP9fIXDF46x73AYBlab
   6sF81hR9zpi/UaoCHQAVaAbT+GXPG0p/I5mH00x5PpyEOeggPVgQQy3eP
   kCtsBSxZKC+b3rg9p5OjId3LfTyZAaTC6gKc/DfJfpk9PKQj55Ts0qdSM
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="266547097"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="266547097"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="828500280"
Received: from pleung-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.33.34])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:37 -0700
From: ira.weiny@intel.com
To: linux-api@vger.kernel.org
Subject: [RFC PATCH 3/6] testing/pkeys: Add additional test for pkey_alloc()
Date: Fri, 10 Jun 2022 16:35:30 -0700
Message-Id: <20220610233533.3649584-4-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610233533.3649584-1-ira.weiny@intel.com>
References: <20220610233533.3649584-1-ira.weiny@intel.com>
MIME-Version: 1.0
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
Cc: x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Sohil Mehta <sohil.mehta@intel.com>, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

When pkeys are not available on the hardware pkey_alloc() has specific
behavior which was previously untested.

Add test for this.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 tools/testing/selftests/vm/protection_keys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 43e47de19c0d..4b733a75606f 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -1554,6 +1554,16 @@ void test_implicit_mprotect_exec_only_memory(int *ptr, u16 pkey)
 	do_not_expect_pkey_fault("plain read on recently PROT_EXEC area");
 }
 
+void test_pkey_alloc_on_unsupported_cpu(void)
+{
+	int test_pkey = sys_pkey_alloc(0, 0);
+
+	dprintf1("pkey_alloc: %d (%d %s)\n", test_pkey, errno,
+		 strerror(errno));
+	pkey_assert(test_pkey < 0);
+	pkey_assert(errno == ENOSPC);
+}
+
 void test_mprotect_pkey_on_unsupported_cpu(int *ptr, u16 pkey)
 {
 	int size = PAGE_SIZE;
@@ -1688,6 +1698,8 @@ int main(int argc, char *argv[])
 
 		printf("running PKEY tests for unsupported CPU/OS\n");
 
+		test_pkey_alloc_on_unsupported_cpu();
+
 		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
 		assert(ptr != (void *)-1);
 		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
-- 
2.35.1

