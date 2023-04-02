Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB56D350F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 02:28:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ppvyr6Wsgz3chr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Apr 2023 10:28:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OvBKgOjO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ppvxx3bDJz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Apr 2023 10:28:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OvBKgOjO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Ppvxn2vZnz4xFd
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Apr 2023 10:27:57 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Ppvxn2q0zz4xDr; Sun,  2 Apr 2023 10:27:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OvBKgOjO;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Ppvxl4SwKz4xDn;
	Sun,  2 Apr 2023 10:27:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680395275; x=1711931275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCox6QVeMf6eKXYGZU5Pl/SsjUXrp7OFa4I0paCyj0k=;
  b=OvBKgOjOCjT/n0TEYKUr2pvvKUw/ghkNST854m1sNrpgxtXtG4LX3n5M
   VFej//WaC2Yta1nPvoNSYHboMuNDh3lNmCbs/i7nHYh5jsCR3Pe73j9sX
   Zj7RIfT5KabiKSbqgwv8HOdIs8qhEXZ+mxdZuFdfaEAGOVJwKyfD2E9+z
   /PtbPgt8vkjHuHqci8AeIosdsE9yLD9CiGZMaxDZsdgOYCQD7GVT51u83
   M5OduVy+GjQ7oZuHgmqDST/M3ZQz1gcfcIIxPrS3J0oGVSYL5Tu9MfjgH
   y2FrzZQMZGi1Zm6xrGKSZdLB+PMgheUfGIdIgBDasWZ0RV//3ETBnhBUr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="369489388"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="369489388"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 17:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="718129711"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="718129711"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Apr 2023 17:27:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pilZQ-000N8T-0f;
	Sun, 02 Apr 2023 00:27:44 +0000
Date: Sun, 2 Apr 2023 08:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2 1/2] KVM: PPC: Permit SRR1 flags in more injected
 interrupt types
Message-ID: <202304020827.3LEZ86WB-lkp@intel.com>
References: <20230330103224.3589928-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330103224.3589928-2-npiggin@gmail.com>
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
Cc: Michael Neuling <mikey@neuling.org>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/topic/ppc-kvm]
[also build test ERROR on linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/KVM-PPC-Permit-SRR1-flags-in-more-injected-interrupt-types/20230330-183420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
patch link:    https://lore.kernel.org/r/20230330103224.3589928-2-npiggin%40gmail.com
patch subject: [PATCH v2 1/2] KVM: PPC: Permit SRR1 flags in more injected interrupt types
config: powerpc-randconfig-c033-20230402 (https://download.01.org/0day-ci/archive/20230402/202304020827.3LEZ86WB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/31c610025a69f60bfa70c098471861456b2e4012
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nicholas-Piggin/KVM-PPC-Permit-SRR1-flags-in-more-injected-interrupt-types/20230330-183420
        git checkout 31c610025a69f60bfa70c098471861456b2e4012
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020827.3LEZ86WB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/booke.c:1011:5: error: no previous prototype for 'kvmppc_handle_exit' [-Werror=missing-prototypes]
    1011 | int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
         |     ^~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/booke.c: In function 'kvmppc_handle_exit':
>> arch/powerpc/kvm/booke.c:1244:17: error: too many arguments to function 'kvmppc_core_queue_alignment'
    1244 |                 kvmppc_core_queue_alignment(vcpu, 0, vcpu->arch.fault_dear,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/booke.c:306:13: note: declared here
     306 | static void kvmppc_core_queue_alignment(struct kvm_vcpu *vcpu, ulong dear_flags,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/kvmppc_core_queue_alignment +1244 arch/powerpc/kvm/booke.c

  1229	
  1230		case BOOKE_INTERRUPT_DATA_STORAGE:
  1231			kvmppc_core_queue_data_storage(vcpu, 0, vcpu->arch.fault_dear,
  1232			                               vcpu->arch.fault_esr);
  1233			kvmppc_account_exit(vcpu, DSI_EXITS);
  1234			r = RESUME_GUEST;
  1235			break;
  1236	
  1237		case BOOKE_INTERRUPT_INST_STORAGE:
  1238			kvmppc_core_queue_inst_storage(vcpu, vcpu->arch.fault_esr);
  1239			kvmppc_account_exit(vcpu, ISI_EXITS);
  1240			r = RESUME_GUEST;
  1241			break;
  1242	
  1243		case BOOKE_INTERRUPT_ALIGNMENT:
> 1244			kvmppc_core_queue_alignment(vcpu, 0, vcpu->arch.fault_dear,
  1245			                            vcpu->arch.fault_esr);
  1246			r = RESUME_GUEST;
  1247			break;
  1248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
