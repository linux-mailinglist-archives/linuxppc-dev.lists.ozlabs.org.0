Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874FE7DA4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 01:52:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472Cjd5vgYzF0ZR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:52:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Cgc0z7FzDvrF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 11:50:45 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 17:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="211594065"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 28 Oct 2019 17:50:37 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iPFiW-000IVH-W0; Tue, 29 Oct 2019 08:50:36 +0800
Date: Tue, 29 Oct 2019 08:50:28 +0800
From: kbuild test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 23/23] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Message-ID: <201910290845.syZKrVRy%lkp@intel.com>
References: <20191025124058.22580-24-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025124058.22580-24-linux@rasmusvillemoes.dk>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 kbuild-all@lists.01.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rasmus,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.4-rc5 next-20191028]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Rasmus-Villemoes/QUICC-Engine-support-on-ARM/20191028-202537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d6d5df1db6e9d7f8f76d2911707f7d5877251b02
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wan/fsl_ucc_hdlc.c:300:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/net/wan/fsl_ucc_hdlc.c:300:57: sparse:    expected void [noderef] <asn:2> *
>> drivers/net/wan/fsl_ucc_hdlc.c:300:57: sparse:    got restricted __be16 *
   drivers/net/wan/fsl_ucc_hdlc.c:302:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:302:46: sparse:    expected void [noderef] <asn:2> *
>> drivers/net/wan/fsl_ucc_hdlc.c:302:46: sparse:    got restricted __be32 *
   drivers/net/wan/fsl_ucc_hdlc.c:311:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:311:57: sparse:    expected void [noderef] <asn:2> *
   drivers/net/wan/fsl_ucc_hdlc.c:311:57: sparse:    got restricted __be16 *
   drivers/net/wan/fsl_ucc_hdlc.c:313:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:313:46: sparse:    expected void [noderef] <asn:2> *
   drivers/net/wan/fsl_ucc_hdlc.c:313:46: sparse:    got restricted __be32 *
>> drivers/net/wan/fsl_ucc_hdlc.c:363:29: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
>> drivers/net/wan/fsl_ucc_hdlc.c:363:29: sparse:    expected unsigned short [usertype]
>> drivers/net/wan/fsl_ucc_hdlc.c:363:29: sparse:    got restricted __be16 [usertype]
>> drivers/net/wan/fsl_ucc_hdlc.c:370:36: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/wan/fsl_ucc_hdlc.c:393:12: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct qe_bd [noderef] <asn:2> *bd @@    got ref] <asn:2> *bd @@
>> drivers/net/wan/fsl_ucc_hdlc.c:393:12: sparse:    expected struct qe_bd [noderef] <asn:2> *bd
>> drivers/net/wan/fsl_ucc_hdlc.c:393:12: sparse:    got struct qe_bd *curtx_bd
>> drivers/net/wan/fsl_ucc_hdlc.c:403:9: sparse: sparse: dereference of noderef expression
>> drivers/net/wan/fsl_ucc_hdlc.c:416:20: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct qe_bd [noderef] <asn:2> *[assigned] bd @@    got > *[assigned] bd @@
>> drivers/net/wan/fsl_ucc_hdlc.c:416:20: sparse:    expected struct qe_bd [noderef] <asn:2> *[assigned] bd
>> drivers/net/wan/fsl_ucc_hdlc.c:416:20: sparse:    got struct qe_bd *tx_bd_base
>> drivers/net/wan/fsl_ucc_hdlc.c:418:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/net/wan/fsl_ucc_hdlc.c:418:16: sparse:    struct qe_bd [noderef] <asn:2> *
>> drivers/net/wan/fsl_ucc_hdlc.c:418:16: sparse:    struct qe_bd *
   drivers/net/wan/fsl_ucc_hdlc.c:453:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:497:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:519:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:543:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:587:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:602:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/net/wan/fsl_ucc_hdlc.c:735:37: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long offset @@    got restricted __be16 [noderef] [userunsigned long offset @@
   drivers/net/wan/fsl_ucc_hdlc.c:736:37: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long offset @@    got restricted __be16 [noderef] [userunsigned long offset @@
>> drivers/net/wan/fsl_ucc_hdlc.c:847:38: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct qe_mux *qe_mux_reg @@    got struct qe_mux [nodstruct qe_mux *qe_mux_reg @@
   drivers/net/wan/fsl_ucc_hdlc.c:850:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:851:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:854:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/net/wan/fsl_ucc_hdlc.c:857:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const volatile [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:862:38: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct qe_mux *qe_mux_reg @@    got struct qe_mux [nodstruct qe_mux *qe_mux_reg @@
>> drivers/net/wan/fsl_ucc_hdlc.c:864:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:866:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:867:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:869:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:991:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:993:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:1002:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/net/wan/fsl_ucc_hdlc.c:1004:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/net/wan/fsl_ucc_hdlc.c:403:9: sparse: sparse: dereference of noderef expression
   drivers/net/wan/fsl_ucc_hdlc.c:720:29: sparse: sparse: dereference of noderef expression
   drivers/net/wan/fsl_ucc_hdlc.c:735:27: sparse: sparse: dereference of noderef expression
   drivers/net/wan/fsl_ucc_hdlc.c:736:27: sparse: sparse: dereference of noderef expression
   drivers/net/wan/fsl_ucc_hdlc.c:811:21: sparse: sparse: dereference of noderef expression
   drivers/net/wan/fsl_ucc_hdlc.c:1019:29: sparse: sparse: dereference of noderef expression
--
>> drivers/soc/fsl/qe/qe.c:430:21: sparse: sparse: cast to restricted __be32
>> drivers/soc/fsl/qe/qe.c:430:21: sparse: sparse: cast to restricted __be32
>> drivers/soc/fsl/qe/qe.c:430:21: sparse: sparse: cast to restricted __be32
>> drivers/soc/fsl/qe/qe.c:430:21: sparse: sparse: cast to restricted __be32
>> drivers/soc/fsl/qe/qe.c:430:21: sparse: sparse: cast to restricted __be32
>> drivers/soc/fsl/qe/qe.c:430:21: sparse: sparse: cast to restricted __be32
>> drivers/soc/fsl/qe/qe.c:532:41: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long static [addressable] [toplevel] [usertype] extended_modes @@    got addressable] [toplevel] [usertype] extended_modes @@
>> drivers/soc/fsl/qe/qe.c:532:41: sparse:    expected unsigned long long static [addressable] [toplevel] [usertype] extended_modes
>> drivers/soc/fsl/qe/qe.c:532:41: sparse:    got restricted __be64 const [usertype] extended_modes
--
>> drivers/soc/fsl/qe/qe_common.c:75:48: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be32 const [usertype] *addr @@    got t [usertype] *addr @@
>> drivers/soc/fsl/qe/qe_common.c:75:48: sparse:    expected restricted __be32 const [usertype] *addr
>> drivers/soc/fsl/qe/qe_common.c:75:48: sparse:    got unsigned int *
--
>> drivers/soc/fsl/qe/qe_ic.c:293:32: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 [noderef] [usertype] <asn:2> *base @@    got icted __be32 [noderef] [usertype] <asn:2> *base @@
>> drivers/soc/fsl/qe/qe_ic.c:293:32: sparse:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
>> drivers/soc/fsl/qe/qe_ic.c:293:32: sparse:    got unsigned int [noderef] [usertype] <asn:2> *regs
   drivers/soc/fsl/qe/qe_ic.c:294:26: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 [noderef] [usertype] <asn:2> *base @@    got icted __be32 [noderef] [usertype] <asn:2> *base @@
   drivers/soc/fsl/qe/qe_ic.c:294:26: sparse:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
   drivers/soc/fsl/qe/qe_ic.c:294:26: sparse:    got unsigned int [noderef] [usertype] <asn:2> *regs
   drivers/soc/fsl/qe/qe_ic.c:309:32: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 [noderef] [usertype] <asn:2> *base @@    got icted __be32 [noderef] [usertype] <asn:2> *base @@
   drivers/soc/fsl/qe/qe_ic.c:309:32: sparse:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
   drivers/soc/fsl/qe/qe_ic.c:309:32: sparse:    got unsigned int [noderef] [usertype] <asn:2> *regs
   drivers/soc/fsl/qe/qe_ic.c:310:26: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 [noderef] [usertype] <asn:2> *base @@    got icted __be32 [noderef] [usertype] <asn:2> *base @@
   drivers/soc/fsl/qe/qe_ic.c:310:26: sparse:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
   drivers/soc/fsl/qe/qe_ic.c:310:26: sparse:    got unsigned int [noderef] [usertype] <asn:2> *regs
   drivers/soc/fsl/qe/qe_ic.c:381:31: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 [noderef] [usertype] <asn:2> *base @@    got icted __be32 [noderef] [usertype] <asn:2> *base @@
   drivers/soc/fsl/qe/qe_ic.c:381:31: sparse:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
   drivers/soc/fsl/qe/qe_ic.c:381:31: sparse:    got unsigned int [noderef] [usertype] <asn:2> *regs
   drivers/soc/fsl/qe/qe_ic.c:384:24: sparse: sparse: undefined identifier 'NO_IRQ'
   drivers/soc/fsl/qe/qe_ic.c:397:31: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 [noderef] [usertype] <asn:2> *base @@    got icted __be32 [noderef] [usertype] <asn:2> *base @@
   drivers/soc/fsl/qe/qe_ic.c:400:24: sparse: sparse: undefined identifier 'NO_IRQ'
   drivers/soc/fsl/qe/qe_ic.c:411:28: sparse: sparse: undefined identifier 'NO_IRQ'
   drivers/soc/fsl/qe/qe_ic.c:424:28: sparse: sparse: undefined identifier 'NO_IRQ'
   drivers/soc/fsl/qe/qe_ic.c:438:28: sparse: sparse: undefined identifier 'NO_IRQ'
   drivers/soc/fsl/qe/qe_ic.c:441:28: sparse: sparse: undefined identifier 'NO_IRQ'
   drivers/soc/fsl/qe/qe_ic.c:477:32: sparse: sparse: undefined identifier 'NO_IRQ'
   drivers/soc/fsl/qe/qe_ic.c:514:33: sparse: sparse: undefined identifier 'NO_IRQ'
--
>> drivers/soc/fsl/qe/ucc.c:638:20: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct qe_mux *qe_mux_reg @@    got struct qe_mux [nodstruct qe_mux *qe_mux_reg @@
>> drivers/soc/fsl/qe/ucc.c:638:20: sparse:    expected struct qe_mux *qe_mux_reg
>> drivers/soc/fsl/qe/ucc.c:638:20: sparse:    got struct qe_mux [noderef] <asn:2> *
>> drivers/soc/fsl/qe/ucc.c:653:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/soc/fsl/qe/ucc.c:653:9: sparse:    expected void [noderef] <asn:2> *
>> drivers/soc/fsl/qe/ucc.c:653:9: sparse:    got restricted __be32 *
   drivers/soc/fsl/qe/ucc.c:653:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/soc/fsl/qe/ucc.c:653:9: sparse:    expected void [noderef] <asn:2> *
>> drivers/soc/fsl/qe/ucc.c:653:9: sparse:    got restricted __be32 *
--
>> drivers/soc/fsl/qe/ucc_fast.c:215:22: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [noderef] [usertype] <asn:2> *p_ucce @@    got ed int [noderef] [usertype] <asn:2> *p_ucce @@
>> drivers/soc/fsl/qe/ucc_fast.c:215:22: sparse:    expected unsigned int [noderef] [usertype] <asn:2> *p_ucce
>> drivers/soc/fsl/qe/ucc_fast.c:215:22: sparse:    got restricted __be32 [noderef] <asn:2> *
>> drivers/soc/fsl/qe/ucc_fast.c:216:22: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [noderef] [usertype] <asn:2> *p_uccm @@    got ed int [noderef] [usertype] <asn:2> *p_uccm @@
>> drivers/soc/fsl/qe/ucc_fast.c:216:22: sparse:    expected unsigned int [noderef] [usertype] <asn:2> *p_uccm
   drivers/soc/fsl/qe/ucc_fast.c:216:22: sparse:    got restricted __be32 [noderef] <asn:2> *

vim +300 drivers/net/wan/fsl_ucc_hdlc.c

c19b6d246a3562 Zhao Qiang       2016-06-06   77  
c19b6d246a3562 Zhao Qiang       2016-06-06   78  static int uhdlc_init(struct ucc_hdlc_private *priv)
c19b6d246a3562 Zhao Qiang       2016-06-06   79  {
c19b6d246a3562 Zhao Qiang       2016-06-06   80  	struct ucc_tdm_info *ut_info;
c19b6d246a3562 Zhao Qiang       2016-06-06   81  	struct ucc_fast_info *uf_info;
c19b6d246a3562 Zhao Qiang       2016-06-06   82  	u32 cecr_subblock;
c19b6d246a3562 Zhao Qiang       2016-06-06   83  	u16 bd_status;
c19b6d246a3562 Zhao Qiang       2016-06-06   84  	int ret, i;
c19b6d246a3562 Zhao Qiang       2016-06-06   85  	void *bd_buffer;
c19b6d246a3562 Zhao Qiang       2016-06-06   86  	dma_addr_t bd_dma_addr;
c19b6d246a3562 Zhao Qiang       2016-06-06   87  	u32 riptr;
c19b6d246a3562 Zhao Qiang       2016-06-06   88  	u32 tiptr;
c19b6d246a3562 Zhao Qiang       2016-06-06   89  	u32 gumr;
c19b6d246a3562 Zhao Qiang       2016-06-06   90  
c19b6d246a3562 Zhao Qiang       2016-06-06   91  	ut_info = priv->ut_info;
c19b6d246a3562 Zhao Qiang       2016-06-06   92  	uf_info = &ut_info->uf_info;
c19b6d246a3562 Zhao Qiang       2016-06-06   93  
c19b6d246a3562 Zhao Qiang       2016-06-06   94  	if (priv->tsa) {
c19b6d246a3562 Zhao Qiang       2016-06-06   95  		uf_info->tsa = 1;
c19b6d246a3562 Zhao Qiang       2016-06-06   96  		uf_info->ctsp = 1;
040b7c94e4ec58 David Gounaris   2018-09-03   97  		uf_info->cds = 1;
040b7c94e4ec58 David Gounaris   2018-09-03   98  		uf_info->ctss = 1;
040b7c94e4ec58 David Gounaris   2018-09-03   99  	} else {
040b7c94e4ec58 David Gounaris   2018-09-03  100  		uf_info->cds = 0;
040b7c94e4ec58 David Gounaris   2018-09-03  101  		uf_info->ctsp = 0;
040b7c94e4ec58 David Gounaris   2018-09-03  102  		uf_info->ctss = 0;
c19b6d246a3562 Zhao Qiang       2016-06-06  103  	}
067bb938dad61e Holger Brunck    2017-05-17  104  
067bb938dad61e Holger Brunck    2017-05-17  105  	/* This sets HPM register in CMXUCR register which configures a
067bb938dad61e Holger Brunck    2017-05-17  106  	 * open drain connected HDLC bus
067bb938dad61e Holger Brunck    2017-05-17  107  	 */
067bb938dad61e Holger Brunck    2017-05-17  108  	if (priv->hdlc_bus)
067bb938dad61e Holger Brunck    2017-05-17  109  		uf_info->brkpt_support = 1;
067bb938dad61e Holger Brunck    2017-05-17  110  
c19b6d246a3562 Zhao Qiang       2016-06-06  111  	uf_info->uccm_mask = ((UCC_HDLC_UCCE_RXB | UCC_HDLC_UCCE_RXF |
c19b6d246a3562 Zhao Qiang       2016-06-06  112  				UCC_HDLC_UCCE_TXB) << 16);
c19b6d246a3562 Zhao Qiang       2016-06-06  113  
c19b6d246a3562 Zhao Qiang       2016-06-06  114  	ret = ucc_fast_init(uf_info, &priv->uccf);
c19b6d246a3562 Zhao Qiang       2016-06-06  115  	if (ret) {
c19b6d246a3562 Zhao Qiang       2016-06-06  116  		dev_err(priv->dev, "Failed to init uccf.");
c19b6d246a3562 Zhao Qiang       2016-06-06  117  		return ret;
c19b6d246a3562 Zhao Qiang       2016-06-06  118  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  119  
c19b6d246a3562 Zhao Qiang       2016-06-06  120  	priv->uf_regs = priv->uccf->uf_regs;
c19b6d246a3562 Zhao Qiang       2016-06-06  121  	ucc_fast_disable(priv->uccf, COMM_DIR_RX | COMM_DIR_TX);
c19b6d246a3562 Zhao Qiang       2016-06-06  122  
c19b6d246a3562 Zhao Qiang       2016-06-06  123  	/* Loopback mode */
c19b6d246a3562 Zhao Qiang       2016-06-06  124  	if (priv->loopback) {
c19b6d246a3562 Zhao Qiang       2016-06-06  125  		dev_info(priv->dev, "Loopback Mode\n");
54e9e0874938ba Holger Brunck    2017-05-17  126  		/* use the same clock when work in loopback */
54e9e0874938ba Holger Brunck    2017-05-17  127  		qe_setbrg(ut_info->uf_info.rx_clock, 20000000, 1);
54e9e0874938ba Holger Brunck    2017-05-17  128  
c19b6d246a3562 Zhao Qiang       2016-06-06  129  		gumr = ioread32be(&priv->uf_regs->gumr);
c19b6d246a3562 Zhao Qiang       2016-06-06  130  		gumr |= (UCC_FAST_GUMR_LOOPBACK | UCC_FAST_GUMR_CDS |
c19b6d246a3562 Zhao Qiang       2016-06-06  131  			 UCC_FAST_GUMR_TCI);
c19b6d246a3562 Zhao Qiang       2016-06-06  132  		gumr &= ~(UCC_FAST_GUMR_CTSP | UCC_FAST_GUMR_RSYN);
c19b6d246a3562 Zhao Qiang       2016-06-06  133  		iowrite32be(gumr, &priv->uf_regs->gumr);
c19b6d246a3562 Zhao Qiang       2016-06-06  134  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  135  
c19b6d246a3562 Zhao Qiang       2016-06-06  136  	/* Initialize SI */
c19b6d246a3562 Zhao Qiang       2016-06-06  137  	if (priv->tsa)
c19b6d246a3562 Zhao Qiang       2016-06-06  138  		ucc_tdm_init(priv->utdm, priv->ut_info);
c19b6d246a3562 Zhao Qiang       2016-06-06  139  
c19b6d246a3562 Zhao Qiang       2016-06-06  140  	/* Write to QE CECR, UCCx channel to Stop Transmission */
c19b6d246a3562 Zhao Qiang       2016-06-06  141  	cecr_subblock = ucc_fast_get_qe_cr_subblock(uf_info->ucc_num);
c19b6d246a3562 Zhao Qiang       2016-06-06  142  	ret = qe_issue_cmd(QE_STOP_TX, cecr_subblock,
c19b6d246a3562 Zhao Qiang       2016-06-06  143  			   QE_CR_PROTOCOL_UNSPECIFIED, 0);
c19b6d246a3562 Zhao Qiang       2016-06-06  144  
c19b6d246a3562 Zhao Qiang       2016-06-06  145  	/* Set UPSMR normal mode (need fixed)*/
c19b6d246a3562 Zhao Qiang       2016-06-06  146  	iowrite32be(0, &priv->uf_regs->upsmr);
c19b6d246a3562 Zhao Qiang       2016-06-06  147  
067bb938dad61e Holger Brunck    2017-05-17  148  	/* hdlc_bus mode */
067bb938dad61e Holger Brunck    2017-05-17  149  	if (priv->hdlc_bus) {
067bb938dad61e Holger Brunck    2017-05-17  150  		u32 upsmr;
067bb938dad61e Holger Brunck    2017-05-17  151  
067bb938dad61e Holger Brunck    2017-05-17  152  		dev_info(priv->dev, "HDLC bus Mode\n");
067bb938dad61e Holger Brunck    2017-05-17  153  		upsmr = ioread32be(&priv->uf_regs->upsmr);
067bb938dad61e Holger Brunck    2017-05-17  154  
067bb938dad61e Holger Brunck    2017-05-17  155  		/* bus mode and retransmit enable, with collision window
067bb938dad61e Holger Brunck    2017-05-17  156  		 * set to 8 bytes
067bb938dad61e Holger Brunck    2017-05-17  157  		 */
067bb938dad61e Holger Brunck    2017-05-17  158  		upsmr |= UCC_HDLC_UPSMR_RTE | UCC_HDLC_UPSMR_BUS |
067bb938dad61e Holger Brunck    2017-05-17  159  				UCC_HDLC_UPSMR_CW8;
067bb938dad61e Holger Brunck    2017-05-17  160  		iowrite32be(upsmr, &priv->uf_regs->upsmr);
067bb938dad61e Holger Brunck    2017-05-17  161  
067bb938dad61e Holger Brunck    2017-05-17  162  		/* explicitly disable CDS & CTSP */
067bb938dad61e Holger Brunck    2017-05-17  163  		gumr = ioread32be(&priv->uf_regs->gumr);
067bb938dad61e Holger Brunck    2017-05-17  164  		gumr &= ~(UCC_FAST_GUMR_CDS | UCC_FAST_GUMR_CTSP);
067bb938dad61e Holger Brunck    2017-05-17  165  		/* set automatic sync to explicitly ignore CD signal */
067bb938dad61e Holger Brunck    2017-05-17  166  		gumr |= UCC_FAST_GUMR_SYNL_AUTO;
067bb938dad61e Holger Brunck    2017-05-17  167  		iowrite32be(gumr, &priv->uf_regs->gumr);
067bb938dad61e Holger Brunck    2017-05-17  168  	}
067bb938dad61e Holger Brunck    2017-05-17  169  
c19b6d246a3562 Zhao Qiang       2016-06-06  170  	priv->rx_ring_size = RX_BD_RING_LEN;
c19b6d246a3562 Zhao Qiang       2016-06-06  171  	priv->tx_ring_size = TX_BD_RING_LEN;
c19b6d246a3562 Zhao Qiang       2016-06-06  172  	/* Alloc Rx BD */
c19b6d246a3562 Zhao Qiang       2016-06-06  173  	priv->rx_bd_base = dma_alloc_coherent(priv->dev,
5b8aad93c52bdd Holger Brunck    2017-05-17  174  			RX_BD_RING_LEN * sizeof(struct qe_bd),
c19b6d246a3562 Zhao Qiang       2016-06-06  175  			&priv->dma_rx_bd, GFP_KERNEL);
c19b6d246a3562 Zhao Qiang       2016-06-06  176  
c19b6d246a3562 Zhao Qiang       2016-06-06  177  	if (!priv->rx_bd_base) {
c19b6d246a3562 Zhao Qiang       2016-06-06  178  		dev_err(priv->dev, "Cannot allocate MURAM memory for RxBDs\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  179  		ret = -ENOMEM;
1efb597d8bf56c Zhao Qiang       2016-07-15  180  		goto free_uccf;
c19b6d246a3562 Zhao Qiang       2016-06-06  181  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  182  
c19b6d246a3562 Zhao Qiang       2016-06-06  183  	/* Alloc Tx BD */
c19b6d246a3562 Zhao Qiang       2016-06-06  184  	priv->tx_bd_base = dma_alloc_coherent(priv->dev,
5b8aad93c52bdd Holger Brunck    2017-05-17  185  			TX_BD_RING_LEN * sizeof(struct qe_bd),
c19b6d246a3562 Zhao Qiang       2016-06-06  186  			&priv->dma_tx_bd, GFP_KERNEL);
c19b6d246a3562 Zhao Qiang       2016-06-06  187  
c19b6d246a3562 Zhao Qiang       2016-06-06  188  	if (!priv->tx_bd_base) {
c19b6d246a3562 Zhao Qiang       2016-06-06  189  		dev_err(priv->dev, "Cannot allocate MURAM memory for TxBDs\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  190  		ret = -ENOMEM;
1efb597d8bf56c Zhao Qiang       2016-07-15  191  		goto free_rx_bd;
c19b6d246a3562 Zhao Qiang       2016-06-06  192  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  193  
c19b6d246a3562 Zhao Qiang       2016-06-06  194  	/* Alloc parameter ram for ucc hdlc */
85deed56032b6c Holger Brunck    2017-05-22  195  	priv->ucc_pram_offset = qe_muram_alloc(sizeof(struct ucc_hdlc_param),
c19b6d246a3562 Zhao Qiang       2016-06-06  196  				ALIGNMENT_OF_UCC_HDLC_PRAM);
c19b6d246a3562 Zhao Qiang       2016-06-06  197  
fd800f646402c0 YueHaibing       2018-07-23  198  	if (IS_ERR_VALUE(priv->ucc_pram_offset)) {
24a24d07d688a4 Colin Ian King   2016-08-28  199  		dev_err(priv->dev, "Can not allocate MURAM for hdlc parameter.\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  200  		ret = -ENOMEM;
1efb597d8bf56c Zhao Qiang       2016-07-15  201  		goto free_tx_bd;
c19b6d246a3562 Zhao Qiang       2016-06-06  202  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  203  
6396bb221514d2 Kees Cook        2018-06-12  204  	priv->rx_skbuff = kcalloc(priv->rx_ring_size,
6396bb221514d2 Kees Cook        2018-06-12  205  				  sizeof(*priv->rx_skbuff),
c19b6d246a3562 Zhao Qiang       2016-06-06  206  				  GFP_KERNEL);
c19b6d246a3562 Zhao Qiang       2016-06-06  207  	if (!priv->rx_skbuff)
1efb597d8bf56c Zhao Qiang       2016-07-15  208  		goto free_ucc_pram;
c19b6d246a3562 Zhao Qiang       2016-06-06  209  
6396bb221514d2 Kees Cook        2018-06-12  210  	priv->tx_skbuff = kcalloc(priv->tx_ring_size,
6396bb221514d2 Kees Cook        2018-06-12  211  				  sizeof(*priv->tx_skbuff),
c19b6d246a3562 Zhao Qiang       2016-06-06  212  				  GFP_KERNEL);
c19b6d246a3562 Zhao Qiang       2016-06-06  213  	if (!priv->tx_skbuff)
1efb597d8bf56c Zhao Qiang       2016-07-15  214  		goto free_rx_skbuff;
c19b6d246a3562 Zhao Qiang       2016-06-06  215  
c19b6d246a3562 Zhao Qiang       2016-06-06  216  	priv->skb_curtx = 0;
c19b6d246a3562 Zhao Qiang       2016-06-06  217  	priv->skb_dirtytx = 0;
c19b6d246a3562 Zhao Qiang       2016-06-06  218  	priv->curtx_bd = priv->tx_bd_base;
c19b6d246a3562 Zhao Qiang       2016-06-06  219  	priv->dirty_tx = priv->tx_bd_base;
c19b6d246a3562 Zhao Qiang       2016-06-06  220  	priv->currx_bd = priv->rx_bd_base;
c19b6d246a3562 Zhao Qiang       2016-06-06  221  	priv->currx_bdnum = 0;
c19b6d246a3562 Zhao Qiang       2016-06-06  222  
c19b6d246a3562 Zhao Qiang       2016-06-06  223  	/* init parameter base */
c19b6d246a3562 Zhao Qiang       2016-06-06  224  	cecr_subblock = ucc_fast_get_qe_cr_subblock(uf_info->ucc_num);
c19b6d246a3562 Zhao Qiang       2016-06-06  225  	ret = qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, cecr_subblock,
c19b6d246a3562 Zhao Qiang       2016-06-06  226  			   QE_CR_PROTOCOL_UNSPECIFIED, priv->ucc_pram_offset);
c19b6d246a3562 Zhao Qiang       2016-06-06  227  
c19b6d246a3562 Zhao Qiang       2016-06-06  228  	priv->ucc_pram = (struct ucc_hdlc_param __iomem *)
c19b6d246a3562 Zhao Qiang       2016-06-06  229  					qe_muram_addr(priv->ucc_pram_offset);
c19b6d246a3562 Zhao Qiang       2016-06-06  230  
c19b6d246a3562 Zhao Qiang       2016-06-06  231  	/* Zero out parameter ram */
c19b6d246a3562 Zhao Qiang       2016-06-06  232  	memset_io(priv->ucc_pram, 0, sizeof(struct ucc_hdlc_param));
c19b6d246a3562 Zhao Qiang       2016-06-06  233  
c19b6d246a3562 Zhao Qiang       2016-06-06  234  	/* Alloc riptr, tiptr */
c19b6d246a3562 Zhao Qiang       2016-06-06  235  	riptr = qe_muram_alloc(32, 32);
fd800f646402c0 YueHaibing       2018-07-23  236  	if (IS_ERR_VALUE(riptr)) {
c19b6d246a3562 Zhao Qiang       2016-06-06  237  		dev_err(priv->dev, "Cannot allocate MURAM mem for Receive internal temp data pointer\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  238  		ret = -ENOMEM;
1efb597d8bf56c Zhao Qiang       2016-07-15  239  		goto free_tx_skbuff;
c19b6d246a3562 Zhao Qiang       2016-06-06  240  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  241  
c19b6d246a3562 Zhao Qiang       2016-06-06  242  	tiptr = qe_muram_alloc(32, 32);
fd800f646402c0 YueHaibing       2018-07-23  243  	if (IS_ERR_VALUE(tiptr)) {
c19b6d246a3562 Zhao Qiang       2016-06-06  244  		dev_err(priv->dev, "Cannot allocate MURAM mem for Transmit internal temp data pointer\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  245  		ret = -ENOMEM;
1efb597d8bf56c Zhao Qiang       2016-07-15  246  		goto free_riptr;
c19b6d246a3562 Zhao Qiang       2016-06-06  247  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  248  
c19b6d246a3562 Zhao Qiang       2016-06-06  249  	/* Set RIPTR, TIPTR */
c19b6d246a3562 Zhao Qiang       2016-06-06  250  	iowrite16be(riptr, &priv->ucc_pram->riptr);
c19b6d246a3562 Zhao Qiang       2016-06-06  251  	iowrite16be(tiptr, &priv->ucc_pram->tiptr);
c19b6d246a3562 Zhao Qiang       2016-06-06  252  
c19b6d246a3562 Zhao Qiang       2016-06-06  253  	/* Set MRBLR */
c19b6d246a3562 Zhao Qiang       2016-06-06  254  	iowrite16be(MAX_RX_BUF_LENGTH, &priv->ucc_pram->mrblr);
c19b6d246a3562 Zhao Qiang       2016-06-06  255  
c19b6d246a3562 Zhao Qiang       2016-06-06  256  	/* Set RBASE, TBASE */
c19b6d246a3562 Zhao Qiang       2016-06-06  257  	iowrite32be(priv->dma_rx_bd, &priv->ucc_pram->rbase);
c19b6d246a3562 Zhao Qiang       2016-06-06  258  	iowrite32be(priv->dma_tx_bd, &priv->ucc_pram->tbase);
c19b6d246a3562 Zhao Qiang       2016-06-06  259  
c19b6d246a3562 Zhao Qiang       2016-06-06  260  	/* Set RSTATE, TSTATE */
c19b6d246a3562 Zhao Qiang       2016-06-06  261  	iowrite32be(BMR_GBL | BMR_BIG_ENDIAN, &priv->ucc_pram->rstate);
c19b6d246a3562 Zhao Qiang       2016-06-06  262  	iowrite32be(BMR_GBL | BMR_BIG_ENDIAN, &priv->ucc_pram->tstate);
c19b6d246a3562 Zhao Qiang       2016-06-06  263  
c19b6d246a3562 Zhao Qiang       2016-06-06  264  	/* Set C_MASK, C_PRES for 16bit CRC */
c19b6d246a3562 Zhao Qiang       2016-06-06  265  	iowrite32be(CRC_16BIT_MASK, &priv->ucc_pram->c_mask);
c19b6d246a3562 Zhao Qiang       2016-06-06  266  	iowrite32be(CRC_16BIT_PRES, &priv->ucc_pram->c_pres);
c19b6d246a3562 Zhao Qiang       2016-06-06  267  
c19b6d246a3562 Zhao Qiang       2016-06-06  268  	iowrite16be(MAX_FRAME_LENGTH, &priv->ucc_pram->mflr);
c19b6d246a3562 Zhao Qiang       2016-06-06  269  	iowrite16be(DEFAULT_RFTHR, &priv->ucc_pram->rfthr);
c19b6d246a3562 Zhao Qiang       2016-06-06  270  	iowrite16be(DEFAULT_RFTHR, &priv->ucc_pram->rfcnt);
045f77baf6b429 David Gounaris   2018-09-03  271  	iowrite16be(priv->hmask, &priv->ucc_pram->hmask);
c19b6d246a3562 Zhao Qiang       2016-06-06  272  	iowrite16be(DEFAULT_HDLC_ADDR, &priv->ucc_pram->haddr1);
c19b6d246a3562 Zhao Qiang       2016-06-06  273  	iowrite16be(DEFAULT_HDLC_ADDR, &priv->ucc_pram->haddr2);
c19b6d246a3562 Zhao Qiang       2016-06-06  274  	iowrite16be(DEFAULT_HDLC_ADDR, &priv->ucc_pram->haddr3);
c19b6d246a3562 Zhao Qiang       2016-06-06  275  	iowrite16be(DEFAULT_HDLC_ADDR, &priv->ucc_pram->haddr4);
c19b6d246a3562 Zhao Qiang       2016-06-06  276  
c19b6d246a3562 Zhao Qiang       2016-06-06  277  	/* Get BD buffer */
750afb08ca7131 Luis Chamberlain 2019-01-04  278  	bd_buffer = dma_alloc_coherent(priv->dev,
750afb08ca7131 Luis Chamberlain 2019-01-04  279  				       (RX_BD_RING_LEN + TX_BD_RING_LEN) * MAX_RX_BUF_LENGTH,
c19b6d246a3562 Zhao Qiang       2016-06-06  280  				       &bd_dma_addr, GFP_KERNEL);
c19b6d246a3562 Zhao Qiang       2016-06-06  281  
c19b6d246a3562 Zhao Qiang       2016-06-06  282  	if (!bd_buffer) {
c19b6d246a3562 Zhao Qiang       2016-06-06  283  		dev_err(priv->dev, "Could not allocate buffer descriptors\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  284  		ret = -ENOMEM;
1efb597d8bf56c Zhao Qiang       2016-07-15  285  		goto free_tiptr;
c19b6d246a3562 Zhao Qiang       2016-06-06  286  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  287  
c19b6d246a3562 Zhao Qiang       2016-06-06  288  	priv->rx_buffer = bd_buffer;
c19b6d246a3562 Zhao Qiang       2016-06-06  289  	priv->tx_buffer = bd_buffer + RX_BD_RING_LEN * MAX_RX_BUF_LENGTH;
c19b6d246a3562 Zhao Qiang       2016-06-06  290  
c19b6d246a3562 Zhao Qiang       2016-06-06  291  	priv->dma_rx_addr = bd_dma_addr;
c19b6d246a3562 Zhao Qiang       2016-06-06  292  	priv->dma_tx_addr = bd_dma_addr + RX_BD_RING_LEN * MAX_RX_BUF_LENGTH;
c19b6d246a3562 Zhao Qiang       2016-06-06  293  
c19b6d246a3562 Zhao Qiang       2016-06-06  294  	for (i = 0; i < RX_BD_RING_LEN; i++) {
c19b6d246a3562 Zhao Qiang       2016-06-06  295  		if (i < (RX_BD_RING_LEN - 1))
c19b6d246a3562 Zhao Qiang       2016-06-06  296  			bd_status = R_E_S | R_I_S;
c19b6d246a3562 Zhao Qiang       2016-06-06  297  		else
c19b6d246a3562 Zhao Qiang       2016-06-06  298  			bd_status = R_E_S | R_I_S | R_W_S;
c19b6d246a3562 Zhao Qiang       2016-06-06  299  
c19b6d246a3562 Zhao Qiang       2016-06-06 @300  		iowrite16be(bd_status, &priv->rx_bd_base[i].status);
c19b6d246a3562 Zhao Qiang       2016-06-06  301  		iowrite32be(priv->dma_rx_addr + i * MAX_RX_BUF_LENGTH,
c19b6d246a3562 Zhao Qiang       2016-06-06 @302  			    &priv->rx_bd_base[i].buf);
c19b6d246a3562 Zhao Qiang       2016-06-06  303  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  304  
c19b6d246a3562 Zhao Qiang       2016-06-06  305  	for (i = 0; i < TX_BD_RING_LEN; i++) {
c19b6d246a3562 Zhao Qiang       2016-06-06  306  		if (i < (TX_BD_RING_LEN - 1))
c19b6d246a3562 Zhao Qiang       2016-06-06  307  			bd_status =  T_I_S | T_TC_S;
c19b6d246a3562 Zhao Qiang       2016-06-06  308  		else
c19b6d246a3562 Zhao Qiang       2016-06-06  309  			bd_status =  T_I_S | T_TC_S | T_W_S;
c19b6d246a3562 Zhao Qiang       2016-06-06  310  
c19b6d246a3562 Zhao Qiang       2016-06-06 @311  		iowrite16be(bd_status, &priv->tx_bd_base[i].status);
c19b6d246a3562 Zhao Qiang       2016-06-06  312  		iowrite32be(priv->dma_tx_addr + i * MAX_RX_BUF_LENGTH,
c19b6d246a3562 Zhao Qiang       2016-06-06 @313  			    &priv->tx_bd_base[i].buf);
c19b6d246a3562 Zhao Qiang       2016-06-06  314  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  315  
c19b6d246a3562 Zhao Qiang       2016-06-06  316  	return 0;
c19b6d246a3562 Zhao Qiang       2016-06-06  317  
1efb597d8bf56c Zhao Qiang       2016-07-15  318  free_tiptr:
c19b6d246a3562 Zhao Qiang       2016-06-06  319  	qe_muram_free(tiptr);
1efb597d8bf56c Zhao Qiang       2016-07-15  320  free_riptr:
c19b6d246a3562 Zhao Qiang       2016-06-06  321  	qe_muram_free(riptr);
1efb597d8bf56c Zhao Qiang       2016-07-15  322  free_tx_skbuff:
c19b6d246a3562 Zhao Qiang       2016-06-06  323  	kfree(priv->tx_skbuff);
1efb597d8bf56c Zhao Qiang       2016-07-15  324  free_rx_skbuff:
c19b6d246a3562 Zhao Qiang       2016-06-06  325  	kfree(priv->rx_skbuff);
1efb597d8bf56c Zhao Qiang       2016-07-15  326  free_ucc_pram:
c19b6d246a3562 Zhao Qiang       2016-06-06  327  	qe_muram_free(priv->ucc_pram_offset);
1efb597d8bf56c Zhao Qiang       2016-07-15  328  free_tx_bd:
c19b6d246a3562 Zhao Qiang       2016-06-06  329  	dma_free_coherent(priv->dev,
5b8aad93c52bdd Holger Brunck    2017-05-17  330  			  TX_BD_RING_LEN * sizeof(struct qe_bd),
c19b6d246a3562 Zhao Qiang       2016-06-06  331  			  priv->tx_bd_base, priv->dma_tx_bd);
1efb597d8bf56c Zhao Qiang       2016-07-15  332  free_rx_bd:
c19b6d246a3562 Zhao Qiang       2016-06-06  333  	dma_free_coherent(priv->dev,
5b8aad93c52bdd Holger Brunck    2017-05-17  334  			  RX_BD_RING_LEN * sizeof(struct qe_bd),
c19b6d246a3562 Zhao Qiang       2016-06-06  335  			  priv->rx_bd_base, priv->dma_rx_bd);
1efb597d8bf56c Zhao Qiang       2016-07-15  336  free_uccf:
c19b6d246a3562 Zhao Qiang       2016-06-06  337  	ucc_fast_free(priv->uccf);
c19b6d246a3562 Zhao Qiang       2016-06-06  338  
c19b6d246a3562 Zhao Qiang       2016-06-06  339  	return ret;
c19b6d246a3562 Zhao Qiang       2016-06-06  340  }
c19b6d246a3562 Zhao Qiang       2016-06-06  341  
c19b6d246a3562 Zhao Qiang       2016-06-06  342  static netdev_tx_t ucc_hdlc_tx(struct sk_buff *skb, struct net_device *dev)
c19b6d246a3562 Zhao Qiang       2016-06-06  343  {
c19b6d246a3562 Zhao Qiang       2016-06-06  344  	hdlc_device *hdlc = dev_to_hdlc(dev);
c19b6d246a3562 Zhao Qiang       2016-06-06  345  	struct ucc_hdlc_private *priv = (struct ucc_hdlc_private *)hdlc->priv;
c19b6d246a3562 Zhao Qiang       2016-06-06  346  	struct qe_bd __iomem *bd;
c19b6d246a3562 Zhao Qiang       2016-06-06  347  	u16 bd_status;
c19b6d246a3562 Zhao Qiang       2016-06-06  348  	unsigned long flags;
c19b6d246a3562 Zhao Qiang       2016-06-06  349  	u16 *proto_head;
c19b6d246a3562 Zhao Qiang       2016-06-06  350  
c19b6d246a3562 Zhao Qiang       2016-06-06  351  	switch (dev->type) {
c19b6d246a3562 Zhao Qiang       2016-06-06  352  	case ARPHRD_RAWHDLC:
c19b6d246a3562 Zhao Qiang       2016-06-06  353  		if (skb_headroom(skb) < HDLC_HEAD_LEN) {
c19b6d246a3562 Zhao Qiang       2016-06-06  354  			dev->stats.tx_dropped++;
c19b6d246a3562 Zhao Qiang       2016-06-06  355  			dev_kfree_skb(skb);
c19b6d246a3562 Zhao Qiang       2016-06-06  356  			netdev_err(dev, "No enough space for hdlc head\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  357  			return -ENOMEM;
c19b6d246a3562 Zhao Qiang       2016-06-06  358  		}
c19b6d246a3562 Zhao Qiang       2016-06-06  359  
c19b6d246a3562 Zhao Qiang       2016-06-06  360  		skb_push(skb, HDLC_HEAD_LEN);
c19b6d246a3562 Zhao Qiang       2016-06-06  361  
c19b6d246a3562 Zhao Qiang       2016-06-06  362  		proto_head = (u16 *)skb->data;
c19b6d246a3562 Zhao Qiang       2016-06-06 @363  		*proto_head = htons(DEFAULT_HDLC_HEAD);
c19b6d246a3562 Zhao Qiang       2016-06-06  364  
c19b6d246a3562 Zhao Qiang       2016-06-06  365  		dev->stats.tx_bytes += skb->len;
c19b6d246a3562 Zhao Qiang       2016-06-06  366  		break;
c19b6d246a3562 Zhao Qiang       2016-06-06  367  
c19b6d246a3562 Zhao Qiang       2016-06-06  368  	case ARPHRD_PPP:
c19b6d246a3562 Zhao Qiang       2016-06-06  369  		proto_head = (u16 *)skb->data;
c19b6d246a3562 Zhao Qiang       2016-06-06 @370  		if (*proto_head != htons(DEFAULT_PPP_HEAD)) {
c19b6d246a3562 Zhao Qiang       2016-06-06  371  			dev->stats.tx_dropped++;
c19b6d246a3562 Zhao Qiang       2016-06-06  372  			dev_kfree_skb(skb);
c19b6d246a3562 Zhao Qiang       2016-06-06  373  			netdev_err(dev, "Wrong ppp header\n");
c19b6d246a3562 Zhao Qiang       2016-06-06  374  			return -ENOMEM;
c19b6d246a3562 Zhao Qiang       2016-06-06  375  		}
c19b6d246a3562 Zhao Qiang       2016-06-06  376  
c19b6d246a3562 Zhao Qiang       2016-06-06  377  		dev->stats.tx_bytes += skb->len;
c19b6d246a3562 Zhao Qiang       2016-06-06  378  		break;
c19b6d246a3562 Zhao Qiang       2016-06-06  379  
8978ca7c8b7b07 David Gounaris   2018-09-03  380  	case ARPHRD_ETHER:
8978ca7c8b7b07 David Gounaris   2018-09-03  381  		dev->stats.tx_bytes += skb->len;
8978ca7c8b7b07 David Gounaris   2018-09-03  382  		break;
8978ca7c8b7b07 David Gounaris   2018-09-03  383  
c19b6d246a3562 Zhao Qiang       2016-06-06  384  	default:
c19b6d246a3562 Zhao Qiang       2016-06-06  385  		dev->stats.tx_dropped++;
c19b6d246a3562 Zhao Qiang       2016-06-06  386  		dev_kfree_skb(skb);
c19b6d246a3562 Zhao Qiang       2016-06-06  387  		return -ENOMEM;
c19b6d246a3562 Zhao Qiang       2016-06-06  388  	}
2e7ad56aa54778 Mathias Thore    2018-11-07  389  	netdev_sent_queue(dev, skb->len);
c19b6d246a3562 Zhao Qiang       2016-06-06  390  	spin_lock_irqsave(&priv->lock, flags);
c19b6d246a3562 Zhao Qiang       2016-06-06  391  
c19b6d246a3562 Zhao Qiang       2016-06-06  392  	/* Start from the next BD that should be filled */
c19b6d246a3562 Zhao Qiang       2016-06-06 @393  	bd = priv->curtx_bd;
c19b6d246a3562 Zhao Qiang       2016-06-06  394  	bd_status = ioread16be(&bd->status);
c19b6d246a3562 Zhao Qiang       2016-06-06  395  	/* Save the skb pointer so we can free it later */
c19b6d246a3562 Zhao Qiang       2016-06-06  396  	priv->tx_skbuff[priv->skb_curtx] = skb;
c19b6d246a3562 Zhao Qiang       2016-06-06  397  
c19b6d246a3562 Zhao Qiang       2016-06-06  398  	/* Update the current skb pointer (wrapping if this was the last) */
c19b6d246a3562 Zhao Qiang       2016-06-06  399  	priv->skb_curtx =
c19b6d246a3562 Zhao Qiang       2016-06-06  400  	    (priv->skb_curtx + 1) & TX_RING_MOD_MASK(TX_BD_RING_LEN);
c19b6d246a3562 Zhao Qiang       2016-06-06  401  
c19b6d246a3562 Zhao Qiang       2016-06-06  402  	/* copy skb data to tx buffer for sdma processing */
c19b6d246a3562 Zhao Qiang       2016-06-06 @403  	memcpy(priv->tx_buffer + (be32_to_cpu(bd->buf) - priv->dma_tx_addr),
c19b6d246a3562 Zhao Qiang       2016-06-06  404  	       skb->data, skb->len);
c19b6d246a3562 Zhao Qiang       2016-06-06  405  
c19b6d246a3562 Zhao Qiang       2016-06-06  406  	/* set bd status and length */
c19b6d246a3562 Zhao Qiang       2016-06-06  407  	bd_status = (bd_status & T_W_S) | T_R_S | T_I_S | T_L_S | T_TC_S;
c19b6d246a3562 Zhao Qiang       2016-06-06  408  
c19b6d246a3562 Zhao Qiang       2016-06-06  409  	iowrite16be(skb->len, &bd->length);
02bb56ddc67116 Zhao Qiang       2017-03-14  410  	iowrite16be(bd_status, &bd->status);
c19b6d246a3562 Zhao Qiang       2016-06-06  411  
c19b6d246a3562 Zhao Qiang       2016-06-06  412  	/* Move to next BD in the ring */
c19b6d246a3562 Zhao Qiang       2016-06-06  413  	if (!(bd_status & T_W_S))
c19b6d246a3562 Zhao Qiang       2016-06-06  414  		bd += 1;
c19b6d246a3562 Zhao Qiang       2016-06-06  415  	else
c19b6d246a3562 Zhao Qiang       2016-06-06 @416  		bd = priv->tx_bd_base;
c19b6d246a3562 Zhao Qiang       2016-06-06  417  
c19b6d246a3562 Zhao Qiang       2016-06-06 @418  	if (bd == priv->dirty_tx) {
c19b6d246a3562 Zhao Qiang       2016-06-06  419  		if (!netif_queue_stopped(dev))
c19b6d246a3562 Zhao Qiang       2016-06-06  420  			netif_stop_queue(dev);
c19b6d246a3562 Zhao Qiang       2016-06-06  421  	}
c19b6d246a3562 Zhao Qiang       2016-06-06  422  
c19b6d246a3562 Zhao Qiang       2016-06-06  423  	priv->curtx_bd = bd;
c19b6d246a3562 Zhao Qiang       2016-06-06  424  
c19b6d246a3562 Zhao Qiang       2016-06-06  425  	spin_unlock_irqrestore(&priv->lock, flags);
c19b6d246a3562 Zhao Qiang       2016-06-06  426  
c19b6d246a3562 Zhao Qiang       2016-06-06  427  	return NETDEV_TX_OK;
c19b6d246a3562 Zhao Qiang       2016-06-06  428  }
c19b6d246a3562 Zhao Qiang       2016-06-06  429  

:::::: The code at line 300 was first introduced by commit
:::::: c19b6d246a35627c3a69b2fa6bdece212b48214b drivers/net: support hdlc function for QE-UCC

:::::: TO: Zhao Qiang <qiang.zhao@nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
