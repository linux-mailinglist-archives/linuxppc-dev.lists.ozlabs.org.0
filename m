Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8BF788E63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 20:16:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kEZ7Vqwa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXSnH2FrNz303p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 04:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kEZ7Vqwa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXSmJ0fxkz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 04:15:11 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PI6rIq031177;
	Fri, 25 Aug 2023 18:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NeXVYWHkVo+QL2tc3Wf4sqBVf7FNluO78WFdmMiRrBU=;
 b=kEZ7Vqwap8o9dWigtL2QMK0IRZccw1DLmwOL+4c4mv/31rVk2CwuVDr4LAV46uNUOnDt
 SmNekR2iAqmucijCXjh4JG0CaRq4jYbiIDzSY5o5QnRv+zFkQ/f4fkEvDmLp14d1vPwX
 3ebQNBJWyg+zqQTDxtGy6RRd+HBypB6eD7BLnpk20I63bw7Om6BZqxPhXMCBfp7GBYHv
 3rU0oqG4OCXvpIMwhatZNwl6bviwD4OsFPneEMqqOhButhXQihAJOS7HJhTaOVe6YF0U
 2BmR3a6hSBWZ+Rb9FSjiygnQswsG2NM5n0GSIEJSK43lmrRRBD1imI3ONnSnFgqxaHn0 tw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sq0p092pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 18:14:56 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PHrDmY027333;
	Fri, 25 Aug 2023 18:14:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn20t1mjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 18:14:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PIEqFR24314394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 18:14:52 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6446E20040;
	Fri, 25 Aug 2023 18:14:52 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E757820043;
	Fri, 25 Aug 2023 18:14:50 +0000 (GMT)
Received: from [9.43.10.206] (unknown [9.43.10.206])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 18:14:50 +0000 (GMT)
Message-ID: <f7a8070c-ee4e-c485-487b-a5da860a1330@linux.ibm.com>
Date: Fri, 25 Aug 2023 23:44:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [powerpc:next 84/128] arch/powerpc/mm/init_64.c:477:38: error:
 use of undeclared identifier 'SECTION_SIZE_BITS'
To: kernel test robot <lkp@intel.com>
References: <202308251532.k9PpWEAD-lkp@intel.com>
Content-Language: en-US
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <202308251532.k9PpWEAD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oF6YQjjPGp9Ammrv8J5rP6yhmKVFOsuw
X-Proofpoint-GUID: oF6YQjjPGp9Ammrv8J5rP6yhmKVFOsuw
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_16,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250162
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
Cc: Reza Arbab <arbab@linux.ibm.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/25/23 12:39 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> head:   b9bbbf4979073d5536b7650decd37fcb901e6556
> commit: 4d15721177d539d743fcf31d7bb376fb3b81aeb6 [84/128] powerpc/mm: Cleanup memory block size probing
> config: powerpc64-randconfig-r005-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251532.k9PpWEAD-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251532.k9PpWEAD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308251532.k9PpWEAD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> arch/powerpc/mm/init_64.c:477:38: error: use of undeclared identifier 'SECTION_SIZE_BITS'
>      477 |         unsigned long section_size = 1UL << SECTION_SIZE_BITS;
>          |                                             ^
>    arch/powerpc/mm/init_64.c:510:18: error: use of undeclared identifier 'SECTION_SIZE_BITS'
>      510 |                         *block_size = MIN_MEMORY_BLOCK_SIZE;
>          |                                       ^
>    include/linux/memory.h:23:43: note: expanded from macro 'MIN_MEMORY_BLOCK_SIZE'
>       23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
>          |                                           ^
>    2 errors generated.
> 
> 
> vim +/SECTION_SIZE_BITS +477 arch/powerpc/mm/init_64.c
> 
>    474	
>    475	static void update_memory_block_size(unsigned long *block_size, unsigned long mem_size)
>    476	{
>  > 477		unsigned long section_size = 1UL << SECTION_SIZE_BITS;
>    478	
>    479		for (; *block_size > section_size; *block_size >>= 2) {
>    480	
>    481			if ((mem_size & *block_size) == 0)
>    482				break;
>    483		}
>    484	}
>    485	
> 

Not a nice fix: 

modified   arch/powerpc/mm/init_64.c
@@ -472,11 +472,17 @@ static int __init dt_scan_mmu_pid_width(unsigned long node,
 	return 1;
 }
 
+#ifndef CONFIG_MEMORY_HOTPLUG
+#define MEMORY_BLOCK_SIZE     SZ_16M
+#else
+#define MEMORY_BLOCK_SIZE MIN_MEMORY_BLOCK_SIZE
+#endif
+
 static void update_memory_block_size(unsigned long *block_size, unsigned long mem_size)
 {
-	unsigned long section_size = 1UL << SECTION_SIZE_BITS;
+	unsigned long min_memory_block_size = MEMORY_BLOCK_SIZE;
 
-	for (; *block_size > section_size; *block_size >>= 2) {
+	for (; *block_size > min_memory_block_size; *block_size >>= 2) {
 
 		if ((mem_size & *block_size) == 0)
 			break;
@@ -507,7 +513,7 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 			/*
 			 * Nothing in the device tree
 			 */
-			*block_size = MIN_MEMORY_BLOCK_SIZE;
+			*block_size = MEMORY_BLOCK_SIZE;
 		else
 			*block_size = of_read_number(prop, dt_root_size_cells);
 		/*


