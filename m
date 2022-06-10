Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A754700D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKcpH0jY5z3cj1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 09:37:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KVeAginJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KVeAginJ;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKclg2Ylpz2ywr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 09:35:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654904143; x=1686440143;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Js4f9kz2YaYmoc0VfWWcGpSWtATIkYgM+SbstpVR+cU=;
  b=KVeAginJ38tC6kTqBToW7zI5YSXFiwbVW/CRMSNydT6mWQHg8ImlFreY
   W3XYi3saEiImQZAVnu5MpiurealvAeHbxK5CXEyq3hDmLCKb4iWiFMlis
   Wkj43t80NCfDPGcEff5PjFtJliKEJuRHJ1NqFZCwW2R1jn66AsVi9RwhS
   PhCeZeCGFHiLmVYXxUYLHnAZJ9Cw5rW32IOBEJVRFEbV/cfVAJ1zsx48N
   7wm0qL3cn7HxOLHIWdHgdhpQhv3HYshCTOgOyasmEDPsB0nzTNXN5xyRA
   RCcdtJUtaRkk1dhrdiFtqKkmsNq99VClsrGM7RJUs+hHOxyYNbZChg/Pv
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="276561758"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="276561758"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="638384941"
Received: from pleung-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.33.34])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:35 -0700
From: ira.weiny@intel.com
To: linux-api@vger.kernel.org
Subject: [RFC PATCH 0/6] User pkey minor bug fixes
Date: Fri, 10 Jun 2022 16:35:27 -0700
Message-Id: <20220610233533.3649584-1-ira.weiny@intel.com>
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
Cc: Ira Weiny <ira.weiny@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Sohil Mehta <sohil.mehta@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>


While evaluating the possibility of defining a new type for pkeys within the
kernel I found a couple of minor bugs.

Because these patches clean up the return codes from system calls I'm sending
this out RFC hoping that users will speak up if anything breaks.

I'm not too concerned about pkey_free() because it is unlikely that anyone is
checking the return code.  Interestingly enough, glibc recommends not calling
pkey_free() because it does not change the access rights to the key and may be
subsequently allocated again.[1][2]

The pkey_alloc() is more concerning.  However, I checked the Chrome source and
it does not differentiate among the return codes and maps all errors into
kNoMemoryProtectionKey.

glibc says it returns ENOSYS if the system does not support pkeys but I don't
see where ENOSYS is returned?  AFAICS it just returns what the kernel returns.
So it is probably up to user of glibc.

In addition I've enhanced the pkey tests to verify and test the changes.

Thanks to Rick Edgecombe and Sohil Mehta for internal review.


[1] Quote from manual/memory.texi:

Calling this function does not change the access rights of the freed
protection key.  The calling thread and other threads may retain access
to it, even if it is subsequently allocated again.  For this reason, it
is not recommended to call the @code{pkey_free} function.

[2] PKS had a similar issue and went to statically allocated keys instead.


Ira Weiny (6):
  testing/pkeys: Add command line options
  testing/pkeys: Don't use uninitialized variable
  testing/pkeys: Add additional test for pkey_alloc()
  pkeys: Lift pkey hardware check for pkey_alloc()
  pkeys: Up level pkey_free() checks
  pkeys: Change mm_pkey_free() to void

 arch/powerpc/include/asm/pkeys.h             | 18 ++---
 arch/x86/include/asm/pkeys.h                 |  7 +-
 include/linux/pkeys.h                        |  5 +-
 mm/mprotect.c                                | 13 +++-
 tools/testing/selftests/vm/pkey-helpers.h    |  7 +-
 tools/testing/selftests/vm/protection_keys.c | 75 +++++++++++++++++---
 6 files changed, 86 insertions(+), 39 deletions(-)


base-commit: 874c8ca1e60b2c564a48f7e7acc40d328d5c8733
-- 
2.35.1

