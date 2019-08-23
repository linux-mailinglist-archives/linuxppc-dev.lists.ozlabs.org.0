Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB3C9B44B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 18:11:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FRGq3ckpzDsN0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 02:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FRDh3JbwzDrnP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 02:09:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=intel.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46FRDd6Qtnz8t6f
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 02:09:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46FRDd64BZz9s7T; Sat, 24 Aug 2019 02:09:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46FRDc5SJkz9s3Z
 for <linuxppc-dev@ozlabs.org>; Sat, 24 Aug 2019 02:09:30 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 09:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; 
 d="gz'50?scan'50,208,50";a="186905009"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2019 09:09:23 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i1C7v-0005X1-50; Sat, 24 Aug 2019 00:09:23 +0800
Date: Sat, 24 Aug 2019 00:08:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/powernv: Add ultravisor message log interface
Message-ID: <201908240021.3IWqQ9kj%lkp@intel.com>
References: <20190823060654.28842-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ejtv5uewy7gvqfux"
Content-Disposition: inline
In-Reply-To: <20190823060654.28842-1-cclaudio@linux.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@ozlabs.org, Ryan Grimm <grimm@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, kbuild-all@01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ejtv5uewy7gvqfux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Claudio,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc5 next-20190823]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Claudio-Carvalho/powerpc-powernv-Add-ultravisor-message-log-interface/20190823-214650
config: powerpc-defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/lppaca.h:48:0,
                    from arch/powerpc/include/asm/paca.h:17,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:16,
                    from arch/powerpc/include/asm/io.h:27,
                    from arch/powerpc/platforms/powernv/opal-msglog.c:8:
   arch/powerpc/platforms/powernv/opal-msglog.c: In function 'opal_msglog_init':
>> arch/powerpc/platforms/powernv/opal-msglog.c:159:27: error: 'FW_FEATURE_ULTRAVISOR' undeclared (first use in this function); did you mean 'FW_FEATURE_ALWAYS'?
     if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
                              ^
   arch/powerpc/include/asm/firmware.h:120:25: note: in definition of macro 'firmware_has_feature'
     ((FW_FEATURE_ALWAYS & (feature)) ||    \
                            ^~~~~~~
   arch/powerpc/platforms/powernv/opal-msglog.c:159:27: note: each undeclared identifier is reported only once for each function it appears in
     if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
                              ^
   arch/powerpc/include/asm/firmware.h:120:25: note: in definition of macro 'firmware_has_feature'
     ((FW_FEATURE_ALWAYS & (feature)) ||    \
                            ^~~~~~~
   arch/powerpc/platforms/powernv/opal-msglog.c: In function 'opal_msglog_sysfs_init':
   arch/powerpc/platforms/powernv/opal-msglog.c:181:27: error: 'FW_FEATURE_ULTRAVISOR' undeclared (first use in this function); did you mean 'FW_FEATURE_ALWAYS'?
     if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
                              ^
   arch/powerpc/include/asm/firmware.h:120:25: note: in definition of macro 'firmware_has_feature'
     ((FW_FEATURE_ALWAYS & (feature)) ||    \
                            ^~~~~~~

vim +159 arch/powerpc/platforms/powernv/opal-msglog.c

   > 8	#include <asm/io.h>
     9	#include <asm/opal.h>
    10	#include <linux/debugfs.h>
    11	#include <linux/of.h>
    12	#include <linux/types.h>
    13	#include <asm/barrier.h>
    14	#include <asm/firmware.h>
    15	
    16	/* OPAL in-memory console. Defined in OPAL source at core/console.c */
    17	struct memcons {
    18		__be64 magic;
    19	#define MEMCONS_MAGIC	0x6630696567726173L
    20		__be64 obuf_phys;
    21		__be64 ibuf_phys;
    22		__be32 obuf_size;
    23		__be32 ibuf_size;
    24		__be32 out_pos;
    25	#define MEMCONS_OUT_POS_WRAP	0x80000000u
    26	#define MEMCONS_OUT_POS_MASK	0x00ffffffu
    27		__be32 in_prod;
    28		__be32 in_cons;
    29	};
    30	
    31	static struct memcons *opal_memcons = NULL;
    32	static struct memcons *opal_uv_memcons;
    33	
    34	static ssize_t msglog_copy(struct memcons *memcons, const char *bin_attr_name,
    35				   char *to, loff_t pos, size_t count)
    36	{
    37		const char *conbuf;
    38		ssize_t ret;
    39		size_t first_read = 0;
    40		uint32_t out_pos, avail;
    41	
    42		if (!memcons)
    43			return -ENODEV;
    44	
    45		out_pos = be32_to_cpu(READ_ONCE(memcons->out_pos));
    46	
    47		/* Now we've read out_pos, put a barrier in before reading the new
    48		 * data it points to in conbuf. */
    49		smp_rmb();
    50	
    51		conbuf = phys_to_virt(be64_to_cpu(memcons->obuf_phys));
    52	
    53		/* When the buffer has wrapped, read from the out_pos marker to the end
    54		 * of the buffer, and then read the remaining data as in the un-wrapped
    55		 * case. */
    56		if (out_pos & MEMCONS_OUT_POS_WRAP) {
    57	
    58			out_pos &= MEMCONS_OUT_POS_MASK;
    59			avail = be32_to_cpu(memcons->obuf_size) - out_pos;
    60	
    61			ret = memory_read_from_buffer(to, count, &pos,
    62					conbuf + out_pos, avail);
    63	
    64			if (ret < 0)
    65				goto out;
    66	
    67			first_read = ret;
    68			to += first_read;
    69			count -= first_read;
    70			pos -= avail;
    71	
    72			if (count <= 0)
    73				goto out;
    74		}
    75	
    76		/* Sanity check. The firmware should not do this to us. */
    77		if (out_pos > be32_to_cpu(memcons->obuf_size)) {
    78			pr_err("OPAL: %s corruption. Aborting read.\n", bin_attr_name);
    79			return -EINVAL;
    80		}
    81	
    82		ret = memory_read_from_buffer(to, count, &pos, conbuf, out_pos);
    83	
    84		if (ret < 0)
    85			goto out;
    86	
    87		ret += first_read;
    88	out:
    89		return ret;
    90	}
    91	
    92	#define BIN_ATTR_NAME_OPAL	"msglog"
    93	#define BIN_ATTR_NAME_UV	"uv_msglog"
    94	
    95	ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
    96	{
    97		return msglog_copy(opal_memcons, BIN_ATTR_NAME_OPAL, to, pos,
    98				   count);
    99	}
   100	
   101	static ssize_t opal_msglog_read(struct file *file, struct kobject *kobj,
   102					struct bin_attribute *bin_attr, char *to,
   103					loff_t pos, size_t count)
   104	{
   105		return msglog_copy(opal_memcons, BIN_ATTR_NAME_OPAL, to, pos,
   106				   count);
   107	}
   108	
   109	static ssize_t opal_uv_msglog_read(struct file *file, struct kobject *kobj,
   110					   struct bin_attribute *bin_attr, char *to,
   111					   loff_t pos, size_t count)
   112	{
   113		return msglog_copy(opal_uv_memcons, BIN_ATTR_NAME_UV, to, pos,
   114				   count);
   115	}
   116	
   117	static struct bin_attribute opal_msglog_attr = {
   118		.attr = {.name = BIN_ATTR_NAME_OPAL, .mode = 0400},
   119		.read = opal_msglog_read
   120	};
   121	
   122	static struct bin_attribute opal_uv_msglog_attr = {
   123		.attr = {.name = BIN_ATTR_NAME_UV, .mode = 0400},
   124		.read = opal_uv_msglog_read
   125	};
   126	
   127	static void __init msglog_init(struct memcons **memcons,
   128				       struct bin_attribute *bin_attr,
   129				       const char *dt_prop_name)
   130	{
   131		u64 memcons_addr;
   132	
   133		if (of_property_read_u64(opal_node, dt_prop_name, &memcons_addr)) {
   134			pr_warn("OPAL: Property '%s' not found, no message log\n",
   135				dt_prop_name);
   136			return;
   137		}
   138	
   139		*memcons = phys_to_virt(memcons_addr);
   140		if (!(*memcons)) {
   141			pr_warn("OPAL: '%s' address is invalid\n", dt_prop_name);
   142			return;
   143		}
   144	
   145		if (be64_to_cpu((*memcons)->magic) != MEMCONS_MAGIC) {
   146			pr_warn("OPAL: '%s' version is invalid\n", dt_prop_name);
   147			*memcons = NULL;
   148			return;
   149		}
   150	
   151		/* Report maximum size */
   152		bin_attr->size = be32_to_cpu((*memcons)->ibuf_size) +
   153				 be32_to_cpu((*memcons)->obuf_size);
   154	}
   155	
   156	void __init opal_msglog_init(void)
   157	{
   158		msglog_init(&opal_memcons, &opal_msglog_attr, "ibm,opal-memcons");
 > 159		if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
   160			msglog_init(&opal_uv_memcons, &opal_uv_msglog_attr,
   161				    "ibm,opal-uv-memcons");
   162	}
   163	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--ejtv5uewy7gvqfux
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
eod08HmdAQA=

--ejtv5uewy7gvqfux--
