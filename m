Return-Path: <linuxppc-dev+bounces-11590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6239B3ECFF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 19:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFwLP20Zwz2ywh;
	Tue,  2 Sep 2025 03:08:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756746493;
	cv=none; b=XR7HfVPXUzk1Nnp1nkzWuk5i5qS4Nbd1IkXMA8O3CjihzmMJzd2E9tJxSamxhQH/sKKTAyFdpzDFZlh2VH0CgsE9KinPxaI98wnBWbOvJ0n/vLFxBy+qAFGPusmvGvugWegj5ZcPGOmwuGgxdY48Ct98iZpwIuxRiv1MLxuUrEul0i7aGZM7PNfeSHXWmmRIeILLA0d1+y8TCnH6MMrgF8OvTIBTA1EGEgcp8eIPLH9wcS10nHYK5CE6JMTYikOQjhiwRIBfMfSPXztr26qjtRvLh1WzUvfg1a28T16LvH3vhAO66SQ9MIxxc2cZQ+F3+WUqgV1B2yFWyLN1OorLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756746493; c=relaxed/relaxed;
	bh=r7TOSxJvoSA+1s5N9qqBPrp+KwUNdbucdgWwePjfXTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQD6e8XicCkV6h79OxVSoTOnfd98SvEYqDy6UvGC3jo1/bBcDEy/W7VXCGdgdOIeAQD22Nv6DLPtuxYYM2Khl9aJ/vHZaKAnsyu/rTSB4xjXe/hU5Qh6OKMEK8YIIfFwA/tAIzwH7U2AsAZNn+11kgDxdO51T+b9Gh+c6wd8VJ6sEVQ1wV01v76wfF9DpNpcV9vY2bslqaX5n3mFZ8M2K/U+MfQejFlkn4XjCBinnh6R77iV6HlE6TxrSXwFZWw+/w8PY8ewPdWRwAwsCAaM1erVb6SWllIipIdmbDc8wqe088tdQvAoeb+Kq2hS0gXE4Vq2181PlN0yzd1cHDJsWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A23Zxf7S; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A23Zxf7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFwLM6bwTz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 03:08:11 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eiFa027567;
	Mon, 1 Sep 2025 17:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=r7TOSx
	JvoSA+1s5N9qqBPrp+KwUNdbucdgWwePjfXTs=; b=A23Zxf7SGvUD7i3F3A7Ihq
	Mgrdp6wxmrD3U107IbRRMfJWqB7w13pen1yCB1xmIclO/1lUJ46tYNSKh8sILjao
	HPWROA6XfF4sbwETXcp7VfjJB9U+G6Tco5q523VshsifiJgAUmFFiwhHWFksWhkg
	8TauF6MGWkOTu6iw6836TOQAQaq4qLI419RrL7I+D5P0bnZm/HgRXLKu86wOPKmo
	zaKeMooIIUN+8jfDd+SpyDrAvf9IIntvI9z7Kwc1Zu/Jfh30q1SXfdQOHh7vuShm
	npLWbBq78hUZptxsWLOw72zgApEXMLhXarSgUn82sXfidpdYN2oVuRpXOtxbDIZw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usvfhydc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 17:06:55 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 581H6tIo008017;
	Mon, 1 Sep 2025 17:06:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usvfhyd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 17:06:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 581Dghh7021191;
	Mon, 1 Sep 2025 17:06:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmpeupn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 17:06:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 581H6oSQ43385100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Sep 2025 17:06:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37D6620043;
	Mon,  1 Sep 2025 17:06:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3DDF20040;
	Mon,  1 Sep 2025 17:06:40 +0000 (GMT)
Received: from [9.124.217.216] (unknown [9.124.217.216])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Sep 2025 17:06:40 +0000 (GMT)
Message-ID: <8eadbf18-f930-41ab-bd0c-344f95324687@linux.ibm.com>
Date: Mon, 1 Sep 2025 22:36:39 +0530
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
Subject: Re: [PATCH v7 0/8] sched/fair: Get rid of sched_domains_curr_level
 hack for tl->cpumask()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, thomas.weissschuh@linutronix.de,
        Li Chen <chenl311@chinatelecom.cn>, Bibo Mao <maobibo@loongson.cn>,
        Mete Durlu <meted@linux.ibm.com>,
        Tobias Huschle <huschle@linux.ibm.com>,
        Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
        Guo Weikang <guoweikang.kernel@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Brian Gerst <brgerst@gmail.com>,
        Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andrea Righi <arighi@nvidia.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Vinicius Costa Gomes <vinicius.gomes@intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
 <20250826101328.GV4067720@noisy.programming.kicks-ass.net>
 <xhsmh7bymlg2f.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ec9ca8a-9ba9-4600-a7a2-f7bd790fca83@linux.ibm.com>
 <20250901085815.GE4067720@noisy.programming.kicks-ass.net>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250901085815.GE4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=behrUPPB c=1 sm=1 tr=0 ts=68b5d2b0 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Sj5KfFTFUvDWxMll-IgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ey1UAu3pK9f_WbwA0sN_jX0wb-cb_G0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX/QfoAP97NVM7
 XKphrqhfzjL/bZlQ33D04vSK/Y5g0HsDiqvirGGVLX9joP5tg9AhgxxKu6qmHaXWl0wlRQmQk5m
 GI4F78mcjE8S4/qpfTKnPlSvBnaccaQrUKJN0fiKXBuLB2idWkCGVV2CChSvkWv+rKtCt9hQpT2
 wio6oFLnztXEn/g7lLVTY/xLs+9fbiTOtCNzopCPaQ61Ip8PZoTJAW97xbD+TpEKxt9TVslvPh0
 sbTKVUpW9k/LnhUOK4kIPlR5UTX0coo3L4KN83ZlNSSOlzVrAjhEcf/QJaVWRqeZqmwnNg5Jc9p
 g7hYaPG3n5liTQvl1IQnRnxH3fthaFqyMin2gEvHocb8aVxhG6/sHu1L47Vw55L4ipo5eCDFLwo
 5jYAwNPn
X-Proofpoint-GUID: 90AWoj7fnTbaX3KKwPhpLIJMKqs0ANIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/1/25 2:28 PM, Peter Zijlstra wrote:
> On Fri, Aug 29, 2025 at 02:23:06PM +0530, Shrikanth Hegde wrote:
> 
>> I was looking at: https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/core
>>
>> Current code doesn't allow one to enable/disable SCHED_MC on ppc since it is set always in kconfig.
>> Used the below patch:
>>
>> I think since the config is there, it would be good to provide a option to disable. no?
> 
> So current PPC code has this MC thing unconditional. I've been
> preserving that behaviour. If PPC maintainers feel they want this
> selectable, I'm happy to include something like the below, but as a
> separate patch with a separate changelog that states this explicit
> choice.
> 

Fair enough. Will send it as separate patch.

>> ---
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index fc0d1c19f5a1..da5b2f8d3686 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -170,9 +170,8 @@ config PPC
>>   	select ARCH_STACKWALK
>>   	select ARCH_SUPPORTS_ATOMIC_RMW
>>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
>> -	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
>>   	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
>> -	select SCHED_MC				if ARCH_SUPPORTS_SCHED_MC
>> +	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
>>   	select ARCH_USE_BUILTIN_BSWAP
>>   	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
>>   	select ARCH_USE_MEMTEST
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index 68edb66c2964..458ec5bd859e 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -1706,10 +1706,12 @@ static void __init build_sched_topology(void)
>>   			SDTL_INIT(tl_cache_mask, powerpc_shared_cache_flags, CACHE);
>>   	}
>> +#ifdef CONFIG_SCHED_MC
>>   	if (has_coregroup_support()) {
>>   		powerpc_topology[i++] =
>>   			SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
>>   	}
>> +#endif
>>   	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_shared_proc_flags, PKG);
>>


If possible for below two, please consider tags.

https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/core&id=496d4cc3d478a662f90cce3a3e3be4af56f78a02
https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/core&id=a912f3e2c6d91f7ea7b294c02796b59af4f50078

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

for powerpc bits:
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>

