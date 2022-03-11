Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 207EE4D5709
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 02:00:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF6zP0kP2z30Dp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 12:00:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NVRGOLhm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NVRGOLhm; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF6y45Cp6z2y6K
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 11:58:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960332; x=1678496332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fROPMJ0aWjZeKi8CMmgQhx4a+oSgNaOrWlO2neoVxFA=;
 b=NVRGOLhmKQCVVsMVtM/xzP+QpodubghNyHDny8UB54xPMtQ1yPysWzGz
 vNpbzXTnGKjvwN8Sf3reQCyG+APxyofb9oGFrT8rtOCasbN3h7+sp+ztI
 wByrb9K0yFGUFxwqxmK2TeHi3Uwx/HnhfikWwqTXIGDQgxkB3a+1qxe7l
 4GfFU6D5KYcrQL41xN+dTY9hJO8EmWgk8zPy0WesxSKTKZGGPvKnSG3LD
 CX7LaPBleqHElsfGMyyjSTVBHx3mahAvpyUzcG9bPwBWyayxOjvN43e9e
 wZGpvpi+5+Fldhi1+Cm5pssQcTqf9BO2gkcmWsPu3kS2eT/s467gwHIgm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="254284042"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="254284042"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="579064522"
Received: from gdavids1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.65.108])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:44 -0800
From: ira.weiny@intel.com
To: Dave Hansen <dave.hansen@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH 0/5] Pkey User clean up patches
Date: Thu, 10 Mar 2022 16:57:37 -0800
Message-Id: <20220311005742.1060992-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
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

I'm looking for acks that this is acceptable for official submission to the
maintainers.  I believe the code to be better than RFC quality but I realize
that the type changes may be more churn than is desired.

The following patches contain pkey cleanups and an attempt to standardize on
the type used for pkeys.

The PKS code is standardizing on u8 for the pkey type and for some of the call
paths in the user space code this should work as well.

Ira Weiny (5):
x86/pkeys: Clean up arch_set_user_pkey_access() declaration
x86/pkeys: Remove __arch_set_user_pkey_access() declaration
powerpc/pkeys: Properly type pkey in init_{i}amr()
mm/pkeys: Make pkey unsigned in arch_set_user_pkey_access()
x86/pkeys: Standardize on u8 for pkey type

arch/powerpc/include/asm/pkeys.h | 4 ++--
arch/powerpc/mm/book3s64/pkeys.c | 6 +++---
arch/x86/include/asm/pgtable.h | 4 ++--
arch/x86/include/asm/pkeys.h | 12 ++----------
arch/x86/include/asm/pkru.h | 4 ++--
arch/x86/kernel/fpu/xstate.c | 2 +-
include/linux/pkeys.h | 2 +-
7 files changed, 13 insertions(+), 21 deletions(-)

--
2.35.1

