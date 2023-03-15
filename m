Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4946BC0C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 00:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcRHg5PXKz3chD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 10:22:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPkjrwQl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPkjrwQl;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcRGj49phz3bh9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 10:21:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678922477; x=1710458477;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=JtqPhoEKPXalriYhJjGElknB+PaqWOwwVH9zLKYLARE=;
  b=UPkjrwQlouy84FO9SYtjyYLN/4j6b4Q756nKtZz6ukFH+qeb36KjC3qT
   evm7h02xVUYuEvaVKo0cpnhNcWnvPMaE3jFrdKgjtSdsb/sY9xedIr5jc
   mK+9S6uvIKmfg+86grWR212xHJeeMfs17qk7uRaJHjuspWJEsNoUCDbLy
   stUz+QPhexyEm93N/qO7oxZF+m50YObs2W7gefWBdW8WD8TcMufW/MTc1
   Vvw+OEYhLJgvuAVRQtkwMXdiU5X1fnofq+UboYeQXmFPgi1S7jkQUcplZ
   NTlEuycJVSGEGxpl2H5KuBWEFeuvLD5TCFjpELRu/H1uughtM5WHFCrOx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365527028"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="365527028"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="672915084"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="672915084"
Received: from iweiny-desk3.amr.corp.intel.com (HELO localhost) ([10.212.196.133])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 16:21:00 -0700
From: Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH 0/3] COVER: Remove memcpy_page_flushcache()
Date: Wed, 15 Mar 2023 16:20:53 -0700
Message-Id: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVSEmQC/x2N0QrCMBAEf6XcswdJBCv+ivhwaTf2kMZyJ1Io/
 XdTH4edZTZymMLp1m1k+KrruzaIp46GSeoTrGNjSiGlmM6BX7MsvF4vnMsoPWIJPUBNz+LgbFK
 H6TjM4h/YMSyGouu/cX/s+w9yRuQEcwAAAA==
To: Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678922459; l=998;
 i=ira.weiny@intel.com; s=20221222; h=from:subject:message-id;
 bh=JtqPhoEKPXalriYhJjGElknB+PaqWOwwVH9zLKYLARE=;
 b=U9HC5ieE6mtI6yDhHzLskDipFcXfN5V+3f/6dtOP+vYtK4gh7RQ5RqWHvkM2/fof3yGgZa9rC
 TzxAczQSZNABEql6X/OHl+LQecFJp7Jop+9LSTx06n4/b9j5a3XT3GW
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=brwqReAJklzu/xZ9FpSsMPSQ/qkSalbg6scP3w809Ec=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 21b56c847753 ("iov_iter: get rid of separate bvec and xarray 
callbacks") removed the calls to memcpy_page_flushcache().

kmap_atomic() is deprecated and used in the x86 version of
memcpy_page_flushcache().

Remove the unnecessary memcpy_page_flushcache() call from all arch's.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
Ira Weiny (3):
      x86, uaccess: Remove memcpy_page_flushcache()
      powerpc: Remove memcpy_page_flushcache()
      arm: uaccess: Remove memcpy_page_flushcache()

 arch/arm64/include/asm/uaccess.h    | 2 --
 arch/arm64/lib/uaccess_flushcache.c | 6 ------
 arch/powerpc/include/asm/uaccess.h  | 2 --
 arch/powerpc/lib/pmem.c             | 7 -------
 arch/x86/include/asm/uaccess_64.h   | 2 --
 arch/x86/lib/usercopy_64.c          | 9 ---------
 6 files changed, 28 deletions(-)
---
base-commit: 6015b1aca1a233379625385feb01dd014aca60b5
change-id: 20221230-kmap-x86-bfda7e1f07ee

Best regards,
-- 
Ira Weiny <ira.weiny@intel.com>

