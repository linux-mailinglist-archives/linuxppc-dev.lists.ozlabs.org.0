Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6222840219E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 02:25:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3Qyw2Kmpz2yNv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 10:25:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3QyP4tgmz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 10:24:55 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="200270532"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; 
 d="gz'50?scan'50,208,50";a="200270532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 17:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; 
 d="gz'50?scan'50,208,50";a="546463007"
Received: from lkp-server01.sh.intel.com (HELO 53c23d017ad5) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2021 17:23:48 -0700
Received: from kbuild by 53c23d017ad5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mNOtv-0001FC-Bd; Tue, 07 Sep 2021 00:23:47 +0000
Date: Tue, 7 Sep 2021 08:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 3/5] PCI: Move pci_dev_is/assign_added() to pci.h
Message-ID: <202109070837.fM9WUV4U-lkp@intel.com>
References: <20210906094927.524106-4-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20210906094927.524106-4-schnelle@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, kbuild-all@lists.01.org,
 Pierre Morel <pmorel@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Linas Vepstas <linasvepstas@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

I love your patch! Yet something to improve:

[auto build test ERROR on s390/features]
[also build test ERROR on next-20210906]
[cannot apply to pci/next powerpc/next v5.14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Niklas-Schnelle/s390-pci-automatic-error-recovery/20210906-175309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
config: i386-randconfig-a016-20210906 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6fe2beba7d2a41964af658c8c59dd172683ef739)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/404ed8c00a612e7ae31c50557c80c6726c464863
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Niklas-Schnelle/s390-pci-automatic-error-recovery/20210906-175309
        git checkout 404ed8c00a612e7ae31c50557c80c6726c464863
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pci/hotplug/acpiphp_glue.c:330:6: error: implicit declaration of function 'pci_bus_read_dev_vendor_id' [-Werror,-Wimplicit-function-declaration]
           if (pci_bus_read_dev_vendor_id(pbus, PCI_DEVFN(device, function),
               ^
>> drivers/pci/hotplug/acpiphp_glue.c:505:6: error: implicit declaration of function '__pci_bus_size_bridges' [-Werror,-Wimplicit-function-declaration]
                                           __pci_bus_size_bridges(dev->subordinate,
                                           ^
   drivers/pci/hotplug/acpiphp_glue.c:505:6: note: did you mean 'pci_bus_size_bridges'?
   include/linux/pci.h:1336:6: note: 'pci_bus_size_bridges' declared here
   void pci_bus_size_bridges(struct pci_bus *bus);
        ^
>> drivers/pci/hotplug/acpiphp_glue.c:510:3: error: implicit declaration of function '__pci_bus_assign_resources' [-Werror,-Wimplicit-function-declaration]
                   __pci_bus_assign_resources(bus, &add_list, NULL);
                   ^
   drivers/pci/hotplug/acpiphp_glue.c:510:3: note: did you mean 'pci_bus_assign_resources'?
   include/linux/pci.h:1334:6: note: 'pci_bus_assign_resources' declared here
   void pci_bus_assign_resources(const struct pci_bus *bus);
        ^
   drivers/pci/hotplug/acpiphp_glue.c:604:8: error: implicit declaration of function 'pci_bus_read_dev_vendor_id' [-Werror,-Wimplicit-function-declaration]
                           if (pci_bus_read_dev_vendor_id(slot->bus,
                               ^
   drivers/pci/hotplug/acpiphp_glue.c:619:7: error: implicit declaration of function 'pci_bus_read_dev_vendor_id' [-Werror,-Wimplicit-function-declaration]
                   if (pci_bus_read_dev_vendor_id(slot->bus,
                       ^
>> drivers/pci/hotplug/acpiphp_glue.c:660:3: error: implicit declaration of function 'pci_dev_set_disconnected' [-Werror,-Wimplicit-function-declaration]
                   pci_dev_set_disconnected(dev, NULL);
                   ^
>> drivers/pci/hotplug/acpiphp_glue.c:661:7: error: implicit declaration of function 'pci_has_subordinate' [-Werror,-Wimplicit-function-declaration]
                   if (pci_has_subordinate(dev))
                       ^
   7 errors generated.


vim +/pci_bus_read_dev_vendor_id +330 drivers/pci/hotplug/acpiphp_glue.c

4e8662bbd680c5 Kristen Accardi   2006-06-28  217  
3799c5a032aefb Rafael J. Wysocki 2014-02-16  218  /**
3799c5a032aefb Rafael J. Wysocki 2014-02-16  219   * acpiphp_add_context - Add ACPIPHP context to an ACPI device object.
3799c5a032aefb Rafael J. Wysocki 2014-02-16  220   * @handle: ACPI handle of the object to add a context to.
3799c5a032aefb Rafael J. Wysocki 2014-02-16  221   * @lvl: Not used.
3799c5a032aefb Rafael J. Wysocki 2014-02-16  222   * @data: The object's parent ACPIPHP bridge.
3799c5a032aefb Rafael J. Wysocki 2014-02-16  223   * @rv: Not used.
3799c5a032aefb Rafael J. Wysocki 2014-02-16  224   */
3799c5a032aefb Rafael J. Wysocki 2014-02-16  225  static acpi_status acpiphp_add_context(acpi_handle handle, u32 lvl, void *data,
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  226  				       void **rv)
^1da177e4c3f41 Linus Torvalds    2005-04-16  227  {
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  228  	struct acpiphp_bridge *bridge = data;
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  229  	struct acpiphp_context *context;
bbcbfc0eed6220 Rafael J. Wysocki 2014-02-04  230  	struct acpi_device *adev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  	struct acpiphp_slot *slot;
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  	struct acpiphp_func *newfunc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  	acpi_status status = AE_OK;
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  234  	unsigned long long adr;
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  235  	int device, function;
e8c331e963c58b Kenji Kaneshige   2008-12-17  236  	struct pci_bus *pbus = bridge->pci_bus;
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  237  	struct pci_dev *pdev = bridge->pci_dev;
3b63aaa70e1ccc Jiang Liu         2013-04-12  238  	u32 val;
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  240  	status = acpi_evaluate_integer(handle, "_ADR", NULL, &adr);
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  241  	if (ACPI_FAILURE(status)) {
f26ca1d699e8b5 Toshi Kani        2013-11-27  242  		if (status != AE_NOT_FOUND)
f26ca1d699e8b5 Toshi Kani        2013-11-27  243  			acpi_handle_warn(handle,
f26ca1d699e8b5 Toshi Kani        2013-11-27  244  				"can't evaluate _ADR (%#x)\n", status);
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  245  		return AE_OK;
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  246  	}
bbcbfc0eed6220 Rafael J. Wysocki 2014-02-04  247  	if (acpi_bus_get_device(handle, &adev))
bbcbfc0eed6220 Rafael J. Wysocki 2014-02-04  248  		return AE_OK;
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  249  
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  250  	device = (adr >> 16) & 0xffff;
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  251  	function = adr & 0xffff;
dfb117b3e50c52 Bjorn Helgaas     2012-06-20  252  
e525506fcb67a9 Rafael J. Wysocki 2014-02-04  253  	acpi_lock_hp_context();
bbcbfc0eed6220 Rafael J. Wysocki 2014-02-04  254  	context = acpiphp_init_context(adev);
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  255  	if (!context) {
e525506fcb67a9 Rafael J. Wysocki 2014-02-04  256  		acpi_unlock_hp_context();
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  257  		acpi_handle_err(handle, "No hotplug context\n");
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  258  		return AE_NOT_EXIST;
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  259  	}
bd4674dfc5fc70 Rafael J. Wysocki 2013-07-13  260  	newfunc = &context->func;
bd4674dfc5fc70 Rafael J. Wysocki 2013-07-13  261  	newfunc->function = function;
bda46dbb6626c9 Rafael J. Wysocki 2013-07-13  262  	newfunc->parent = bridge;
edf5bf34d40804 Rafael J. Wysocki 2014-02-21  263  	acpi_unlock_hp_context();
cb7b8cedf6c88b Rafael J. Wysocki 2013-07-13  264  
edf5bf34d40804 Rafael J. Wysocki 2014-02-21  265  	/*
edf5bf34d40804 Rafael J. Wysocki 2014-02-21  266  	 * If this is a dock device, its _EJ0 should be executed by the dock
edf5bf34d40804 Rafael J. Wysocki 2014-02-21  267  	 * notify handler after calling _DCK.
edf5bf34d40804 Rafael J. Wysocki 2014-02-21  268  	 */
edf5bf34d40804 Rafael J. Wysocki 2014-02-21  269  	if (!is_dock_device(adev) && acpi_has_method(handle, "_EJ0"))
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  		newfunc->flags = FUNC_HAS_EJ0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  
ecd046da57d332 Jiang Liu         2013-06-29  272  	if (acpi_has_method(handle, "_STA"))
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  		newfunc->flags |= FUNC_HAS_STA;
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  	/* search for objects that share the same slot */
ad41dd9dd0c8ca Yijing Wang       2013-04-12  276  	list_for_each_entry(slot, &bridge->slots, node)
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  277  		if (slot->device == device)
ac372338b75064 Rafael J. Wysocki 2013-07-13  278  			goto slot_found;
^1da177e4c3f41 Linus Torvalds    2005-04-16  279  
f5afe8064f3087 Eric Sesterhenn   2006-02-28  280  	slot = kzalloc(sizeof(struct acpiphp_slot), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  	if (!slot) {
e525506fcb67a9 Rafael J. Wysocki 2014-02-04  282  		acpi_lock_hp_context();
146fc68a4bdd78 Rafael J. Wysocki 2014-02-04  283  		acpiphp_put_context(context);
e525506fcb67a9 Rafael J. Wysocki 2014-02-04  284  		acpi_unlock_hp_context();
146fc68a4bdd78 Rafael J. Wysocki 2014-02-04  285  		return AE_NO_MEMORY;
^1da177e4c3f41 Linus Torvalds    2005-04-16  286  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  287  
bda46dbb6626c9 Rafael J. Wysocki 2013-07-13  288  	slot->bus = bridge->pci_bus;
^1da177e4c3f41 Linus Torvalds    2005-04-16  289  	slot->device = device;
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  	INIT_LIST_HEAD(&slot->funcs);
^1da177e4c3f41 Linus Torvalds    2005-04-16  291  
ad41dd9dd0c8ca Yijing Wang       2013-04-12  292  	list_add_tail(&slot->node, &bridge->slots);
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  293  
cc6254e00eb676 Rafael J. Wysocki 2014-02-16  294  	/*
cc6254e00eb676 Rafael J. Wysocki 2014-02-16  295  	 * Expose slots to user space for functions that have _EJ0 or _RMV or
cc6254e00eb676 Rafael J. Wysocki 2014-02-16  296  	 * are located in dock stations.  Do not expose them for devices handled
84c8b58ed3addf Mika Westerberg   2018-05-29  297  	 * by the native PCIe hotplug (PCIeHP) or standard PCI hotplug
84c8b58ed3addf Mika Westerberg   2018-05-29  298  	 * (SHPCHP), because that code is supposed to expose slots to user
84c8b58ed3addf Mika Westerberg   2018-05-29  299  	 * space in those cases.
cc6254e00eb676 Rafael J. Wysocki 2014-02-16  300  	 */
3b52b21fa1f44c Rafael J. Wysocki 2014-02-21  301  	if ((acpi_pci_check_ejectable(pbus, handle) || is_dock_device(adev))
84c8b58ed3addf Mika Westerberg   2018-05-29  302  	    && !(pdev && hotplug_is_native(pdev))) {
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  303  		unsigned long long sun;
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  304  		int retval;
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  305  
^1da177e4c3f41 Linus Torvalds    2005-04-16  306  		bridge->nr_slots++;
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  307  		status = acpi_evaluate_integer(handle, "_SUN", NULL, &sun);
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  308  		if (ACPI_FAILURE(status))
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  309  			sun = bridge->nr_slots;
^1da177e4c3f41 Linus Torvalds    2005-04-16  310  
bd950799d9510c Lan Tianyu        2013-09-24  311  		pr_debug("found ACPI PCI Hotplug slot %llu at PCI %04x:%02x:%02x\n",
7342798d0ab850 Rafael J. Wysocki 2013-07-13  312  		    sun, pci_domain_nr(pbus), pbus->number, device);
ac372338b75064 Rafael J. Wysocki 2013-07-13  313  
7342798d0ab850 Rafael J. Wysocki 2013-07-13  314  		retval = acpiphp_register_hotplug_slot(slot, sun);
e27da381417038 MUNEDA Takahiro   2006-02-23  315  		if (retval) {
1aaac07112f040 Rafael J. Wysocki 2013-08-17  316  			slot->slot = NULL;
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  317  			bridge->nr_slots--;
f46753c5e354b8 Alex Chiang       2008-06-10  318  			if (retval == -EBUSY)
227f06470502c4 Ryan Desfosses    2014-04-18  319  				pr_warn("Slot %llu already registered by another hotplug driver\n", sun);
f46753c5e354b8 Alex Chiang       2008-06-10  320  			else
227f06470502c4 Ryan Desfosses    2014-04-18  321  				pr_warn("acpiphp_register_hotplug_slot failed (err code = 0x%x)\n", retval);
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  322  		}
bbd34fcdd1b201 Rafael J. Wysocki 2013-07-13  323  		/* Even if the slot registration fails, we can still use it. */
e27da381417038 MUNEDA Takahiro   2006-02-23  324  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  325  
ac372338b75064 Rafael J. Wysocki 2013-07-13  326   slot_found:
^1da177e4c3f41 Linus Torvalds    2005-04-16  327  	newfunc->slot = slot;
^1da177e4c3f41 Linus Torvalds    2005-04-16  328  	list_add_tail(&newfunc->sibling, &slot->funcs);
^1da177e4c3f41 Linus Torvalds    2005-04-16  329  
3b63aaa70e1ccc Jiang Liu         2013-04-12 @330  	if (pci_bus_read_dev_vendor_id(pbus, PCI_DEVFN(device, function),
3b63aaa70e1ccc Jiang Liu         2013-04-12  331  				       &val, 60*1000))
bc805a55392a7c Rafael J. Wysocki 2013-07-13  332  		slot->flags |= SLOT_ENABLED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  333  
2e862c51904ddd Rafael J. Wysocki 2013-07-13  334  	return AE_OK;
^1da177e4c3f41 Linus Torvalds    2005-04-16  335  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  336  
364d5094a43ff2 Rajesh Shah       2005-04-28  337  static void cleanup_bridge(struct acpiphp_bridge *bridge)
^1da177e4c3f41 Linus Torvalds    2005-04-16  338  {
3d54a3160fb6ba Jiang Liu         2013-04-12  339  	struct acpiphp_slot *slot;
3d54a3160fb6ba Jiang Liu         2013-04-12  340  	struct acpiphp_func *func;
42f49a6ae5dca9 Rajesh Shah       2005-04-28  341  
3d54a3160fb6ba Jiang Liu         2013-04-12  342  	list_for_each_entry(slot, &bridge->slots, node) {
3d54a3160fb6ba Jiang Liu         2013-04-12  343  		list_for_each_entry(func, &slot->funcs, sibling) {
1a699476e25814 Rafael J. Wysocki 2014-02-06  344  			struct acpi_device *adev = func_to_acpi_device(func);
5a3bc573ae32a7 Rafael J. Wysocki 2013-07-13  345  
1a699476e25814 Rafael J. Wysocki 2014-02-06  346  			acpi_lock_hp_context();
be27b3dcb02335 Rafael J. Wysocki 2014-02-21  347  			adev->hp->notify = NULL;
edf5bf34d40804 Rafael J. Wysocki 2014-02-21  348  			adev->hp->fixup = NULL;
1a699476e25814 Rafael J. Wysocki 2014-02-06  349  			acpi_unlock_hp_context();
42f49a6ae5dca9 Rajesh Shah       2005-04-28  350  		}
9217a984671e8a Rafael J. Wysocki 2014-01-10  351  		slot->flags |= SLOT_IS_GOING_AWAY;
1aaac07112f040 Rafael J. Wysocki 2013-08-17  352  		if (slot->slot)
e27da381417038 MUNEDA Takahiro   2006-02-23  353  			acpiphp_unregister_hotplug_slot(slot);
42f49a6ae5dca9 Rajesh Shah       2005-04-28  354  	}
42f49a6ae5dca9 Rajesh Shah       2005-04-28  355  
3d54a3160fb6ba Jiang Liu         2013-04-12  356  	mutex_lock(&bridge_mutex);
42f49a6ae5dca9 Rajesh Shah       2005-04-28  357  	list_del(&bridge->list);
3d54a3160fb6ba Jiang Liu         2013-04-12  358  	mutex_unlock(&bridge_mutex);
9217a984671e8a Rafael J. Wysocki 2014-01-10  359  
e525506fcb67a9 Rafael J. Wysocki 2014-02-04  360  	acpi_lock_hp_context();
9217a984671e8a Rafael J. Wysocki 2014-01-10  361  	bridge->is_going_away = true;
e525506fcb67a9 Rafael J. Wysocki 2014-02-04  362  	acpi_unlock_hp_context();
^1da177e4c3f41 Linus Torvalds    2005-04-16  363  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  364  
15a1ae74879925 Kristen Accardi   2006-02-23  365  /**
26e6c66e47fe7f Randy Dunlap      2007-11-28  366   * acpiphp_max_busnr - return the highest reserved bus number under the given bus.
15a1ae74879925 Kristen Accardi   2006-02-23  367   * @bus: bus to start search with
15a1ae74879925 Kristen Accardi   2006-02-23  368   */
15a1ae74879925 Kristen Accardi   2006-02-23  369  static unsigned char acpiphp_max_busnr(struct pci_bus *bus)
15a1ae74879925 Kristen Accardi   2006-02-23  370  {
c6f0d5adc21e2d Yijing Wang       2014-02-13  371  	struct pci_bus *tmp;
15a1ae74879925 Kristen Accardi   2006-02-23  372  	unsigned char max, n;
15a1ae74879925 Kristen Accardi   2006-02-23  373  
15a1ae74879925 Kristen Accardi   2006-02-23  374  	/*
15a1ae74879925 Kristen Accardi   2006-02-23  375  	 * pci_bus_max_busnr will return the highest
15a1ae74879925 Kristen Accardi   2006-02-23  376  	 * reserved busnr for all these children.
15a1ae74879925 Kristen Accardi   2006-02-23  377  	 * that is equivalent to the bus->subordinate
15a1ae74879925 Kristen Accardi   2006-02-23  378  	 * value.  We don't want to use the parent's
15a1ae74879925 Kristen Accardi   2006-02-23  379  	 * bus->subordinate value because it could have
15a1ae74879925 Kristen Accardi   2006-02-23  380  	 * padding in it.
15a1ae74879925 Kristen Accardi   2006-02-23  381  	 */
b918c62e086b21 Yinghai Lu        2012-05-17  382  	max = bus->busn_res.start;
15a1ae74879925 Kristen Accardi   2006-02-23  383  
c6f0d5adc21e2d Yijing Wang       2014-02-13  384  	list_for_each_entry(tmp, &bus->children, node) {
c6f0d5adc21e2d Yijing Wang       2014-02-13  385  		n = pci_bus_max_busnr(tmp);
15a1ae74879925 Kristen Accardi   2006-02-23  386  		if (n > max)
15a1ae74879925 Kristen Accardi   2006-02-23  387  			max = n;
15a1ae74879925 Kristen Accardi   2006-02-23  388  	}
15a1ae74879925 Kristen Accardi   2006-02-23  389  	return max;
15a1ae74879925 Kristen Accardi   2006-02-23  390  }
15a1ae74879925 Kristen Accardi   2006-02-23  391  
d06070509147c9 Shaohua Li        2010-02-25  392  static void acpiphp_set_acpi_region(struct acpiphp_slot *slot)
d06070509147c9 Shaohua Li        2010-02-25  393  {
d06070509147c9 Shaohua Li        2010-02-25  394  	struct acpiphp_func *func;
d06070509147c9 Shaohua Li        2010-02-25  395  
d06070509147c9 Shaohua Li        2010-02-25  396  	list_for_each_entry(func, &slot->funcs, sibling) {
d06070509147c9 Shaohua Li        2010-02-25  397  		/* _REG is optional, we don't care about if there is failure */
6dd10c47e91239 Hans de Goede     2020-05-07  398  		acpi_evaluate_reg(func_to_handle(func),
6dd10c47e91239 Hans de Goede     2020-05-07  399  				  ACPI_ADR_SPACE_PCI_CONFIG,
6dd10c47e91239 Hans de Goede     2020-05-07  400  				  ACPI_REG_CONNECT);
d06070509147c9 Shaohua Li        2010-02-25  401  	}
d06070509147c9 Shaohua Li        2010-02-25  402  }
d06070509147c9 Shaohua Li        2010-02-25  403  
1f96a965e30d09 Yinghai Lu        2013-01-21  404  static void check_hotplug_bridge(struct acpiphp_slot *slot, struct pci_dev *dev)
1f96a965e30d09 Yinghai Lu        2013-01-21  405  {
1f96a965e30d09 Yinghai Lu        2013-01-21  406  	struct acpiphp_func *func;
1f96a965e30d09 Yinghai Lu        2013-01-21  407  
1f96a965e30d09 Yinghai Lu        2013-01-21  408  	/* quirk, or pcie could set it already */
1f96a965e30d09 Yinghai Lu        2013-01-21  409  	if (dev->is_hotplug_bridge)
1f96a965e30d09 Yinghai Lu        2013-01-21  410  		return;
1f96a965e30d09 Yinghai Lu        2013-01-21  411  
1f96a965e30d09 Yinghai Lu        2013-01-21  412  	list_for_each_entry(func, &slot->funcs, sibling) {
1f96a965e30d09 Yinghai Lu        2013-01-21  413  		if (PCI_FUNC(dev->devfn) == func->function) {
1f96a965e30d09 Yinghai Lu        2013-01-21  414  			dev->is_hotplug_bridge = 1;
1f96a965e30d09 Yinghai Lu        2013-01-21  415  			break;
1f96a965e30d09 Yinghai Lu        2013-01-21  416  		}
1f96a965e30d09 Yinghai Lu        2013-01-21  417  	}
1f96a965e30d09 Yinghai Lu        2013-01-21  418  }
3b63aaa70e1ccc Jiang Liu         2013-04-12  419  
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  420  static int acpiphp_rescan_slot(struct acpiphp_slot *slot)
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  421  {
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  422  	struct acpiphp_func *func;
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  423  
b6708fbf98ac01 Rafael J. Wysocki 2014-02-04  424  	list_for_each_entry(func, &slot->funcs, sibling) {
b6708fbf98ac01 Rafael J. Wysocki 2014-02-04  425  		struct acpi_device *adev = func_to_acpi_device(func);
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  426  
b6708fbf98ac01 Rafael J. Wysocki 2014-02-04  427  		acpi_bus_scan(adev->handle);
b6708fbf98ac01 Rafael J. Wysocki 2014-02-04  428  		if (acpi_device_enumerated(adev))
b6708fbf98ac01 Rafael J. Wysocki 2014-02-04  429  			acpi_device_set_power(adev, ACPI_STATE_D0);
b6708fbf98ac01 Rafael J. Wysocki 2014-02-04  430  	}
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  431  	return pci_scan_slot(slot->bus, PCI_DEVFN(slot->device, 0));
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  432  }
a47d8c8e72a5fa Rafael J. Wysocki 2013-09-08  433  
84c8b58ed3addf Mika Westerberg   2018-05-29  434  static void acpiphp_native_scan_bridge(struct pci_dev *bridge)
84c8b58ed3addf Mika Westerberg   2018-05-29  435  {
84c8b58ed3addf Mika Westerberg   2018-05-29  436  	struct pci_bus *bus = bridge->subordinate;
84c8b58ed3addf Mika Westerberg   2018-05-29  437  	struct pci_dev *dev;
84c8b58ed3addf Mika Westerberg   2018-05-29  438  	int max;
84c8b58ed3addf Mika Westerberg   2018-05-29  439  
84c8b58ed3addf Mika Westerberg   2018-05-29  440  	if (!bus)
84c8b58ed3addf Mika Westerberg   2018-05-29  441  		return;
84c8b58ed3addf Mika Westerberg   2018-05-29  442  
84c8b58ed3addf Mika Westerberg   2018-05-29  443  	max = bus->busn_res.start;
84c8b58ed3addf Mika Westerberg   2018-05-29  444  	/* Scan already configured non-hotplug bridges */
84c8b58ed3addf Mika Westerberg   2018-05-29  445  	for_each_pci_bridge(dev, bus) {
84c8b58ed3addf Mika Westerberg   2018-05-29  446  		if (!hotplug_is_native(dev))
84c8b58ed3addf Mika Westerberg   2018-05-29  447  			max = pci_scan_bridge(bus, dev, max, 0);
84c8b58ed3addf Mika Westerberg   2018-05-29  448  	}
84c8b58ed3addf Mika Westerberg   2018-05-29  449  
84c8b58ed3addf Mika Westerberg   2018-05-29  450  	/* Scan non-hotplug bridges that need to be reconfigured */
84c8b58ed3addf Mika Westerberg   2018-05-29  451  	for_each_pci_bridge(dev, bus) {
77adf9355304f8 Mika Westerberg   2019-10-30  452  		if (hotplug_is_native(dev))
77adf9355304f8 Mika Westerberg   2019-10-30  453  			continue;
77adf9355304f8 Mika Westerberg   2019-10-30  454  
84c8b58ed3addf Mika Westerberg   2018-05-29  455  		max = pci_scan_bridge(bus, dev, max, 1);
77adf9355304f8 Mika Westerberg   2019-10-30  456  		if (dev->subordinate) {
77adf9355304f8 Mika Westerberg   2019-10-30  457  			pcibios_resource_survey_bus(dev->subordinate);
77adf9355304f8 Mika Westerberg   2019-10-30  458  			pci_bus_size_bridges(dev->subordinate);
77adf9355304f8 Mika Westerberg   2019-10-30  459  			pci_bus_assign_resources(dev->subordinate);
77adf9355304f8 Mika Westerberg   2019-10-30  460  		}
84c8b58ed3addf Mika Westerberg   2018-05-29  461  	}
84c8b58ed3addf Mika Westerberg   2018-05-29  462  }
84c8b58ed3addf Mika Westerberg   2018-05-29  463  
^1da177e4c3f41 Linus Torvalds    2005-04-16  464  /**
a1d0abcea84573 Rafael J. Wysocki 2013-07-13  465   * enable_slot - enable, configure a slot
^1da177e4c3f41 Linus Torvalds    2005-04-16  466   * @slot: slot to be enabled
f188b99f0b2d33 Mika Westerberg   2018-09-26  467   * @bridge: true if enable is for the whole bridge (not a single slot)
^1da177e4c3f41 Linus Torvalds    2005-04-16  468   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  469   * This function should be called per *physical slot*,
^1da177e4c3f41 Linus Torvalds    2005-04-16  470   * not per each slot object in ACPI namespace.
^1da177e4c3f41 Linus Torvalds    2005-04-16  471   */
f188b99f0b2d33 Mika Westerberg   2018-09-26  472  static void enable_slot(struct acpiphp_slot *slot, bool bridge)
^1da177e4c3f41 Linus Torvalds    2005-04-16  473  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  474  	struct pci_dev *dev;
bda46dbb6626c9 Rafael J. Wysocki 2013-07-13  475  	struct pci_bus *bus = slot->bus;
^1da177e4c3f41 Linus Torvalds    2005-04-16  476  	struct acpiphp_func *func;
84c8b58ed3addf Mika Westerberg   2018-05-29  477  
f188b99f0b2d33 Mika Westerberg   2018-09-26  478  	if (bridge && bus->self && hotplug_is_native(bus->self)) {
84c8b58ed3addf Mika Westerberg   2018-05-29  479  		/*
84c8b58ed3addf Mika Westerberg   2018-05-29  480  		 * If native hotplug is used, it will take care of hotplug
84c8b58ed3addf Mika Westerberg   2018-05-29  481  		 * slot management and resource allocation for hotplug
84c8b58ed3addf Mika Westerberg   2018-05-29  482  		 * bridges. However, ACPI hotplug may still be used for
84c8b58ed3addf Mika Westerberg   2018-05-29  483  		 * non-hotplug bridges to bring in additional devices such
84c8b58ed3addf Mika Westerberg   2018-05-29  484  		 * as a Thunderbolt host controller.
84c8b58ed3addf Mika Westerberg   2018-05-29  485  		 */
84c8b58ed3addf Mika Westerberg   2018-05-29  486  		for_each_pci_bridge(dev, bus) {
84c8b58ed3addf Mika Westerberg   2018-05-29  487  			if (PCI_SLOT(dev->devfn) == slot->device)
84c8b58ed3addf Mika Westerberg   2018-05-29  488  				acpiphp_native_scan_bridge(dev);
84c8b58ed3addf Mika Westerberg   2018-05-29  489  		}
84c8b58ed3addf Mika Westerberg   2018-05-29  490  	} else {
d66ecb7220a70e Jiang Liu         2013-06-23  491  		LIST_HEAD(add_list);
84c8b58ed3addf Mika Westerberg   2018-05-29  492  		int max, pass;
^1da177e4c3f41 Linus Torvalds    2005-04-16  493  
ab1225901da2d4 Mika Westerberg   2013-10-30  494  		acpiphp_rescan_slot(slot);
15a1ae74879925 Kristen Accardi   2006-02-23  495  		max = acpiphp_max_busnr(bus);
42f49a6ae5dca9 Rajesh Shah       2005-04-28  496  		for (pass = 0; pass < 2; pass++) {
24a0c654d7d606 Andy Shevchenko   2017-10-20  497  			for_each_pci_bridge(dev, bus) {
42f49a6ae5dca9 Rajesh Shah       2005-04-28  498  				if (PCI_SLOT(dev->devfn) != slot->device)
42f49a6ae5dca9 Rajesh Shah       2005-04-28  499  					continue;
a1d0abcea84573 Rafael J. Wysocki 2013-07-13  500  
42f49a6ae5dca9 Rajesh Shah       2005-04-28  501  				max = pci_scan_bridge(bus, dev, max, pass);
1f96a965e30d09 Yinghai Lu        2013-01-21  502  				if (pass && dev->subordinate) {
1f96a965e30d09 Yinghai Lu        2013-01-21  503  					check_hotplug_bridge(slot, dev);
d66ecb7220a70e Jiang Liu         2013-06-23  504  					pcibios_resource_survey_bus(dev->subordinate);
84c8b58ed3addf Mika Westerberg   2018-05-29 @505  					__pci_bus_size_bridges(dev->subordinate,
84c8b58ed3addf Mika Westerberg   2018-05-29  506  							       &add_list);
c64b5eead93f9d Kristen Accardi   2005-12-14  507  				}
42f49a6ae5dca9 Rajesh Shah       2005-04-28  508  			}
1f96a965e30d09 Yinghai Lu        2013-01-21  509  		}
d66ecb7220a70e Jiang Liu         2013-06-23 @510  		__pci_bus_assign_resources(bus, &add_list, NULL);
84c8b58ed3addf Mika Westerberg   2018-05-29  511  	}
2dc41281b1d117 Rafael J. Wysocki 2013-09-06  512  
8e5dce35221850 Kristen Accardi   2005-10-18  513  	acpiphp_sanitize_bus(bus);
81ee57326c9ca6 Bjorn Helgaas     2014-08-28  514  	pcie_bus_configure_settings(bus);
d06070509147c9 Shaohua Li        2010-02-25  515  	acpiphp_set_acpi_region(slot);
69643e4829c5cd Ian Campbell      2011-05-11  516  
69643e4829c5cd Ian Campbell      2011-05-11  517  	list_for_each_entry(dev, &bus->devices, bus_list) {
69643e4829c5cd Ian Campbell      2011-05-11  518  		/* Assume that newly added devices are powered on already. */
44bda4b7d26e9f Hari Vyas         2018-07-03  519  		if (!pci_dev_is_added(dev))
69643e4829c5cd Ian Campbell      2011-05-11  520  			dev->current_state = PCI_D0;
69643e4829c5cd Ian Campbell      2011-05-11  521  	}
69643e4829c5cd Ian Campbell      2011-05-11  522  
42f49a6ae5dca9 Rajesh Shah       2005-04-28  523  	pci_bus_add_devices(bus);
42f49a6ae5dca9 Rajesh Shah       2005-04-28  524  
f382a086f3129e Amos Kong         2011-11-25  525  	slot->flags |= SLOT_ENABLED;
58c08628c4fe66 Alex Chiang       2009-10-26  526  	list_for_each_entry(func, &slot->funcs, sibling) {
9d911d7903926a Alex Chiang       2009-05-21  527  		dev = pci_get_slot(bus, PCI_DEVFN(slot->device,
^1da177e4c3f41 Linus Torvalds    2005-04-16  528  						  func->function));
f382a086f3129e Amos Kong         2011-11-25  529  		if (!dev) {
f382a086f3129e Amos Kong         2011-11-25  530  			/* Do not set SLOT_ENABLED flag if some funcs
f382a086f3129e Amos Kong         2011-11-25  531  			   are not added. */
9337a493623d59 Mika Westerberg   2018-05-24  532  			slot->flags &= ~SLOT_ENABLED;
551bcb75b3d9f2 MUNEDA Takahiro   2006-03-22  533  			continue;
f382a086f3129e Amos Kong         2011-11-25  534  		}
3bbfd319034ddc Feilong Lin       2021-03-25  535  		pci_dev_put(dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  536  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  537  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  538  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--Q68bSM7Ycu6FN28Q
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Q68bSM7Ycu6FN28Q--
