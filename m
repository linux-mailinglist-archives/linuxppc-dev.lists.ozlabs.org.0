Return-Path: <linuxppc-dev+bounces-16086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCEnB/sUcGlyUwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:51:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D94E231
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:51:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwkcP6KDpz2xrL;
	Wed, 21 Jan 2026 10:51:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768953077;
	cv=none; b=J95AThJiv1LsmhKJPakRhBsa0dvsBfZ0m7iddr0eKpkBLp07NCQFt/LWokWIjG83m4tmz0LUIOcmRK/bDEFd9xRi4oZo5ZePxL1hImXyMEGSYsKcxJRAIeSCSNJ2vKBBzAUq8FrgkRg84r7LSS9EVXsxgjgG50TlajlNYSnU1ItA98fKWNmPWqSgF1w5cAykG31/du0aRgrSR19q2UN6QP2ktPfTHcmFtmCDgMZRREF8nAS/kDM0RKiaRoox1WL1XhODbC/qI1KSmAuyiJM6b6ZHtTJVWmRCGGtRGKJRfHS0Ee8LVL2en9PeUVIMhacoXI80x+Dqj0Gcxlmp3HVl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768953077; c=relaxed/relaxed;
	bh=OjSQELt6MhMSruMz4BeE6G4yXGXsO8zdav7zAwmJHAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXz1icM6tKCuQHqmzj3Dv6d0p8x392m6QdKbPFjx13wQHioMhUSDO4Lzjk/FpNC2Rrq+5WDWbZHZDgZ3oGW9m7N+0jkTehehLibiDuBNVTtfCkETqnJjIvxtOEuqFZznkr20L9UXvNXDQXGfd2P/5wFxuq0uuyXk2uwKRQPCjbjnRF21jTDEB4XwcQVm/QTlfD+9XM39Tt+YuZoIccwFVANMeWC9aGTqLNdypA4V44rE1oC9AdWqgbSEogyHMCRRrzInGeBy+Z82FwCoW8Q7rPwpnmlwQfm96kF/nnWMinkPlxxtRqC3RYTpbjKZ6WLf/KyxljE/icLQI0CNGOLevw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VeJZQ/WV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VeJZQ/WV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwkcL70P9z2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 10:51:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768953076; x=1800489076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F5yoRbWch+cbaLBVp1uSb8AEgbjGteKlxCkICYJXx74=;
  b=VeJZQ/WVPEkpAxPiv41UXWwnJrFg986KXCA7lHQWzFpCBbdtZVCmq3mo
   XlMCE5AdP8+PqS5xIblstzqHwdxcrZaPloht4mYyE7qx71bNss8Vxkxja
   M4HpigEzcxhQAW01xcgyfjsKydZXLTbQs5ktdxdqDEVuHHGdCSnW3BB5F
   /LAmfyUOXIxpCU5vGMU33aKj/kF6IxdCn0FHizOWpMfvArCrT/9Ms1PLP
   qn9HSt1CIP7xDQ/PtaSDRRMk93leaBIcnzUDxDEPnuaOdoYMWUQC2jlka
   r/32F9ciF4I3cUCkyHgJBR692YxG2CMvnFgb8ur7shUCNWOSkl3I5JK58
   g==;
X-CSE-ConnectionGUID: 7A+Mr/GwRWCThMSFRxst0Q==
X-CSE-MsgGUID: KY2pO9UtST+Lrlxm5os7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70085033"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70085033"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:51:11 -0800
X-CSE-ConnectionGUID: rOndJBMSThSjHWZZ9Umqow==
X-CSE-MsgGUID: IGZYyd04RMieHEmL0zc4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206068459"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jan 2026 15:51:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viLUy-00000000Phh-3QZT;
	Tue, 20 Jan 2026 23:51:00 +0000
Date: Wed, 21 Jan 2026 07:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
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
In-Reply-To: <20260119130122.1283821-4-ryan.roberts@arm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16086-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ryan.roberts@arm.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:david.laight.linux@gmail.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,linutronix.de,redhat.com,alien8.de,linux.intel.com,arndb.de,zx2c4.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,git-scm.com:url,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: 235D94E231
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc6 next-20260119]
[cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

