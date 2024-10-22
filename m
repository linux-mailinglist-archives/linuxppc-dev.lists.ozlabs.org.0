Return-Path: <linuxppc-dev+bounces-2484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B839AA1F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 14:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXrgr6z3Dz2yPG;
	Tue, 22 Oct 2024 23:14:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729585103;
	cv=none; b=A/lPu7MZRiLwTtKCITIfVCVTtj5tqm3HZxVy4UxGfQC6hlwqleYEPlu/UNc5OTLoWlAT0knf/bIjG4XZkvYD8SnaRdB8POaSoGE1VglrIIFDKZetuUec0xcsUvH/fpoX9/A8rfOEmQNCdOmgYa/qnWUpraYgnciXBBmKcvp8DKL9thg4c+L9mO78L3DXqSRh1eh23UUx5X70lPYuj338S8Uz8jDhTSU9BVOisA+w3qPkf9KtUG47+15JAH9IGcx3IFjosuHzV/RPLzLlR+FypW2YUrAg1tRVZmQod/kujtkBp3zgWWQ54sysIExowMrHJPqAXE3bm9WpWSbO8PT00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729585103; c=relaxed/relaxed;
	bh=78yBcjOvhW3Os14MZ5DeD29fKDPAg89H4ipE1CwdrSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqmL/STTzZdo0U3L7qG3lWfOS3KhBypqje2Gon4kTbqINT0hQr1KVCf5K4IPyfczZP7IdIJRDVTzOLBoVXRaadJPhEI0JlmnrjuHa6BmgRTjCvRyjV4mYWDjykXOCuPD++hBhzzYc3xdErIWfHbPzujFpnAZ8Wqyoemmew3v6T3E/z2dYVPjWnIPCfsbqxAaothyQJmqdkJ21wlX5XznTUFvI+Y0k0TrMEhai1qy9Klj1N/KONIsaPVobbWw5BPfUyzz+W6xvA9VLDeVNCGQaNrZHthowtJEcdkj3SbkOMnDQ+2pWcurULkkEc/vDid4ER1bY8Kqc2R+Nq/nLORTpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nbnosMAC; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=pawan.kumar.gupta@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nbnosMAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=pawan.kumar.gupta@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 22 Oct 2024 19:18:19 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXlRv3WWVz2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 19:18:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729585099; x=1761121099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GbaR0xjNbIpbzyC2NrASCe27hsFjXXoBDSPrsS+E0w4=;
  b=nbnosMACh7nTJdXctAWSCATdyEBcMjz7AeLinjhJaViJ92stHXqp2pNO
   iotKlyYsH4QelnOnvMKgIHjBkEklLe6HtSO+QN2yHhZDWQ9fr/h1u/kvQ
   mp/aycHCK1YiZf+U+iy/v4OQe0UInpmHZsHZtB9VDokhwVVDum70EDAXA
   OYDeiNzP3bHQt+R6yj8RWDx9K19GvpwZHNvjsyZFvnAWDUrH70Dzpu1C4
   53pTfkTk+tDZFX0jwF5atJDPHOiMn7Zylb1PH9k7CuQjVB/OnuuZtNPiH
   PhkIauxKEriBqd/ueP13dRYHigdlL30+CEicp3ycWBJmSIt7b68kJMUf1
   g==;
X-CSE-ConnectionGUID: cRvE4UKSSkSf+dHMDHYOJA==
X-CSE-MsgGUID: fgKP1AJ1QZSvMWmVuIpcfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29215272"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="29215272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 01:17:11 -0700
X-CSE-ConnectionGUID: TqN9W/9lRNazEkXXwyIvKg==
X-CSE-MsgGUID: aRiFw84MQeaZX/bVsiC0MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79353889"
Received: from pardy-mobl1.amr.corp.intel.com (HELO desk) ([10.125.146.26])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 01:17:10 -0700
Date: Tue, 22 Oct 2024 01:16:58 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241022081658.pmf3j5dcxohsvr5e@desk>
References: <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <4fvuiq7h3zay3ios6kpyqye4x2igixew4k44k5nkq2ywbu5lig@ybpx5fowgy7x>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fvuiq7h3zay3ios6kpyqye4x2igixew4k44k5nkq2ywbu5lig@ybpx5fowgy7x>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024 at 01:48:15PM +0300, Kirill A. Shutemov wrote:
> On Sun, Oct 20, 2024 at 03:59:25PM -0700, Linus Torvalds wrote:
> > On Sun, 20 Oct 2024 at 15:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > >
> > > Anyway, I'd really like to make forward progress on getting rid of the
> > > LFENCEs in copy_from_user() and __get_user(), so until if/when we hear
> > > back from both vendors, how about we avoid noncanonical exceptions
> > > altogether (along with the edge cases mentioned above) and do something
> > > like the below?
> > 
> > That doesn't work for LAM at _all_.
> > 
> > So at a minimum, you need to then say "for LAM enabled CPU's we do the
> > 'shift sign bit' trick".
> > 
> > Hopefully any LAM-capable CPU doesn't have this issue?
> 
> LAM brings own speculation issues[1] that is going to be addressed by
> LASS[2]. There was a patch[3] to disable LAM until LASS is landed, but it
> never got applied for some reason.

AIU, issue with LAM is it allows speculative translation of non-canonical
user address. It does not allow data fetches from those addresses. SLAM
attack uses LAM to form a TLB-based disclosure gadget. In essence, SLAM
needs to chain another speculative vulnerability to form a successful
attack. If the data accessed by a chained speculative vulnerability is
interpreted as a pointer, LAM may allow the translation of non-canonical
user address. This is specially true for ascii characters that have MSB
masked off.

I don't really know how this could be a problem for something like
copy_from_user() that ensures the canonicality of bit 63.

AFAIK, Sierra Forest, Lunar Lake and Arrow Lake support LAM. To be on safe
side, it is better to keep LAM disabled until LASS arrives.

