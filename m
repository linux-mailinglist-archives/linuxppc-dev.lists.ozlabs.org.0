Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473F83A9426
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 09:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4cSJ6ch8z3c0v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 17:36:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=rong.a.chen@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 16 Jun 2021 17:35:58 AEST
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4cRy2y2Zz2yXJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 17:35:58 +1000 (AEST)
IronPort-SDR: kCLF0/6Vebqycs20r/z+4+c7jnHX+UtfQPc7XJlzn83cDlR6DctnMXHO5fy3oTh9cUMBC0I7WZ
 EtMbgVBF9YcA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="269981010"
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="269981010"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 00:34:40 -0700
IronPort-SDR: tju26XTtT5CtSiJa+42+6hw9m/hu3AjlCFfT8dthm9xR7YXfatXk2vYbm04LaUuF5xQNWhDGwk
 ZjnaFeczxSqA==
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="484782709"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 00:34:35 -0700
Date: Wed, 16 Jun 2021 15:34:32 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: [powerpc:next-test 113/124] arch/powerpc/kernel/interrupt_64.S:
 asm/head-64.h is included more than once.
Message-ID: <20210616073432.GX237458@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: kbuild-all@lists.01.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   103bf32b0d2dd8b8a4d3d9ebdded5ba4e8263e6a
commit: 5592c877d21b6ca201aafca349663c5a41f134f0 [113/124] powerpc/64: move interrupt return asm to interrupt_64.S
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/interrupt_64.S: asm/head-64.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
