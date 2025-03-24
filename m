Return-Path: <linuxppc-dev+bounces-7315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52188A6E042
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 17:54:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLzfX28wlz2yGy;
	Tue, 25 Mar 2025 03:54:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742835252;
	cv=none; b=oQg0G/SWf7wodXmjjd5T8kHWPUH0CvLmBRQKLNFUNdPHK3RSYW78Jh1bZHlWGxyVl9iZAE7ux5BDPZwoHMogjzBJtP3UfW/kkF4gpGFO6H3k/kQOiA/jLmlHwxKAesz8k+rpUUuhHDgnfOGzwV2BB4jdPWTpUKkp2p71UKWWQJeIpNu/IljcigqF4cXVXcspozYB3okP68LqRckJfmh2D+gBnquESTqXAhv4nk8RuPIftQUQLtm661HoWltR53E2DqyhtXijismZd73yw6mS6A3q1hEyhVyBBV6hNTrdG67MdiNh6xNCedChD3TDzPcS7q4yeYmQcbqvV5yKNlOv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742835252; c=relaxed/relaxed;
	bh=pCacE+xisYPcsgdv3+TM1VMm0lKFuw1VC2E+x/ru66M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNh4EgS0Hzw+l6zSbS+Uv2smxyf82Z1mbpf777Ol7ZffpI/iHd1jnGSVV5ooK1os92bxsXG6mRnGtJ6TCR3g/iSpnaZKPMnAOOe+GWncmds16sfq/3Q55gY5dpQCEPeC9MLO6V1hvdlrIl4lOzaEa5MgSNDz89Zpns7BswqPQnV4M3ocQVtmZyvtjecOda29behrMXr/2zsUqJs01Tqw3UQVZ9qqamC5jD83L0FHuJHWwWGw2lC+UndVpULeTkDhOUixBg6s2cP/V/HxaGcgiDI9u0IoLg+56s5bxaStfqYR/kh4UHhz3Oqz96lJIVKk1G8xl79kR1Qel92P5k3UQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E4YwuHYP; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=tony.luck@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E4YwuHYP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=tony.luck@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLzfT5Y99z2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 03:54:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742835250; x=1774371250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dE6Zd6Ph+/ryHeQLLazfSBwNRaC6LfUCJ2aoR2M+tDQ=;
  b=E4YwuHYPzmB0OknyiOqTh+shSX+81PWMxpqKC/mVUX6mQM141Tu3IsuR
   6TpgOCAKRf9zeeQ6wBmmLBTRALl4X3bWRTNfGCo4XiHgVGyANk8n5caEU
   uNnMneJ16v9JH8bkdVKojzUi+VpM+iYlEQSdR4OKwSNwv8nruaQL1ZtwQ
   kuiupa2pM5zuvIJmhtTGBNMsjWewdKpZ2Zacmwk5HIenM4hFITm93wryz
   aHUYT2LaKPO1czdwzPo1U2nsVtPAoCUmwuVfYH5lN7//v3EVOLXiZSYPp
   2jwj3JS6pjhb+i3WnfHejZhVlx6XCigwnVoA18nnU3BjjdWvbGLKnpTNj
   A==;
X-CSE-ConnectionGUID: +e9hQMufTJechHIAO/l3Cg==
X-CSE-MsgGUID: LnjH6bz9TNWVbEvqjzhM4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61444863"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="61444863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 09:54:04 -0700
X-CSE-ConnectionGUID: y2R8TjF9T0uyVt27GhllBQ==
X-CSE-MsgGUID: cDQOi4IQR9e/FuSVLgSLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="124891128"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 09:54:05 -0700
Date: Mon, 24 Mar 2025 09:54:02 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 2/5] arm64: add support for ARCH_HAS_COPY_MC
Message-ID: <Z-GOKgBNxKWQ21w4@agluck-desk3>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-3-tongtiangen@huawei.com>
 <Z6zKfvxKnRlyNzkX@arm.com>
 <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 09:44:02AM +0800, Tong Tiangen wrote:
> 
> 
> 在 2025/2/13 0:21, Catalin Marinas 写道:
> > (catching up with old threads)
> > 
> > On Mon, Dec 09, 2024 at 10:42:54AM +0800, Tong Tiangen wrote:
> > > For the arm64 kernel, when it processes hardware memory errors for
> > > synchronize notifications(do_sea()), if the errors is consumed within the
> > > kernel, the current processing is panic. However, it is not optimal.
> > > 
> > > Take copy_from/to_user for example, If ld* triggers a memory error, even in
> > > kernel mode, only the associated process is affected. Killing the user
> > > process and isolating the corrupt page is a better choice.
> > 
> > I agree that killing the user process and isolating the page is a better
> > choice but I don't see how the latter happens after this patch. Which
> > page would be isolated?
> 
> The SEA is triggered when the page with hardware error is read. After
> that, the page is isolated in memory_failure() (mf). The processing of
> mf is mentioned in the comments of do_sea().
> 
> /*
>  * APEI claimed this as a firmware-first notification.
>  * Some processing deferred to task_work before ret_to_user().
>  */
> 
> Some processing include mf.
> 
> > 
> > > Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
> > > that can recover from memory errors triggered by access to kernel memory,
> > > and this fixup type is used in __arch_copy_to_user(), This make the regular
> > > copy_to_user() will handle kernel memory errors.
> > 
> > Is the assumption that the error on accessing kernel memory is
> > transient? There's no way to isolate the kernel page and also no point
> > in isolating the destination page either.
> 
> Yes, it's transient, the kernel page in mf can't be isolated, the
> transient access (ld) of this kernel page is currently expected to kill
> the user-mode process to avoid error spread.
> 
> 
> The SEA processes synchronization errors. Only hardware errors on the
> source page can be detected (Through synchronous ld insn) and processed.
> The destination page cannot be processed.

I've considered the copy_to_user() case as only partially fixable. There
are lots of cases to consider:

1) Many places where drivers copy to user in ioctl(2) calls. 
   Killing the application solves the immediate problem, but if
   the problem with kernel memory is not transient, then you
   may run into it again.

2) Copy from Linux page cache to user for a read(2) system call.
   This one is a candidate for recovery. Might need help from the
   file system code. If the kernel page is a clean copy of data in
   the file system, then drop this page and re-read from storage
   into a new page. Then resume the copy_to_user().
   If the page is modified, then need some file system action to
   somehow mark this range of addresses in the file as lost forever.
   First step in tackling this case is identifying that the source
   address is a page cache page.

3) Probably many other places where the kernel copies to user for
   other system calls. Would need to look at these on a case by case
   basis. Likely most have the same issue as ioctl(2) above.

-Tony

