Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271E168FB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 16:19:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PsRq0BNhzDqkD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Feb 2020 02:19:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PsQC2H5KzDqGc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2020 02:17:33 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2020 07:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,472,1574150400"; 
 d="gz'50?scan'50,208,50";a="270341868"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2020 07:17:26 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j5WWz-0006st-Kw; Sat, 22 Feb 2020 23:17:25 +0800
Date: Sat, 22 Feb 2020 23:16:44 +0800
From: kbuild test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/kprobes: Blacklist functions running with MMU
 disabled on PPC32
Message-ID: <202002222314.HyIQcC1S%lkp@intel.com>
References: <c99186043ede68b22014750857c561e479563ca6.1582099846.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <c99186043ede68b22014750857c561e479563ca6.1582099846.git.christophe.leroy@c-s.fr>
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.6-rc2 next-20200221]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-kprobes-Blacklist-functions-running-with-MMU-disabled-on-PPC32/20200221-040310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-mgcoge_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/82xx/pq2.c:32:1: error: return type defaults to 'int' [-Werror=return-type]
    NOKPROBE_SYMBOL(pq2_restart)
    ^~~~~~~~~~~~~~~
>> arch/powerpc/platforms/82xx/pq2.c:32:1: error: function declaration isn't a prototype [-Werror=strict-prototypes]
   arch/powerpc/platforms/82xx/pq2.c: In function 'NOKPROBE_SYMBOL':
>> arch/powerpc/platforms/82xx/pq2.c:37:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   arch/powerpc/platforms/82xx/pq2.c:45:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
   arch/powerpc/platforms/82xx/pq2.c:70:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    {
    ^
>> arch/powerpc/platforms/82xx/pq2.c:77:1: error: expected '{' at end of input
    }
    ^
   arch/powerpc/platforms/82xx/pq2.c:77:1: error: control reaches end of non-void function [-Werror=return-type]
    }
    ^
   cc1: all warnings being treated as errors

vim +32 arch/powerpc/platforms/82xx/pq2.c

    20	
    21	void __noreturn pq2_restart(char *cmd)
    22	{
    23		local_irq_disable();
    24		setbits32(&cpm2_immr->im_clkrst.car_rmr, RMR_CSRE);
    25	
    26		/* Clear the ME,EE,IR & DR bits in MSR to cause checkstop */
    27		mtmsr(mfmsr() & ~(MSR_ME | MSR_EE | MSR_IR | MSR_DR));
    28		in_8(&cpm2_immr->im_clkrst.res[0]);
    29	
    30		panic("Restart failed\n");
    31	}
  > 32	NOKPROBE_SYMBOL(pq2_restart)
    33	
    34	#ifdef CONFIG_PCI
    35	static int pq2_pci_exclude_device(struct pci_controller *hose,
    36	                                  u_char bus, u8 devfn)
  > 37	{
    38		if (bus == 0 && PCI_SLOT(devfn) == 0)
    39			return PCIBIOS_DEVICE_NOT_FOUND;
    40		else
    41			return PCIBIOS_SUCCESSFUL;
    42	}
    43	
    44	static void __init pq2_pci_add_bridge(struct device_node *np)
    45	{
    46		struct pci_controller *hose;
    47		struct resource r;
    48	
    49		if (of_address_to_resource(np, 0, &r) || r.end - r.start < 0x10b)
    50			goto err;
    51	
    52		pci_add_flags(PCI_REASSIGN_ALL_BUS);
    53	
    54		hose = pcibios_alloc_controller(np);
    55		if (!hose)
    56			return;
    57	
    58		hose->dn = np;
    59	
    60		setup_indirect_pci(hose, r.start + 0x100, r.start + 0x104, 0);
    61		pci_process_bridge_OF_ranges(hose, np, 1);
    62	
    63		return;
    64	
    65	err:
    66		printk(KERN_ERR "No valid PCI reg property in device tree\n");
    67	}
    68	
    69	void __init pq2_init_pci(void)
    70	{
    71		struct device_node *np;
    72	
    73		ppc_md.pci_exclude_device = pq2_pci_exclude_device;
    74	
    75		for_each_compatible_node(np, NULL, "fsl,pq2-pci")
    76			pq2_pci_add_bridge(np);
  > 77	}

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--EeQfGwPcQSOJBaQU
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--EeQfGwPcQSOJBaQU--
