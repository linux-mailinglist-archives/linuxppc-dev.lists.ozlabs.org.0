Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 391934021A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 02:27:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3R171Gnlz307x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 10:27:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3R0c3RyJz2xtY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 10:26:55 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="220089107"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; 
 d="gz'50?scan'50,208,50";a="220089107"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 17:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; 
 d="gz'50?scan'50,208,50";a="523524041"
Received: from lkp-server01.sh.intel.com (HELO 53c23d017ad5) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2021 17:25:48 -0700
Received: from kbuild by 53c23d017ad5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mNOvr-0001FX-DQ; Tue, 07 Sep 2021 00:25:47 +0000
Date: Tue, 7 Sep 2021 08:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 3/5] PCI: Move pci_dev_is/assign_added() to pci.h
Message-ID: <202109070818.aHlo0OT9-lkp@intel.com>
References: <20210906094927.524106-4-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
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
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Linas Vepstas <linasvepstas@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--UugvWAfsgieZRqgk
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
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/404ed8c00a612e7ae31c50557c80c6726c464863
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Niklas-Schnelle/s390-pci-automatic-error-recovery/20210906-175309
        git checkout 404ed8c00a612e7ae31c50557c80c6726c464863
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/hotplug/acpiphp_glue.c: In function 'acpiphp_add_context':
>> drivers/pci/hotplug/acpiphp_glue.c:330:6: error: implicit declaration of function 'pci_bus_read_dev_vendor_id' [-Werror=implicit-function-declaration]
     330 |  if (pci_bus_read_dev_vendor_id(pbus, PCI_DEVFN(device, function),
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/acpiphp_glue.c: In function 'enable_slot':
>> drivers/pci/hotplug/acpiphp_glue.c:505:6: error: implicit declaration of function '__pci_bus_size_bridges'; did you mean 'pci_bus_size_bridges'? [-Werror=implicit-function-declaration]
     505 |      __pci_bus_size_bridges(dev->subordinate,
         |      ^~~~~~~~~~~~~~~~~~~~~~
         |      pci_bus_size_bridges
>> drivers/pci/hotplug/acpiphp_glue.c:510:3: error: implicit declaration of function '__pci_bus_assign_resources'; did you mean 'pci_bus_assign_resources'? [-Werror=implicit-function-declaration]
     510 |   __pci_bus_assign_resources(bus, &add_list, NULL);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |   pci_bus_assign_resources
   drivers/pci/hotplug/acpiphp_glue.c: In function 'trim_stale_devices':
>> drivers/pci/hotplug/acpiphp_glue.c:660:3: error: implicit declaration of function 'pci_dev_set_disconnected' [-Werror=implicit-function-declaration]
     660 |   pci_dev_set_disconnected(dev, NULL);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/hotplug/acpiphp_glue.c:661:7: error: implicit declaration of function 'pci_has_subordinate' [-Werror=implicit-function-declaration]
     661 |   if (pci_has_subordinate(dev))
         |       ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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

--UugvWAfsgieZRqgk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--UugvWAfsgieZRqgk--
