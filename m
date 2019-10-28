Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE3EE6ADE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 03:37:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471f4w62MpzDqkm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 13:37:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471f2v1zNQzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 13:35:33 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 19:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,238,1569308400"; d="scan'208";a="374110679"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 27 Oct 2019 19:35:21 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iOusL-0009eV-6D; Mon, 28 Oct 2019 10:35:21 +0800
Date: Mon, 28 Oct 2019 10:34:55 +0800
From: kbuild test robot <lkp@intel.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH 04/10] powerpc: Map & release OpenCAPI LPC memory
Message-ID: <201910281039.Oh0NAyNk%lkp@intel.com>
References: <20191025044721.16617-5-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025044721.16617-5-alastair@au1.ibm.com>
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Wei Yang <richard.weiyang@gmail.com>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Qian Cai <cai@lca.pw>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>,
 David Gibson <david@gibson.dropbear.id.au>, kbuild-all@lists.01.org,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alastair,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on v5.4-rc5]
[cannot apply to next-20191025]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Alastair-D-Silva/Add-support-for-OpenCAPI-SCM-devices/20191028-043750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git da80d2e516eb858eb5bcca7fa5f5a13ed86930e4
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/lightnvm.h:461:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:454:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:453:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:452:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:490:55: sparse: sparse: invalid access past the end of 'l' (4 8)
   include/linux/lightnvm.h:483:55: sparse: sparse: invalid access past the end of 'l' (4 8)
   include/linux/lightnvm.h:482:54: sparse: sparse: invalid access past the end of 'l' (4 8)
   include/linux/lightnvm.h:481:53: sparse: sparse: invalid access past the end of 'l' (4 8)
   drivers/lightnvm/core.c:704:36: sparse: sparse: invalid access past the end of 'ppa' (4 8)
   include/linux/lightnvm.h:461:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:454:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:453:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:452:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   drivers/lightnvm/core.c:929:36: sparse: sparse: invalid access past the end of 'ppa' (4 8)
   drivers/lightnvm/core.c:928:36: sparse: sparse: invalid access past the end of 'ppa' (4 8)
   drivers/lightnvm/core.c:898:35: sparse: sparse: invalid access past the end of 'ppa' (4 8)
   drivers/lightnvm/core.c:897:34: sparse: sparse: invalid access past the end of 'ppa' (4 8)
   include/linux/lightnvm.h:461:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:454:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:453:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:452:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:461:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:454:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:453:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:452:35: sparse: sparse: invalid access past the end of 'r' (4 8)
   include/linux/lightnvm.h:490:55: sparse: sparse: invalid access past the end of 'l' (4 8)
   include/linux/lightnvm.h:483:55: sparse: sparse: invalid access past the end of 'l' (4 8)
   include/linux/lightnvm.h:482:54: sparse: sparse: invalid access past the end of 'l' (4 8)
   include/linux/lightnvm.h:481:53: sparse: sparse: invalid access past the end of 'l' (4 8)
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/pnp/support.c:42:14: sparse: sparse: cast to restricted __be32
   drivers/pnp/support.c:42:14: sparse: sparse: cast to restricted __be32
   drivers/pnp/support.c:42:14: sparse: sparse: cast to restricted __be32
   drivers/pnp/support.c:42:14: sparse: sparse: cast to restricted __be32
   drivers/pnp/support.c:42:14: sparse: sparse: cast to restricted __be32
   drivers/pnp/support.c:42:14: sparse: sparse: cast to restricted __be32
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/osl.c:373:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/acpi/osl.c:698:1: sparse: sparse: context imbalance in 'acpi_os_read_memory' - wrong count at exit
   drivers/acpi/osl.c:731:1: sparse: sparse: context imbalance in 'acpi_os_write_memory' - wrong count at exit
   drivers/acpi/osl.c:1594:16: sparse: sparse: context imbalance in 'acpi_os_acquire_lock' - wrong count at exit
   drivers/acpi/osl.c:1605:6: sparse: sparse: context imbalance in 'acpi_os_release_lock' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/nvs.c:138:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> *addr @@    got n:2> *addr @@
   drivers/acpi/nvs.c:138:54: sparse:    expected void volatile [noderef] <asn:2> *addr
   drivers/acpi/nvs.c:138:54: sparse:    got void *kaddr
   drivers/acpi/nvs.c:141:66: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> *virt @@    got n:2> *virt @@
   drivers/acpi/nvs.c:141:66: sparse:    expected void [noderef] <asn:2> *virt
   drivers/acpi/nvs.c:141:66: sparse:    got void *kaddr
   drivers/acpi/nvs.c:180:38: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected void *kaddr @@    got void [noderef] <asvoid *kaddr @@
   drivers/acpi/nvs.c:180:38: sparse:    expected void *kaddr
   drivers/acpi/nvs.c:180:38: sparse:    got void [noderef] <asn:2> *
   drivers/acpi/nvs.c:182:46: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected void *kaddr @@    got void [noderef] <asvoid *kaddr @@
   drivers/acpi/nvs.c:182:46: sparse:    expected void *kaddr
   drivers/acpi/nvs.c:182:46: sparse:    got void [noderef] <asn:2> *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/sleep.c:538:46: sparse: sparse: restricted suspend_state_t degrades to integer
   drivers/acpi/sleep.c:640:50: sparse: sparse: restricted suspend_state_t degrades to integer
   drivers/acpi/sleep.c:925:13: sparse: sparse: restricted suspend_state_t degrades to integer
   drivers/acpi/sleep.c:925:33: sparse: sparse: restricted suspend_state_t degrades to integer
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/bus.c:37:20: sparse: sparse: symbol 'acpi_root' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/sysfs.c:446:14: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected void [noderef] <asn:2> *base @@    got n:2> *base @@
   drivers/acpi/sysfs.c:446:14: sparse:    expected void [noderef] <asn:2> *base
   drivers/acpi/sysfs.c:446:14: sparse:    got void *
   drivers/acpi/sysfs.c:449:59: sparse: sparse: incorrect type in argument 4 (different address spaces) @@    expected void const *from @@    got void [noderevoid const *from @@
   drivers/acpi/sysfs.c:449:59: sparse:    expected void const *from
   drivers/acpi/sysfs.c:449:59: sparse:    got void [noderef] <asn:2> *base
   drivers/acpi/sysfs.c:451:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *logical_address @@    got void [noderef] <asvoid *logical_address @@
   drivers/acpi/sysfs.c:451:30: sparse:    expected void *logical_address
   drivers/acpi/sysfs.c:451:30: sparse:    got void [noderef] <asn:2> *base
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/processor_throttling.c:716:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:716:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:716:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:716:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:716:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:716:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:716:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:716:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:716:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:716:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:716:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:716:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:716:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:716:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:716:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:716:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:716:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:716:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:716:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:716:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:716:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:737:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:737:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:737:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:737:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:737:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:737:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:737:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:737:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:737:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:737:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:737:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:737:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:737:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:737:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:737:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:737:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:737:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:737:14: sparse:    got unsigned char *
   drivers/acpi/processor_throttling.c:737:14: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got eref] <asn:3> *__vpp_verify @@
   drivers/acpi/processor_throttling.c:737:14: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   drivers/acpi/processor_throttling.c:737:14: sparse:    got unsigned char *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/acpica/acpredef.h:186:34: sparse: sparse: symbol 'acpi_gbl_predefined_methods' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/acpi/acpixf.h:104:1: sparse: sparse: symbol 'acpi_gbl_enable_interpreter_slack' was not declared. Should it be static?
   include/acpi/acpixf.h:113:1: sparse: sparse: symbol 'acpi_gbl_auto_serialize_methods' was not declared. Should it be static?
   include/acpi/acpixf.h:120:1: sparse: sparse: symbol 'acpi_gbl_create_osi_method' was not declared. Should it be static?
   include/acpi/acpixf.h:126:1: sparse: sparse: symbol 'acpi_gbl_use_default_register_widths' was not declared. Should it be static?
   include/acpi/acpixf.h:136:1: sparse: sparse: symbol 'acpi_gbl_enable_table_validation' was not declared. Should it be static?
   include/acpi/acpixf.h:141:1: sparse: sparse: symbol 'acpi_gbl_enable_aml_debug_object' was not declared. Should it be static?
   include/acpi/acpixf.h:149:1: sparse: sparse: symbol 'acpi_gbl_copy_dsdt_locally' was not declared. Should it be static?
   include/acpi/acpixf.h:157:1: sparse: sparse: symbol 'acpi_gbl_do_not_use_xsdt' was not declared. Should it be static?
   include/acpi/acpixf.h:167:1: sparse: sparse: symbol 'acpi_gbl_use32_bit_fadt_addresses' was not declared. Should it be static?
   include/acpi/acpixf.h:176:1: sparse: sparse: symbol 'acpi_gbl_use32_bit_facs_addresses' was not declared. Should it be static?
   include/acpi/acpixf.h:184:1: sparse: sparse: symbol 'acpi_gbl_truncate_io_addresses' was not declared. Should it be static?
   include/acpi/acpixf.h:190:1: sparse: sparse: symbol 'acpi_gbl_disable_auto_repair' was not declared. Should it be static?
   include/acpi/acpixf.h:196:1: sparse: sparse: symbol 'acpi_gbl_disable_ssdt_table_install' was not declared. Should it be static?
   include/acpi/acpixf.h:201:1: sparse: sparse: symbol 'acpi_gbl_runtime_namespace_override' was not declared. Should it be static?
   include/acpi/acpixf.h:207:1: sparse: sparse: symbol 'acpi_gbl_osi_data' was not declared. Should it be static?
   include/acpi/acpixf.h:214:1: sparse: sparse: symbol 'acpi_gbl_reduced_hardware' was not declared. Should it be static?
   include/acpi/acpixf.h:221:1: sparse: sparse: symbol 'acpi_gbl_max_loop_iterations' was not declared. Should it be static?
   include/acpi/acpixf.h:231:1: sparse: sparse: symbol 'acpi_gbl_ignore_package_resolution_errors' was not declared. Should it be static?
   include/acpi/acpixf.h:237:1: sparse: sparse: symbol 'acpi_gbl_trace_flags' was not declared. Should it be static?
   include/acpi/acpixf.h:238:1: sparse: sparse: symbol 'acpi_gbl_trace_method_name' was not declared. Should it be static?
   include/acpi/acpixf.h:239:1: sparse: sparse: symbol 'acpi_gbl_trace_dbg_level' was not declared. Should it be static?
   include/acpi/acpixf.h:240:1: sparse: sparse: symbol 'acpi_gbl_trace_dbg_layer' was not declared. Should it be static?
   include/acpi/acpixf.h:247:1: sparse: sparse: symbol 'acpi_dbg_level' was not declared. Should it be static?
   include/acpi/acpixf.h:248:1: sparse: sparse: symbol 'acpi_dbg_layer' was not declared. Should it be static?
   include/acpi/acpixf.h:252:1: sparse: sparse: symbol 'acpi_gbl_display_debug_timer' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:27:1: sparse: sparse: symbol 'acpi_gbl_dsdt_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:28:1: sparse: sparse: symbol 'acpi_gbl_facs_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:29:1: sparse: sparse: symbol 'acpi_gbl_xfacs_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:30:1: sparse: sparse: symbol 'acpi_gbl_fadt_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:114:1: sparse: sparse: symbol 'acpi_gbl_early_initialization' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:134:1: sparse: sparse: symbol 'acpi_gbl_namespace_initialized' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:206:1: sparse: sparse: symbol 'acpi_gbl_current_scope' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:210:1: sparse: sparse: symbol 'acpi_gbl_capture_comments' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:211:1: sparse: sparse: symbol 'acpi_gbl_last_list_head' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:267:1: sparse: sparse: symbol 'acpi_gbl_db_output_flags' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/acpi/acpica/exfield.c:25:10: sparse: sparse: symbol 'acpi_protocol_lengths' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/tty/vt/vt.c:232:5: sparse: sparse: symbol 'console_blank_hook' was not declared. Should it be static?
   drivers/tty/vt/vt.c:2875:19: sparse: sparse: symbol 'console_driver' was not declared. Should it be static?
   drivers/tty/vt/vt.c:2916:13: sparse: sparse: context imbalance in 'vt_console_print' - wrong count at exit
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/power/main.c:130:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:130:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:131:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:132:62: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:130:55: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:156:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:156:46: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:157:54: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:156:67: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:176:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:176:36: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:182:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:182:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:182:39: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:182:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:559:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:559:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:560:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:561:57: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:559:55: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:588:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:588:46: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:589:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:588:67: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:609:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:609:36: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:615:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:615:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:683:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:683:36: sparse: sparse: restricted suspend_state_t degrades to integer
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/power/suspend.c:90:54: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:90:54: sparse:    expected int val
   kernel/power/suspend.c:90:54: sparse:    got restricted suspend_state_t [usertype]
   kernel/power/suspend.c:117:54: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:117:54: sparse:    expected int val
   kernel/power/suspend.c:117:54: sparse:    got restricted suspend_state_t [usertype]
   kernel/power/suspend.c:174:19: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:174:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:175:19: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:175:51: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:180:26: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:180:65: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:187:42: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:187:51: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:188:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:189:51: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:187:72: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:209:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:209:73: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:210:27: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:210:59: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:215:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:215:69: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:216:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:216:42: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:438:33: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:438:33: sparse:    expected int val
   kernel/power/suspend.c:438:33: sparse:    got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:441:33: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:441:33: sparse:    expected int val
   kernel/power/suspend.c:441:33: sparse:    got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:511:53: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:511:53: sparse:    expected int val
   kernel/power/suspend.c:511:53: sparse:    got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:513:53: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:513:53: sparse:    expected int val
   kernel/power/suspend.c:513:53: sparse:    got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:550:52: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:550:52: sparse:    expected int val
   kernel/power/suspend.c:550:52: sparse:    got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:573:9: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:582:52: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int val @@    got restricted suspend_state_t [usertyint val @@
   kernel/power/suspend.c:582:52: sparse:    expected int val
   kernel/power/suspend.c:582:52: sparse:    got restricted suspend_state_t [usertype] state
   kernel/power/suspend.c:583:9: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:608:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:608:22: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:608:39: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:608:48: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/suspend.c:611:9: sparse: sparse: restricted suspend_state_t degrades to integer
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/base/core.c:63:5: sparse: sparse: context imbalance in 'device_links_read_lock' - wrong count at exit
   include/linux/srcu.h:181:9: sparse: sparse: context imbalance in 'device_links_read_unlock' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/base/devres.c:1114:9: sparse: sparse: cast removes address space '<asn:3>' of expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/base/power/wakeup.c:1039:13: sparse: sparse: context imbalance in 'wakeup_sources_stats_seq_start' - wrong count at exit
   include/linux/srcu.h:181:9: sparse: sparse: context imbalance in 'wakeup_sources_stats_seq_stop' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/char/random.c:930:12: sparse: sparse: context imbalance in 'crng_fast_load' - wrong count at exit
   drivers/char/random.c:970:12: sparse: sparse: context imbalance in 'crng_slow_load' - wrong count at exit
   drivers/char/random.c:1309:6: sparse: sparse: context imbalance in 'add_interrupt_randomness' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   lib/radix-tree.c:275:36: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node *nodes @@    got struct xa_node [nostruct xa_node *nodes @@
   lib/radix-tree.c:275:36: sparse:    expected struct xa_node *nodes
   lib/radix-tree.c:275:36: sparse:    got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:293:29: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node [noderef] <asn:4> *parent @@    got deref] <asn:4> *parent @@
   lib/radix-tree.c:293:29: sparse:    expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:293:29: sparse:    got struct xa_node *parent
   lib/radix-tree.c:353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node [noderef] <asn:4> *parent @@    got deref] <asn:4> *parent @@
   lib/radix-tree.c:353:38: sparse:    expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:353:38: sparse:    got struct xa_node *nodes
   lib/radix-tree.c:455:54: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node [noderef] <asn:4> *parent @@    got deref] <asn:4> *parent @@
   lib/radix-tree.c:455:54: sparse:    expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:455:54: sparse:    got struct xa_node *node
   lib/radix-tree.c:567:24: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node *parent @@    got struct xa_node [nostruct xa_node *parent @@
   lib/radix-tree.c:567:24: sparse:    expected struct xa_node *parent
   lib/radix-tree.c:567:24: sparse:    got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:681:31: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node *[assigned] child @@    got struct struct xa_node *[assigned] child @@
   lib/radix-tree.c:681:31: sparse:    expected struct xa_node *[assigned] child
   lib/radix-tree.c:681:31: sparse:    got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:955:22: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node *node @@    got struct xa_node [nostruct xa_node *node @@
   lib/radix-tree.c:955:22: sparse:    expected struct xa_node *node
   lib/radix-tree.c:955:22: sparse:    got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1015:22: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node *node @@    got struct xa_node [nostruct xa_node *node @@
   lib/radix-tree.c:1015:22: sparse:    expected struct xa_node *node
   lib/radix-tree.c:1015:22: sparse:    got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1536:38: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node *[assigned] node @@    got struct struct xa_node *[assigned] node @@
   lib/radix-tree.c:1536:38: sparse:    expected struct xa_node *[assigned] node
   lib/radix-tree.c:1536:38: sparse:    got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1596:28: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct xa_node *nodes @@    got struct xa_node [nostruct xa_node *nodes @@
   lib/radix-tree.c:1596:28: sparse:    expected struct xa_node *nodes
   lib/radix-tree.c:1596:28: sparse:    got struct xa_node [noderef] <asn:4> *parent
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   lib/string.c:1093:6: sparse: sparse: symbol 'fortify_panic' redeclared with different type (originally declared at include/linux/string.h:265) - different modifiers
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   lib/vsprintf.c:1865:23: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned long [assigned] flags @@    got resunsigned long [assigned] flags @@
   lib/vsprintf.c:1865:23: sparse:    expected unsigned long [assigned] flags
   lib/vsprintf.c:1865:23: sparse:    got restricted gfp_t [usertype]
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   lib/bitmap.c:62:6: sparse: sparse: symbol '__bitmap_or_equal' redeclared with different type (originally declared at include/linux/bitmap.h:123) - different modifiers
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   lib/generic-radix-tree.c:56:35: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct genradix_root *r @@    got struct genradix_rostruct genradix_root *r @@
   lib/generic-radix-tree.c:56:35: sparse:    expected struct genradix_root *r
   lib/generic-radix-tree.c:56:35: sparse:    got struct genradix_root [noderef] <asn:4> *__val
   lib/generic-radix-tree.c:107:35: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct genradix_root *v @@    got struct genradix_rostruct genradix_root *v @@
   lib/generic-radix-tree.c:107:35: sparse:    expected struct genradix_root *v
   lib/generic-radix-tree.c:107:35: sparse:    got struct genradix_root [noderef] <asn:4> *__val
   lib/generic-radix-tree.c:131:26: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct genradix_root [noderef] <asn:4> *__old @@    got ot [noderef] <asn:4> *__old @@
   lib/generic-radix-tree.c:131:26: sparse:    expected struct genradix_root [noderef] <asn:4> *__old
   lib/generic-radix-tree.c:131:26: sparse:    got struct genradix_root *r
   lib/generic-radix-tree.c:131:26: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct genradix_root [noderef] <asn:4> *__new @@    got genradix_root [noderef] <asn:4> *__new @@
   lib/generic-radix-tree.c:131:26: sparse:    expected struct genradix_root [noderef] <asn:4> *__new
   lib/generic-radix-tree.c:131:26: sparse:    got struct genradix_root *[assigned] new_root
   lib/generic-radix-tree.c:131:24: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct genradix_root *v @@    got struct genradix_root [noderefstruct genradix_root *v @@
   lib/generic-radix-tree.c:131:24: sparse:    expected struct genradix_root *v
   lib/generic-radix-tree.c:131:24: sparse:    got struct genradix_root [noderef] <asn:4> *[assigned] __ret
   lib/generic-radix-tree.c:170:11: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct genradix_root *r @@    got struct genradix_rostruct genradix_root *r @@
   lib/generic-radix-tree.c:170:11: sparse:    expected struct genradix_root *r
   lib/generic-radix-tree.c:170:11: sparse:    got struct genradix_root [noderef] <asn:4> *__val
   lib/generic-radix-tree.c:232:35: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct genradix_root *r @@    got struct genradix_root [noderefstruct genradix_root *r @@
   lib/generic-radix-tree.c:232:35: sparse:    expected struct genradix_root *r
   lib/generic-radix-tree.c:232:35: sparse:    got struct genradix_root [noderef] <asn:4> *[assigned] __ret
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/notify/inotify/inotify_user.c:544:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct fsnotify_mark_connector *conn @@    got struct fsnotify_mastruct fsnotify_mark_connector *conn @@
   fs/notify/inotify/inotify_user.c:544:51: sparse:    expected struct fsnotify_mark_connector *conn
   fs/notify/inotify/inotify_user.c:544:51: sparse:    got struct fsnotify_mark_connector [noderef] <asn:4> *i_fsnotify_marks
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/printk/printk.c:421:1: sparse: sparse: symbol 'log_wait' was not declared. Should it be static?
   kernel/printk/printk.c:2950:23: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected int [noderef] <asn:3> *__p @@    got :3> *__p @@
   kernel/printk/printk.c:2950:23: sparse:    expected int [noderef] <asn:3> *__p
   kernel/printk/printk.c:2950:23: sparse:    got int *
   kernel/printk/printk.c:2950:23: sparse: sparse: dereference of noderef expression
   kernel/printk/printk.c:2950:23: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/lib/iomem.c:39:23: sparse: sparse: cast removes address space '<asn:2>' of expression
   arch/x86/lib/iomem.c:57:19: sparse: sparse: cast removes address space '<asn:2>' of expression
   arch/x86/lib/iomem.c:67:9: sparse: sparse: cast removes address space '<asn:2>' of expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   security/commoncap.c:439:31: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] magic @@    got e] magic @@
   security/commoncap.c:439:31: sparse:    expected restricted __le32 [usertype] magic
   security/commoncap.c:439:31: sparse:    got int
   security/commoncap.c:440:33: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] nsmagic @@    got icted __le32 [usertype] nsmagic @@
   security/commoncap.c:440:33: sparse:    expected restricted __le32 [usertype] nsmagic
   security/commoncap.c:440:33: sparse:    got unsigned int [usertype]
   security/commoncap.c:441:29: sparse: sparse: restricted __le32 degrades to integer
   security/commoncap.c:442:39: sparse: sparse: invalid assignment: |=
   security/commoncap.c:442:39: sparse:    left side has type restricted __le32
   security/commoncap.c:442:39: sparse:    right side has type int
   security/commoncap.c:444:42: sparse: sparse: cast from restricted __le32
   security/commoncap.c:1260:41: sparse: sparse: dubious: !x | y
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/sched/core.c:4049:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4049:17: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:4049:17: sparse:    struct task_struct *
   kernel/sched/core.c:6047:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6047:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/core.c:6047:9: sparse:    struct task_struct *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/sched/cputime.c:316:17: sparse: sparse: context imbalance in 'thread_group_cputime' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/sched/fair.c:5073:35: sparse: sparse: marked inline, but without a definition
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/sched/membarrier.c:108:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/membarrier.c:108:21: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/membarrier.c:108:21: sparse:    struct task_struct *
   kernel/sched/membarrier.c:177:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/membarrier.c:177:21: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/membarrier.c:177:21: sparse:    struct task_struct *
   kernel/sched/membarrier.c:243:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/membarrier.c:243:21: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/sched/membarrier.c:243:21: sparse:    struct task_struct *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/time/posix-timers.c:588:24: sparse: sparse: context imbalance in '__lock_timer' - different lock contexts for basic block
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'timer_wait_running' - unexpected unlock
   kernel/time/posix-timers.c:876:12: sparse: sparse: context imbalance in 'do_timer_settime' - different lock contexts for basic block
   kernel/time/posix-timers.c:982:1: sparse: sparse: context imbalance in '__se_sys_timer_delete' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   drivers/firmware/dmi_scan.c:635:27: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected char [noderef] <asn:2> *p @@    got n:2> *p @@
   drivers/firmware/dmi_scan.c:635:27: sparse:    expected char [noderef] <asn:2> *p
   drivers/firmware/dmi_scan.c:635:27: sparse:    got void *
   drivers/firmware/dmi_scan.c:639:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *addr @@    got char [noderef] <asvoid *addr @@
   drivers/firmware/dmi_scan.c:639:41: sparse:    expected void *addr
   drivers/firmware/dmi_scan.c:639:41: sparse:    got char [noderef] <asn:2> *p
   drivers/firmware/dmi_scan.c:653:19: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected char [noderef] <asn:2> *p @@    got n:2> *p @@
   drivers/firmware/dmi_scan.c:653:19: sparse:    expected char [noderef] <asn:2> *p
   drivers/firmware/dmi_scan.c:653:19: sparse:    got void *
   drivers/firmware/dmi_scan.c:657:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *addr @@    got char [noderef] <asvoid *addr @@
   drivers/firmware/dmi_scan.c:657:33: sparse:    expected void *addr
   drivers/firmware/dmi_scan.c:657:33: sparse:    got char [noderef] <asn:2> *p
   drivers/firmware/dmi_scan.c:664:19: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected char [noderef] <asn:2> *p @@    got n:2> *p @@
   drivers/firmware/dmi_scan.c:664:19: sparse:    expected char [noderef] <asn:2> *p
   drivers/firmware/dmi_scan.c:664:19: sparse:    got void *
   drivers/firmware/dmi_scan.c:677:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *addr @@    got char [noderef] <asvoid *addr @@
   drivers/firmware/dmi_scan.c:677:49: sparse:    expected void *addr
   drivers/firmware/dmi_scan.c:677:49: sparse:    got char [noderef] <asn:2> *p
   drivers/firmware/dmi_scan.c:695:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *addr @@    got char [noderef] <asvoid *addr @@
   drivers/firmware/dmi_scan.c:695:49: sparse:    expected void *addr
   drivers/firmware/dmi_scan.c:695:49: sparse:    got char [noderef] <asn:2> *p
   drivers/firmware/dmi_scan.c:700:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *addr @@    got char [noderef] <asvoid *addr @@
   drivers/firmware/dmi_scan.c:700:33: sparse:    expected void *addr
   drivers/firmware/dmi_scan.c:700:33: sparse:    got char [noderef] <asn:2> *p
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   block/blk-ioc.c:108:28: sparse: sparse: context imbalance in 'ioc_release_fn' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   init/do_mounts.c:389:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected char const [noderef] <asn:1> *dev_name @@    got n:1> *dev_name @@
   init/do_mounts.c:389:30: sparse:    expected char const [noderef] <asn:1> *dev_name
   init/do_mounts.c:389:30: sparse:    got char *name
   init/do_mounts.c:389:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected char const [noderef] <asn:1> *dir_name @@    got n:1> *dir_name @@
   init/do_mounts.c:389:36: sparse:    expected char const [noderef] <asn:1> *dir_name
   init/do_mounts.c:389:36: sparse:    got char *
   init/do_mounts.c:389:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected char const [noderef] <asn:1> *type @@    got n:1> *type @@
   init/do_mounts.c:389:45: sparse:    expected char const [noderef] <asn:1> *type
   init/do_mounts.c:389:45: sparse:    got char *fs
   init/do_mounts.c:389:56: sparse: sparse: incorrect type in argument 5 (different address spaces) @@    expected void [noderef] <asn:1> *data @@    got n:1> *data @@
   init/do_mounts.c:389:56: sparse:    expected void [noderef] <asn:1> *data
   init/do_mounts.c:389:56: sparse:    got void *data
   init/do_mounts.c:393:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected char const [noderef] <asn:1> *filename @@    got n:1> *filename @@
   init/do_mounts.c:393:20: sparse:    expected char const [noderef] <asn:1> *filename
   init/do_mounts.c:393:20: sparse:    got char *
   init/do_mounts.h:19:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected char const [noderef] <asn:1> *pathname @@    got n:1> *pathname @@
   init/do_mounts.h:19:21: sparse:    expected char const [noderef] <asn:1> *pathname
   init/do_mounts.h:19:21: sparse:    got char *name
   init/do_mounts.h:20:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected char const [noderef] <asn:1> *filename @@    got n:1> *filename @@
   init/do_mounts.h:20:27: sparse:    expected char const [noderef] <asn:1> *filename
   init/do_mounts.h:20:27: sparse:    got char *name
   init/do_mounts.c:625:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected char const [noderef] <asn:1> *dev_name @@    got n:1> *dev_name @@
   init/do_mounts.c:625:20: sparse:    expected char const [noderef] <asn:1> *dev_name
   init/do_mounts.c:625:20: sparse:    got char *
   init/do_mounts.c:625:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected char const [noderef] <asn:1> *dir_name @@    got n:1> *dir_name @@
   init/do_mounts.c:625:25: sparse:    expected char const [noderef] <asn:1> *dir_name
   init/do_mounts.c:625:25: sparse:    got char *
   init/do_mounts.c:626:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected char const [noderef] <asn:1> *filename @@    got n:1> *filename @@
   init/do_mounts.c:626:21: sparse:    expected char const [noderef] <asn:1> *filename
   init/do_mounts.c:626:21: sparse:    got char *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   init/init_task.c:97:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct task_struct [noderef] <asn:4> *real_parent @@    got  [noderef] <asn:4> *real_parent @@
   init/init_task.c:97:28: sparse:    expected struct task_struct [noderef] <asn:4> *real_parent
   init/init_task.c:97:28: sparse:    got struct task_struct *
   init/init_task.c:98:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct task_struct [noderef] <asn:4> *parent @@    got  [noderef] <asn:4> *parent @@
   init/init_task.c:98:28: sparse:    expected struct task_struct [noderef] <asn:4> *parent
   init/init_task.c:98:28: sparse:    got struct task_struct *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/sysctl.c:2048:26: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sysctl.c:2048:26: sparse: sparse: non size-preserving integer to pointer cast
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/ptrace.c:53:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:53:22: sparse:    struct task_struct *
   kernel/ptrace.c:53:22: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/ptrace.c:72:23: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct [noderef] <asn:4> *parent @@    got  [noderef] <asn:4> *parent @@
   kernel/ptrace.c:72:23: sparse:    expected struct task_struct [noderef] <asn:4> *parent
   kernel/ptrace.c:72:23: sparse:    got struct task_struct *new_parent
   kernel/ptrace.c:73:29: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct cred const [noderef] <asn:4> *ptracer_cred @@    got [noderef] <asn:4> *ptracer_cred @@
   kernel/ptrace.c:73:29: sparse:    expected struct cred const [noderef] <asn:4> *ptracer_cred
   kernel/ptrace.c:73:29: sparse:    got struct cred const *
   kernel/ptrace.c:127:18: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct cred const *old_cred @@    got struct cred const struct cred const *old_cred @@
   kernel/ptrace.c:127:18: sparse:    expected struct cred const *old_cred
   kernel/ptrace.c:127:18: sparse:    got struct cred const [noderef] <asn:4> *ptracer_cred
   kernel/ptrace.c:196:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:196:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/ptrace.c:196:9: sparse:    struct task_struct *
   kernel/ptrace.c:241:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:241:44: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/ptrace.c:241:44: sparse:    struct task_struct *
   kernel/ptrace.c:475:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *parent @@    got struct task_structstruct task_struct *parent @@
   kernel/ptrace.c:475:54: sparse:    expected struct task_struct *parent
   kernel/ptrace.c:475:54: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/ptrace.c:483:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *new_parent @@    got struct task_structstruct task_struct *new_parent @@
   kernel/ptrace.c:483:53: sparse:    expected struct task_struct *new_parent
   kernel/ptrace.c:483:53: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/ptrace.c:531:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *p1 @@    got struct task_structstruct task_struct *p1 @@
   kernel/ptrace.c:531:41: sparse:    expected struct task_struct *p1
   kernel/ptrace.c:531:41: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/ptrace.c:481:38: sparse: sparse: dereference of noderef expression
   kernel/ptrace.c:682:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   kernel/ptrace.c:698:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   kernel/ptrace.c:854:9: sparse: sparse: context imbalance in 'ptrace_resume' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/user.c:85:19: sparse: sparse: symbol 'uidhash_table' was not declared. Should it be static?
   kernel/user.c:172:17: sparse: sparse: context imbalance in 'free_uid' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/signal.c:1251:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:1> * @@    got eref] <asn:1> * @@
   kernel/signal.c:1251:29: sparse:    expected void const volatile [noderef] <asn:1> *
   kernel/signal.c:1251:29: sparse:    got unsigned char *
   kernel/signal.c:1370:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/signal.c:1370:27: sparse:    struct sighand_struct [noderef] <asn:4> *
   kernel/signal.c:1370:27: sparse:    struct sighand_struct *
   kernel/signal.c:1948:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *tsk @@    got struct task_structstruct task_struct *tsk @@
   kernel/signal.c:1948:65: sparse:    expected struct task_struct *tsk
   kernel/signal.c:1948:65: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile *p @@    got struct cred const [noderef] <asn:4>void const volatile *p @@
   kernel/signal.c:1949:40: sparse:    expected void const volatile *p
   kernel/signal.c:1949:40: sparse:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile *p @@    got struct cred const [noderef] <asn:4>void const volatile *p @@
   kernel/signal.c:1949:40: sparse:    expected void const volatile *p
   kernel/signal.c:1949:40: sparse:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:1992:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected struct task_struct *p @@    got struct task_structstruct task_struct *p @@
   kernel/signal.c:1992:54: sparse:    expected struct task_struct *p
   kernel/signal.c:1992:54: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:1993:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *parent @@    got struct task_structstruct task_struct *parent @@
   kernel/signal.c:1993:34: sparse:    expected struct task_struct *parent
   kernel/signal.c:1993:34: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2022:24: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct *parent @@    got struct task_structstruct task_struct *parent @@
   kernel/signal.c:2022:24: sparse:    expected struct task_struct *parent
   kernel/signal.c:2022:24: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2025:24: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct *parent @@    got struct task_structstruct task_struct *parent @@
   kernel/signal.c:2025:24: sparse:    expected struct task_struct *parent
   kernel/signal.c:2025:24: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *p1 @@    got struct task_structstruct task_struct *p1 @@
   include/linux/ptrace.h:99:40: sparse:    expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *p2 @@    got struct task_structstruct task_struct *p2 @@
   include/linux/ptrace.h:99:60: sparse:    expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2506:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *tsk @@    got struct task_structstruct task_struct *tsk @@
   kernel/signal.c:2506:52: sparse:    expected struct task_struct *tsk
   kernel/signal.c:2506:52: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile *p @@    got struct cred const [noderef] <asn:4>void const volatile *p @@
   kernel/signal.c:2508:49: sparse:    expected void const volatile *p
   kernel/signal.c:2508:49: sparse:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile *p @@    got struct cred const [noderef] <asn:4>void const volatile *p @@
   kernel/signal.c:2508:49: sparse:    expected void const volatile *p
   kernel/signal.c:2508:49: sparse:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *p1 @@    got struct task_structstruct task_struct *p1 @@
   include/linux/ptrace.h:99:40: sparse:    expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *p2 @@    got struct task_structstruct task_struct *p2 @@
   include/linux/ptrace.h:99:60: sparse:    expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:3676:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct siginfo const [noderef] [usertype] <asn:1> *from @@    got deref] [usertype] <asn:1> *from @@
   kernel/signal.c:3676:46: sparse:    expected struct siginfo const [noderef] [usertype] <asn:1> *from
   kernel/signal.c:3676:46: sparse:    got struct siginfo [usertype] *info
   kernel/signal.c:3736:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct siginfo [usertype] *info @@    got struct siginfo [nostruct siginfo [usertype] *info @@
   kernel/signal.c:3736:58: sparse:    expected struct siginfo [usertype] *info
   kernel/signal.c:3736:58: sparse:    got struct siginfo [noderef] [usertype] <asn:1> *info
   kernel/signal.c:1289:9: sparse: sparse: context imbalance in 'do_send_sig_info' - different lock contexts for basic block
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in '__lock_task_sighand' - different lock contexts for basic block
   include/linux/rcupdate.h:649:9: sparse: sparse: context imbalance in 'send_sigqueue' - wrong count at exit
   kernel/signal.c:1929:47: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1967:19: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2088:13: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2299:13: sparse: sparse: context imbalance in 'do_signal_stop' - different lock contexts for basic block
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2591:69: sparse: sparse: context imbalance in 'get_signal' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/sys.c:1035:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *p1 @@    got struct task_structstruct task_struct *p1 @@
   kernel/sys.c:1035:32: sparse:    expected struct task_struct *p1
   kernel/sys.c:1035:32: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/sys.c:1862:19: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct file [noderef] <asn:4> *__ret @@    got file [noderef] <asn:4> *__ret @@
   kernel/sys.c:1862:19: sparse:    expected struct file [noderef] <asn:4> *__ret
   kernel/sys.c:1862:19: sparse:    got struct file *[assigned] file
   kernel/sys.c:1862:17: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct file *old_exe @@    got struct file [noderef] <asn:4>struct file *old_exe @@
   kernel/sys.c:1862:17: sparse:    expected struct file *old_exe
   kernel/sys.c:1862:17: sparse:    got struct file [noderef] <asn:4> *[assigned] __ret
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/pid.c:375:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:375:23: sparse:    struct pid [noderef] <asn:4> *
   kernel/pid.c:375:23: sparse:    struct pid *
   kernel/pid.c:434:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:434:32: sparse:    struct pid [noderef] <asn:4> *
   kernel/pid.c:434:32: sparse:    struct pid *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/notifier.c:29:20: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:29:20: sparse:    expected struct notifier_block **nl
   kernel/notifier.c:29:20: sparse:    got struct notifier_block [noderef] <asn:4> **
   kernel/notifier.c:31:17: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct notifier_block [noderef] <asn:4> *next @@    got ock [noderef] <asn:4> *next @@
   kernel/notifier.c:31:17: sparse:    expected struct notifier_block [noderef] <asn:4> *next
   kernel/notifier.c:31:17: sparse:    got struct notifier_block *
   kernel/notifier.c:32:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/notifier.c:32:9: sparse:    struct notifier_block [noderef] <asn:4> *
   kernel/notifier.c:32:9: sparse:    struct notifier_block *
   kernel/notifier.c:44:20: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:44:20: sparse:    expected struct notifier_block **nl
   kernel/notifier.c:44:20: sparse:    got struct notifier_block [noderef] <asn:4> **
   kernel/notifier.c:46:17: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct notifier_block [noderef] <asn:4> *next @@    got ock [noderef] <asn:4> *next @@
   kernel/notifier.c:46:17: sparse:    expected struct notifier_block [noderef] <asn:4> *next
   kernel/notifier.c:46:17: sparse:    got struct notifier_block *
   kernel/notifier.c:47:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/notifier.c:47:9: sparse:    struct notifier_block [noderef] <asn:4> *
   kernel/notifier.c:47:9: sparse:    struct notifier_block *
   kernel/notifier.c:56:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/notifier.c:56:25: sparse:    struct notifier_block [noderef] <asn:4> *
   kernel/notifier.c:56:25: sparse:    struct notifier_block *
   kernel/notifier.c:130:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:152:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:185:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:226:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:229:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:252:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:279:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:282:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:319:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:352:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:369:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:396:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:434:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:437:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:464:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:467:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
   kernel/notifier.c:500:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct notifier_block **nl @@    got struct notifier_blstruct notifier_block **nl @@
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/cred.c:144:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:144:9: sparse:    struct cred *
   kernel/cred.c:144:9: sparse:    struct cred const [noderef] <asn:4> *
   kernel/cred.c:145:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:145:9: sparse:    struct cred *
   kernel/cred.c:145:9: sparse:    struct cred const [noderef] <asn:4> *
   kernel/cred.c:161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct atomic_t const [usertype] *v @@    got struct struct atomic_t const [usertype] *v @@
   kernel/cred.c:161:9: sparse:    expected struct atomic_t const [usertype] *v
   kernel/cred.c:161:9: sparse:    got struct atomic_t const [noderef] <asn:4> *
   kernel/cred.c:161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct cred const *cred @@    got struct cred const struct cred const *cred @@
   kernel/cred.c:161:9: sparse:    expected struct cred const *cred
   kernel/cred.c:161:9: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:165:17: sparse: sparse: cast removes address space '<asn:4>' of expression
   kernel/cred.c:171:17: sparse: sparse: cast removes address space '<asn:4>' of expression
   kernel/cred.c:264:13: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct cred const *old @@    got struct cred const struct cred const *old @@
   kernel/cred.c:264:13: sparse:    expected struct cred const *old
   kernel/cred.c:264:13: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:345:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct cred const *cred @@    got struct cred const struct cred const *cred @@
   kernel/cred.c:345:42: sparse:    expected struct cred const *cred
   kernel/cred.c:345:42: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:345:30: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct cred const [noderef] <asn:4> *real_cred @@    got [noderef] <asn:4> *real_cred @@
   kernel/cred.c:345:30: sparse:    expected struct cred const [noderef] <asn:4> *real_cred
   kernel/cred.c:345:30: sparse:    got struct cred const *
   kernel/cred.c:346:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct cred const *cred @@    got struct cred const struct cred const *cred @@
   kernel/cred.c:346:27: sparse:    expected struct cred const *cred
   kernel/cred.c:346:27: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:347:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct cred const *_cred @@    got struct cred const struct cred const *_cred @@
   kernel/cred.c:347:41: sparse:    expected struct cred const *_cred
   kernel/cred.c:347:41: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:348:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct atomic_t const [usertype] *v @@    got struct struct atomic_t const [usertype] *v @@
   kernel/cred.c:348:17: sparse:    expected struct atomic_t const [usertype] *v
   kernel/cred.c:348:17: sparse:    got struct atomic_t const [noderef] <asn:4> *
   kernel/cred.c:348:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct cred const *cred @@    got struct cred const struct cred const *cred @@
   kernel/cred.c:348:17: sparse:    expected struct cred const *cred
   kernel/cred.c:348:17: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:385:32: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct cred const [noderef] <asn:4> *real_cred @@    got [noderef] <asn:4> *real_cred @@
   kernel/cred.c:385:32: sparse:    expected struct cred const [noderef] <asn:4> *real_cred
   kernel/cred.c:385:32: sparse:    got struct cred const *
   kernel/cred.c:437:38: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct cred const *old @@    got struct cred const struct cred const *old @@
   kernel/cred.c:437:38: sparse:    expected struct cred const *old
   kernel/cred.c:437:38: sparse:    got struct cred const [noderef] <asn:4> *real_cred
   kernel/cred.c:443:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:443:9: sparse:    struct cred const [noderef] <asn:4> *
   kernel/cred.c:443:9: sparse:    struct cred const *
   kernel/cred.c:543:41: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct cred const *old @@    got struct cred const struct cred const *old @@
   kernel/cred.c:543:41: sparse:    expected struct cred const *old
   kernel/cred.c:543:41: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:584:46: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct cred const *override @@    got struct cred const struct cred const *override @@
   kernel/cred.c:584:46: sparse:    expected struct cred const *override
   kernel/cred.c:584:46: sparse:    got struct cred const [noderef] <asn:4> *cred
   kernel/cred.c:351:30: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/futex.c:1559:9: sparse: sparse: context imbalance in 'wake_futex_pi' - unexpected unlock
   kernel/futex.c:1719:33: sparse: sparse: context imbalance in 'futex_wake_op' - different lock contexts for basic block
   kernel/futex.c:2015:39: sparse: sparse: context imbalance in 'futex_requeue' - different lock contexts for basic block
   kernel/futex.c:2491:9: sparse: sparse: context imbalance in 'fixup_pi_state_owner' - unexpected unlock
   kernel/futex.c:2600:13: sparse: sparse: context imbalance in 'futex_wait_queue_me' - unexpected unlock
   kernel/futex.c:2702:1: sparse: sparse: context imbalance in 'futex_wait_setup' - different lock contexts for basic block
   kernel/futex.c:2981:12: sparse: sparse: context imbalance in 'futex_unlock_pi' - different lock contexts for basic block
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'futex_wait_requeue_pi' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/pid_namespace.c:56:76: sparse: sparse: Using plain integer as NULL pointer
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/iomem.c:113:22: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected void *[assigned] addr @@    got void [nvoid *[assigned] addr @@
   kernel/iomem.c:113:22: sparse:    expected void *[assigned] addr
   kernel/iomem.c:113:22: sparse:    got void [noderef] <asn:2> *
   kernel/iomem.c:116:22: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected void *[assigned] addr @@    got void [nvoid *[assigned] addr @@
   kernel/iomem.c:116:22: sparse:    expected void *[assigned] addr
   kernel/iomem.c:116:22: sparse:    got void [noderef] <asn:2> *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/fork.c:1512:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:1512:9: sparse:    struct sighand_struct [noderef] <asn:4> *
   kernel/fork.c:1512:9: sparse:    struct sighand_struct *
   kernel/fork.c:1735:17: sparse: sparse: incorrect type in initializer (different base types) @@    expected restricted __poll_t ( *poll )( ... ) @@    got ted __poll_t ( *poll )( ... ) @@
   kernel/fork.c:1735:17: sparse:    expected restricted __poll_t ( *poll )( ... )
   kernel/fork.c:1735:17: sparse:    got unsigned int ( * )( ... )
   kernel/fork.c:2146:32: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct [noderef] <asn:4> *real_parent @@    got  [noderef] <asn:4> *real_parent @@
   kernel/fork.c:2146:32: sparse:    expected struct task_struct [noderef] <asn:4> *real_parent
   kernel/fork.c:2146:32: sparse:    got struct task_struct *
   include/linux/ptrace.h:218:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *new_parent @@    got struct task_structstruct task_struct *new_parent @@
   include/linux/ptrace.h:218:45: sparse:    expected struct task_struct *new_parent
   include/linux/ptrace.h:218:45: sparse:    got struct task_struct [noderef] <asn:4> *parent
   include/linux/ptrace.h:218:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected struct cred const *ptracer_cred @@    got struct cred const struct cred const *ptracer_cred @@
   include/linux/ptrace.h:218:62: sparse:    expected struct cred const *ptracer_cred
   include/linux/ptrace.h:218:62: sparse:    got struct cred const [noderef] <asn:4> *ptracer_cred
   kernel/fork.c:2201:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct list_head *head @@    got struct list_head [struct list_head *head @@
   kernel/fork.c:2201:54: sparse:    expected struct list_head *head
   kernel/fork.c:2201:54: sparse:    got struct list_head [noderef] <asn:4> *
   kernel/fork.c:2639:24: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct *[assigned] parent @@    got struct struct task_struct *[assigned] parent @@
   kernel/fork.c:2639:24: sparse:    expected struct task_struct *[assigned] parent
   kernel/fork.c:2639:24: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/fork.c:1876:27: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1878:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2199:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2200:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2287:22: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/panic.c:167:6: sparse: sparse: symbol 'panic' redeclared with different type (originally declared at include/linux/kernel.h:322) - different modifiers
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/exit.c:100:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/exit.c:100:19: sparse:    struct sighand_struct [noderef] <asn:4> *
   kernel/exit.c:100:19: sparse:    struct sighand_struct *
   kernel/exit.c:278:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *tsk @@    got struct task_structstruct task_struct *tsk @@
   kernel/exit.c:278:37: sparse:    expected struct task_struct *tsk
   kernel/exit.c:278:37: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/exit.c:281:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *task @@    got struct task_structstruct task_struct *task @@
   kernel/exit.c:281:32: sparse:    expected struct task_struct *task
   kernel/exit.c:281:32: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/exit.c:282:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *task @@    got struct task_structstruct task_struct *task @@
   kernel/exit.c:282:35: sparse:    expected struct task_struct *task
   kernel/exit.c:282:35: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/exit.c:327:24: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct *parent @@    got struct task_structstruct task_struct *parent @@
   kernel/exit.c:327:24: sparse:    expected struct task_struct *parent
   kernel/exit.c:327:24: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/exit.c:562:29: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct *reaper @@    got struct task_structstruct task_struct *reaper @@
   kernel/exit.c:562:29: sparse:    expected struct task_struct *reaper
   kernel/exit.c:562:29: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/exit.c:564:29: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct *reaper @@    got struct task_structstruct task_struct *reaper @@
   kernel/exit.c:564:29: sparse:    expected struct task_struct *reaper
   kernel/exit.c:564:29: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   kernel/exit.c:626:40: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct task_struct [noderef] <asn:4> *real_parent @@    got task_struct [noderef] <asn:4> *real_parent @@
   kernel/exit.c:626:40: sparse:    expected struct task_struct [noderef] <asn:4> *real_parent
   kernel/exit.c:626:40: sparse:    got struct task_struct *[assigned] reaper
   kernel/exit.c:627:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/exit.c:627:25: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/exit.c:627:25: sparse:    struct task_struct *
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *p1 @@    got struct task_structstruct task_struct *p1 @@
   include/linux/ptrace.h:99:40: sparse:    expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *p2 @@    got struct task_structstruct task_struct *p2 @@
   include/linux/ptrace.h:99:60: sparse:    expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/exit.c:715:17: sparse: sparse: symbol 'do_exit' redeclared with different type (originally declared at include/linux/kernel.h:328) - different modifiers
   kernel/exit.c:879:6: sparse: sparse: symbol 'complete_and_exit' redeclared with different type (originally declared at include/linux/kernel.h:329) - different modifiers
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *p1 @@    got struct task_structstruct task_struct *p1 @@
   include/linux/ptrace.h:99:40: sparse:    expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *p2 @@    got struct task_structstruct task_struct *p2 @@
   include/linux/ptrace.h:99:60: sparse:    expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:    got struct task_struct [noderef] <asn:4> *parent
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *p1 @@    got struct task_structstruct task_struct *p1 @@
   include/linux/ptrace.h:99:40: sparse:    expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *p2 @@    got struct task_structstruct task_struct *p2 @@
   include/linux/ptrace.h:99:60: sparse:    expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:    got struct task_struct [noderef] <asn:4> *parent
   kernel/exit.c:1429:59: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/exit.c:1429:59: sparse:    void *
   kernel/exit.c:1429:59: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/exit.c:1732:13: sparse: sparse: symbol 'abort' was not declared. Should it be static?
   kernel/exit.c:1007:17: sparse: sparse: context imbalance in 'wait_task_zombie' - unexpected unlock
   kernel/exit.c:1199:24: sparse: sparse: context imbalance in 'wait_task_stopped' - unexpected unlock
   include/linux/uidgid.h:168:9: sparse: sparse: context imbalance in 'wait_task_continued' - unexpected unlock
   arch/x86/include/asm/current.h:15:16: sparse: sparse: context imbalance in 'do_wait' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/tsc.c:52:20: sparse: sparse: symbol 'art_related_clocksource' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/process.c:606:26: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/process.c:606:26: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/process.c:606:26: sparse:    got struct cpuinfo_x86 *
   arch/x86/include/asm/bitops.h:77:37: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/umip.c:84:12: sparse: sparse: symbol 'umip_insns' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/nmi.c:557:13: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned int enum nmi_states [noderef] <asn:3> *__p @@    got nmi_states [noderef] <asn:3> *__p @@
   arch/x86/kernel/nmi.c:557:13: sparse:    expected unsigned int enum nmi_states [noderef] <asn:3> *__p
   arch/x86/kernel/nmi.c:557:13: sparse:    got unsigned int enum nmi_states *
   arch/x86/kernel/nmi.c:312:13: sparse: sparse: context imbalance in 'default_do_nmi' - different lock contexts for basic block
   arch/x86/kernel/nmi.c:557:13: sparse: sparse: dereference of noderef expression
   arch/x86/kernel/nmi.c:557:13: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/setup.c:180:14: sparse: sparse: symbol 'machine_submodel_id' was not declared. Should it be static?
   arch/x86/kernel/setup.c:181:14: sparse: sparse: symbol 'BIOS_revision' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/i8259.c:410:19: sparse: sparse: symbol 'default_legacy_pic' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/mm.h:1745:21: sparse: sparse: context imbalance in '__text_poke' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/signal.c:355:16: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:355:16: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:355:16: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:355:16: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:355:16: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:355:16: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:355:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:1> * @@    got st volatile [noderef] <asn:1> * @@
   arch/x86/kernel/signal.c:355:16: sparse:    expected void const volatile [noderef] <asn:1> *
   arch/x86/kernel/signal.c:355:16: sparse:    got unsigned long long [usertype] *__pu_ptr
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:1> * @@    got st volatile [noderef] <asn:1> * @@
   arch/x86/kernel/signal.c:415:17: sparse:    expected void const volatile [noderef] <asn:1> *
   arch/x86/kernel/signal.c:415:17: sparse:    got unsigned long long [usertype] *
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
   arch/x86/kernel/signal.c:415:17: sparse: sparse: cast removes address space '<asn:1>' of expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/mm/tlb.c:105:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned short [noderef] <asn:3> *__p @@    got deref] <asn:3> *__p @@
   arch/x86/mm/tlb.c:105:21: sparse:    expected unsigned short [noderef] <asn:3> *__p
   arch/x86/mm/tlb.c:105:21: sparse:    got unsigned short *
   arch/x86/mm/tlb.c:105:21: sparse: sparse: dereference of noderef expression
   arch/x86/mm/tlb.c:105:21: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/highmem.h:118:19: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected int [noderef] <asn:3> *__p @@    got :3> *__p @@
   include/linux/highmem.h:118:19: sparse:    expected int [noderef] <asn:3> *__p
   include/linux/highmem.h:118:19: sparse:    got int *
   include/linux/highmem.h:118:19: sparse: sparse: dereference of noderef expression
   include/linux/highmem.h:118:19: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/mm/pageattr.c:334:6: sparse: sparse: symbol '__cpa_flush_tlb' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'poking_init' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/entry/vdso/vdso32/../vclock_gettime.c:70:5: sparse: sparse: symbol '__vdso_clock_gettime64' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/events/intel/core.c:2804:1: sparse: sparse: context imbalance in 'intel_start_scheduling' - different lock contexts for basic block
   arch/x86/events/intel/core.c:2877:9: sparse: sparse: context imbalance in 'intel_stop_scheduling' - unexpected unlock
   arch/x86/events/intel/core.c:3083:25: sparse: sparse: context imbalance in 'intel_put_excl_constraints' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/acpi/boot.c:111:30: sparse: sparse: incorrect type in return expression (different address spaces) @@    expected void [noderef] <asn:2> * @@    got n:2> * @@
   arch/x86/kernel/acpi/boot.c:111:30: sparse:    expected void [noderef] <asn:2> *
   arch/x86/kernel/acpi/boot.c:111:30: sparse:    got void *
   arch/x86/kernel/acpi/boot.c:119:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *addr @@    got void [noderef] <asvoid *addr @@
   arch/x86/kernel/acpi/boot.c:119:24: sparse:    expected void *addr
   arch/x86/kernel/acpi/boot.c:119:24: sparse:    got void [noderef] <asn:2> *map
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/acpi/sleep.c:81:13: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got :3> *__vpp_verify @@
   arch/x86/kernel/acpi/sleep.c:81:13: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/acpi/sleep.c:81:13: sparse:    got int *
   arch/x86/kernel/acpi/sleep.c:81:13: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got :3> *__vpp_verify @@
   arch/x86/kernel/acpi/sleep.c:81:13: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/acpi/sleep.c:81:13: sparse:    got int *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/cpu/common.c:131:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:132:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:133:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:134:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:161:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:162:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/cpu/cacheinfo.c:267:30: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got ref] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/cacheinfo.c:267:30: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/cacheinfo.c:267:30: sparse:    got unsigned int *
   arch/x86/kernel/cpu/cacheinfo.c:267:30: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got ref] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/cacheinfo.c:267:30: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/cacheinfo.c:267:30: sparse:    got unsigned int *
   arch/x86/kernel/cpu/cacheinfo.c:289:39: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got deref] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/cacheinfo.c:289:39: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/cacheinfo.c:289:39: sparse:    got unsigned short *
   arch/x86/kernel/cpu/cacheinfo.c:289:39: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got deref] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/cacheinfo.c:289:39: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/cacheinfo.c:289:39: sparse:    got unsigned short *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/page_alloc.c:1026:1: sparse: sparse: directive in macro's argument list
   mm/page_alloc.c:1028:1: sparse: sparse: directive in macro's argument list
   mm/page_alloc.c:7561:1: sparse: sparse: directive in macro's argument list
   mm/page_alloc.c:7563:1: sparse: sparse: directive in macro's argument list
   mm/page_alloc.c:7571:1: sparse: sparse: directive in macro's argument list
   mm/page_alloc.c:7573:1: sparse: sparse: directive in macro's argument list
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'total_swapcache_pages' - unexpected unlock
   mm/swap_state.c:319:29: sparse: sparse: context imbalance in 'lookup_swap_cache' - unexpected unlock
   mm/swap_state.c:377:43: sparse: sparse: context imbalance in '__read_swap_cache_async' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/swapfile.c:476:35: sparse: sparse: context imbalance in 'swap_do_scheduled_discard' - different lock contexts for basic block
   mm/swapfile.c:647:23: sparse: sparse: context imbalance in 'scan_swap_map_try_ssd_cluster' - different lock contexts for basic block
   mm/swapfile.c:891:20: sparse: sparse: context imbalance in 'scan_swap_map_slots' - unexpected unlock
   mm/swapfile.c:973:23: sparse: sparse: context imbalance in 'swap_free_cluster' - different lock contexts for basic block
   mm/swapfile.c:1151:32: sparse: sparse: context imbalance in 'swap_info_get' - wrong count at exit
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'swap_info_get_cont' - unexpected unlock
   mm/swapfile.c:1249:25: sparse: sparse: context imbalance in 'get_swap_device' - different lock contexts for basic block
   mm/swapfile.c:361:40: sparse: sparse: context imbalance in '__swap_entry_free' - different lock contexts for basic block
   mm/swapfile.c:1305:33: sparse: sparse: context imbalance in 'swap_entry_free' - different lock contexts for basic block
   mm/swapfile.c:1360:34: sparse: sparse: context imbalance in 'put_swap_page' - different lock contexts for basic block
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'swapcache_free_entries' - unexpected unlock
   mm/swapfile.c:361:40: sparse: sparse: context imbalance in 'page_swapcount' - different lock contexts for basic block
   mm/swapfile.c:1456:35: sparse: sparse: context imbalance in '__swap_count' - unexpected unlock
   mm/swapfile.c:361:40: sparse: sparse: context imbalance in 'swap_swapcount' - different lock contexts for basic block
   mm/swapfile.c:1486:17: sparse: sparse: context imbalance in '__swp_swapcount' - unexpected unlock
   mm/swapfile.c:361:40: sparse: sparse: context imbalance in 'swp_swapcount' - different lock contexts for basic block
   mm/swapfile.c:361:40: sparse: sparse: context imbalance in 'swap_page_trans_huge_swapped' - different lock contexts for basic block
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'reuse_swap_page' - unexpected unlock
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in '__swap_duplicate' - unexpected unlock
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'add_swap_count_continuation' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:2762:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2762:21: sparse:    got unsigned long *
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:2762:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2762:21: sparse:    got unsigned long *
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:2762:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2762:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:2762:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2762:21: sparse:    got unsigned long *
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:2762:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2762:21: sparse:    got unsigned long *
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:2762:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2762:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:3003:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:3003:21: sparse:    got void ***
   mm/slub.c:3003:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:3003:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:3003:21: sparse:    got unsigned long *
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
   mm/slub.c:2762:21: sparse:    expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2762:21: sparse:    got unsigned long *
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void **[noderef] <asn:3> *__p1 @@    got asn:3> *__p1 @@
   mm/slub.c:2762:21: sparse:    expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2762:21: sparse:    got void ***
   mm/slub.c:2762:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long [noderef] <asn:3> *__p2 @@    got eref] <asn:3> *__p2 @@
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/migrate.c:811:9: sparse: sparse: context imbalance in '__buffer_migrate_page' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/spinlock.h:393:9: sparse: sparse: context imbalance in 'pagevec_lru_move_fn' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/truncate.c:104:9: sparse: sparse: context imbalance in 'truncate_exceptional_pvec_entries' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/include/asm/irqflags.h:54:9: sparse: sparse: context imbalance in 'check_move_unevictable_pages' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/spinlock.h:393:9: sparse: sparse: context imbalance in 'walk_zones_in_node' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/gfp.h:318:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/compaction.c:2343:39: sparse: sparse: incorrect type in initializer (different base types) @@    expected int may_perform_io @@    got restricted gint may_perform_io @@
   mm/compaction.c:2343:39: sparse:    expected int may_perform_io
   mm/compaction.c:2343:39: sparse:    got restricted gfp_t
   mm/compaction.c:482:13: sparse: sparse: context imbalance in 'compact_lock_irqsave' - wrong count at exit
   include/linux/spinlock.h:393:9: sparse: sparse: context imbalance in 'compact_unlock_should_abort' - unexpected unlock
   mm/compaction.c:638:39: sparse: sparse: context imbalance in 'isolate_freepages_block' - unexpected unlock
   mm/compaction.c:1047:39: sparse: sparse: context imbalance in 'isolate_migratepages_block' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/include/asm/irqflags.h:54:9: sparse: sparse: context imbalance in 'shadow_lru_isolate' - wrong count at exit
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/memory.c:800:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1412:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1801:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:2547:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c:3124:19: sparse: sparse: context imbalance in 'pte_alloc_one_map' - different lock contexts for basic block
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'finish_fault' - unexpected unlock
   mm/memory.c:3463:9: sparse: sparse: context imbalance in 'do_fault_around' - unexpected unlock
   mm/memory.c:4116:12: sparse: sparse: context imbalance in '__follow_pte_pmd' - different lock contexts for basic block
   mm/memory.c:4195:5: sparse: sparse: context imbalance in 'follow_pte_pmd' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/mincore.c:76:53: sparse: sparse: context imbalance in 'mincore_page' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/mm.h:1745:21: sparse: sparse: context imbalance in '__munlock_pagevec_fill' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/rcupdate.h:649:9: sparse: sparse: context imbalance in 'find_lock_task_mm' - wrong count at exit
   include/linux/sched/mm.h:166:37: sparse: sparse: dereference of noderef expression
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'oom_badness' - unexpected unlock
   mm/oom_kill.c:402:9: sparse: sparse: context imbalance in 'dump_task' - unexpected unlock
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in '__oom_kill_process' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/page_vma_mapped.c:156:29: sparse: sparse: Using plain integer as NULL pointer
   mm/page_vma_mapped.c:16:13: sparse: sparse: context imbalance in 'map_pte' - wrong count at exit
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'page_vma_mapped_walk' - unexpected unlock
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'page_mapped_in_vma' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'page_referenced_one' - unexpected unlock
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'try_to_unmap_one' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   mm/vmalloc.c:1097:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct vmap_area *[noderef] <asn:3> *__p @@    got [noderef] <asn:3> *__p @@
   mm/vmalloc.c:1097:21: sparse:    expected struct vmap_area *[noderef] <asn:3> *__p
   mm/vmalloc.c:1097:21: sparse:    got struct vmap_area **
   mm/vmalloc.c:958:23: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct vmap_area *[noderef] <asn:3> *__p @@    got [noderef] <asn:3> *__p @@
   mm/vmalloc.c:958:23: sparse:    expected struct vmap_area *[noderef] <asn:3> *__p
   mm/vmalloc.c:958:23: sparse:    got struct vmap_area **
   mm/vmalloc.c:1097:21: sparse: sparse: dereference of noderef expression
   mm/vmalloc.c:1097:21: sparse: sparse: dereference of noderef expression
   mm/vmalloc.c:958:23: sparse: sparse: dereference of noderef expression
   mm/vmalloc.c:958:23: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/bpf/hashtab.c:510:19: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/hashtab.c:551:19: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/hashtab.c:1488:19: sparse: sparse: subtraction of functions? Share your drugs
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/bpf/verifier.c:8759:76: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:9112:81: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:9116:81: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:9120:81: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:9124:79: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:9128:78: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:9132:79: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:9151:38: sparse: sparse: subtraction of functions? Share your drugs
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/bpf/core.c:206:49: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:1447:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:1452:48: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:1632:77: sparse: sparse: subtraction of functions? Share your drugs
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/events/core.c:571:26: sparse: sparse: function 'perf_pmu_name' with external linkage has definition
   kernel/events/core.c:1035:1: sparse: sparse: symbol 'perf_cgroup_switch' was not declared. Should it be static?
   kernel/events/core.c:1384:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1384:15: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:1384:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1397:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1397:28: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:1397:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3187:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3187:18: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3187:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3188:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3188:23: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3188:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3219:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3219:25: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3219:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3220:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3220:25: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:3220:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3858:21: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected int [noderef] <asn:3> *__p @@    got :3> *__p @@
   kernel/events/core.c:3858:21: sparse:    expected int [noderef] <asn:3> *__p
   kernel/events/core.c:3858:21: sparse:    got int *
   kernel/events/core.c:4294:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4294:25: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:4294:25: sparse:    struct perf_event_context *
   kernel/events/core.c:5507:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5507:9: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:5507:9: sparse:    struct ring_buffer *
   kernel/events/core.c:5020:24: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted __poll_t [usertype] events @@    got e] events @@
   kernel/events/core.c:5020:24: sparse:    expected restricted __poll_t [usertype] events
   kernel/events/core.c:5020:24: sparse:    got int
   kernel/events/core.c:5218:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5218:22: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:5218:22: sparse:    struct ring_buffer *
   kernel/events/core.c:5349:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5349:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:5349:14: sparse:    struct ring_buffer *
   kernel/events/core.c:5382:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5382:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:5382:14: sparse:    struct ring_buffer *
   kernel/events/core.c:5439:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5439:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:5439:14: sparse:    struct ring_buffer *
   kernel/events/core.c:5525:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5525:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:5525:14: sparse:    struct ring_buffer *
   kernel/events/core.c:5538:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5538:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:5538:14: sparse:    struct ring_buffer *
   kernel/events/internal.h:203:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1> *from @@    got f] <asn:1> *from @@
   kernel/events/internal.h:203:1: sparse:    expected void const [noderef] <asn:1> *from
   kernel/events/internal.h:203:1: sparse:    got void const *buf
   kernel/events/core.c:6854:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6854:23: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:6854:23: sparse:    struct perf_event_context *
   kernel/events/core.c:6945:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6945:13: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/core.c:6945:13: sparse:    struct ring_buffer *
   kernel/events/core.c:7633:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7633:23: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:7633:23: sparse:    struct perf_event_context *
   kernel/events/core.c:8363:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8363:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8363:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:8383:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8383:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8383:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:8503:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8503:16: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8503:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:8514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8514:9: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8514:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:8503:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8503:16: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8503:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:8553:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8553:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8553:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9905:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:11567:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11567:9: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:11567:9: sparse:    struct perf_event_context *
   kernel/events/core.c:11677:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11677:17: sparse:    struct perf_event_context [noderef] <asn:4> *
   kernel/events/core.c:11677:17: sparse:    struct perf_event_context *
   kernel/events/core.c:8503:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8503:16: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:8503:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:12101:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:12101:17: sparse:    struct swevent_hlist [noderef] <asn:4> *
   kernel/events/core.c:12101:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:155:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:163:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c:1404:17: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1431:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2636:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:3858:21: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/events/ring_buffer.c:22:39: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int i @@    got restricted __poll_t [usertyint i @@
   kernel/events/ring_buffer.c:22:39: sparse:    expected int i
   kernel/events/ring_buffer.c:22:39: sparse:    got restricted __poll_t [usertype]
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/ring_buffer.c:169:14: sparse:    struct ring_buffer *
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/ring_buffer.c:169:14: sparse:    struct ring_buffer *
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct ring_buffer [noderef] <asn:4> *
   kernel/events/ring_buffer.c:169:14: sparse:    struct ring_buffer *
   kernel/events/ring_buffer.c:149:1: sparse: sparse: context imbalance in 'perf_output_begin_forward' - different lock contexts for basic block
   kernel/events/ring_buffer.c:149:1: sparse: sparse: context imbalance in 'perf_output_begin_backward' - different lock contexts for basic block
   kernel/events/ring_buffer.c:149:1: sparse: sparse: context imbalance in 'perf_output_begin' - different lock contexts for basic block
   kernel/events/ring_buffer.c:297:6: sparse: sparse: context imbalance in 'perf_output_end' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/events/callchain.c:66:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:66:9: sparse:    struct callchain_cpus_entries [noderef] <asn:4> *
   kernel/events/callchain.c:66:9: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c:96:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:96:9: sparse:    struct callchain_cpus_entries [noderef] <asn:4> *
   kernel/events/callchain.c:96:9: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c:161:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:161:19: sparse:    struct callchain_cpus_entries [noderef] <asn:4> *
   kernel/events/callchain.c:161:19: sparse:    struct callchain_cpus_entries *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/kernel/cpu/mce/core.c:1416:27: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/mce/core.c:1416:27: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/mce/core.c:1416:27: sparse:    got struct cpuinfo_x86 *
   arch/x86/kernel/cpu/mce/core.c:2050:34: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/mce/core.c:2050:34: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/mce/core.c:2050:34: sparse:    got struct cpuinfo_x86 *
   arch/x86/kernel/cpu/mce/core.c:2066:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/mce/core.c:2066:28: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/mce/core.c:2066:28: sparse:    got struct cpuinfo_x86 *
   arch/x86/kernel/cpu/mce/core.c:2083:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/mce/core.c:2083:28: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/mce/core.c:2083:28: sparse:    got struct cpuinfo_x86 *
   arch/x86/kernel/cpu/mce/core.c:2090:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/mce/core.c:2090:28: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/mce/core.c:2090:28: sparse:    got struct cpuinfo_x86 *
   arch/x86/kernel/cpu/mce/core.c:2335:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/mce/core.c:2335:28: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/mce/core.c:2335:28: sparse:    got struct cpuinfo_x86 *
   arch/x86/kernel/cpu/mce/core.c:2349:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3> *__vpp_verify @@    got  [noderef] <asn:3> *__vpp_verify @@
   arch/x86/kernel/cpu/mce/core.c:2349:28: sparse:    expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/kernel/cpu/mce/core.c:2349:28: sparse:    got struct cpuinfo_x86 *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/direct-io.c:1177:36: sparse: sparse: Using plain integer as NULL pointer
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/signalfd.c:108:32: sparse: sparse: cast removes address space '<asn:1>' of expression
   fs/signalfd.c:125:33: sparse: sparse: cast removes address space '<asn:1>' of expression
   fs/signalfd.c:131:33: sparse: sparse: cast removes address space '<asn:1>' of expression
   fs/signalfd.c:150:32: sparse: sparse: cast removes address space '<asn:1>' of expression
   fs/signalfd.c:154:38: sparse: sparse: cast removes address space '<asn:1>' of expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/aio.c:1662:12: sparse: sparse: context imbalance in 'aio_poll_wake' - wrong count at exit
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/io_uring.c:1775:12: sparse: sparse: context imbalance in 'io_poll_wake' - wrong count at exit
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/sched/signal.h:668:37: sparse: sparse: context imbalance in 'zap_threads' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/exec.c:417:31: sparse: sparse: incorrect type in return expression (different address spaces) @@    expected char const [noderef] <asn:1> * @@    got n:1> * @@
   fs/exec.c:417:31: sparse:    expected char const [noderef] <asn:1> *
   fs/exec.c:417:31: sparse:    got void *
   fs/exec.c:1175:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct task_struct *parent @@    got struct task_structstruct task_struct *parent @@
   fs/exec.c:1175:56: sparse:    expected struct task_struct *parent
   fs/exec.c:1175:56: sparse:    got struct task_struct [noderef] <asn:4> *parent
   fs/exec.c:1210:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/exec.c:1210:17: sparse:    struct sighand_struct [noderef] <asn:4> *
   fs/exec.c:1210:17: sparse:    struct sighand_struct *
   fs/exec.c:1699:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *tsk @@    got struct task_structstruct task_struct *tsk @@
   fs/exec.c:1699:70: sparse:    expected struct task_struct *tsk
   fs/exec.c:1699:70: sparse:    got struct task_struct [noderef] <asn:4> *parent
   fs/exec.c:1873:52: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected char const [noderef] <asn:1> *const [noderef] <asn:1> *native @@    got n:1> *native @@
   fs/exec.c:1873:52: sparse:    expected char const [noderef] <asn:1> *const [noderef] <asn:1> *native
   fs/exec.c:1873:52: sparse:    got void *__argv
   fs/exec.c:1874:52: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected char const [noderef] <asn:1> *const [noderef] <asn:1> *native @@    got n:1> *native @@
   fs/exec.c:1874:52: sparse:    expected char const [noderef] <asn:1> *const [noderef] <asn:1> *native
   fs/exec.c:1874:52: sparse:    got void *__envp
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/namei.c:1928:14: sparse: sparse: symbol 'full_name_hash' redeclared with different type (originally declared at include/linux/stringhash.h:66) - different modifiers
   fs/namei.c:1949:5: sparse: sparse: symbol 'hashlen_string' redeclared with different type (originally declared at include/linux/stringhash.h:77) - different modifiers
   fs/namei.c:604:17: sparse: sparse: context imbalance in 'terminate_walk' - unexpected unlock
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'unlazy_walk' - unexpected unlock
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'unlazy_child' - unexpected unlock
   fs/namei.c:1727:33: sparse: sparse: context imbalance in 'pick_link' - unexpected unlock
   fs/namei.c:2162:19: sparse: sparse: context imbalance in 'path_init' - wrong count at exit
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/fcntl.c:280:22: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected unsigned long long [usertype] *argp @@    got unsigned long longunsigned long long [usertype] *argp @@
   fs/fcntl.c:280:22: sparse:    expected unsigned long long [usertype] *argp
   fs/fcntl.c:280:22: sparse:    got unsigned long long [noderef] [usertype] <asn:1> *
   fs/fcntl.c:287:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1> *to @@    got unsignevoid [noderef] <asn:1> *to @@
   fs/fcntl.c:287:34: sparse:    expected void [noderef] <asn:1> *to
   fs/fcntl.c:287:34: sparse:    got unsigned long long [usertype] *argp
   fs/fcntl.c:291:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1> *from @@    got uvoid const [noderef] <asn:1> *from @@
   fs/fcntl.c:291:40: sparse:    expected void const [noderef] <asn:1> *from
   fs/fcntl.c:291:40: sparse:    got unsigned long long [usertype] *argp
   fs/fcntl.c:303:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:1> *to @@    got unsignevoid [noderef] <asn:1> *to @@
   fs/fcntl.c:303:34: sparse:    expected void [noderef] <asn:1> *to
   fs/fcntl.c:303:34: sparse:    got unsigned long long [usertype] *argp
   fs/fcntl.c:307:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1> *from @@    got uvoid const [noderef] <asn:1> *from @@
   fs/fcntl.c:307:40: sparse:    expected void const [noderef] <asn:1> *from
   fs/fcntl.c:307:40: sparse:    got unsigned long long [usertype] *argp
   fs/fcntl.c:936:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:936:9: sparse:    struct fasync_struct [noderef] <asn:4> *
   fs/fcntl.c:936:9: sparse:    struct fasync_struct *
   fs/fcntl.c:1010:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1010:22: sparse:    struct fasync_struct [noderef] <asn:4> *
   fs/fcntl.c:1010:22: sparse:    struct fasync_struct *
   fs/fcntl.c:1021:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1021:33: sparse:    struct fasync_struct [noderef] <asn:4> *
   fs/fcntl.c:1021:33: sparse:    struct fasync_struct *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noderef] <asn:4> *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noderef] <asn:4> *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [noderef] <asn:4> *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [noderef] <asn:4> *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in '__dentry_kill' - unexpected unlock
   fs/dcache.c:622:9: sparse: sparse: context imbalance in '__lock_parent' - wrong count at exit
   fs/dcache.c:686:9: sparse: sparse: context imbalance in 'dentry_kill' - wrong count at exit
   fs/dcache.c:859:17: sparse: sparse: context imbalance in 'dput' - unexpected unlock
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'dput_to_list' - unexpected unlock
   include/linux/spinlock.h:338:9: sparse: sparse: context imbalance in 'd_prune_aliases' - different lock contexts for basic block
   fs/dcache.c:1055:13: sparse: sparse: context imbalance in 'shrink_lock_dentry' - different lock contexts for basic block
   include/linux/compiler.h:199:9: sparse: sparse: context imbalance in 'shrink_dentry_list' - different lock contexts for basic block
   fs/dcache.c:1124:24: sparse: sparse: context imbalance in 'dentry_lru_isolate' - wrong count at exit
   fs/dcache.c:1205:24: sparse: sparse: context imbalance in 'dentry_lru_isolate_shrink' - wrong count at exit
   fs/dcache.c:1267:13: sparse: sparse: context imbalance in 'd_walk' - different lock contexts for basic block
   fs/dcache.c:1501:24: sparse: sparse: context imbalance in 'select_collect2' - different lock contexts for basic block
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'shrink_dcache_parent' - unexpected unlock
   fs/dcache.c:2674:6: sparse: sparse: context imbalance in 'd_add' - different lock contexts for basic block
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in '__d_move' - unexpected unlock
   fs/dcache.c:3044:16: sparse: sparse: context imbalance in 'd_splice_alias' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/inode.c:724:24: sparse: sparse: context imbalance in 'inode_lru_isolate' - wrong count at exit
   fs/inode.c:813:9: sparse: sparse: context imbalance in 'find_inode' - different lock contexts for basic block
   fs/inode.c:844:9: sparse: sparse: context imbalance in 'find_inode_fast' - different lock contexts for basic block
   fs/inode.c:1450:5: sparse: sparse: context imbalance in 'insert_inode_locked' - wrong count at exit
   include/linux/spinlock.h:378:9: sparse: sparse: context imbalance in 'iput_final' - unexpected unlock
   fs/inode.c:1575:6: sparse: sparse: context imbalance in 'iput' - wrong count at exit
   fs/inode.c:1946:13: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/file.c:335:17: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct file **old_fds @@    got struct file [noderstruct file **old_fds @@
   fs/file.c:335:17: sparse:    expected struct file **old_fds
   fs/file.c:335:17: sparse:    got struct file [noderef] <asn:4> **fd
   fs/file.c:336:17: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct file **new_fds @@    got struct file [noderstruct file **new_fds @@
   fs/file.c:336:17: sparse:    expected struct file **new_fds
   fs/file.c:336:17: sparse:    got struct file [noderef] <asn:4> **fd
   fs/file.c:351:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:351:17: sparse:    struct file [noderef] <asn:4> *
   fs/file.c:351:17: sparse:    struct file *
   fs/file.c:386:54: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct file *file @@    got struct file [noderef] <asn:4>struct file *file @@
   fs/file.c:386:54: sparse:    expected struct file *file
   fs/file.c:386:54: sparse:    got struct file [noderef] <asn:4> *[assigned] __ret
   fs/file.c:451:28: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct fdtable [noderef] <asn:4> *fdt @@    got deref] <asn:4> *fdt @@
   fs/file.c:451:28: sparse:    expected struct fdtable [noderef] <asn:4> *fdt
   fs/file.c:451:28: sparse:    got struct fdtable *
   fs/file.c:630:14: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct file *file @@    got struct file [noderstruct file *file @@
   fs/file.c:630:14: sparse:    expected struct file *file
   fs/file.c:630:14: sparse:    got struct file [noderef] <asn:4> *
   fs/file.c:657:14: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct file *file @@    got struct file [noderstruct file *file @@
   fs/file.c:657:14: sparse:    expected struct file *file
   fs/file.c:657:14: sparse:    got struct file [noderef] <asn:4> *
   fs/file.c:694:30: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct file *file @@    got struct file [noderstruct file *file @@
   fs/file.c:694:30: sparse:    expected struct file *file
   fs/file.c:694:30: sparse:    got struct file [noderef] <asn:4> *
   fs/file.c:865:16: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct file *tofree @@    got struct file [noderstruct file *tofree @@
   fs/file.c:865:16: sparse:    expected struct file *tofree
   fs/file.c:865:16: sparse:    got struct file [noderef] <asn:4> *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/namespace.c:1731:22: sparse: sparse: symbol 'to_mnt_ns' was not declared. Should it be static?
   fs/namespace.c:2392:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected char const [noderef] <asn:1> *name @@    got f] <asn:1> *name @@
   fs/namespace.c:2392:35: sparse:    expected char const [noderef] <asn:1> *name
   fs/namespace.c:2392:35: sparse:    got char const *filename
   fs/namespace.c:3541:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected char const [noderef] <asn:1> *name @@    got f] <asn:1> *name @@
   fs/namespace.c:3541:38: sparse:    expected char const [noderef] <asn:1> *name
   fs/namespace.c:3541:38: sparse:    got char const *from_pathname
   fs/namespace.c:3550:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected char const [noderef] <asn:1> *name @@    got f] <asn:1> *name @@
   fs/namespace.c:3550:36: sparse:    expected char const [noderef] <asn:1> *name
   fs/namespace.c:3550:36: sparse:    got char const *to_pathname
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/seq_file.c:1048:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:1048:24: sparse:    struct hlist_node [noderef] <asn:4> *
   fs/seq_file.c:1048:24: sparse:    struct hlist_node *
   fs/seq_file.c:1050:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:1050:24: sparse:    struct hlist_node [noderef] <asn:4> *
   fs/seq_file.c:1050:24: sparse:    struct hlist_node *
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/fs-writeback.c:1702:17: sparse: sparse: context imbalance in 'writeback_sb_inodes' - unexpected unlock
   fs/fs-writeback.c:2194:9: sparse: sparse: context imbalance in 'block_dump___mark_inode_dirty' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/d_path.c:155:9: sparse: sparse: context imbalance in 'prepend_path' - wrong count at exit
   include/linux/err.h:24:20: sparse: sparse: context imbalance in '__dentry_path' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/fs_struct.c:163:18: sparse: sparse: symbol 'init_fs' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/fs_pin.c:41:17: sparse: sparse: context imbalance in 'pin_kill' - unexpected unlock
   include/linux/rcupdate.h:59:9: sparse: sparse: context imbalance in 'mnt_pin_kill' - different lock contexts for basic block
   include/linux/rcupdate.h:59:9: sparse: sparse: context imbalance in 'group_pin_kill' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/buffer.c:3358:13: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected int [noderef] <asn:3> *__p @@    got :3> *__p @@
   fs/buffer.c:3358:13: sparse:    expected int [noderef] <asn:3> *__p
   fs/buffer.c:3358:13: sparse:    got int *
   arch/x86/include/asm/bitops.h:77:37: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   fs/buffer.c:3358:13: sparse: sparse: dereference of noderef expression
   fs/buffer.c:3358:13: sparse: sparse: dereference of noderef expression
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/open.c:757:13: sparse: sparse: restricted fmode_t degrades to integer
   fs/open.c:975:18: sparse: sparse: restricted fmode_t degrades to integer
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/nls/nls_base.c:124:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:124:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:124:20: sparse:    got restricted __le16 [usertype]
   fs/nls/nls_base.c:127:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:127:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:127:20: sparse:    got restricted __be16 [usertype]
   fs/nls/nls_base.c:124:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:124:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:124:20: sparse:    got restricted __le16 [usertype]
   fs/nls/nls_base.c:127:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:127:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:127:20: sparse:    got restricted __be16 [usertype]
   fs/nls/nls_base.c:124:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:124:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:124:20: sparse:    got restricted __le16 [usertype]
   fs/nls/nls_base.c:127:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:127:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:127:20: sparse:    got restricted __be16 [usertype]
   fs/nls/nls_base.c:124:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:124:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:124:20: sparse:    got restricted __le16 [usertype]
   fs/nls/nls_base.c:127:20: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [usertype] @@    got resunsigned short [usertype] @@
   fs/nls/nls_base.c:127:20: sparse:    expected unsigned short [usertype]
   fs/nls/nls_base.c:127:20: sparse:    got restricted __be16 [usertype]
   fs/nls/nls_base.c:180:24: sparse: sparse: cast to restricted __le16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
   fs/nls/nls_base.c:180:24: sparse: sparse: cast to restricted __le16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
   fs/nls/nls_base.c:182:24: sparse: sparse: cast to restricted __be16
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/notify/fsnotify.c:239:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:239:16: sparse:    struct fsnotify_mark_connector [noderef] <asn:4> *
   fs/notify/fsnotify.c:239:16: sparse:    struct fsnotify_mark_connector *
   fs/notify/fsnotify.c:241:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:241:24: sparse:    struct hlist_node [noderef] <asn:4> *
   fs/notify/fsnotify.c:241:24: sparse:    struct hlist_node *
   fs/notify/fsnotify.c:251:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:251:24: sparse:    struct hlist_node [noderef] <asn:4> *
   fs/notify/fsnotify.c:251:24: sparse:    struct hlist_node *
   fs/notify/fsnotify.c:354:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct fsnotify_mark_connector **connp @@    got struct fsnotify_mastruct fsnotify_mark_connector **connp @@
   fs/notify/fsnotify.c:354:38: sparse:    expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:354:38: sparse:    got struct fsnotify_mark_connector [noderef] <asn:4> **
   fs/notify/fsnotify.c:356:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct fsnotify_mark_connector **connp @@    got struct fsnotify_mastruct fsnotify_mark_connector **connp @@
   fs/notify/fsnotify.c:356:38: sparse:    expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:356:38: sparse:    got struct fsnotify_mark_connector [noderef] <asn:4> **
   fs/notify/fsnotify.c:359:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct fsnotify_mark_connector **connp @@    got struct fsnotify_mastruct fsnotify_mark_connector **connp @@
   fs/notify/fsnotify.c:359:46: sparse:    expected struct fsnotify_mark_connector **connp
   fs/notify/fsnotify.c:359:46: sparse:    got struct fsnotify_mark_connector [noderef] <asn:4> **
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/notify/mark.c:500:13: sparse: sparse: incorrect type in initializer (different address spaces) @@    expected struct fsnotify_mark_connector [noderef] <asn:4> *__new @@    got fsnotify_mark_connector [noderef] <asn:4> *__new @@
   fs/notify/mark.c:500:13: sparse:    expected struct fsnotify_mark_connector [noderef] <asn:4> *__new
   fs/notify/mark.c:500:13: sparse:    got struct fsnotify_mark_connector *[assigned] conn
   fs/notify/mark.c:255:9: sparse: sparse: context imbalance in 'fsnotify_put_mark' - unexpected unlock
   include/linux/srcu.h:181:9: sparse: sparse: context imbalance in 'fsnotify_prepare_user_wait' - unexpected unlock
   fs/notify/mark.c:357:9: sparse: sparse: context imbalance in 'fsnotify_finish_user_wait' - wrong count at exit
   fs/notify/mark.c:516:39: sparse: sparse: context imbalance in 'fsnotify_grab_connector' - different lock contexts for basic block
   fs/notify/mark.c:626:20: sparse: sparse: context imbalance in 'fsnotify_add_mark_list' - unexpected unlock
   fs/notify/mark.c:709:25: sparse: sparse: context imbalance in 'fsnotify_find_mark' - unexpected unlock
   fs/notify/mark.c:783:17: sparse: sparse: context imbalance in 'fsnotify_destroy_marks' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/notify/fdinfo.c:53:87: sparse: sparse: Using plain integer as NULL pointer
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   arch/x86/include/asm/microcode_amd.h:56:6: sparse: sparse: symbol 'reload_ucode_amd' was not declared. Should it be static?
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   kernel/irq/irqdesc.c:869:17: sparse: sparse: context imbalance in '__irq_get_desc_lock' - wrong count at exit
   kernel/irq/irqdesc.c:893:6: sparse: sparse: context imbalance in '__irq_put_desc_unlock' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/proc/inode.c:50:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/proc/inode.c:50:17: sparse:    struct ctl_table_header [noderef] <asn:4> *
   fs/proc/inode.c:50:17: sparse:    struct ctl_table_header *
   fs/proc/inode.c:155:17: sparse: sparse: context imbalance in 'close_pdeo' - unexpected unlock
   fs/proc/inode.c:189:27: sparse: sparse: context imbalance in 'proc_entry_rundown' - different lock contexts for basic block
   fs/proc/inode.c:385:12: sparse: sparse: context imbalance in 'proc_reg_release' - wrong count at exit
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/proc/base.c:2087:25: sparse: sparse: cast to restricted fmode_t
   fs/proc/base.c:2144:42: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:2241:48: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:1083:36: sparse: sparse: context imbalance in '__set_oom_adj' - unexpected unlock
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/proc/array.c:515:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct task_struct *tsk @@    got struct task_structstruct task_struct *tsk @@
   fs/proc/array.c:515:44: sparse:    expected struct task_struct *tsk
   fs/proc/array.c:515:44: sparse:    got struct task_struct [noderef] <asn:4> *real_parent
   fs/proc/array.c:293:9: sparse: sparse: context imbalance in 'proc_pid_status' - different lock contexts for basic block
   fs/proc/array.c:521:9: sparse: sparse: context imbalance in 'do_task_stat' - different lock contexts for basic block
--
>> include/linux/memory_hotplug.h:342:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MEMORY_HOTPLUG_SPARSE'
   fs/proc/proc_sysctl.c:279:22: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected struct hlist_node *node @@    got struct hlist_node struct hlist_node *node @@
   fs/proc/proc_sysctl.c:279:22: sparse:    expected struct hlist_node *node
   fs/proc/proc_sysctl.c:279:22: sparse:    got struct hlist_node [noderef] <asn:4> *
   fs/proc/proc_sysctl.c:940:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/proc/proc_sysctl.c:940:16: sparse:    struct ctl_table_header [noderef] <asn:4> *
   fs/proc/proc_sysctl.c:940:16: sparse:    struct ctl_table_header *
   fs/proc/proc_sysctl.c:317:17: sparse: sparse: context imbalance in 'start_unregistering' - unexpected unlock

vim +/CONFIG_MEMORY_HOTPLUG_SPARSE +342 include/linux/memory_hotplug.h

   341	
 > 342	#if CONFIG_MEMORY_HOTPLUG_SPARSE
   343	int check_hotplug_memory_addressable(unsigned long pfn,
   344			unsigned long nr_pages);
   345	#endif /* CONFIG_MEMORY_HOTPLUG_SPARSE */
   346	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
