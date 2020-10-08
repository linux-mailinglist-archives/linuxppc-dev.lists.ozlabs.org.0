Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 446D1287356
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 13:27:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6TTQ6xjXzDqBj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 22:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6TQm4X4jzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 22:25:32 +1100 (AEDT)
IronPort-SDR: LwApqzEOkCJNkKTKxTecLps1ei2iVBnNdmBy/b6nXyed3P9uXz9xq7dO2fBqfd8NDm7HnKzwsQ
 t73cJZ0xofRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="145184976"
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
 d="gz'50?scan'50,208,50";a="145184976"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 04:25:28 -0700
IronPort-SDR: xgESGjZNjDJZVsfPKCJ7dpAcWWYlP3ADSE/i//OqP19lkvQ1JRK03NmjsmJdwkZ/nnDMvVqd04
 bVGogkhM10CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
 d="gz'50?scan'50,208,50";a="354461967"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Oct 2020 04:25:26 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kQU33-00023q-KY; Thu, 08 Oct 2020 11:25:25 +0000
Date: Thu, 8 Oct 2020 19:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v4 2/4] powerpc/sstep: Support VSX vector paired storage
 access instructions
Message-ID: <202010081900.qsL0QYZ6-lkp@intel.com>
References: <20201008072726.233086-3-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20201008072726.233086-3-ravi.bangoria@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: ravi.bangoria@linux.ibm.com, kbuild-all@lists.01.org, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ravi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.9-rc8 next-20201007]
[cannot apply to mpe/next scottwood/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ravi-Bangoria/powerpc-sstep-VSX-32-byte-vector-paired-load-store-instructions/20201008-153614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-g5_defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/55def6779849f9aec057f405abf1cd98a8674b4f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ravi-Bangoria/powerpc-sstep-VSX-32-byte-vector-paired-load-store-instructions/20201008-153614
        git checkout 55def6779849f9aec057f405abf1cd98a8674b4f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:2901:15: error: implicit declaration of function 'VSX_REGISTER_XTP'; did you mean 'H_REGISTER_SMR'? [-Werror=implicit-function-declaration]
    2901 |     op->reg = VSX_REGISTER_XTP(rd);
         |               ^~~~~~~~~~~~~~~~
         |               H_REGISTER_SMR
   cc1: all warnings being treated as errors

vim +2901 arch/powerpc/lib/sstep.c

  2815	
  2816	#ifdef __powerpc64__
  2817		case 62:	/* std[u] */
  2818			op->ea = dsform_ea(word, regs);
  2819			switch (word & 3) {
  2820			case 0:		/* std */
  2821				op->type = MKOP(STORE, 0, 8);
  2822				break;
  2823			case 1:		/* stdu */
  2824				op->type = MKOP(STORE, UPDATE, 8);
  2825				break;
  2826			case 2:		/* stq */
  2827				if (!(rd & 1))
  2828					op->type = MKOP(STORE, 0, 16);
  2829				break;
  2830			}
  2831			break;
  2832		case 1: /* Prefixed instructions */
  2833			if (!cpu_has_feature(CPU_FTR_ARCH_31))
  2834				return -1;
  2835	
  2836			prefix_r = GET_PREFIX_R(word);
  2837			ra = GET_PREFIX_RA(suffix);
  2838			op->update_reg = ra;
  2839			rd = (suffix >> 21) & 0x1f;
  2840			op->reg = rd;
  2841			op->val = regs->gpr[rd];
  2842	
  2843			suffixopcode = get_op(suffix);
  2844			prefixtype = (word >> 24) & 0x3;
  2845			switch (prefixtype) {
  2846			case 0: /* Type 00  Eight-Byte Load/Store */
  2847				if (prefix_r && ra)
  2848					break;
  2849				op->ea = mlsd_8lsd_ea(word, suffix, regs);
  2850				switch (suffixopcode) {
  2851				case 41:	/* plwa */
  2852					op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
  2853					break;
  2854				case 42:        /* plxsd */
  2855					op->reg = rd + 32;
  2856					op->type = MKOP(LOAD_VSX, PREFIXED, 8);
  2857					op->element_size = 8;
  2858					op->vsx_flags = VSX_CHECK_VEC;
  2859					break;
  2860				case 43:	/* plxssp */
  2861					op->reg = rd + 32;
  2862					op->type = MKOP(LOAD_VSX, PREFIXED, 4);
  2863					op->element_size = 8;
  2864					op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
  2865					break;
  2866				case 46:	/* pstxsd */
  2867					op->reg = rd + 32;
  2868					op->type = MKOP(STORE_VSX, PREFIXED, 8);
  2869					op->element_size = 8;
  2870					op->vsx_flags = VSX_CHECK_VEC;
  2871					break;
  2872				case 47:	/* pstxssp */
  2873					op->reg = rd + 32;
  2874					op->type = MKOP(STORE_VSX, PREFIXED, 4);
  2875					op->element_size = 8;
  2876					op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
  2877					break;
  2878				case 51:	/* plxv1 */
  2879					op->reg += 32;
  2880					fallthrough;
  2881				case 50:	/* plxv0 */
  2882					op->type = MKOP(LOAD_VSX, PREFIXED, 16);
  2883					op->element_size = 16;
  2884					op->vsx_flags = VSX_CHECK_VEC;
  2885					break;
  2886				case 55:	/* pstxv1 */
  2887					op->reg = rd + 32;
  2888					fallthrough;
  2889				case 54:	/* pstxv0 */
  2890					op->type = MKOP(STORE_VSX, PREFIXED, 16);
  2891					op->element_size = 16;
  2892					op->vsx_flags = VSX_CHECK_VEC;
  2893					break;
  2894				case 56:        /* plq */
  2895					op->type = MKOP(LOAD, PREFIXED, 16);
  2896					break;
  2897				case 57:	/* pld */
  2898					op->type = MKOP(LOAD, PREFIXED, 8);
  2899					break;
  2900				case 58:        /* plxvp */
> 2901					op->reg = VSX_REGISTER_XTP(rd);
  2902					op->type = MKOP(LOAD_VSX, PREFIXED, 32);
  2903					op->element_size = 32;
  2904					break;
  2905				case 60:        /* stq */
  2906					op->type = MKOP(STORE, PREFIXED, 16);
  2907					break;
  2908				case 61:	/* pstd */
  2909					op->type = MKOP(STORE, PREFIXED, 8);
  2910					break;
  2911				case 62:        /* pstxvp */
  2912					op->reg = VSX_REGISTER_XTP(rd);
  2913					op->type = MKOP(STORE_VSX, PREFIXED, 32);
  2914					op->element_size = 32;
  2915					break;
  2916				}
  2917				break;
  2918			case 1: /* Type 01 Eight-Byte Register-to-Register */
  2919				break;
  2920			case 2: /* Type 10 Modified Load/Store */
  2921				if (prefix_r && ra)
  2922					break;
  2923				op->ea = mlsd_8lsd_ea(word, suffix, regs);
  2924				switch (suffixopcode) {
  2925				case 32:	/* plwz */
  2926					op->type = MKOP(LOAD, PREFIXED, 4);
  2927					break;
  2928				case 34:	/* plbz */
  2929					op->type = MKOP(LOAD, PREFIXED, 1);
  2930					break;
  2931				case 36:	/* pstw */
  2932					op->type = MKOP(STORE, PREFIXED, 4);
  2933					break;
  2934				case 38:	/* pstb */
  2935					op->type = MKOP(STORE, PREFIXED, 1);
  2936					break;
  2937				case 40:	/* plhz */
  2938					op->type = MKOP(LOAD, PREFIXED, 2);
  2939					break;
  2940				case 42:	/* plha */
  2941					op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 2);
  2942					break;
  2943				case 44:	/* psth */
  2944					op->type = MKOP(STORE, PREFIXED, 2);
  2945					break;
  2946				case 48:        /* plfs */
  2947					op->type = MKOP(LOAD_FP, PREFIXED | FPCONV, 4);
  2948					break;
  2949				case 50:        /* plfd */
  2950					op->type = MKOP(LOAD_FP, PREFIXED, 8);
  2951					break;
  2952				case 52:        /* pstfs */
  2953					op->type = MKOP(STORE_FP, PREFIXED | FPCONV, 4);
  2954					break;
  2955				case 54:        /* pstfd */
  2956					op->type = MKOP(STORE_FP, PREFIXED, 8);
  2957					break;
  2958				}
  2959				break;
  2960			case 3: /* Type 11 Modified Register-to-Register */
  2961				break;
  2962			}
  2963	#endif /* __powerpc64__ */
  2964	
  2965		}
  2966	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--+HP7ph2BbKc20aGI
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--+HP7ph2BbKc20aGI--
