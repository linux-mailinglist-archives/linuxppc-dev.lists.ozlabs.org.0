Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 094512021D5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 08:15:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pllp2pKlzDrfT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 16:15:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49plk45v2bzDrL3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 16:13:56 +1000 (AEST)
IronPort-SDR: IxBeemW8gZY955bKhiGYHQnTtuIYvV7dOiLpSlmq+Ck6RJ3dn7ASDkQI5Ohd3qDgmGD/bUkHCt
 +n+kaOgkyXlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="208450444"
X-IronPort-AV: E=Sophos;i="5.75,258,1589266800"; 
 d="gz'50?scan'50,208,50";a="208450444"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 23:13:51 -0700
IronPort-SDR: CgZL5C8ewkWtlsCrvTshKTWcF3uTwgzOxK/nO+5gwi4TBXq8b+odJUCnJ4YLtx4SuXBGcSPG5v
 AMv7YuXmpVfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,258,1589266800"; 
 d="gz'50?scan'50,208,50";a="274500938"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 19 Jun 2020 23:13:48 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jmWl9-00013Z-AS; Sat, 20 Jun 2020 06:13:47 +0000
Date: Sat, 20 Jun 2020 14:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH 4/4] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
Message-ID: <202006201431.4eA8qrc2%lkp@intel.com>
References: <20200619050619.266888-5-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20200619050619.266888-5-leobras.c@gmail.com>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Leonardo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on v5.8-rc1 next-20200618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Leonardo-Bras/Remove-default-DMA-window-before-creating-DDW/20200619-131022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-r031-20200619 (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 63700971ac9cdf198faa4a3a7c226fa579e49206)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> arch/powerpc/platforms/pseries/iommu.c:1111:6: warning: variable 'dfl_win' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
if (ret)
^~~
arch/powerpc/platforms/pseries/iommu.c:1234:6: note: uninitialized use occurs here
if (dfl_win)
^~~~~~~
arch/powerpc/platforms/pseries/iommu.c:1111:2: note: remove the 'if' if its condition is always false
if (ret)
^~~~~~~~
arch/powerpc/platforms/pseries/iommu.c:1079:34: note: initialize the variable 'dfl_win' to silence this warning
struct property *win64, *dfl_win;
^
= NULL
1 warning generated.

vim +1111 arch/powerpc/platforms/pseries/iommu.c

715a454e17d328 Leonardo Bras        2020-06-19  1056  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1057  /*
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1058   * If the PE supports dynamic dma windows, and there is space for a table
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1059   * that can map all pages in a linear offset, then setup such a table,
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1060   * and record the dma-offset in the struct device.
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1061   *
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1062   * dev: the pci device we are checking
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1063   * pdn: the parent pe node with the ibm,dma_window property
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1064   * Future: also check if we can remap the base window for our base page size
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1065   *
9ae2fddeda4cbf Christoph Hellwig    2019-02-13  1066   * returns the dma offset for use by the direct mapped DMA code.
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1067   */
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1068  static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1069  {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1070  	int len, ret;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1071  	struct ddw_query_response query;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1072  	struct ddw_create_response create;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1073  	int page_shift;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1074  	u64 dma_addr, max_addr;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1075  	struct device_node *dn;
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1076  	u32 ddw_avail[3];
3248d5f65aac44 Leonardo Bras        2020-06-19  1077  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1078  	struct direct_window *window;
3248d5f65aac44 Leonardo Bras        2020-06-19  1079  	struct property *win64, *dfl_win;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1080  	struct dynamic_dma_window_prop *ddwprop;
61435690a9c781 Nishanth Aravamudan  2013-03-07  1081  	struct failed_ddw_pdn *fpdn;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1082  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1083  	mutex_lock(&direct_window_init_mutex);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1084  
b73a635f348610 Milton Miller        2011-05-11  1085  	dma_addr = find_existing_ddw(pdn);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1086  	if (dma_addr != 0)
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1087  		goto out_unlock;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1088  
61435690a9c781 Nishanth Aravamudan  2013-03-07  1089  	/*
61435690a9c781 Nishanth Aravamudan  2013-03-07  1090  	 * If we already went through this for a previous function of
61435690a9c781 Nishanth Aravamudan  2013-03-07  1091  	 * the same device and failed, we don't want to muck with the
61435690a9c781 Nishanth Aravamudan  2013-03-07  1092  	 * DMA window again, as it will race with in-flight operations
61435690a9c781 Nishanth Aravamudan  2013-03-07  1093  	 * and can lead to EEHs. The above mutex protects access to the
61435690a9c781 Nishanth Aravamudan  2013-03-07  1094  	 * list.
61435690a9c781 Nishanth Aravamudan  2013-03-07  1095  	 */
61435690a9c781 Nishanth Aravamudan  2013-03-07  1096  	list_for_each_entry(fpdn, &failed_ddw_pdn_list, list) {
b7c670d673d118 Rob Herring          2017-08-21  1097  		if (fpdn->pdn == pdn)
61435690a9c781 Nishanth Aravamudan  2013-03-07  1098  			goto out_unlock;
61435690a9c781 Nishanth Aravamudan  2013-03-07  1099  	}
61435690a9c781 Nishanth Aravamudan  2013-03-07  1100  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1101  	/*
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1102  	 * the ibm,ddw-applicable property holds the tokens for:
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1103  	 * ibm,query-pe-dma-window
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1104  	 * ibm,create-pe-dma-window
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1105  	 * ibm,remove-pe-dma-window
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1106  	 * for the given node in that order.
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1107  	 * the property is actually in the parent, not the PE
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1108  	 */
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1109  	ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1110  					 &ddw_avail[0], 3);
9410e0185e6539 Alexey Kardashevskiy 2014-09-25 @1111  	if (ret)
ae69e1eddc646f Nishanth Aravamudan  2014-01-10  1112  		goto out_failed;
25ebc45b93452d Nishanth Aravamudan  2012-05-15  1113  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1114  	/*
3248d5f65aac44 Leonardo Bras        2020-06-19  1115  	 * First step of setting up DDW is removing the default DMA window,
3248d5f65aac44 Leonardo Bras        2020-06-19  1116  	 * if it's present. It will make all the resources available to the
3248d5f65aac44 Leonardo Bras        2020-06-19  1117  	 * new DDW window.
3248d5f65aac44 Leonardo Bras        2020-06-19  1118  	 * If anything fails after this, we need to restore it.
3248d5f65aac44 Leonardo Bras        2020-06-19  1119  	 */
3248d5f65aac44 Leonardo Bras        2020-06-19  1120  
3248d5f65aac44 Leonardo Bras        2020-06-19  1121  	dfl_win = of_find_property(pdn, "ibm,dma-window", NULL);
3248d5f65aac44 Leonardo Bras        2020-06-19  1122  	if (dfl_win)
3248d5f65aac44 Leonardo Bras        2020-06-19  1123  		remove_dma_window(pdn, ddw_avail, dfl_win);
3248d5f65aac44 Leonardo Bras        2020-06-19  1124  
3248d5f65aac44 Leonardo Bras        2020-06-19  1125  	/*
3248d5f65aac44 Leonardo Bras        2020-06-19  1126  	 * Query if there is a window of size to map the
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1127  	 * whole partition.  Query returns number of windows, largest
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1128  	 * block assigned to PE (partition endpoint), and two bitmasks
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1129  	 * of page sizes: supported and supported for migrate-dma.
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1130  	 */
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1131  	dn = pci_device_to_OF_node(dev);
0ef1ee0bda323e Leonardo Bras        2020-06-19  1132  	ret = query_ddw(dev, ddw_avail, &query, pdn);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1133  	if (ret != 0)
ae69e1eddc646f Nishanth Aravamudan  2014-01-10  1134  		goto out_failed;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1135  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1136  	if (query.windows_available == 0) {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1137  		/*
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1138  		 * no additional windows are available for this device.
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1139  		 * We might be able to reallocate the existing window,
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1140  		 * trading in for a larger page size.
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1141  		 */
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1142  		dev_dbg(&dev->dev, "no free dynamic windows");
ae69e1eddc646f Nishanth Aravamudan  2014-01-10  1143  		goto out_failed;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1144  	}
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1145  	if (query.page_size & 4) {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1146  		page_shift = 24; /* 16MB */
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1147  	} else if (query.page_size & 2) {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1148  		page_shift = 16; /* 64kB */
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1149  	} else if (query.page_size & 1) {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1150  		page_shift = 12; /* 4kB */
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1151  	} else {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1152  		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1153  			  query.page_size);
ae69e1eddc646f Nishanth Aravamudan  2014-01-10  1154  		goto out_failed;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1155  	}
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1156  	/* verify the window * number of ptes will map the partition */
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1157  	/* check largest block * page size > max memory hotplug addr */
68c0449ea16d77 Alexey Kardashevskiy 2018-12-19  1158  	max_addr = ddw_memory_hotplug_max();
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1159  	if (query.largest_available_block < (max_addr >> page_shift)) {
0ef1ee0bda323e Leonardo Bras        2020-06-19  1160  		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1161  			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1162  			  1ULL << page_shift);
ae69e1eddc646f Nishanth Aravamudan  2014-01-10  1163  		goto out_failed;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1164  	}
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1165  	len = order_base_2(max_addr);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1166  	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1167  	if (!win64) {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1168  		dev_info(&dev->dev,
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1169  			"couldn't allocate property for 64bit dma window\n");
ae69e1eddc646f Nishanth Aravamudan  2014-01-10  1170  		goto out_failed;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1171  	}
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1172  	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1173  	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
767303349e052a Nishanth Aravamudan  2011-05-06  1174  	win64->length = sizeof(*ddwprop);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1175  	if (!win64->name || !win64->value) {
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1176  		dev_info(&dev->dev,
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1177  			"couldn't allocate property name and value\n");
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1178  		goto out_free_prop;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1179  	}
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1180  
b73a635f348610 Milton Miller        2011-05-11  1181  	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1182  	if (ret != 0)
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1183  		goto out_free_prop;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1184  
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1185  	ddwprop->liobn = cpu_to_be32(create.liobn);
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1186  	ddwprop->dma_base = cpu_to_be64(((u64)create.addr_hi << 32) |
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1187  			create.addr_lo);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1188  	ddwprop->tce_shift = cpu_to_be32(page_shift);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1189  	ddwprop->window_shift = cpu_to_be32(len);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1190  
b7c670d673d118 Rob Herring          2017-08-21  1191  	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
b7c670d673d118 Rob Herring          2017-08-21  1192  		  create.liobn, dn);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1193  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1194  	window = kzalloc(sizeof(*window), GFP_KERNEL);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1195  	if (!window)
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1196  		goto out_clear_window;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1197  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1198  	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1199  			win64->value, tce_setrange_multi_pSeriesLP_walk);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1200  	if (ret) {
b7c670d673d118 Rob Herring          2017-08-21  1201  		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
b7c670d673d118 Rob Herring          2017-08-21  1202  			 dn, ret);
7a19081fc26581 Julia Lawall         2011-08-08  1203  		goto out_free_window;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1204  	}
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1205  
79d1c712958f94 Nathan Fontenot      2012-10-02  1206  	ret = of_add_property(pdn, win64);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1207  	if (ret) {
b7c670d673d118 Rob Herring          2017-08-21  1208  		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
b7c670d673d118 Rob Herring          2017-08-21  1209  			 pdn, ret);
7a19081fc26581 Julia Lawall         2011-08-08  1210  		goto out_free_window;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1211  	}
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1212  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1213  	window->device = pdn;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1214  	window->prop = ddwprop;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1215  	spin_lock(&direct_window_list_lock);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1216  	list_add(&window->list, &direct_window_list);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1217  	spin_unlock(&direct_window_list_lock);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1218  
9410e0185e6539 Alexey Kardashevskiy 2014-09-25  1219  	dma_addr = be64_to_cpu(ddwprop->dma_base);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1220  	goto out_unlock;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1221  
7a19081fc26581 Julia Lawall         2011-08-08  1222  out_free_window:
7a19081fc26581 Julia Lawall         2011-08-08  1223  	kfree(window);
7a19081fc26581 Julia Lawall         2011-08-08  1224  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1225  out_clear_window:
5efbabe09d986f Gavin Shan           2014-08-11  1226  	remove_ddw(pdn, true);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1227  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1228  out_free_prop:
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1229  	kfree(win64->name);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1230  	kfree(win64->value);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1231  	kfree(win64);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1232  
ae69e1eddc646f Nishanth Aravamudan  2014-01-10  1233  out_failed:
3248d5f65aac44 Leonardo Bras        2020-06-19  1234  	if (dfl_win)
3248d5f65aac44 Leonardo Bras        2020-06-19  1235  		reset_dma_window(dev, pdn);
25ebc45b93452d Nishanth Aravamudan  2012-05-15  1236  
61435690a9c781 Nishanth Aravamudan  2013-03-07  1237  	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
61435690a9c781 Nishanth Aravamudan  2013-03-07  1238  	if (!fpdn)
61435690a9c781 Nishanth Aravamudan  2013-03-07  1239  		goto out_unlock;
61435690a9c781 Nishanth Aravamudan  2013-03-07  1240  	fpdn->pdn = pdn;
61435690a9c781 Nishanth Aravamudan  2013-03-07  1241  	list_add(&fpdn->list, &failed_ddw_pdn_list);
61435690a9c781 Nishanth Aravamudan  2013-03-07  1242  
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1243  out_unlock:
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1244  	mutex_unlock(&direct_window_init_mutex);
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1245  	return dma_addr;
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1246  }
4e8b0cf46b2570 Nishanth Aravamudan  2011-02-10  1247  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ibTvN161/egqYuK8
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
48AR/n9W0EDxIoYCAA==

--ibTvN161/egqYuK8--
