Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9862E73A8DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:17:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cnArpf0h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn9B13sdJz3bmQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 05:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cnArpf0h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn9964DPjz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 05:16:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687461418; x=1718997418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uI2cugghMPMvRogKoZJ3oTm+3R3ufG4U0Yhvp+OeKGs=;
  b=cnArpf0hP69u4XQl4IZcbvi//G24c8ZVGo1fdrKKbFwyyE0Up/3cb+1V
   P0MuUJxuy43Wn3NXxrfHFW9SHc5PyFkZJOysLvHJHjtUdokSRMh4EqZRC
   xXWgJxsG6cZMh6v6aC7krWD1GLwWbkdyAlKw69TOs0C6s+Pk0s6ow7QG9
   UkpYYzu7XXDo6ivzdIimwYf9CjEig+ter1Ws1Ud5IZDTkyi6BTXWCpDfz
   b9V6pXKXRaFzDBGoq/j23fBmnO6Z5vgvx+l1vMKvpt8MWtK4IOKmjrESm
   03YZEhNcv8oytWKYrI7UDBychgyiayO82ql9bMe/EHUaDt58rWcOz/nxR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359451002"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="359451002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 12:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="961695680"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="961695680"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2023 12:16:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCPnR-0007kk-2R;
	Thu, 22 Jun 2023 19:16:45 +0000
Date: Fri, 23 Jun 2023 03:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sathvika Vasireddy <sv@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
Message-ID: <202306230353.iPqv57lK-lkp@intel.com>
References: <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.4-rc7]
[cannot apply to next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-kuap-Avoid-unnecessary-reads-of-MD_AP/20230622-185950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
config: powerpc-randconfig-r025-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230353.iPqv57lK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230353.iPqv57lK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230353.iPqv57lK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/ubsan.c:307:6: warning: no previous prototype for '__ubsan_handle_type_mismatch' [-Wmissing-prototypes]
     307 | void __ubsan_handle_type_mismatch(struct type_mismatch_data *data,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/ubsan.o: warning: objtool: ubsan_type_mismatch_common+0x24: UACCESS-safe disables UACCESS
   lib/ubsan.o: warning: objtool: __ubsan_handle_type_mismatch+0x54: call to _restgpr_30_x() with UACCESS enabled
   lib/ubsan.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0x5c: call to _restgpr_30_x() with UACCESS enabled
   lib/ubsan.o: warning: objtool: __ubsan_handle_load_invalid_value+0x28: call to memset() with UACCESS enabled
   lib/ubsan.o: warning: objtool: __ubsan_handle_shift_out_of_bounds+0x34: call to memset() with UACCESS enabled
--
>> arch/powerpc/kernel/ptrace/ptrace-view.o: warning: objtool: gpr32_set_common+0x2b8: redundant UACCESS disable


objdump-func vmlinux.o ubsan_type_mismatch_common:
0000 00000000 <ubsan_type_mismatch_common>:
0000    0:	94 21 ff e0 	stwu    r1,-32(r1)
0004    4:	7c 08 02 a6 	mflr    r0
0008    8:	bf 61 00 0c 	stmw    r27,12(r1)
000c    c:	7c 7f 1b 78 	mr      r31,r3
0010   10:	90 01 00 24 	stw     r0,36(r1)
0014   14:	7c 9e 23 78 	mr      r30,r4
0018   18:	48 00 00 01 	bl      18 <ubsan_type_mismatch_common+0x18>	18: R_PPC_REL24	__sanitizer_cov_trace_pc
001c   1c:	7f 90 0a a6 	mfpid   r28
0020   20:	39 20 00 00 	li      r9,0
0024   24:	7d 30 0b a6 	mtpid   r9
0028   28:	4c 00 01 2c 	isync
002c   2c:	2c 1e 00 00 	cmpwi   r30,0
0030   30:	40 e2 00 58 	bne+    88 <ubsan_type_mismatch_common+0x88>
0034   34:	48 00 00 01 	bl      34 <ubsan_type_mismatch_common+0x34>	34: R_PPC_REL24	__sanitizer_cov_trace_pc
0038   38:	80 7f 00 00 	lwz     r3,0(r31)
003c   3c:	48 00 00 01 	bl      3c <ubsan_type_mismatch_common+0x3c>	3c: R_PPC_REL24	.text.suppress_report
0040   40:	2c 03 00 00 	cmpwi   r3,0
0044   44:	40 e2 01 30 	bne+    174 <ubsan_type_mismatch_common+0x174>
0048   48:	48 00 00 01 	bl      48 <ubsan_type_mismatch_common+0x48>	48: R_PPC_REL24	__sanitizer_cov_trace_pc
004c   4c:	80 7f 00 00 	lwz     r3,0(r31)
0050   50:	3c 80 00 00 	lis     r4,0	52: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1
0054   54:	38 84 00 00 	addi    r4,r4,0	56: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1
0058   58:	48 00 00 01 	bl      58 <ubsan_type_mismatch_common+0x58>	58: R_PPC_REL24	.text.unlikely.ubsan_prologue
005c   5c:	89 3f 00 0c 	lbz     r9,12(r31)
0060   60:	3d 40 00 00 	lis     r10,0	62: R_PPC_ADDR16_HA	.rodata.type_check_kinds
0064   64:	80 bf 00 04 	lwz     r5,4(r31)
0068   68:	39 4a 00 00 	addi    r10,r10,0	6a: R_PPC_ADDR16_LO	.rodata.type_check_kinds
006c   6c:	55 29 10 3a 	slwi    r9,r9,2
0070   70:	7c 8a 48 2e 	lwzx    r4,r10,r9
0074   74:	3c 60 00 00 	lis     r3,0	76: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1+0xf
0078   78:	38 a5 00 04 	addi    r5,r5,4
007c   7c:	38 63 00 00 	addi    r3,r3,0	7e: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1+0xf
0080   80:	48 00 00 01 	bl      80 <ubsan_type_mismatch_common+0x80>	80: R_PPC_REL24	_printk
0084   84:	48 00 00 ec 	b       170 <ubsan_type_mismatch_common+0x170>
0088   88:	48 00 00 01 	bl      88 <ubsan_type_mismatch_common+0x88>	88: R_PPC_REL24	__sanitizer_cov_trace_pc
008c   8c:	83 bf 00 08 	lwz     r29,8(r31)
0090   90:	83 7f 00 00 	lwz     r27,0(r31)
0094   94:	2c 1d 00 00 	cmpwi   r29,0
0098   98:	41 c2 00 78 	beq-    110 <ubsan_type_mismatch_common+0x110>
009c   9c:	3b bd ff ff 	addi    r29,r29,-1
00a0   a0:	48 00 00 01 	bl      a0 <ubsan_type_mismatch_common+0xa0>	a0: R_PPC_REL24	__sanitizer_cov_trace_pc
00a4   a4:	7f bd f0 39 	and.    r29,r29,r30
00a8   a8:	41 e2 00 68 	beq+    110 <ubsan_type_mismatch_common+0x110>
00ac   ac:	48 00 00 01 	bl      ac <ubsan_type_mismatch_common+0xac>	ac: R_PPC_REL24	__sanitizer_cov_trace_pc
00b0   b0:	7f 63 db 78 	mr      r3,r27
00b4   b4:	48 00 00 01 	bl      b4 <ubsan_type_mismatch_common+0xb4>	b4: R_PPC_REL24	.text.suppress_report
00b8   b8:	2c 03 00 00 	cmpwi   r3,0
00bc   bc:	40 e2 00 b8 	bne+    174 <ubsan_type_mismatch_common+0x174>
00c0   c0:	48 00 00 01 	bl      c0 <ubsan_type_mismatch_common+0xc0>	c0: R_PPC_REL24	__sanitizer_cov_trace_pc
00c4   c4:	80 7f 00 00 	lwz     r3,0(r31)
00c8   c8:	3c 80 00 00 	lis     r4,0	ca: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1+0x2d
00cc   cc:	38 84 00 00 	addi    r4,r4,0	ce: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1+0x2d
00d0   d0:	48 00 00 01 	bl      d0 <ubsan_type_mismatch_common+0xd0>	d0: R_PPC_REL24	.text.unlikely.ubsan_prologue
00d4   d4:	89 3f 00 0c 	lbz     r9,12(r31)
00d8   d8:	3d 40 00 00 	lis     r10,0	da: R_PPC_ADDR16_HA	.rodata.type_check_kinds
00dc   dc:	80 df 00 04 	lwz     r6,4(r31)
00e0   e0:	39 4a 00 00 	addi    r10,r10,0	e2: R_PPC_ADDR16_LO	.rodata.type_check_kinds
00e4   e4:	55 29 10 3a 	slwi    r9,r9,2
00e8   e8:	7c 8a 48 2e 	lwzx    r4,r10,r9
00ec   ec:	3c 60 00 00 	lis     r3,0	ee: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1+0x3f
00f0   f0:	38 c6 00 04 	addi    r6,r6,4
00f4   f4:	7f c5 f3 78 	mr      r5,r30
00f8   f8:	38 63 00 00 	addi    r3,r3,0	fa: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1+0x3f
00fc   fc:	48 00 00 01 	bl      fc <ubsan_type_mismatch_common+0xfc>	fc: R_PPC_REL24	_printk
0100  100:	3c 60 00 00 	lis     r3,0	102: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1+0x67
0104  104:	80 9f 00 08 	lwz     r4,8(r31)
0108  108:	38 63 00 00 	addi    r3,r3,0	10a: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1+0x67
010c  10c:	48 00 00 60 	b       16c <ubsan_type_mismatch_common+0x16c>
0110  110:	48 00 00 01 	bl      110 <ubsan_type_mismatch_common+0x110>	110: R_PPC_REL24	__sanitizer_cov_trace_pc
0114  114:	7f 63 db 78 	mr      r3,r27
0118  118:	48 00 00 01 	bl      118 <ubsan_type_mismatch_common+0x118>	118: R_PPC_REL24	.text.suppress_report
011c  11c:	2c 03 00 00 	cmpwi   r3,0
0120  120:	40 e2 00 54 	bne+    174 <ubsan_type_mismatch_common+0x174>
0124  124:	48 00 00 01 	bl      124 <ubsan_type_mismatch_common+0x124>	124: R_PPC_REL24	__sanitizer_cov_trace_pc
0128  128:	80 7f 00 00 	lwz     r3,0(r31)
012c  12c:	3c 80 00 00 	lis     r4,0	12e: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1+0x8c
0130  130:	38 84 00 00 	addi    r4,r4,0	132: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1+0x8c
0134  134:	48 00 00 01 	bl      134 <ubsan_type_mismatch_common+0x134>	134: R_PPC_REL24	.text.unlikely.ubsan_prologue
0138  138:	89 3f 00 0c 	lbz     r9,12(r31)
013c  13c:	3d 40 00 00 	lis     r10,0	13e: R_PPC_ADDR16_HA	.rodata.type_check_kinds
0140  140:	39 4a 00 00 	addi    r10,r10,0	142: R_PPC_ADDR16_LO	.rodata.type_check_kinds
0144  144:	55 29 10 3a 	slwi    r9,r9,2
0148  148:	3c 60 00 00 	lis     r3,0	14a: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1+0xa1
014c  14c:	7c 8a 48 2e 	lwzx    r4,r10,r9
0150  150:	7f c5 f3 78 	mr      r5,r30
0154  154:	38 63 00 00 	addi    r3,r3,0	156: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1+0xa1
0158  158:	48 00 00 01 	bl      158 <ubsan_type_mismatch_common+0x158>	158: R_PPC_REL24	_printk
015c  15c:	80 9f 00 04 	lwz     r4,4(r31)
0160  160:	3c 60 00 00 	lis     r3,0	162: R_PPC_ADDR16_HA	.rodata.ubsan_type_mismatch_common.str1.1+0xca
0164  164:	38 63 00 00 	addi    r3,r3,0	166: R_PPC_ADDR16_LO	.rodata.ubsan_type_mismatch_common.str1.1+0xca
0168  168:	38 84 00 04 	addi    r4,r4,4
016c  16c:	48 00 00 01 	bl      16c <ubsan_type_mismatch_common+0x16c>	16c: R_PPC_REL24	_printk
0170  170:	48 00 00 01 	bl      170 <ubsan_type_mismatch_common+0x170>	170: R_PPC_REL24	.text.unlikely.ubsan_epilogue
0174  174:	48 00 00 01 	bl      174 <ubsan_type_mismatch_common+0x174>	174: R_PPC_REL24	__sanitizer_cov_trace_pc
0178  178:	2c 1c 00 00 	cmpwi   r28,0
017c  17c:	41 e2 00 14 	beq+    190 <ubsan_type_mismatch_common+0x190>
0180  180:	48 00 00 01 	bl      180 <ubsan_type_mismatch_common+0x180>	180: R_PPC_REL24	__sanitizer_cov_trace_pc
0184  184:	81 22 0e b4 	lwz     r9,3764(r2)
0188  188:	7d 30 0b a6 	mtpid   r9
018c  18c:	4c 00 01 2c 	isync
0190  190:	80 01 00 24 	lwz     r0,36(r1)
0194  194:	83 61 00 0c 	lwz     r27,12(r1)
0198  198:	83 81 00 10 	lwz     r28,16(r1)
019c  19c:	83 a1 00 14 	lwz     r29,20(r1)
01a0  1a0:	7c 08 03 a6 	mtlr    r0
01a4  1a4:	83 c1 00 18 	lwz     r30,24(r1)
01a8  1a8:	83 e1 00 1c 	lwz     r31,28(r1)
01ac  1ac:	38 21 00 20 	addi    r1,r1,32
01b0  1b0:	48 00 00 00 	b       1b0 <ubsan_type_mismatch_common+0x1b0>	1b0: R_PPC_REL24	__sanitizer_cov_trace_pc

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
