Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0C224FF2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jul 2020 08:37:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B8Zs81GLLzDqs3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jul 2020 16:37:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B8ZqB1LVzzDqHm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 16:35:17 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06J6WiId004874; Sun, 19 Jul 2020 02:35:07 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bwmjtyq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Jul 2020 02:35:07 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06J6JRZ5018676;
 Sun, 19 Jul 2020 06:35:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 32brq87ssn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Jul 2020 06:35:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06J6Z5rc12255606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Jul 2020 06:35:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDD57112064;
 Sun, 19 Jul 2020 06:35:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D878112062;
 Sun, 19 Jul 2020 06:35:04 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.75.204])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 19 Jul 2020 06:35:03 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next-test 103/106]
 arch/powerpc/mm/book3s64/radix_pgtable.c:513:21: error: use of undeclared
 identifier 'SECTION_SIZE_BITS'
In-Reply-To: <202007190428.5Q47y2Gy%lkp@intel.com>
References: <202007190428.5Q47y2Gy%lkp@intel.com>
Date: Sun, 19 Jul 2020 12:05:01 +0530
Message-ID: <87zh7w108a.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-18_13:2020-07-17,
 2020-07-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 clxscore=1011 mlxscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007190048
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
Cc: clang-built-linux@googlegroups.com, Bharata B Rao <bharata@linux.ibm.com>,
 kbuild-all@lists.01.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   5fed3b3e21db21f9a7002426f456fd3a8a8c0772
> commit: 21407f39b9d547da527ad5224c4323e1f62bb514 [103/106] powerpc/mm/radix: Create separate mappings for hot-plugged memory
> config: powerpc-randconfig-r016-20200719 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project ed6b578040a85977026c93bf4188f996148f3218)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         git checkout 21407f39b9d547da527ad5224c4323e1f62bb514
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> arch/powerpc/mm/book3s64/radix_pgtable.c:513:21: error: use of undeclared identifier 'SECTION_SIZE_BITS'
>                    *mem_block_size = MIN_MEMORY_BLOCK_SIZE;
>                                      ^
>    include/linux/memory.h:24:43: note: expanded from macro 'MIN_MEMORY_BLOCK_SIZE'
>    #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
>                                              ^
>    arch/powerpc/mm/book3s64/radix_pgtable.c:521:33: error: use of undeclared identifier 'SECTION_SIZE_BITS'
>            unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
>                                           ^
>    include/linux/memory.h:24:43: note: expanded from macro 'MIN_MEMORY_BLOCK_SIZE'
>    #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
>                                              ^
>    2 errors generated.
>
> vim +/SECTION_SIZE_BITS +513 arch/powerpc/mm/book3s64/radix_pgtable.c
>
>    494	
>    495	static int __init probe_memory_block_size(unsigned long node, const char *uname, int
>    496						  depth, void *data)
>    497	{
>    498		unsigned long *mem_block_size = (unsigned long *)data;
>    499		const __be64 *prop;
>    500		int len;
>    501	
>    502		if (depth != 1)
>    503			return 0;
>    504	
>    505		if (strcmp(uname, "ibm,dynamic-reconfiguration-memory"))
>    506			return 0;
>    507	
>    508		prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
>    509		if (!prop || len < sizeof(__be64))
>    510			/*
>    511			 * Nothing in the device tree
>    512			 */
>  > 513			*mem_block_size = MIN_MEMORY_BLOCK_SIZE;
>    514		else
>    515			*mem_block_size = be64_to_cpup(prop);
>    516		return 1;
>    517	}
>    518	
>

 arch/powerpc/mm/book3s64/radix_pgtable.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index bba45fc0b7b2..c5bf2ef73c36 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -492,6 +492,7 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
 	return 1;
 }
 
+#ifdef CONFIG_MEMORY_HOTPLUG
 static int __init probe_memory_block_size(unsigned long node, const char *uname, int
 					  depth, void *data)
 {
@@ -532,6 +533,15 @@ static unsigned long radix_memory_block_size(void)
 	return mem_block_size;
 }
 
+#else   /* CONFIG_MEMORY_HOTPLUG */
+
+static unsigned long radix_memory_block_size(void)
+{
+	return 1UL * 1024 * 1024 * 1024;
+}
+
+#endif /* CONFIG_MEMORY_HOTPLUG */
+
 
 void __init radix__early_init_devtree(void)
 {
-- 
2.26.2


-aneesh
