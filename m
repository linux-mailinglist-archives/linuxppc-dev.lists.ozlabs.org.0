Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA8FDEFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 14:33:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dznz23gnzF5N5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 00:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DzmC4BFTzF3Ss
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 00:32:06 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 05:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="230455904"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2019 05:31:56 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iVbhc-0005u4-BH; Fri, 15 Nov 2019 21:31:56 +0800
Date: Fri, 15 Nov 2019 21:31:24 +0800
From: kbuild test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v3 36/36] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Message-ID: <201911152105.ojcD68ZC%lkp@intel.com>
References: <20191101124210.14510-37-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101124210.14510-37-linux@rasmusvillemoes.dk>
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
Cc: kbuild-all@lists.01.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rasmus,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.4-rc7 next-20191114]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Rasmus-Villemoes/QUICC-Engine-support-on-ARM/20191102-234436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1204c70d9dcba31164f78ad5d8c88c42335d51f8
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-32-g233d4e1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/soc/fsl/qe/ucc_slow.c:78:17: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct ucc_slow *us_regs @@    got struct ucc_slow [nstruct ucc_slow *us_regs @@
>> drivers/soc/fsl/qe/ucc_slow.c:78:17: sparse:    expected struct ucc_slow *us_regs
>> drivers/soc/fsl/qe/ucc_slow.c:78:17: sparse:    got struct ucc_slow [noderef] <asn:2> *us_regs
>> drivers/soc/fsl/qe/ucc_slow.c:81:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/soc/fsl/qe/ucc_slow.c:81:18: sparse:    expected void [noderef] <asn:2> *
>> drivers/soc/fsl/qe/ucc_slow.c:81:18: sparse:    got restricted __be32 *
   drivers/soc/fsl/qe/ucc_slow.c:90:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:90:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:90:9: sparse:    got restricted __be32 *
   drivers/soc/fsl/qe/ucc_slow.c:99:17: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct ucc_slow *us_regs @@    got struct ucc_slow [nstruct ucc_slow *us_regs @@
   drivers/soc/fsl/qe/ucc_slow.c:99:17: sparse:    expected struct ucc_slow *us_regs
   drivers/soc/fsl/qe/ucc_slow.c:99:17: sparse:    got struct ucc_slow [noderef] <asn:2> *us_regs
   drivers/soc/fsl/qe/ucc_slow.c:102:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:102:18: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:102:18: sparse:    got restricted __be32 *
   drivers/soc/fsl/qe/ucc_slow.c:111:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:111:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:111:9: sparse:    got restricted __be32 *
>> drivers/soc/fsl/qe/ucc_slow.c:169:28: sparse: sparse: Using plain integer as NULL pointer
>> drivers/soc/fsl/qe/ucc_slow.c:171:25: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/soc/fsl/qe/ucc_slow.c:172:25: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/soc/fsl/qe/ucc_slow.c:191:23: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct ucc_slow_pram *us_pram @@    got vostruct ucc_slow_pram *us_pram @@
>> drivers/soc/fsl/qe/ucc_slow.c:191:23: sparse:    expected struct ucc_slow_pram *us_pram
>> drivers/soc/fsl/qe/ucc_slow.c:191:23: sparse:    got void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:201:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:201:9: sparse:    expected void [noderef] <asn:2> *
>> drivers/soc/fsl/qe/ucc_slow.c:201:9: sparse:    got restricted __be16 *
>> drivers/soc/fsl/qe/ucc_slow.c:228:41: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct qe_bd *tx_bd @@    got void [nodestruct qe_bd *tx_bd @@
>> drivers/soc/fsl/qe/ucc_slow.c:228:41: sparse:    expected struct qe_bd *tx_bd
   drivers/soc/fsl/qe/ucc_slow.c:228:41: sparse:    got void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:231:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:231:17: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:231:17: sparse:    got restricted __be32 *
>> drivers/soc/fsl/qe/ucc_slow.c:233:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got uvoid [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:233:17: sparse:    expected void [noderef] <asn:2> *
>> drivers/soc/fsl/qe/ucc_slow.c:233:17: sparse:    got unsigned int [usertype] *
   drivers/soc/fsl/qe/ucc_slow.c:237:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:237:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:237:9: sparse:    got restricted __be32 *
>> drivers/soc/fsl/qe/ucc_slow.c:238:9: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [usertype] @@    got restrunsigned int [usertype] @@
>> drivers/soc/fsl/qe/ucc_slow.c:238:9: sparse:    expected unsigned int [usertype]
>> drivers/soc/fsl/qe/ucc_slow.c:238:9: sparse:    got restricted __be32 [usertype]
   drivers/soc/fsl/qe/ucc_slow.c:238:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got uvoid [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:238:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:238:9: sparse:    got unsigned int [usertype] *
>> drivers/soc/fsl/qe/ucc_slow.c:241:26: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct qe_bd *rx_bd @@    got void [nodestruct qe_bd *rx_bd @@
>> drivers/soc/fsl/qe/ucc_slow.c:241:26: sparse:    expected struct qe_bd *rx_bd
   drivers/soc/fsl/qe/ucc_slow.c:241:26: sparse:    got void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:244:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got uvoid [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:244:17: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:244:17: sparse:    got unsigned int [usertype] *
   drivers/soc/fsl/qe/ucc_slow.c:246:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:246:17: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:246:17: sparse:    got restricted __be32 *
   drivers/soc/fsl/qe/ucc_slow.c:250:9: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [usertype] @@    got restrunsigned int [usertype] @@
   drivers/soc/fsl/qe/ucc_slow.c:250:9: sparse:    expected unsigned int [usertype]
   drivers/soc/fsl/qe/ucc_slow.c:250:9: sparse:    got restricted __be32 [usertype]
   drivers/soc/fsl/qe/ucc_slow.c:250:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got uvoid [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:250:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:250:9: sparse:    got unsigned int [usertype] *
   drivers/soc/fsl/qe/ucc_slow.c:251:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:251:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:251:9: sparse:    got restricted __be32 *
>> drivers/soc/fsl/qe/ucc_slow.c:275:39: sparse: sparse: mixing different enum types:
>> drivers/soc/fsl/qe/ucc_slow.c:275:39: sparse:    unsigned int enum ucc_slow_tx_oversampling_rate
>> drivers/soc/fsl/qe/ucc_slow.c:275:39: sparse:    unsigned int enum ucc_slow_rx_oversampling_rate
   drivers/soc/fsl/qe/ucc_slow.c:295:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:295:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:295:9: sparse:    got restricted __be16 *
   drivers/soc/fsl/qe/ucc_slow.c:296:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/soc/fsl/qe/ucc_slow.c:296:9: sparse:    expected void [noderef] <asn:2> *
   drivers/soc/fsl/qe/ucc_slow.c:296:9: sparse:    got restricted __be16 *
--
>> drivers/tty/serial/ucc_uart.c:264:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
>> drivers/tty/serial/ucc_uart.c:264:21: sparse:    expected void [noderef] <asn:2> *
>> drivers/tty/serial/ucc_uart.c:264:21: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:268:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:268:21: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:268:21: sparse:    got restricted __be16 *
>> drivers/tty/serial/ucc_uart.c:286:6: sparse: sparse: symbol 'qe_uart_set_mctrl' was not declared. Should it be static?
   drivers/tty/serial/ucc_uart.c:349:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:349:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:349:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:350:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:350:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:350:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:350:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:350:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:350:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:352:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:352:21: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:352:21: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:371:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:371:18: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:371:18: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:384:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:384:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:384:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:385:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:385:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:385:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:385:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:385:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:385:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:388:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:388:21: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:388:21: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:476:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:476:26: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:476:26: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:483:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:483:21: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:483:21: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:514:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:514:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:514:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:514:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:514:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:514:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:517:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:517:21: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:517:21: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:608:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:608:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:608:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:609:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:609:17: sparse:    expected void [noderef] <asn:2> *
>> drivers/tty/serial/ucc_uart.c:609:17: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:610:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:610:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:610:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:616:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:616:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:616:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:617:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:617:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:617:9: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:618:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:618:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:618:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:629:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:629:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:629:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:630:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:630:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:630:17: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:631:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:631:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:631:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:641:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:641:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:641:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:642:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:642:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:642:9: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:643:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:643:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:643:9: sparse:    got restricted __be16 *
>> drivers/tty/serial/ucc_uart.c:657:46: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct ucc_uart_pram *uccup @@    got struct ucc_uart_prstruct ucc_uart_pram *uccup @@
>> drivers/tty/serial/ucc_uart.c:657:46: sparse:    expected struct ucc_uart_pram *uccup
>> drivers/tty/serial/ucc_uart.c:657:46: sparse:    got struct ucc_uart_pram [noderef] <asn:2> *uccup
>> drivers/tty/serial/ucc_uart.c:665:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:665:9: sparse:    expected void [noderef] <asn:2> *
>> drivers/tty/serial/ucc_uart.c:665:9: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:666:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:666:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:666:9: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:667:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:667:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:667:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:668:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:668:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:668:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:669:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:669:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:669:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:670:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:670:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:670:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:671:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:671:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:672:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:672:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:672:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:673:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:673:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:673:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:674:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:674:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:674:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:675:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:675:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:675:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:676:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:676:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:676:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:678:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:678:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:678:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:679:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:679:9: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:679:9: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:717:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:717:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:717:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:718:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:718:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:718:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:719:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:719:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:719:17: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:720:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:720:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:720:17: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:721:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:721:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:721:17: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:722:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:722:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:722:17: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:723:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:723:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:723:17: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:724:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:724:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:724:17: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:725:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:725:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:725:17: sparse:    got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:726:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:726:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:726:17: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:728:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:728:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:728:17: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:730:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:730:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:730:17: sparse:    got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:731:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got eref] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:731:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:731:17: sparse:    got unsigned char *
   drivers/tty/serial/ucc_uart.c:732:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void [noderef] <asn:2> * @@    got [noderef] <asn:2> * @@
   drivers/tty/serial/ucc_uart.c:732:17: sparse:    expected void [noderef] <asn:2> *
   drivers/tty/serial/ucc_uart.c:732:17: sparse:    got restricted __be16 *
>> drivers/tty/serial/ucc_uart.c:1004:24: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct ucc_uart_pram [noderef] <asn:2> *uccup @@    got am [noderef] <asn:2> *uccup @@
>> drivers/tty/serial/ucc_uart.c:1004:24: sparse:    expected struct ucc_uart_pram [noderef] <asn:2> *uccup
>> drivers/tty/serial/ucc_uart.c:1004:24: sparse:    got struct ucc_uart_pram *

vim +78 drivers/soc/fsl/qe/ucc_slow.c

9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   72  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   73  void ucc_slow_enable(struct ucc_slow_private * uccs, enum comm_dir mode)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   74  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   75  	struct ucc_slow *us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   76  	u32 gumr_l;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   77  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  @78  	us_regs = uccs->us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   79  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   80  	/* Enable reception and/or transmission on this UCC. */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  @81  	gumr_l = qe_ioread32be(&us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   82  	if (mode & COMM_DIR_TX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   83  		gumr_l |= UCC_SLOW_GUMR_L_ENT;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   84  		uccs->enabled_tx = 1;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   85  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   86  	if (mode & COMM_DIR_RX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   87  		gumr_l |= UCC_SLOW_GUMR_L_ENR;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   88  		uccs->enabled_rx = 1;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   89  	}
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01   90  	qe_iowrite32be(gumr_l, &us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   91  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09   92  EXPORT_SYMBOL(ucc_slow_enable);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   93  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   94  void ucc_slow_disable(struct ucc_slow_private * uccs, enum comm_dir mode)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   95  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   96  	struct ucc_slow *us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   97  	u32 gumr_l;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   98  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  @99  	us_regs = uccs->us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  100  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  101  	/* Disable reception and/or transmission on this UCC. */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @102  	gumr_l = qe_ioread32be(&us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  103  	if (mode & COMM_DIR_TX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  104  		gumr_l &= ~UCC_SLOW_GUMR_L_ENT;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  105  		uccs->enabled_tx = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  106  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  107  	if (mode & COMM_DIR_RX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  108  		gumr_l &= ~UCC_SLOW_GUMR_L_ENR;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  109  		uccs->enabled_rx = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  110  	}
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @111  	qe_iowrite32be(gumr_l, &us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  112  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09  113  EXPORT_SYMBOL(ucc_slow_disable);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  114  
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  115  /* Initialize the UCC for Slow operations
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  116   *
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  117   * The caller should initialize the following us_info
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  118   */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  119  int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** uccs_ret)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  120  {
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  121  	struct ucc_slow_private *uccs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  122  	u32 i;
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  123  	struct ucc_slow __iomem *us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  124  	u32 gumr;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  125  	struct qe_bd *bd;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  126  	u32 id;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  127  	u32 command;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  128  	int ret = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  129  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  130  	if (!us_info)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  131  		return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  132  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  133  	/* check if the UCC port number is in range. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  134  	if ((us_info->ucc_num < 0) || (us_info->ucc_num > UCC_MAX_NUM - 1)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  135  		printk(KERN_ERR "%s: illegal UCC number\n", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  136  		return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  137  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  138  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  139  	/*
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  140  	 * Set mrblr
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  141  	 * Check that 'max_rx_buf_length' is properly aligned (4), unless
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  142  	 * rfw is 1, meaning that QE accepts one byte at a time, unlike normal
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  143  	 * case when QE accepts 32 bits at a time.
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  144  	 */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  145  	if ((!us_info->rfw) &&
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  146  		(us_info->max_rx_buf_length & (UCC_SLOW_MRBLR_ALIGNMENT - 1))) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  147  		printk(KERN_ERR "max_rx_buf_length not aligned.\n");
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  148  		return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  149  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  150  
f8485350c22b25 arch/powerpc/sysdev/qe_lib/ucc_slow.c Yan Burman       2006-12-02  151  	uccs = kzalloc(sizeof(struct ucc_slow_private), GFP_KERNEL);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  152  	if (!uccs) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  153  		printk(KERN_ERR "%s: Cannot allocate private data\n",
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  154  			__func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  155  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  156  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  157  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  158  	/* Fill slow UCC structure */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  159  	uccs->us_info = us_info;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  160  	/* Set the PHY base address */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  161  	uccs->us_regs = ioremap(us_info->regs, sizeof(struct ucc_slow));
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  162  	if (uccs->us_regs == NULL) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  163  		printk(KERN_ERR "%s: Cannot map UCC registers\n", __func__);
61a4e9e91dd391 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-08-20  164  		kfree(uccs);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  165  		return -ENOMEM;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  166  	}
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  167  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  168  	uccs->saved_uccm = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03 @169  	uccs->p_rx_frame = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  170  	us_regs = uccs->us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03 @171  	uccs->p_ucce = (u16 *) & (us_regs->ucce);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  172  	uccs->p_uccm = (u16 *) & (us_regs->uccm);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  173  #ifdef STATISTICS
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  174  	uccs->rx_frames = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  175  	uccs->tx_frames = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  176  	uccs->rx_discarded = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  177  #endif				/* STATISTICS */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  178  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  179  	/* Get PRAM base */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  180  	uccs->us_pram_offset =
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  181  		qe_muram_alloc(UCC_SLOW_PRAM_SIZE, ALIGNMENT_OF_UCC_SLOW_PRAM);
4c35630ccda56e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-05-08  182  	if (IS_ERR_VALUE(uccs->us_pram_offset)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  183  		printk(KERN_ERR "%s: cannot allocate MURAM for PRAM", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  184  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  185  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  186  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  187  	id = ucc_slow_get_qe_cr_subblock(us_info->ucc_num);
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  188  	qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, id, us_info->protocol,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  189  		     uccs->us_pram_offset);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  190  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03 @191  	uccs->us_pram = qe_muram_addr(uccs->us_pram_offset);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  192  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  193  	/* Set UCC to slow type */
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  194  	ret = ucc_set_type(us_info->ucc_num, UCC_SPEED_TYPE_SLOW);
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  195  	if (ret) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  196  		printk(KERN_ERR "%s: cannot set UCC type", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  197  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  198  		return ret;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  199  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  200  
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @201  	qe_iowrite16be(us_info->max_rx_buf_length, &uccs->us_pram->mrblr);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  202  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  203  	INIT_LIST_HEAD(&uccs->confQ);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  204  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  205  	/* Allocate BDs. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  206  	uccs->rx_base_offset =
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  207  		qe_muram_alloc(us_info->rx_bd_ring_len * sizeof(struct qe_bd),
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  208  				QE_ALIGNMENT_OF_BD);
4c35630ccda56e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-05-08  209  	if (IS_ERR_VALUE(uccs->rx_base_offset)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  210  		printk(KERN_ERR "%s: cannot allocate %u RX BDs\n", __func__,
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  211  			us_info->rx_bd_ring_len);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  212  		uccs->rx_base_offset = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  213  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  214  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  215  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  216  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  217  	uccs->tx_base_offset =
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  218  		qe_muram_alloc(us_info->tx_bd_ring_len * sizeof(struct qe_bd),
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  219  			QE_ALIGNMENT_OF_BD);
4c35630ccda56e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-05-08  220  	if (IS_ERR_VALUE(uccs->tx_base_offset)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  221  		printk(KERN_ERR "%s: cannot allocate TX BDs", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  222  		uccs->tx_base_offset = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  223  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  224  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  225  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  226  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  227  	/* Init Tx bds */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03 @228  	bd = uccs->confBd = uccs->tx_bd = qe_muram_addr(uccs->tx_base_offset);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  229  	for (i = 0; i < us_info->tx_bd_ring_len - 1; i++) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  230  		/* clear bd buffer */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @231  		qe_iowrite32be(0, &bd->buf);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  232  		/* set bd status and length */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @233  		qe_iowrite32be(0, (u32 *)bd);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  234  		bd++;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  235  	}
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  236  	/* for last BD set Wrap bit */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @237  	qe_iowrite32be(0, &bd->buf);
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @238  	qe_iowrite32be(cpu_to_be32(T_W), (u32 *)bd);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  239  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  240  	/* Init Rx bds */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03 @241  	bd = uccs->rx_bd = qe_muram_addr(uccs->rx_base_offset);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  242  	for (i = 0; i < us_info->rx_bd_ring_len - 1; i++) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  243  		/* set bd status and length */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  244  		qe_iowrite32be(0, (u32 *)bd);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  245  		/* clear bd buffer */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  246  		qe_iowrite32be(0, &bd->buf);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  247  		bd++;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  248  	}
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  249  	/* for last BD set Wrap bit */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01 @250  	qe_iowrite32be(cpu_to_be32(R_W), (u32 *)bd);
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  251  	qe_iowrite32be(0, &bd->buf);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  252  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  253  	/* Set GUMR (For more details see the hardware spec.). */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  254  	/* gumr_h */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  255  	gumr = us_info->tcrc;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  256  	if (us_info->cdp)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  257  		gumr |= UCC_SLOW_GUMR_H_CDP;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  258  	if (us_info->ctsp)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  259  		gumr |= UCC_SLOW_GUMR_H_CTSP;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  260  	if (us_info->cds)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  261  		gumr |= UCC_SLOW_GUMR_H_CDS;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  262  	if (us_info->ctss)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  263  		gumr |= UCC_SLOW_GUMR_H_CTSS;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  264  	if (us_info->tfl)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  265  		gumr |= UCC_SLOW_GUMR_H_TFL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  266  	if (us_info->rfw)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  267  		gumr |= UCC_SLOW_GUMR_H_RFW;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  268  	if (us_info->txsy)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  269  		gumr |= UCC_SLOW_GUMR_H_TXSY;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  270  	if (us_info->rtsm)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  271  		gumr |= UCC_SLOW_GUMR_H_RTSM;
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  272  	qe_iowrite32be(gumr, &us_regs->gumr_h);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  273  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  274  	/* gumr_l */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16 @275  	gumr = us_info->tdcr | us_info->rdcr | us_info->tenc | us_info->renc |
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  276  		us_info->diag | us_info->mode;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  277  	if (us_info->tci)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  278  		gumr |= UCC_SLOW_GUMR_L_TCI;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  279  	if (us_info->rinv)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  280  		gumr |= UCC_SLOW_GUMR_L_RINV;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  281  	if (us_info->tinv)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  282  		gumr |= UCC_SLOW_GUMR_L_TINV;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  283  	if (us_info->tend)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  284  		gumr |= UCC_SLOW_GUMR_L_TEND;
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  285  	qe_iowrite32be(gumr, &us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  286  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  287  	/* Function code registers */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  288  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  289  	/* if the data is in cachable memory, the 'global' */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  290  	/* in the function code should be set. */
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  291  	uccs->us_pram->tbmr = UCC_BMR_BO_BE;
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  292  	uccs->us_pram->rbmr = UCC_BMR_BO_BE;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  293  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  294  	/* rbase, tbase are offsets from MURAM base */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  295  	qe_iowrite16be(uccs->rx_base_offset, &uccs->us_pram->rbase);
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  296  	qe_iowrite16be(uccs->tx_base_offset, &uccs->us_pram->tbase);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  297  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  298  	/* Mux clocking */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  299  	/* Grant Support */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  300  	ucc_set_qe_mux_grant(us_info->ucc_num, us_info->grant_support);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  301  	/* Breakpoint Support */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  302  	ucc_set_qe_mux_bkpt(us_info->ucc_num, us_info->brkpt_support);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  303  	/* Set Tsa or NMSI mode. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  304  	ucc_set_qe_mux_tsa(us_info->ucc_num, us_info->tsa);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  305  	/* If NMSI (not Tsa), set Tx and Rx clock. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  306  	if (!us_info->tsa) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  307  		/* Rx clock routing */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  308  		if (ucc_set_qe_mux_rxtx(us_info->ucc_num, us_info->rx_clock,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  309  					COMM_DIR_RX)) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  310  			printk(KERN_ERR "%s: illegal value for RX clock\n",
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  311  			       __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  312  			ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  313  			return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  314  		}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  315  		/* Tx clock routing */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  316  		if (ucc_set_qe_mux_rxtx(us_info->ucc_num, us_info->tx_clock,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  317  					COMM_DIR_TX)) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  318  			printk(KERN_ERR "%s: illegal value for TX clock\n",
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  319  			       __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  320  			ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  321  			return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  322  		}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  323  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  324  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  325  	/* Set interrupt mask register at UCC level. */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  326  	qe_iowrite16be(us_info->uccm_mask, &us_regs->uccm);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  327  
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  328  	/* First, clear anything pending at UCC level,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  329  	 * otherwise, old garbage may come through
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  330  	 * as soon as the dam is opened. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  331  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  332  	/* Writing '1' clears */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  333  	qe_iowrite16be(0xffff, &us_regs->ucce);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  334  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  335  	/* Issue QE Init command */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  336  	if (us_info->init_tx && us_info->init_rx)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  337  		command = QE_INIT_TX_RX;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  338  	else if (us_info->init_tx)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  339  		command = QE_INIT_TX;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  340  	else
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  341  		command = QE_INIT_RX;	/* We know at least one is TRUE */
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  342  
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  343  	qe_issue_cmd(command, id, us_info->protocol, 0);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  344  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  345  	*uccs_ret = uccs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  346  	return 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  347  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09  348  EXPORT_SYMBOL(ucc_slow_init);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  349  

:::::: The code at line 78 was first introduced by commit
:::::: 9865853851313e0d94a4acde42d6f9d8070bb376 [POWERPC] Add QUICC Engine (QE) infrastructure

:::::: TO: Li Yang <leoli@freescale.com>
:::::: CC: Paul Mackerras <paulus@samba.org>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
