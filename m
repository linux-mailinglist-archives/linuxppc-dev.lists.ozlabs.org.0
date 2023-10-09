Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6DC7BE123
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 15:47:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bCMOkg0q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S40hP54fPz3cCH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 00:47:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bCMOkg0q;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S40gV1nxfz3c86
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:46:30 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4S40gV0Zqsz4xfZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:46:30 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4S40gV0WtMz4xfc; Tue, 10 Oct 2023 00:46:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bCMOkg0q;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4S40gT4hgcz4xfZ
	for <linuxppc-dev@ozlabs.org>; Tue, 10 Oct 2023 00:46:29 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399DjYTp006987;
	Mon, 9 Oct 2023 13:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Kx3R6TtZU7AYtUR7N+za+KZcz1OL85WVX7r0H6DMruo=;
 b=bCMOkg0qumQnPj8okQuzDs9gP3H5DmyhMqLDkUNqovMrANCyNlifoGuhNneiWRuc7YkN
 2ks1PE6xiCXyLbqZvRIRyIL9iXpFI+gAbj9uU7IJT2X45ZqJG+OBVttrvvjEsHMYxtD4
 u5Af50PXmu4yKRBRJKT9o0Hk29hy8QFobX/8FJ8Nb2/o9spFRjULtIXLE63gJg838hnS
 nxxTaUEw2CthQI6F51DE8d7ggrX1lYDU2bUGWp2xoVRYehd+qgD/xBKfPO7vulJzvQmC
 SH6100Y7qEiTRAkwgjW8VkI6clch2egZ/jcHlyQy1vb8NJUNVHVCQf9NkZYAOOQlOgFM wQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmjp7r15x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 13:46:16 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 399DW6X2001148;
	Mon, 9 Oct 2023 13:42:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvjgv1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 13:42:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 399DgC3R27722320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 13:42:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89F362004B;
	Mon,  9 Oct 2023 13:42:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 076CD20043;
	Mon,  9 Oct 2023 13:42:11 +0000 (GMT)
Received: from [9.43.23.140] (unknown [9.43.23.140])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 13:42:10 +0000 (GMT)
Message-ID: <d343ee0a-c518-0a4b-caa4-57004f607866@linux.ibm.com>
Date: Mon, 9 Oct 2023 19:12:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/3] powerpc: make fadump resilient with memory
 add/remove events
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20231009041953.36139-2-sourabhjain@linux.ibm.com>
 <202310091444.dryLmXy1-lkp@intel.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <202310091444.dryLmXy1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4-r4fMekIDi9Qc8i37D5TphKTgVhBIM3
X-Proofpoint-ORIG-GUID: 4-r4fMekIDi9Qc8i37D5TphKTgVhBIM3
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_11,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090113
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
Cc: mahesh@linux.vnet.ibm.com, adityag@linux.ibm.com, hbathini@linux.ibm.com, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Thank you for reporting the issue; we will fix this in v4.

- Sourabh

On 09/10/23 11:54, kernel test robot wrote:
> Hi Sourabh,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on powerpc/next]
> [also build test WARNING on powerpc/fixes linus/master v6.6-rc5 next-20231006]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-make-fadump-resilient-with-memory-add-remove-events/20231009-122519
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> patch link:    https://lore.kernel.org/r/20231009041953.36139-2-sourabhjain%40linux.ibm.com
> patch subject: [PATCH v3 1/3] powerpc: make fadump resilient with memory add/remove events
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310091444.dryLmXy1-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310091444.dryLmXy1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310091444.dryLmXy1-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     In file included from arch/powerpc/include/asm/mmu.h:143,
>                      from arch/powerpc/include/asm/paca.h:18,
>                      from arch/powerpc/include/asm/current.h:13,
>                      from include/linux/thread_info.h:23,
>                      from include/asm-generic/preempt.h:5,
>                      from ./arch/powerpc/include/generated/asm/preempt.h:1,
>                      from include/linux/preempt.h:79,
>                      from include/linux/spinlock.h:56,
>                      from include/linux/mmzone.h:8,
>                      from include/linux/gfp.h:7,
>                      from include/linux/mm.h:7,
>                      from include/linux/memblock.h:12,
>                      from arch/powerpc/kernel/fadump.c:18:
>     arch/powerpc/kernel/fadump.c: In function 'fadump_free_elfcorehdr_buf':
>>> arch/powerpc/include/asm/page.h:210:2: warning: passing argument 1 of 'fadump_free_buffer' makes integer from pointer without a cast [-Wint-conversion]
>       210 | ({                                                                      \
>           | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |  |
>           |  void *
>       211 |         VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);             \
>           |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       212 |         (void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);        \
>           |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       213 | })
>           | ~~
>     arch/powerpc/kernel/fadump.c:1401:28: note: in expansion of macro '__va'
>      1401 |         fadump_free_buffer(__va(fdh->elfcorehdr_addr), fdh->elfcorehdr_size);
>           |                            ^~~~
>     arch/powerpc/kernel/fadump.c:795:46: note: expected 'long unsigned int' but argument is of type 'void *'
>       795 | static void fadump_free_buffer(unsigned long vaddr, unsigned long size)
>           |                                ~~~~~~~~~~~~~~^~~~~
>
>
> vim +/fadump_free_buffer +210 arch/powerpc/include/asm/page.h
>
> c4bce84d0bd3f3 Michael Ellerman 2022-04-07  203
> bdbc29c19b2633 Paul Mackerras   2013-08-27  204  /*
> bdbc29c19b2633 Paul Mackerras   2013-08-27  205   * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
> bdbc29c19b2633 Paul Mackerras   2013-08-27  206   * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
> 4dd7554a6456d1 Nicholas Piggin  2019-07-24  207   * This also results in better code generation.
> bdbc29c19b2633 Paul Mackerras   2013-08-27  208   */
> 4dd7554a6456d1 Nicholas Piggin  2019-07-24  209  #define __va(x)								\
> 4dd7554a6456d1 Nicholas Piggin  2019-07-24 @210  ({									\
> c4bce84d0bd3f3 Michael Ellerman 2022-04-07  211  	VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);		\
> 4dd7554a6456d1 Nicholas Piggin  2019-07-24  212  	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
> 4dd7554a6456d1 Nicholas Piggin  2019-07-24  213  })
> 4dd7554a6456d1 Nicholas Piggin  2019-07-24  214
>

