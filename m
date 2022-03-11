Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51134D5707
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 01:59:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF6yk4lc6z30Gd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 11:59:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BxtcDwbW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BxtcDwbW; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF6y45pt1z2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 11:58:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960332; x=1678496332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qdRZwcheezTGfs6H8foja5La9g1WfULiBkuZy4sc1Hs=;
 b=BxtcDwbWtkpXY/l53P9rL7c3ZeERoWOVEgqczzddCk1IFlMttAoNDd+i
 qJZVfunngX620Ga0A86ToxMLuTTd00gSm+2y/0dt2qj4TiO4hdsuvVGJY
 apRWxKgLcIh+RJc98PKtAmxBaYaJ4D/6sx3flsxoqJJeiMDn3HdeNj2pd
 rB5BAz/NGnghdnw4S1jMoUL/bMLd4ica/ztVM2yFpEBCK0yjbvxFZjWSg
 hrZ5+JP0Nos6716txLAuUR3XlLJQq8bowAhOJ7mT4mpRcIkjkwzXPf3IG
 OHWE5Ea+R6xoBXnkSERl8Lf9lJQM9PZqBc2BHvn+8QJydGrlgr56TmhRY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="341883870"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="341883870"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="538750557"
Received: from gdavids1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.65.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:45 -0800
From: ira.weiny@intel.com
To: Dave Hansen <dave.hansen@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH 1/5] x86/pkeys: Clean up arch_set_user_pkey_access()
 declaration
Date: Thu, 10 Mar 2022 16:57:38 -0800
Message-Id: <20220311005742.1060992-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311005742.1060992-1-ira.weiny@intel.com>
References: <20220311005742.1060992-1-ira.weiny@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

arch_set_user_pkey_access() was declared two times in the header.

Remove the 2nd declaration.

Suggested-by: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/x86/include/asm/pkeys.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 1d5f14aff5f6..9c530530b9a7 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -118,8 +118,6 @@ int mm_pkey_free(struct mm_struct *mm, int pkey)
 	return 0;
 }
 
-extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
 extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 		unsigned long init_val);
 
-- 
2.35.1

