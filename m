Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AAE6493
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 18:42:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471QCq31TxzDqhk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 04:42:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471Q9v38g0zDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 04:40:44 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 10:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,237,1569308400"; 
 d="gz'50?scan'50,208,50";a="197895177"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 27 Oct 2019 10:40:38 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iOmWs-0003pu-06; Mon, 28 Oct 2019 01:40:38 +0800
Date: Mon, 28 Oct 2019 01:40:06 +0800
From: kbuild test robot <lkp@intel.com>
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Subject: Re: [PATCH v6 25/30] PNP: Don't reserve BARs for PCI when enabled
 movable BARs
Message-ID: <201910280100.HqFDfPBd%lkp@intel.com>
References: <20191024171228.877974-26-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fgzmlw27zmqdhyft"
Content-Disposition: inline
In-Reply-To: <20191024171228.877974-26-s.miroshnichenko@yadro.com>
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
Cc: kbuild-all@lists.01.org, linux-pci@vger.kernel.org,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>, linux@yadro.com,
 Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--fgzmlw27zmqdhyft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sergey,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on pci/next]
[also build test ERROR on v5.4-rc4 next-20191025]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sergey-Miroshnichenko/PCI-Allow-BAR-movement-during-hotplug/20191028-002741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: i386-alldefconfig (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pnp/system.c: In function 'reserve_resources_of_dev':
>> drivers/pnp/system.c:62:6: error: 'pci_can_move_bars' undeclared (first use in this function); did you mean 'pci_cap_saved_data'?
     if (pci_can_move_bars)
         ^~~~~~~~~~~~~~~~~
         pci_cap_saved_data
   drivers/pnp/system.c:62:6: note: each undeclared identifier is reported only once for each function it appears in

vim +62 drivers/pnp/system.c

    56	
    57	static void reserve_resources_of_dev(struct pnp_dev *dev)
    58	{
    59		struct resource *res;
    60		int i;
    61	
  > 62		if (pci_can_move_bars)
    63			return;
    64	
    65		for (i = 0; (res = pnp_get_resource(dev, IORESOURCE_IO, i)); i++) {
    66			if (res->flags & IORESOURCE_DISABLED)
    67				continue;
    68			if (res->start == 0)
    69				continue;	/* disabled */
    70			if (res->start < 0x100)
    71				/*
    72				 * Below 0x100 is only standard PC hardware
    73				 * (pics, kbd, timer, dma, ...)
    74				 * We should not get resource conflicts there,
    75				 * and the kernel reserves these anyway
    76				 * (see arch/i386/kernel/setup.c).
    77				 * So, do nothing
    78				 */
    79				continue;
    80			if (res->end < res->start)
    81				continue;	/* invalid */
    82	
    83			reserve_range(dev, res, 1);
    84		}
    85	
    86		for (i = 0; (res = pnp_get_resource(dev, IORESOURCE_MEM, i)); i++) {
    87			if (res->flags & IORESOURCE_DISABLED)
    88				continue;
    89	
    90			reserve_range(dev, res, 0);
    91		}
    92	}
    93	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--fgzmlw27zmqdhyft
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--fgzmlw27zmqdhyft--
