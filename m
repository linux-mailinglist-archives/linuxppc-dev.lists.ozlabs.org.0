Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB101107E2F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2019 12:24:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KrXz6wktzDrJ7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2019 22:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KrVq6nVNzDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2019 22:22:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=intel.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47KrVq0SnQz8svr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2019 22:22:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47KrVq03jSz9sPf; Sat, 23 Nov 2019 22:22:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47KrVn5LHTz9sPW
 for <linuxppc-dev@ozlabs.org>; Sat, 23 Nov 2019 22:22:18 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Nov 2019 03:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,233,1571727600"; 
 d="gz'50?scan'50,208,50";a="205808404"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2019 03:22:13 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iYTUS-000DJR-Ma; Sat, 23 Nov 2019 19:22:12 +0800
Date: Sat, 23 Nov 2019 19:21:15 +0800
From: kbuild test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v3 2/4] powerpc/fadump: reorganize /sys/kernel/fadump_*
 sysfs files
Message-ID: <201911231940.11VsnYpL%lkp@intel.com>
References: <20191109122339.20484-3-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="v5n3kchtsk2vargi"
Content-Disposition: inline
In-Reply-To: <20191109122339.20484-3-sourabhjain@linux.ibm.com>
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
Cc: kbuild-all@lists.01.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--v5n3kchtsk2vargi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sourabh,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.4-rc8 next-20191122]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sourabh-Jain/reorganize-and-add-FADump-sysfs-files/20191110-091753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-rhel-kconfig (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/powernv/opal-core.c: In function 'opalcore_init':
>> arch/powerpc/platforms/powernv/opal-core.c:632:25: error: 'fadump_kobj' undeclared (first use in this function); did you mean 'fadump_ops'?
     rc = sysfs_create_file(fadump_kobj, &opalcore_rel_attr.attr);
                            ^~~~~~~~~~~
                            fadump_ops
   arch/powerpc/platforms/powernv/opal-core.c:632:25: note: each undeclared identifier is reported only once for each function it appears in

vim +632 arch/powerpc/platforms/powernv/opal-core.c

   591	
   592	static struct kobj_attribute opalcore_rel_attr = __ATTR(release_opalcore,
   593							0200, NULL,
   594							fadump_release_opalcore_store);
   595	
   596	static int __init opalcore_init(void)
   597	{
   598		int rc = -1;
   599	
   600		opalcore_config_init();
   601	
   602		if (oc_conf == NULL)
   603			return rc;
   604	
   605		create_opalcore();
   606	
   607		/*
   608		 * If oc_conf->opalcorebuf= is set in the 2nd kernel,
   609		 * then capture the dump.
   610		 */
   611		if (!(is_opalcore_usable())) {
   612			pr_err("Failed to export /sys/firmware/opal/core\n");
   613			opalcore_cleanup();
   614			return rc;
   615		}
   616	
   617		/* Set OPAL core file size */
   618		opal_core_attr.size = oc_conf->opalcore_size;
   619	
   620		/* Export OPAL core sysfs file */
   621		rc = sysfs_create_bin_file(opal_kobj, &opal_core_attr);
   622		if (rc != 0) {
   623			pr_err("Failed to export /sys/firmware/opal/core\n");
   624			opalcore_cleanup();
   625			return rc;
   626		}
   627	
   628		/*
   629		 * Originally fadump_release_opalcore sysfs was part of kernel_kobj
   630		 * later moved to fadump_kobj and renamed to release_opalcore.
   631		 */
 > 632		rc = sysfs_create_file(fadump_kobj, &opalcore_rel_attr.attr);

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--v5n3kchtsk2vargi
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
nV6zcJowb24qN6aD3bv/AdwaPPcr6wAA

--v5n3kchtsk2vargi--
