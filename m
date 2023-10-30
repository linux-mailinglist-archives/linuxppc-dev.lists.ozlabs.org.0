Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B31B7DB4A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 08:58:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdMsFA6Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJly3718Cz3cP7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 18:58:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdMsFA6Z;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJlx83vPfz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 18:57:32 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SJlx50179z4wcX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 18:57:28 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SJlx46nRTz4xDB; Mon, 30 Oct 2023 18:57:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdMsFA6Z;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SJlx44V4pz4wcX
	for <linuxppc-dev@ozlabs.org>; Mon, 30 Oct 2023 18:57:28 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39U7BHrb015037;
	Mon, 30 Oct 2023 07:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=x0DHrCrbA3J0aEmgZ2ZvFDDkwNYNZ9zfSIbaGC8A9BM=;
 b=YdMsFA6ZjIVOyhlTTnA5EoPiCZCd5H6IpmegwJPLt9LawV2RXxB/ray400J5QPEY+8eL
 kTRKawZ647fqYP09G4a8eAFajgRP5g85oHBk8KQUwox14r0kMdRY9/RfSs3TICPnBXoy
 NwYyAltG+BiRedd/Fb7FthZy0Ih/oaD5nraRAjaR09w5IJKdflUPS9cDkGfaavzJ41Ml
 6JBIBaKNMDkK8Mc++XZWjPbR2o6RXkzSnvqlUaQEXSUN6guWIUY/y5wpd2zAXE+bWH9x
 QYY1zeAmqLxPD8hB6s35LliPI4g5A0nz36mPY4NyZtgDeDQfIq7UIORCxFLnIncSih2P QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u251p4xjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 07:57:01 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39U7KjNw024225;
	Mon, 30 Oct 2023 07:57:00 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u251p4xj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 07:57:00 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39U5cHsw007713;
	Mon, 30 Oct 2023 07:56:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u1dmn7kex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 07:56:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39U7utEk18940668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 07:56:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98C6D2004B;
	Mon, 30 Oct 2023 07:56:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C036820040;
	Mon, 30 Oct 2023 07:56:51 +0000 (GMT)
Received: from [9.43.56.123] (unknown [9.43.56.123])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Oct 2023 07:56:51 +0000 (GMT)
Message-ID: <d6e87443-4402-402f-9c98-449cc9fd158f@linux.ibm.com>
Date: Mon, 30 Oct 2023 13:26:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/6] powerpc: add crash memory hotplug support
To: kernel test robot <lkp@intel.com>, linuxppc-dev@ozlabs.org
References: <20231029124039.6158-7-sourabhjain@linux.ibm.com>
 <202310300812.yN6FuPcZ-lkp@intel.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <202310300812.yN6FuPcZ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YUg_rupIguVp5iY-e6851HQxd-kryJB5
X-Proofpoint-ORIG-GUID: K7-O8qPNq3ZpO55X5WXf8VxaqHoKC1AI
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_06,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300059
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Eric DeVolder <eric.devolder@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Borislav Petkov <bp@alien8.de>, oe-kbuild-all@lists.linux.dev, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 30/10/23 06:13, kernel test robot wrote:
> Hi Sourabh,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.6-rc7]
> [cannot apply to powerpc/next powerpc/fixes tip/x86/core next-20231027]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/crash-forward-memory_notify-arg-to-arch-crash-hotplug-handler/20231029-213858
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20231029124039.6158-7-sourabhjain%40linux.ibm.com
> patch subject: [PATCH v12 6/6] powerpc: add crash memory hotplug support
> config: powerpc64-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231030/202310300812.yN6FuPcZ-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300812.yN6FuPcZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310300812.yN6FuPcZ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     powerpc64-linux-ld: warning: discarding dynamic section .glink
>     powerpc64-linux-ld: warning: discarding dynamic section .plt
>     powerpc64-linux-ld: linkage table error against `add_opal_mem_range'
>     powerpc64-linux-ld: stubs don't match calculated size
>     powerpc64-linux-ld: can not build stubs: bad value
>     powerpc64-linux-ld: arch/powerpc/kexec/core_64.o: in function `get_crash_memory_ranges':
>     core_64.c:(.text+0x1010): undefined reference to `add_mem_range'
>     powerpc64-linux-ld: core_64.c:(.text+0x1064): undefined reference to `sort_memory_ranges'
>     powerpc64-linux-ld: core_64.c:(.text+0x1128): undefined reference to `add_rtas_mem_range'
>     powerpc64-linux-ld: core_64.c:(.text+0x1140): undefined reference to `add_opal_mem_range'
>     powerpc64-linux-ld: core_64.c:(.text+0x1160): undefined reference to `add_mem_range'
>     powerpc64-linux-ld: core_64.c:(.text+0x1188): undefined reference to `sort_memory_ranges'
>     powerpc64-linux-ld: core_64.c:(.text+0x11e0): undefined reference to `realloc_mem_ranges'
>     powerpc64-linux-ld: arch/powerpc/kexec/core_64.o: in function `arch_crash_handle_hotplug_event':
>>> core_64.c:(.text+0x1900): undefined reference to `remove_mem_range'

The patch series uses a couple of functions defined in 
arch/powerpc/kexec/ranges.c. Since this file
only builds when CONFIG_KEXEC_FILE is set, we are encountering this 
build issue.

If CONFIG_KEXEC_FILE is set, then this issue is not observed.

I will fix the above warnings and post the next version.

Thanks,
Sourabh
