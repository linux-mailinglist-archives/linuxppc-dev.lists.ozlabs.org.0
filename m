Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E123C9FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 12:47:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM7c11ln8zDqY6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 20:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM7X46PK3zDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 20:43:43 +1000 (AEST)
IronPort-SDR: CkdicH6TAsEsAK15mPZFHyRSgkHasRLRatOQzOLgotasaoJIjmwiw5aaAek+KygB14mRRN/sxe
 vzua4bky37tQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="140406186"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
 d="gz'50?scan'50,208,50";a="140406186"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 03:43:39 -0700
IronPort-SDR: zDlxRTG2piJt8w8UZcXUTO0wRr+3o3FAztZWO9KIg6F4otsRbsR7tlGLUPgJ0k/KeErvnJqxXG
 vfsJ5DG07wng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
 d="gz'50?scan'50,208,50";a="396879380"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2020 03:43:36 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3GtU-0000jh-1G; Wed, 05 Aug 2020 10:43:36 +0000
Date: Wed, 5 Aug 2020 18:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/drmem: Don't compute the NUMA node for each LMB
Message-ID: <202008051807.Vi8NDJtX%lkp@intel.com>
References: <20200805092858.64143-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20200805092858.64143-1-ldufour@linux.ibm.com>
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on linux/master linus/master v5.8 next-20200804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Laurent-Dufour/powerpc-drmem-Don-t-compute-the-NUMA-node-for-each-LMB/20200805-173213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-mpc885_ads_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/mm/drmem.c: In function 'init_drmem_v2_lmbs':
>> arch/powerpc/mm/drmem.c:457:8: error: 'struct drmem_lmb' has no member named 'nid'
     457 |     lmb->nid = first->nid;
         |        ^~
   arch/powerpc/mm/drmem.c:457:21: error: 'struct drmem_lmb' has no member named 'nid'
     457 |     lmb->nid = first->nid;
         |                     ^~

vim +457 arch/powerpc/mm/drmem.c

   397	
   398	static void __init init_drmem_v2_lmbs(const __be32 *prop)
   399	{
   400		struct drmem_lmb *lmb, *first;
   401		struct of_drconf_cell_v2 dr_cell;
   402		const __be32 *p;
   403		u32 i, j, lmb_sets;
   404		int lmb_index;
   405	
   406		lmb_sets = of_read_number(prop++, 1);
   407		if (lmb_sets == 0)
   408			return;
   409	
   410		/* first pass, calculate the number of LMBs */
   411		p = prop;
   412		for (i = 0; i < lmb_sets; i++) {
   413			read_drconf_v2_cell(&dr_cell, &p);
   414			drmem_info->n_lmbs += dr_cell.seq_lmbs;
   415		}
   416	
   417		drmem_info->lmbs = kcalloc(drmem_info->n_lmbs, sizeof(*lmb),
   418					   GFP_KERNEL);
   419		if (!drmem_info->lmbs)
   420			return;
   421	
   422		/* second pass, read in the LMB information */
   423		lmb_index = 0;
   424		p = prop;
   425		first = NULL;
   426	
   427		for (i = 0; i < lmb_sets; i++) {
   428			read_drconf_v2_cell(&dr_cell, &p);
   429	
   430			/*
   431			 * Fetch the NUMA node id for the fist set or if the
   432			 * associativity index is different from the previous set.
   433			 */
   434			if (first && dr_cell.aa_index != first->aa_index)
   435				first = NULL;
   436	
   437			for (j = 0; j < dr_cell.seq_lmbs; j++) {
   438				lmb = &drmem_info->lmbs[lmb_index++];
   439	
   440				lmb->base_addr = dr_cell.base_addr;
   441				dr_cell.base_addr += drmem_info->lmb_size;
   442	
   443				lmb->drc_index = dr_cell.drc_index;
   444				dr_cell.drc_index++;
   445	
   446				lmb->aa_index = dr_cell.aa_index;
   447				lmb->flags = dr_cell.flags;
   448	
   449				/*
   450				 * All the LMB in the set share the same NUMA
   451				 * associativity property. So read that node only once.
   452				 */
   453				if (!first) {
   454					lmb_set_nid(lmb);
   455					first = lmb;
   456				} else {
 > 457					lmb->nid = first->nid;
   458				}
   459			}
   460		}
   461	}
   462	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--Q68bSM7Ycu6FN28Q
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Q68bSM7Ycu6FN28Q--
