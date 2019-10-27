Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56809E6842
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 22:28:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471WDJ3pQbzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 08:28:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471W8x6m6XzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 08:25:18 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 14:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,237,1569308400"; 
 d="gz'50?scan'50,208,50";a="211264013"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 27 Oct 2019 14:25:07 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iOq27-00089l-2U; Mon, 28 Oct 2019 05:25:07 +0800
Date: Mon, 28 Oct 2019 05:24:51 +0800
From: kbuild test robot <lkp@intel.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH 04/10] powerpc: Map & release OpenCAPI LPC memory
Message-ID: <201910280525.oZQFx3jR%lkp@intel.com>
References: <20191025044721.16617-5-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dbn3nf5g54vyig3i"
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


--dbn3nf5g54vyig3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
config: i386-tinyconfig (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:811:0,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/audit.h:13,
                    from security/commoncap.c:6:
>> include/linux/memory_hotplug.h:342:5: warning: "CONFIG_MEMORY_HOTPLUG_SPARSE" is not defined, evaluates to 0 [-Wundef]
    #if CONFIG_MEMORY_HOTPLUG_SPARSE
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:811:0,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:19,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/memory_hotplug.h:342:5: warning: "CONFIG_MEMORY_HOTPLUG_SPARSE" is not defined, evaluates to 0 [-Wundef]
    #if CONFIG_MEMORY_HOTPLUG_SPARSE
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 real  4 user  3 sys  112.50% cpu 	make prepare

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

--dbn3nf5g54vyig3i
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
EVRRS98RgpYOkcU7UPgXmECHiihnAAA=

--dbn3nf5g54vyig3i--
