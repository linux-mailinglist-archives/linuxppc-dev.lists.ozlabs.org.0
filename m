Return-Path: <linuxppc-dev+bounces-14950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D10CD960F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 13:57:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbFRJ1X43z2yF1;
	Tue, 23 Dec 2025 23:57:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766494668;
	cv=none; b=iaMQPj13pUA82MN9JEA/Sv2KvjerxeRBcrnYYU3oojkVyYMJYxU1fS6wik430/CHZ0BeT/sTOvuagU3P1rUpAtpKFgHgplOQMKb0MPA/bkPvw7YAbZh0i8rX3b8yfS5lvnyi4jcL+sNjys/PvSJo3kqB+JWSjCN7QcE08AKmKbcaoUnoPlOJ1xiw7TxpBs2ZNnPPoK4xFxUcjxB08+d5PmQYvWnoxooJjxOwP3b7cF176ohiLAleLFGwokljiof2MQTpniAqT1/7jetPQUpSkK7cLmM2aQPiiY3wJ/IwOLJM95p0mGMXXfCGbplMZFuxZQuhoZppiUOdNLdi3KfeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766494668; c=relaxed/relaxed;
	bh=EojjdwTpV0a0uzjajItXh7sM23uq+A0hHxp8F5KWUk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fufuBiFGBzf/zO03zHZ3BMt6Ps89kh3skpa8fFrGWBupUhsJCqGvgGFUPkmN3O7gDjScH7fnk149dF9Y1du5zGpZaHGG/YK27KnJG8GotIF8v4LdTrgJbbGUYyP3tPj2FKsdtnNVS1mlr1fUk+eO/3qX4UNoNntjrG0ea3TnGU4gxJ26gh2gvqP6l7G6Yr6X/Rs/JuZ+3yTwLVIqArol3c6kDdzK18uPeL8Rg+jEhr0O6mPq3io2rmgvrJP8DiiXJdLLh1UPP4ck5OoLYdKXpVUVZ0kI29Wvk2G8C2bbc5NHARIpd9sQciqvBkM7HnLfYa2Yhu9uUx6unvaJoqlEAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lVdxw+iX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lVdxw+iX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbFRG2pDQz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 23:57:45 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BN7Uw92010872;
	Tue, 23 Dec 2025 12:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Eojjdw
	TpV0a0uzjajItXh7sM23uq+A0hHxp8F5KWUk8=; b=lVdxw+iXQcJtO8zKfjPYCH
	hG+usMvldov/yN7zBnRn5knwVyf88zk6MZI9JQDYe1HEOXm+VESXTnZY0yJ+gRJc
	uKQxF3NNCixK3bIXrYFDuXGWuNjZ3qPz/HIO3IQ3CLk9uo+tMd71VFyjslcrU2Zc
	2+nlffIeoa16flWGdznt9BhAMm1Hz7m9RHElKQVngmpLgoJ/dOmFQzIBixQ/RUwD
	vQY2T2upXAD+D7mv9kODPgd26tQryp6N9mlTFkjexrrpDyTID6jGAZ+OTvLN0Y6t
	St7CSlq97ttGnVEunLb5dXp3A66XHAKEnLihArSzwIecJLV2GLK9ZdWivSNSOWeQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5j7e4j5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:57:28 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BNCjeFs026492;
	Tue, 23 Dec 2025 12:57:28 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5j7e4j5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:57:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BNAAxjk004608;
	Tue, 23 Dec 2025 12:57:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b674mu6w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 12:57:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BNCvNQn29950388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Dec 2025 12:57:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51EC52004B;
	Tue, 23 Dec 2025 12:57:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D0D220040;
	Tue, 23 Dec 2025 12:57:21 +0000 (GMT)
Received: from [9.39.22.157] (unknown [9.39.22.157])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 Dec 2025 12:57:21 +0000 (GMT)
Message-ID: <fb309e19-9c2c-492c-abac-8aa6031f3124@linux.ibm.com>
Date: Tue, 23 Dec 2025 18:27:19 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect type
 in assignment (different base types)
To: kernel test robot <lkp@intel.com>, Ben Collins <bcollins@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        shivang upadhyay <shivangu@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Hari Bathini <hbathini@linux.ibm.com>
References: <202512221405.VHPKPjnp-lkp@intel.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <202512221405.VHPKPjnp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=G8YR0tk5 c=1 sm=1 tr=0 ts=694a91b8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=hGzw-44bAAAA:8 a=wMNdZWldAAAA:8 a=O1bWE6anNRU1bnsqH8UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22 a=HvKuF1_PTVFglORKqfwH:22
 a=FUarYpL4UH3yWsho8X8J:22
X-Proofpoint-ORIG-GUID: 0VKgn2tWtb28lJapprSFjPooqxXsfezw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwNCBTYWx0ZWRfX08SD5BX2iqN5
 l5db5UF/5dA/BY8pWb5UbYdDruDf41k7jRltMYlxCDGmM+EqALB895v90xvctQ34dS1G9bor23a
 oZevOVNnv4B9n3LwI2EjgU9WaeQc0YOAPP7HAH6vn+V01ga3pjFxWFxQtaiaFzYwK6LrqbkWGdG
 LAw8IfvHAdrZTl18zQJvstVuBZk24kPqviM3xg5+7vocFpoYpu6ITkMZnbc6QX6F9M+W9FyhzUM
 U7GVsX7GP3zqHlLUnZ65MVGDaU4jOaiRiW7a8B5fBUobndaznDCoGxVTY0oseQqtKUbq86VhtJn
 jGVVREMgIiY51d8NbLsLgBbVbgAYMu9y9Lkj4iytMQZ8SctSUJqqb2FxJeMTb0RAfK+NHt06u0/
 t1tHHN1LXQzmgaBxVHmat/uhHSwKwD7KPT7DWXqI7KNfZN6l+z7WRYGZOsH9j7rJqfwFDcIL7b7
 Pbqj4msipt7Gco7UHsg==
X-Proofpoint-GUID: MHHvmlOPd_Cmo5X4rH4gjnzdpaoutqZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512230104
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

+Cc: PowerPC mailing list.

and added some comments below.

On 22/12/25 12:14, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
> commit: 38c64dfe0af12778953846df5f259e913275cfe5 kexec: Include kernel-end even without crashkernel
> date:   6 weeks ago
> config: powerpc-randconfig-r111-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221405.VHPKPjnp-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221405.VHPKPjnp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512221405.VHPKPjnp-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int static [addressable] [toplevel] [usertype] kernel_end @@     got restricted __be32 [usertype] @@
>     arch/powerpc/kexec/core.c:217:20: sparse:     expected unsigned int static [addressable] [toplevel] [usertype] kernel_end
>     arch/powerpc/kexec/core.c:217:20: sparse:     got restricted __be32 [usertype]

If CONFIG_CRASH_DUMP is enabled (which is not done in config shared by 
kernel test robot) sparse warn
about other assignments in the same file. And these warnings are not 
limited to 32-bit.

../arch/powerpc/kexec/core.c:181:29: sparse: warning: incorrect type in 
assignment (different base types)
../arch/powerpc/kexec/core.c:181:29: sparse:    expected unsigned int 
static [addressable] [toplevel] [usertype] crashk_base
../arch/powerpc/kexec/core.c:181:29: sparse:    got restricted __be32 
[usertype]
../arch/powerpc/kexec/core.c:183:29: sparse: warning: incorrect type in 
assignment (different base types)
../arch/powerpc/kexec/core.c:183:29: sparse:    expected unsigned int 
static [addressable] [toplevel] [usertype] crashk_size
../arch/powerpc/kexec/core.c:183:29: sparse:    got restricted __be32 
[usertype]
../arch/powerpc/kexec/core.c:191:19: sparse: warning: incorrect type in 
assignment (different base types)
../arch/powerpc/kexec/core.c:191:19: sparse:    expected unsigned long 
long static [addressable] [toplevel] mem_limit
../arch/powerpc/kexec/core.c:191:19: sparse:    got restricted __be32 
[usertype]
../arch/powerpc/kexec/core.c:217:20: sparse: warning: incorrect type in 
assignment (different base types)
../arch/powerpc/kexec/core.c:217:20: sparse:    expected unsigned int 
static [addressable] [toplevel] [usertype] kernel_end
../arch/powerpc/kexec/core.c:217:20: sparse:    got restricted __be32 
[usertype]
   CHECK   ../arch/powerpc/kexec/core_32.c

To resolve these warnings:

Should we use __force tpyecast and silence the warnings?
for example:
kernel_end = (__force phys_addr_t) cpu_to_be_ulong(__pa(_end));

Or

Use proper data types __be<32|64> and duplicated the definition and 
assignment? seems like bit too much.

Or

Do we have better way to handle these warnings? If yes, please share.

- Sourabh Jain

>
> vim +217 arch/powerpc/kexec/core.c
>
> 6f29c3298b1821 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-17  203
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  204  static int __init kexec_setup(void)
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  205  {
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  206  	struct device_node *node;
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  207
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  208  	node = of_find_node_by_path("/chosen");
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  209  	if (!node)
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  210  		return -ENOENT;
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  211
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  212  	/* remove any stale properties so ours can be found */
> 38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     2025-04-21  213  	of_remove_property(node, of_find_property(node, kernel_end_prop.name,
> 38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     2025-04-21  214  						  NULL));
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  215
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  216  	/* information needed by userspace when using default_machine_kexec */
> ea961a828fe725 arch/powerpc/kernel/machine_kexec.c Anton Blanchard 2014-01-22 @217  	kernel_end = cpu_to_be_ulong(__pa(_end));
> 79d1c712958f94 arch/powerpc/kernel/machine_kexec.c Nathan Fontenot 2012-10-02  218  	of_add_property(node, &kernel_end_prop);
> 2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  219
>
> :::::: The code at line 217 was first introduced by commit
> :::::: ea961a828fe7250e954f086d74d9323c3d44c3e4 powerpc: Fix endian issues in kexec and crash dump code
>
> :::::: TO: Anton Blanchard <anton@samba.org>
> :::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>


