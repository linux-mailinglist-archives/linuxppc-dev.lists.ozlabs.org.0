Return-Path: <linuxppc-dev+bounces-11262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDFAB3478B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 18:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9byY5r8bz3cYq;
	Tue, 26 Aug 2025 02:36:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756139765;
	cv=none; b=bqn7SI/Z2JIGX5+0UW6AF+lGT04M5hMhXBMDA+xLLJca853wFG4yzJH/yfYZLq2FjXEr4ihEiJRMDfJ1zOVIEvYJhHaQTFgDkW9zEmuR5uJxWtZmdplWOgP+RZSJC7MEXDlEf9atsFpdN2Dd1fNfPCuuajBsgQ5unoz0SwxTBkk53PzpI+MCiM0nKwAW3s9/xRaNOwcns7ZXoMcvaEj0rWOe8bxkLkWJGF8VWAfl221209cB2DedCaSXOMJXXunnMsLsT9BvNJceS14qYAheFBOZw0Eaw5B3yHmlBkkR8VEvQ0ijPX5Hzs18YkNQZGb+ZkWZYnFf5n7bpobgd3NyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756139765; c=relaxed/relaxed;
	bh=CYkENkG86CGpJX8tlASGD4qcKwdlUFc6LyyYgBUp7bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m51k4RrS0JAg5wyL0L8SwTfTDC553xCGjpoZQybNsfOIgB5RJgQokn/yuoCenSt58zeeS6oCXI8aMq5GHqpl4TvwM0pOQ5m5mKRimHbuHPT4cA0CfWmDfmmHUAP9XzfRZ3CaGsaEAoTthfHC4ujyslqAYZ8BDKo84DgpjqVIlkzo6R/PqrARdr67/Z/Zmxu9uKzSh5J8wkMHIimWgaRJVPCteKn6Bi2n8e2K1SS18u/OKAjhhSKdhAosl96k23RZnXLhCzCRt/8g84s3ID3LI3Mtltom/tsj1QiW15J8uQmPmYo2/zME7BUb7HTA3DOojmB7iIcxk39AzLyAJA8Dtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EG4Y5TOf; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EG4Y5TOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9byR5x7wz3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 02:35:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139760; x=1787675760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L2un3Tp24kq84D49bPeqtKFgx0ttvdt2Oi+LfIRW2Jk=;
  b=EG4Y5TOfTTeneF2U+iXkLIBI0GA5kVBePgKc97ZonPrRqnUJhuLd/NUd
   w/dZ9VdorL37FJ6pkzz2oPw+E4uU9EQMNb+v6VGm3vLfBCIz47b1rlD+G
   7JGBICZ92yi2+h7MkIw4MJbAbYe1/OragxO6j372GxFmrjoChyEJuB3vy
   UAwykfMC0bMNwCp/5TPqipB7SZ5AvZsHv+KPxVX5FHIIgczEsSFv6VUmX
   nS2vsKx8kQXxLKvz94Z/oyu4uYhYm6LeqVXad+nziUSp7lLiraOeDtZO8
   dh+/znVywFiQKPDNS3rJ9CFkgmGqgL/x+49TDmkjF+mHMtUYA5JN9L6d3
   A==;
X-CSE-ConnectionGUID: 9+kMUbB+Rw2vqebUH2elog==
X-CSE-MsgGUID: IcAYx+sHSzGj3DZXAhfqAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69459516"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69459516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:55 -0700
X-CSE-ConnectionGUID: orFQ8jjkTR+a1kLWJels8Q==
X-CSE-MsgGUID: l5OrMqmGT8icT6nXAJqR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169241087"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D581B94; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] floppy: A couple of cleanups
Date: Mon, 25 Aug 2025 18:32:54 +0200
Message-ID: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There are a few places in architecture code for the floppy driver
that may be cleaned up. Do it so.

Assumed to route via Andrew Morton's tree as floppy is basically orphaned.

Changelog v2:
- combined separate patches sent earlier into a series
- added tags (Helge, Geert)
- fixed typo in the commit message (Geert)

Andy Shevchenko (3):
  floppy: Remove unused CROSS_64KB() macro from arch/ code
  floppy: Replace custom SZ_64K constant
  floppy: Sort headers alphabetically

 arch/alpha/include/asm/floppy.h    | 19 ----------
 arch/arm/include/asm/floppy.h      |  2 --
 arch/m68k/include/asm/floppy.h     |  4 ---
 arch/mips/include/asm/floppy.h     | 15 --------
 arch/parisc/include/asm/floppy.h   | 11 +++---
 arch/powerpc/include/asm/floppy.h  |  5 ---
 arch/sparc/include/asm/floppy_32.h |  3 --
 arch/sparc/include/asm/floppy_64.h |  3 --
 arch/x86/include/asm/floppy.h      |  8 ++---
 drivers/block/floppy.c             | 56 ++++++++++++++----------------
 10 files changed, 34 insertions(+), 92 deletions(-)

-- 
2.50.1


