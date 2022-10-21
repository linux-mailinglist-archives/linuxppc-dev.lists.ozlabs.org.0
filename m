Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76076607F67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 22:02:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvFkB1kGhz3dx9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 07:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b3b5ekre;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b3b5ekre;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvFjD07YSz3045
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 07:01:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666382496; x=1697918496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/l/AGxNBveIFVLifPG7mHqaofFSHPy5andRAcNZBXFI=;
  b=b3b5ekreCVTkk5UcGbcUDyXtMg8Xf2VIRXW9aK5AFkl5yAkGH1iTLRAS
   YCVrcFzQEJOI/1l+vA9A2HkuALvfojfQu/1JOkyNcnsnzsuLCvFVcjrk7
   Er/AjAH4+NsaoVkMv0ZfTGcA2B6OyMwHh5Qbh4OiTg+TwF0ZGt0t2yz7g
   APihhuRTfMO2KrqOzlymUnaCOyFvmomxRD2tg0AALuRIcSn7AIXx2UtHl
   x2BA+JvnLlZhF+7INdT9YSZ8Ot828x1+5+qUrdq5E8/dPMGxJ6DgljU1A
   /5jI6r7703a2Cm73IeMMdNur11R+Z1f1N/EIx5NAJv72FSB2AOvrD1+yx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="287493355"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="287493355"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 13:01:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="633069084"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="633069084"
Received: from agluck-desk3.sc.intel.com ([172.25.222.78])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 13:01:27 -0700
From: Tony Luck <tony.luck@intel.com>
To: Naoya Horiguchi <naoya.horiguchi@nec.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 0/2] Copy-on-write poison recovery
Date: Fri, 21 Oct 2022 13:01:18 -0700
Message-Id: <20221021200120.175753-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221019170835.155381-1-tony.luck@intel.com>
References: <20221019170835.155381-1-tony.luck@intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Tony Luck <tony.luck@intel.com>, Shuai Xue <xueshuai@linux.alibaba.com>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part 1 deals with the process that triggered the copy on write
fault with a store to a shared read-only page. That process is
send a SIGBUS with the usual machine check decoration to specify
the virtual address of the lost page, together with the scope.

Part 2 sets up to asynchronously take the page with the uncorrected
error offline to prevent additional machine check faults. H/t to
Miaohe Lin <linmiaohe@huawei.com> and Shuai Xue <xueshuai@linux.alibaba.com>
for pointing me to the existing function to queue a call to
memory_failure().

On x86 there is some duplicate reporting (because the error is
also signalled by the memory controller as well as by the core
that triggered the machine check). Console logs look like this:

[ 1647.723403] mce: [Hardware Error]: Machine check events logged
	Machine check from kernel copy routine

[ 1647.723414] MCE: Killing einj_mem_uc:3600 due to hardware memory corruption fault at 7f3309503400
	x86 fault handler sends SIGBUS to child process

[ 1647.735183] Memory failure: 0x905b92d: recovery action for dirty LRU page: Recovered
	Async call to memory_failure() from copy on write path

[ 1647.748397] Memory failure: 0x905b92d: already hardware poisoned
	uc_decode_notifier() processes memory controller report

[ 1647.761313] MCE: Killing einj_mem_uc:3599 due to hardware memory corruption fault at 7f3309503400
	Parent process tries to read poisoned page. Page has been unmapped, so
	#PF handler sends SIGBUS


Tony Luck (2):
  mm, hwpoison: Try to recover from copy-on write faults
  mm, hwpoison: When copy-on-write hits poison, take page offline

 include/linux/highmem.h | 24 ++++++++++++++++++++++++
 include/linux/mm.h      |  5 ++++-
 mm/memory.c             | 32 ++++++++++++++++++++++----------
 3 files changed, 50 insertions(+), 11 deletions(-)

-- 
2.37.3

