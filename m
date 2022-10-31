Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD936613EBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 21:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1PSQ4VmDz3cLr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 07:11:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hH+8JOog;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hH+8JOog;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1PRR2CPwz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 07:10:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667247059; x=1698783059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gVin2FQfBiKKdgB/2PC5DT5M96qnAGhQxw1TWFWq2qw=;
  b=hH+8JOog47bM7cHRbLGIQK+pZ8PWM/bPri3g9ygdRdyCNuRRh8ydwVsb
   r1ySRZqQt9o07ks90NJodmK+bOHSySVFhWVxdgoAtdsaS1LkDCPPpzqDz
   IpELYxkgNqURkPCMKIGh6v7TQ9oSmeoEuAEHdvDLVzgIbZ4FwU0I/huFq
   Sk5sClJR/7DwRFTGUIJkj9BUR4ky3bXqp03pWou7nqW3GZQOHtk2mqw6H
   JhD8y0KiLfNdLU7sZUd/Bjiy6wZnazQd9OROdG0VslrxzKmGz6t6hq+ct
   GjxtHh7nb3TKerFErAMxKANUhP0rNmug3LMuzV9AQbBg7j6eJCf7DBTXl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="296408518"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="296408518"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 13:10:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="722931438"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="722931438"
Received: from agluck-desk3.sc.intel.com ([172.25.222.78])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 13:10:47 -0700
From: Tony Luck <tony.luck@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 0/2] Copy-on-write poison recovery
Date: Mon, 31 Oct 2022 13:10:27 -0700
Message-Id: <20221031201029.102123-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021200120.175753-1-tony.luck@intel.com>
References: <20221021200120.175753-1-tony.luck@intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Tony Luck <tony.luck@intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Alexander Potapenko <glider@google.com>, Shuai Xue <xueshuai@linux.alibaba.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recover from poison consumption while copying pages
in the kernel for a copy-on-write fault.

Changes since v3:

1) Miaohe Lin <linmiaohe@huawei.com> pointed out that a recent change
by Alexander Potapenko <glider@google.com> to copy_user_highpage()
added a call to kmsan_unpoison_memory().  Same is needed in my cloned
copy_mc_user_highpage() ... at least in the successful case where the
page was copied with no machine checks.

2) Picked up some additional Reviewed-by and Tested-by tags.

Tony Luck (2):
  mm, hwpoison: Try to recover from copy-on write faults
  mm, hwpoison: When copy-on-write hits poison, take page offline

 include/linux/highmem.h | 26 ++++++++++++++++++++++++++
 include/linux/mm.h      |  5 ++++-
 mm/memory.c             | 32 ++++++++++++++++++++++----------
 3 files changed, 52 insertions(+), 11 deletions(-)


base-commit: 30a0b95b1335e12efef89dd78518ed3e4a71a763
-- 
2.37.3

