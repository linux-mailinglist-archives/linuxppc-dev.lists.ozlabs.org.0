Return-Path: <linuxppc-dev+bounces-16756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGebOku+imncNQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:12:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4B11703E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:12:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f98nx3B70z309C;
	Tue, 10 Feb 2026 16:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770700357;
	cv=none; b=ghz/19UcnU/ZSZ/qCBBUfm6pbk9L7x5+5SAXrKjkOeciRRvszAXyP8ZBvCaH68QJOTVLS1c0PeNMfDhjy9iSkhb7A1aVgOhTx+w5Yb1Cpx/FwBEiTvZHa6z9IAOGvg9V2Wrs5wrjFfLhMlfZ3Xvdd8t7yR3TDAjnwSXZXerk4qg++yKrJWtmc/XmIZeYDfoqor2EemN58kNy25m0LAk+D6JPJ2rHr2G5IhwlwkPUf+q72OtAoDMq4KXAjyVCCKLPMAdShy4jr/jg0ifVOtSMgBi4b9Ho/kvfCkePuv9l+NsdYQ0dLBHP0vt9cg3yqjxFIRb+EKRiIWPM5pPcEjRxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770700357; c=relaxed/relaxed;
	bh=KNmOPLX8P6Umsx64l1JIsFtCaT40pc8oT9aiCqSewtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjcVjJKktPmP8eBswvtcPJh8YuaySvr4rPsFKKYMOxa+YpsvyFF5kuSHp095qyQ0wK3xORItBt8CC9O6ZX/xf3kBOoJjl5Rcg6kALOBLYuorER5aPPBUUVGH8WU8CX/MJwG71027QIKE8uEIRXMxNzVPxLTp0MnUX/upigJ/dF6G0jeJB8D5znWCf0axz0gmo7fcH69TaRnsMrOLHrHZBVS0PF1aGJYZBcS+/ySm4U1NMR/qrP60W2Q+FXr4MWQgm8yu+Wvy7CJGU7/+KACuLRJDo5jgu1TRClOnu8yVJtkvykoL8nynhfUB0yGti8hom4iV8878eZPBMcFTsRhNkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KSvi7+p4; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KSvi7+p4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f98nt4D4Bz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 16:12:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770700355; x=1802236355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3UNd5cxLJqz/3s1NIEI3vT5VGVl5sklAlpXeEWdBoZY=;
  b=KSvi7+p4x2sqxFvWT23MjiNbGUM+y71st0NEj/4SYm1IgLSL0yhwYL+J
   qlSlu1CfmhBtDCm6+nPJ8SFu2fzE3OtxhJCw08S9WPoAnVd/2FoqXl10B
   qo0SQ3YHqYJlJmkNkZq5co1fTd8DMUmOOEVBiNQAqEvCQQby1rkgrj0hS
   ZvzYXEL1p606Z2aJLVmtyJ5SQyX/IOSX0yhUBvcSPBzULgnekjUGEMLf0
   /KIdkkmbXInAh4UmHqZbSIe+npIbvJktUt/ltjwkg7YsLOF/a9wg2JwLh
   e2vV7FQ2iAHXwgaqoX4GF8qvzAx399JtPddQ+UAWxq4ev205bnJZ8PPQA
   w==;
X-CSE-ConnectionGUID: 2juRE6DiSd2oh9IkjIztyw==
X-CSE-MsgGUID: 2WSdRqPeSBuUrgUs3PNK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74425776"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74425776"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:12:29 -0800
X-CSE-ConnectionGUID: PE/oxs8ATIetyQVLsPYhpQ==
X-CSE-MsgGUID: zIgjYMXuS/mOmpPCoKhmbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210907238"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2026 21:12:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpg2v-00000000of2-0EFa;
	Tue, 10 Feb 2026 05:12:21 +0000
Date: Tue, 10 Feb 2026 13:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	rostedt@goodmis.org, ardb@kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
Message-ID: <202602101353.da6BkK6l-lkp@intel.com>
References: <20260209105456.1551677-3-mkchauras@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209105456.1551677-3-mkchauras@gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16756-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:oe-kbuild-all@lists.linux.dev,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: 20E4B11703E
X-Rspamd-Action: no action

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.19]
[also build test ERROR on linus/master next-20260209]
[cannot apply to powerpc/next powerpc/fixes rust/rust-next ah-configfs/configfs-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya-IBM/powerpc-jump_label-adjust-inline-asm-to-be-consistent/20260209-185801
base:   v6.19
patch link:    https://lore.kernel.org/r/20260209105456.1551677-3-mkchauras%40gmail.com
patch subject: [PATCH V4 2/3] rust: Add PowerPC support
config: powerpc-randconfig-r073-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101353.da6BkK6l-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101353.da6BkK6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101353.da6BkK6l-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[3]: *** [rust/Makefile:624: rust/helpers/helpers.o] Error 1
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>> error[E0658]: inline assembly is not stable yet on this architecture
   --> rust/kernel/sync/barrier.rs:19:14
   |
   19 |     unsafe { core::arch::asm!("") };
   |              ^^^^^^^^^^^^^^^^^^^^
   |
   = note: see issue #93335 <https://github.com/rust-lang/rust/issues/93335> for more information
   = help: add `#![feature(asm_experimental_arch)]` to the crate attributes to enable
   = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

