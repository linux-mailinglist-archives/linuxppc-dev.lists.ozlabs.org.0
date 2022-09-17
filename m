Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 979B55BBA11
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 21:13:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVLFq3q0vz3bqC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 05:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KmH+WEu6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KmH+WEu6;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVLF90f9Mz2y2F
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Sep 2022 05:13:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663441997; x=1694977997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d+qHVA9z1lydHrwNoclbhPA6d9Aqs6FomGFSgsSlm5w=;
  b=KmH+WEu6vg/MsOidCv4e3onmJ9/qTcnws1H7Rtcyf5rRH188JKCZeZ01
   h9yfC4pYC2Zf8RsjIfE8NmoUdxVvf/390oOcvTIE3tEaIL5oN5HfikyUB
   7pYgcRirh6fqXb1Gw5yxjZRvJnc2/SWnDa/020PQwAQXtUKXOueoG7K+J
   VWho4wFEX5tMEHPMA5ppW1PixJ9Ft+03qsnSFpHUNwuy8ekmUkHmdXQnI
   +Ppcd0Y5/lI+SuB2H7JgK8uTBVs1a0P3fSK1uWyIr4Bp8vQnxkWC3rOZy
   CXBib3RCN+hUP6x3ebi2f/UwfLhTmMx4L0v6o32jfoj+eRb59nKWcFVbb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="278904046"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="278904046"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 12:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="707106404"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2022 12:13:05 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZdFQ-0000Xb-1H;
	Sat, 17 Sep 2022 19:13:04 +0000
Date: Sun, 18 Sep 2022 03:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 11/16] objtool: Add --mnop as an option to --mcount
Message-ID: <202209180354.tm3Z4uPD-lkp@intel.com>
References: <20220912082020.226755-12-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912082020.226755-12-sv@linux.ibm.com>
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
Cc: kbuild-all@lists.01.org, peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sathvika,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/topic/ppc-kvm]
[also build test WARNING on linus/master v6.0-rc5]
[cannot apply to powerpc/next masahiroy-kbuild/for-next next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220912-163023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20220918/202209180354.tm3Z4uPD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ca5e2b42c0d4438ba93623579b6860b98f3598f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220912-163023
        git checkout ca5e2b42c0d4438ba93623579b6860b98f3598f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: exc_page_fault+0xe: call to __sanitizer_cov_trace_pc() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: get_cpu_entry_area+0x3: call to __sanitizer_cov_trace_pc() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __stack_chk_fail+0x0: call to __sanitizer_cov_trace_pc() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ktime_get_real_seconds+0x0: call to __sanitizer_cov_trace_pc() leaves .noinstr.text section


objdump-func vmlinux.o exc_page_fault:
0000 00000000000020c0 <exc_page_fault>:
0000     20c0:	41 56                	push   %r14
0002     20c2:	41 55                	push   %r13
0004     20c4:	49 89 f5             	mov    %rsi,%r13
0007     20c7:	41 54                	push   %r12
0009     20c9:	55                   	push   %rbp
000a     20ca:	48 89 fd             	mov    %rdi,%rbp
000d     20cd:	53                   	push   %rbx
000e     20ce:	e8 00 00 00 00       	call   20d3 <exc_page_fault+0x13>	20cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0013     20d3:	41 0f 20 d4          	mov    %cr2,%r12
0017     20d7:	48 8b 04 25 00 00 00 00 	mov    0x0,%rax	20db: R_X86_64_32S	current_task
001f     20df:	48 8b 80 b8 03 00 00 	mov    0x3b8(%rax),%rax
0026     20e6:	0f 18 88 b0 00 00 00 	prefetcht0 0xb0(%rax)
002d     20ed:	44 8b 35 00 00 00 00 	mov    0x0(%rip),%r14d        # 20f4 <exc_page_fault+0x34>	20f0: R_X86_64_PC32	kvm_async_pf_enabled-0x4
0034     20f4:	31 ff                	xor    %edi,%edi
0036     20f6:	44 89 f6             	mov    %r14d,%esi
0039     20f9:	e8 00 00 00 00       	call   20fe <exc_page_fault+0x3e>	20fa: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
003e     20fe:	45 85 f6             	test   %r14d,%r14d
0041     2101:	0f 8f c9 00 00 00    	jg     21d0 <exc_page_fault+0x110>
0047     2107:	e8 00 00 00 00       	call   210c <exc_page_fault+0x4c>	2108: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
004c     210c:	48 89 ef             	mov    %rbp,%rdi
004f     210f:	e8 00 00 00 00       	call   2114 <exc_page_fault+0x54>	2110: R_X86_64_PLT32	irqentry_enter-0x4
0054     2114:	41 89 c6             	mov    %eax,%r14d
0057     2117:	90                   	nop
0058     2118:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 211e <exc_page_fault+0x5e>	211a: R_X86_64_PC32	trace_pagefault_key-0x4
005e     211e:	31 ff                	xor    %edi,%edi
0060     2120:	89 de                	mov    %ebx,%esi
0062     2122:	e8 00 00 00 00       	call   2127 <exc_page_fault+0x67>	2123: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0067     2127:	85 db                	test   %ebx,%ebx
0069     2129:	0f 8f c6 00 00 00    	jg     21f5 <exc_page_fault+0x135>
006f     212f:	e8 00 00 00 00       	call   2134 <exc_page_fault+0x74>	2130: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0074     2134:	4c 89 e3             	mov    %r12,%rbx
0077     2137:	48 c7 c7 00 00 60 ff 	mov    $0xffffffffff600000,%rdi
007e     213e:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
0085     2145:	48 89 de             	mov    %rbx,%rsi
0088     2148:	e8 00 00 00 00       	call   214d <exc_page_fault+0x8d>	2149: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
008d     214d:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
0094     2154:	74 23                	je     2179 <exc_page_fault+0xb9>
0096     2156:	48 bb ff ef ff ff ff 7f 00 00 	movabs $0x7fffffffefff,%rbx
00a0     2160:	e8 00 00 00 00       	call   2165 <exc_page_fault+0xa5>	2161: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00a5     2165:	4c 89 e6             	mov    %r12,%rsi
00a8     2168:	48 89 df             	mov    %rbx,%rdi
00ab     216b:	e8 00 00 00 00       	call   2170 <exc_page_fault+0xb0>	216c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00b0     2170:	49 39 dc             	cmp    %rbx,%r12
00b3     2173:	0f 87 47 01 00 00    	ja     22c0 <exc_page_fault+0x200>
00b9     2179:	e8 00 00 00 00       	call   217e <exc_page_fault+0xbe>	217a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00be     217e:	4c 89 e2             	mov    %r12,%rdx
00c1     2181:	4c 89 ee             	mov    %r13,%rsi
00c4     2184:	48 89 ef             	mov    %rbp,%rdi
00c7     2187:	e8 00 00 00 00       	call   218c <exc_page_fault+0xcc>	2188: R_X86_64_PC32	.text+0x6fcfc
00cc     218c:	9c                   	pushf
00cd     218d:	41 5c                	pop    %r12
00cf     218f:	41 81 e4 00 02 00 00 	and    $0x200,%r12d
00d6     2196:	fa                   	cli
00d7     2197:	31 ff                	xor    %edi,%edi
00d9     2199:	4c 89 e6             	mov    %r12,%rsi
00dc     219c:	e8 00 00 00 00       	call   21a1 <exc_page_fault+0xe1>	219d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00e1     21a1:	4d 85 e4             	test   %r12,%r12
00e4     21a4:	75 1e                	jne    21c4 <exc_page_fault+0x104>
00e6     21a6:	e8 00 00 00 00       	call   21ab <exc_page_fault+0xeb>	21a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00eb     21ab:	90                   	nop
00ec     21ac:	44 89 f6             	mov    %r14d,%esi
00ef     21af:	48 89 ef             	mov    %rbp,%rdi
00f2     21b2:	e8 00 00 00 00       	call   21b7 <exc_page_fault+0xf7>	21b3: R_X86_64_PLT32	irqentry_exit-0x4
00f7     21b7:	5b                   	pop    %rbx
00f8     21b8:	5d                   	pop    %rbp
00f9     21b9:	41 5c                	pop    %r12
00fb     21bb:	41 5d                	pop    %r13
00fd     21bd:	41 5e                	pop    %r14
00ff     21bf:	e9 00 00 00 00       	jmp    21c4 <exc_page_fault+0x104>	21c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0104     21c4:	e8 00 00 00 00       	call   21c9 <exc_page_fault+0x109>	21c5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0109     21c9:	e8 00 00 00 00       	call   21ce <exc_page_fault+0x10e>	21ca: R_X86_64_PLT32	trace_hardirqs_off-0x4
010e     21ce:	eb d6                	jmp    21a6 <exc_page_fault+0xe6>
0110     21d0:	e8 00 00 00 00       	call   21d5 <exc_page_fault+0x115>	21d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0115     21d5:	44 89 e6             	mov    %r12d,%esi
0118     21d8:	48 89 ef             	mov    %rbp,%rdi
011b     21db:	e8 00 00 00 00       	call   21e0 <exc_page_fault+0x120>	21dc: R_X86_64_PLT32	__kvm_handle_async_pf-0x4
0120     21e0:	31 ff                	xor    %edi,%edi
0122     21e2:	89 c3                	mov    %eax,%ebx
0124     21e4:	89 c6                	mov    %eax,%esi
0126     21e6:	e8 00 00 00 00       	call   21eb <exc_page_fault+0x12b>	21e7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
012b     21eb:	84 db                	test   %bl,%bl
012d     21ed:	0f 84 14 ff ff ff    	je     2107 <exc_page_fault+0x47>
0133     21f3:	eb c2                	jmp    21b7 <exc_page_fault+0xf7>
0135     21f5:	e8 00 00 00 00       	call   21fa <exc_page_fault+0x13a>	21f6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
013a     21fa:	48 8b 9d 88 00 00 00 	mov    0x88(%rbp),%rbx
0141     2201:	31 ff                	xor    %edi,%edi
0143     2203:	83 e3 03             	and    $0x3,%ebx
0146     2206:	48 89 de             	mov    %rbx,%rsi
0149     2209:	e8 00 00 00 00       	call   220e <exc_page_fault+0x14e>	220a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
014e     220e:	48 85 db             	test   %rbx,%rbx
0151     2211:	0f 84 02 01 00 00    	je     2319 <exc_page_fault+0x259>
0157     2217:	e8 00 00 00 00       	call   221c <exc_page_fault+0x15c>	2218: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
015c     221c:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 2222 <exc_page_fault+0x162>	221e: R_X86_64_PC32	__tracepoint_page_fault_user+0x4
0162     2222:	31 ff                	xor    %edi,%edi
0164     2224:	89 de                	mov    %ebx,%esi
0166     2226:	e8 00 00 00 00       	call   222b <exc_page_fault+0x16b>	2227: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
016b     222b:	85 db                	test   %ebx,%ebx
016d     222d:	0f 8f dc 01 00 00    	jg     240f <exc_page_fault+0x34f>
0173     2233:	e8 00 00 00 00       	call   2238 <exc_page_fault+0x178>	2234: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0178     2238:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 223e <exc_page_fault+0x17e>	223a: R_X86_64_PC32	__preempt_count-0x4
017e     223e:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 2245 <exc_page_fault+0x185>	2241: R_X86_64_PC32	__tracepoint_page_fault_user+0x34
0185     2245:	e8 00 00 00 00       	call   224a <exc_page_fault+0x18a>	2246: R_X86_64_PLT32	rcu_read_lock_sched_held-0x4
018a     224a:	31 ff                	xor    %edi,%edi
018c     224c:	89 c3                	mov    %eax,%ebx
018e     224e:	89 c6                	mov    %eax,%esi
0190     2250:	e8 00 00 00 00       	call   2255 <exc_page_fault+0x195>	2251: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0195     2255:	85 db                	test   %ebx,%ebx
0197     2257:	0f 85 fe 00 00 00    	jne    235b <exc_page_fault+0x29b>
019d     225d:	e8 00 00 00 00       	call   2262 <exc_page_fault+0x1a2>	225e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a2     2262:	e8 00 00 00 00       	call   2267 <exc_page_fault+0x1a7>	2263: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
01a7     2267:	31 ff                	xor    %edi,%edi
01a9     2269:	89 c3                	mov    %eax,%ebx
01ab     226b:	89 c6                	mov    %eax,%esi
01ad     226d:	e8 00 00 00 00       	call   2272 <exc_page_fault+0x1b2>	226e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
01b2     2272:	85 db                	test   %ebx,%ebx
01b4     2274:	0f 84 e1 00 00 00    	je     235b <exc_page_fault+0x29b>
01ba     227a:	e8 00 00 00 00       	call   227f <exc_page_fault+0x1bf>	227b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01bf     227f:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 2286 <exc_page_fault+0x1c6>	2282: R_X86_64_PC32	.data.unlikely+0x23
01c6     2286:	31 ff                	xor    %edi,%edi
01c8     2288:	89 de                	mov    %ebx,%esi
01ca     228a:	e8 00 00 00 00       	call   228f <exc_page_fault+0x1cf>	228b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
01cf     228f:	84 db                	test   %bl,%bl
01d1     2291:	0f 85 c4 00 00 00    	jne    235b <exc_page_fault+0x29b>
01d7     2297:	e8 00 00 00 00       	call   229c <exc_page_fault+0x1dc>	2298: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01dc     229c:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	229f: R_X86_64_32S	.rodata.str1.8+0xafd8
01e3     22a3:	be 2c 00 00 00       	mov    $0x2c,%esi
01e8     22a8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	22ab: R_X86_64_32S	.rodata.str1.8+0xb008
01ef     22af:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 22b6 <exc_page_fault+0x1f6>	22b1: R_X86_64_PC32	.data.unlikely+0x22
01f6     22b6:	e8 00 00 00 00       	call   22bb <exc_page_fault+0x1fb>	22b7: R_X86_64_PLT32	lockdep_rcu_suspicious-0x4
01fb     22bb:	e9 9b 00 00 00       	jmp    235b <exc_page_fault+0x29b>
0200     22c0:	e8 00 00 00 00       	call   22c5 <exc_page_fault+0x205>	22c1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0205     22c5:	4c 89 eb             	mov    %r13,%rbx
0208     22c8:	31 ff                	xor    %edi,%edi
020a     22ca:	83 e3 20             	and    $0x20,%ebx
020d     22cd:	48 89 de             	mov    %rbx,%rsi
0210     22d0:	e8 00 00 00 00       	call   22d5 <exc_page_fault+0x215>	22d1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0215     22d5:	48 85 db             	test   %rbx,%rbx
0218     22d8:	0f 85 e5 00 00 00    	jne    23c3 <exc_page_fault+0x303>
021e     22de:	e8 00 00 00 00       	call   22e3 <exc_page_fault+0x223>	22df: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0223     22e3:	4c 89 e6             	mov    %r12,%rsi
0226     22e6:	4c 89 ef             	mov    %r13,%rdi
0229     22e9:	e8 00 00 00 00       	call   22ee <exc_page_fault+0x22e>	22ea: R_X86_64_PC32	.text+0x706fc
022e     22ee:	31 ff                	xor    %edi,%edi
0230     22f0:	89 c3                	mov    %eax,%ebx
0232     22f2:	89 c6                	mov    %eax,%esi
0234     22f4:	e8 00 00 00 00       	call   22f9 <exc_page_fault+0x239>	22f5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0239     22f9:	85 db                	test   %ebx,%ebx
023b     22fb:	0f 85 a5 fe ff ff    	jne    21a6 <exc_page_fault+0xe6>
0241     2301:	e8 00 00 00 00       	call   2306 <exc_page_fault+0x246>	2302: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0246     2306:	4c 89 e2             	mov    %r12,%rdx
0249     2309:	4c 89 ee             	mov    %r13,%rsi
024c     230c:	48 89 ef             	mov    %rbp,%rdi
024f     230f:	e8 00 00 00 00       	call   2314 <exc_page_fault+0x254>	2310: R_X86_64_PC32	.text+0x6fbbc
0254     2314:	e9 8d fe ff ff       	jmp    21a6 <exc_page_fault+0xe6>
0259     2319:	e8 00 00 00 00       	call   231e <exc_page_fault+0x25e>	231a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
025e     231e:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 2324 <exc_page_fault+0x264>	2320: R_X86_64_PC32	__tracepoint_page_fault_kernel+0x4
0264     2324:	31 ff                	xor    %edi,%edi
0266     2326:	89 de                	mov    %ebx,%esi
0268     2328:	e8 00 00 00 00       	call   232d <exc_page_fault+0x26d>	2329: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
026d     232d:	85 db                	test   %ebx,%ebx
026f     232f:	0f 8f 9c 00 00 00    	jg     23d1 <exc_page_fault+0x311>
0275     2335:	e8 00 00 00 00       	call   233a <exc_page_fault+0x27a>	2336: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
027a     233a:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 2340 <exc_page_fault+0x280>	233c: R_X86_64_PC32	__preempt_count-0x4
0280     2340:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 2347 <exc_page_fault+0x287>	2343: R_X86_64_PC32	__tracepoint_page_fault_kernel+0x34
0287     2347:	e8 00 00 00 00       	call   234c <exc_page_fault+0x28c>	2348: R_X86_64_PLT32	rcu_read_lock_sched_held-0x4
028c     234c:	31 ff                	xor    %edi,%edi
028e     234e:	89 c3                	mov    %eax,%ebx
0290     2350:	89 c6                	mov    %eax,%esi
0292     2352:	e8 00 00 00 00       	call   2357 <exc_page_fault+0x297>	2353: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0297     2357:	85 db                	test   %ebx,%ebx
0299     2359:	74 10                	je     236b <exc_page_fault+0x2ab>
029b     235b:	e8 00 00 00 00       	call   2360 <exc_page_fault+0x2a0>	235c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02a0     2360:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 2366 <exc_page_fault+0x2a6>	2362: R_X86_64_PC32	__preempt_count-0x4
02a6     2366:	e9 c4 fd ff ff       	jmp    212f <exc_page_fault+0x6f>
02ab     236b:	e8 00 00 00 00       	call   2370 <exc_page_fault+0x2b0>	236c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02b0     2370:	e8 00 00 00 00       	call   2375 <exc_page_fault+0x2b5>	2371: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
02b5     2375:	31 ff                	xor    %edi,%edi
02b7     2377:	89 c3                	mov    %eax,%ebx
02b9     2379:	89 c6                	mov    %eax,%esi
02bb     237b:	e8 00 00 00 00       	call   2380 <exc_page_fault+0x2c0>	237c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
02c0     2380:	85 db                	test   %ebx,%ebx
02c2     2382:	74 d7                	je     235b <exc_page_fault+0x29b>
02c4     2384:	e8 00 00 00 00       	call   2389 <exc_page_fault+0x2c9>	2385: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02c9     2389:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 2390 <exc_page_fault+0x2d0>	238c: R_X86_64_PC32	.data.unlikely+0x22
02d0     2390:	31 ff                	xor    %edi,%edi
02d2     2392:	89 de                	mov    %ebx,%esi
02d4     2394:	e8 00 00 00 00       	call   2399 <exc_page_fault+0x2d9>	2395: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
02d9     2399:	84 db                	test   %bl,%bl
02db     239b:	75 be                	jne    235b <exc_page_fault+0x29b>
02dd     239d:	e8 00 00 00 00       	call   23a2 <exc_page_fault+0x2e2>	239e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e2     23a2:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	23a5: R_X86_64_32S	.rodata.str1.8+0xafd8
02e9     23a9:	be 2d 00 00 00       	mov    $0x2d,%esi
02ee     23ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	23b1: R_X86_64_32S	.rodata.str1.8+0xb008
02f5     23b5:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 23bc <exc_page_fault+0x2fc>	23b7: R_X86_64_PC32	.data.unlikely+0x21
02fc     23bc:	e8 00 00 00 00       	call   23c1 <exc_page_fault+0x301>	23bd: R_X86_64_PLT32	lockdep_rcu_suspicious-0x4
0301     23c1:	eb 98                	jmp    235b <exc_page_fault+0x29b>
0303     23c3:	e8 00 00 00 00       	call   23c8 <exc_page_fault+0x308>	23c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0308     23c8:	90                   	nop
0309     23c9:	0f 0b                	ud2
030b     23cb:	90                   	nop
030c     23cc:	e9 0d ff ff ff       	jmp    22de <exc_page_fault+0x21e>
0311     23d1:	e8 00 00 00 00       	call   23d6 <exc_page_fault+0x316>	23d2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0316     23d6:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 23dc <exc_page_fault+0x31c>	23d8: R_X86_64_PC32	__preempt_count-0x4
031c     23dc:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 23e3 <exc_page_fault+0x323>	23df: R_X86_64_PC32	__tracepoint_page_fault_kernel+0x34
0323     23e3:	48 85 db             	test   %rbx,%rbx
0326     23e6:	74 17                	je     23ff <exc_page_fault+0x33f>
0328     23e8:	e8 00 00 00 00       	call   23ed <exc_page_fault+0x32d>	23e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
032d     23ed:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
0331     23f1:	4c 89 e9             	mov    %r13,%rcx
0334     23f4:	48 89 ea             	mov    %rbp,%rdx
0337     23f7:	4c 89 e6             	mov    %r12,%rsi
033a     23fa:	e8 00 00 00 00       	call   23ff <exc_page_fault+0x33f>	23fb: R_X86_64_PLT32	__SCT__tp_func_page_fault_kernel-0x4
033f     23ff:	e8 00 00 00 00       	call   2404 <exc_page_fault+0x344>	2400: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0344     2404:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 240a <exc_page_fault+0x34a>	2406: R_X86_64_PC32	__preempt_count-0x4
034a     240a:	e9 26 ff ff ff       	jmp    2335 <exc_page_fault+0x275>
034f     240f:	e8 00 00 00 00       	call   2414 <exc_page_fault+0x354>	2410: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0354     2414:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 241a <exc_page_fault+0x35a>	2416: R_X86_64_PC32	__preempt_count-0x4
035a     241a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 2421 <exc_page_fault+0x361>	241d: R_X86_64_PC32	__tracepoint_page_fault_user+0x34
0361     2421:	48 85 db             	test   %rbx,%rbx
0364     2424:	74 17                	je     243d <exc_page_fault+0x37d>
0366     2426:	e8 00 00 00 00       	call   242b <exc_page_fault+0x36b>	2427: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
036b     242b:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
036f     242f:	4c 89 e9             	mov    %r13,%rcx
0372     2432:	48 89 ea             	mov    %rbp,%rdx
0375     2435:	4c 89 e6             	mov    %r12,%rsi
0378     2438:	e8 00 00 00 00       	call   243d <exc_page_fault+0x37d>	2439: R_X86_64_PLT32	__SCT__tp_func_page_fault_user-0x4
037d     243d:	e8 00 00 00 00       	call   2442 <exc_page_fault+0x382>	243e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0382     2442:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 2448 <exc_page_fault+0x388>	2444: R_X86_64_PC32	__preempt_count-0x4
0388     2448:	e9 e6 fd ff ff       	jmp    2233 <exc_page_fault+0x173>
038d     244d:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0397     2457:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
03a1     2461:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
03ab     246b:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
03b5     2475:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
03bf     247f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
