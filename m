Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD33489A09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 14:35:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXZb86GVDz30NN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 00:35:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XHPEzx3h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XHPEzx3h; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXZZQ0c8Xz2yNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 00:35:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641821710; x=1673357710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BLaGhAWIehRQcM1U5/7DpGlbIBtYb8hXB5v9pg/fvnw=;
 b=XHPEzx3hdFNLPY4Ik0krB5UO8BB/C2y/hrGQ09vLiHa/BsQNAptsLhDo
 z0EuEbCf4JuSFqrlgKD3mZmVo9+1gPibIcUuCNPb4STsbOcl32OpfUZmG
 mFXoxkNXG8DGazVskDa6w0Kw3dcooeN1KqfegEdcB9Dq1NCdcGcOzOl9k
 oMgoGdHdKThzBZPiAna1VRhoyJNpRUm4fh3LwKsVU+3jFr0YZuc6C86gH
 Pq4/tv+U+2nspGelrTyDhiq3Imwfn+h2hJB45Xkofh5nXrTfgGDMRK1XK
 CK3QBZsH1aWD6rlkdC9ShvG5RxDAYy8qmAifjiGCnT6R/GgZ9h2rr1EF8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243422520"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="243422520"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 05:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="474129435"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 10 Jan 2022 05:33:57 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n6uo8-0003Ws-L8; Mon, 10 Jan 2022 13:33:56 +0000
Date: Mon, 10 Jan 2022 21:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] powerpc/pseries: read the lpar name from the firmware
Message-ID: <202201102154.a95OQEPr-lkp@intel.com>
References: <20220106161339.74656-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106161339.74656-1-ldufour@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com,
 kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on linux/master linus/master v5.16 next-20220110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Laurent-Dufour/powerpc-pseries-read-the-lpar-name-from-the-firmware/20220107-001503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-r026-20220106 (https://download.01.org/0day-ci/archive/20220110/202201102154.a95OQEPr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5cf0dea6e919e93ff3088f87acd40e84608a6861
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Laurent-Dufour/powerpc-pseries-read-the-lpar-name-from-the-firmware/20220107-001503
        git checkout 5cf0dea6e919e93ff3088f87acd40e84608a6861
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/pseries/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/lparcfg.c:257: warning: Function parameter or member 'm' not described in 'parse_mpp_data'
   arch/powerpc/platforms/pseries/lparcfg.c:295: warning: Function parameter or member 'm' not described in 'parse_mpp_x_data'
   arch/powerpc/platforms/pseries/lparcfg.c:334: warning: Function parameter or member 'm' not described in 'read_RTAS_lpar_name'
>> arch/powerpc/platforms/pseries/lparcfg.c:334: warning: expecting prototype for Read the lpar name using the RTAS ibm,get-system(). Prototype was for read_RTAS_lpar_name() instead
>> arch/powerpc/platforms/pseries/lparcfg.c:378: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Read the LPAR name from the Device Tree.
   arch/powerpc/platforms/pseries/lparcfg.c:678: warning: Function parameter or member 'entitlement' not described in 'update_mpp'
   arch/powerpc/platforms/pseries/lparcfg.c:678: warning: Function parameter or member 'weight' not described in 'update_mpp'


vim +334 arch/powerpc/platforms/pseries/lparcfg.c

   323	
   324	/**
   325	 * Read the lpar name using the RTAS ibm,get-system-parameter call.
   326	 *
   327	 * The name read through this call is updated if changes are made by the end
   328	 * user on the hypervisor side.
   329	 *
   330	 * Some hypervisor (like Qemu) may not provide this value. In that case, a non
   331	 * null value is returned.
   332	 */
   333	static int read_RTAS_lpar_name(struct seq_file *m)
 > 334	{
   335		int rc, len, token;
   336		union {
   337			char raw_buffer[GET_SYS_PARM_BUF_SIZE];
   338			struct {
   339				__be16 len;
   340				char name[GET_SYS_PARM_BUF_SIZE-2];
   341			};
   342		} *local_buffer;
   343	
   344		token = rtas_token("ibm,get-system-parameter");
   345		if (token == RTAS_UNKNOWN_SERVICE)
   346			return -EINVAL;
   347	
   348		local_buffer = kmalloc(sizeof(*local_buffer), GFP_KERNEL);
   349		if (!local_buffer)
   350			return -ENOMEM;
   351	
   352		do {
   353			spin_lock(&rtas_data_buf_lock);
   354			memset(rtas_data_buf, 0, sizeof(*local_buffer));
   355			rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
   356				       __pa(rtas_data_buf), sizeof(*local_buffer));
   357			if (!rc)
   358				memcpy(local_buffer->raw_buffer, rtas_data_buf,
   359				       sizeof(local_buffer->raw_buffer));
   360			spin_unlock(&rtas_data_buf_lock);
   361		} while (rtas_busy_delay(rc));
   362	
   363		if (!rc) {
   364			/* Force end of string */
   365			len = min((int) be16_to_cpu(local_buffer->len),
   366				  (int) sizeof(local_buffer->name)-1);
   367			local_buffer->name[len] = '\0';
   368	
   369			seq_printf(m, "partition_name=%s\n", local_buffer->name);
   370		} else
   371			rc = -ENODATA;
   372	
   373		kfree(local_buffer);
   374		return rc;
   375	}
   376	
   377	/**
 > 378	 * Read the LPAR name from the Device Tree.
   379	 *
   380	 * The value read in the DT is not updated if the end-user is touching the LPAR
   381	 * name on the hypervisor side.
   382	 */
   383	static int read_DT_lpar_name(struct seq_file *m)
   384	{
   385		struct device_node *rootdn;
   386		const char *name;
   387	
   388		rootdn = of_find_node_by_path("/");
   389		if (!rootdn)
   390			return -ENOENT;
   391	
   392		name = of_get_property(rootdn, "ibm,partition-name", NULL);
   393		if (!name)
   394			return -ENOENT;
   395	
   396		seq_printf(m, "partition_name=%s\n", name);
   397		return 0;
   398	}
   399	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
