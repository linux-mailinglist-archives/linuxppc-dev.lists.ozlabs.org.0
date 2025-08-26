Return-Path: <linuxppc-dev+bounces-11314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1A4B359C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 12:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB3GC6qQ7z3dS0;
	Tue, 26 Aug 2025 20:06:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756202771;
	cv=none; b=czawiTOb0VZh6P/FFkqCHQCghb46TfmPSjw9R+sL6gLmmw37+GNf6JrUbPkoLWsIEpxIdGgUuIK41StBKOfLbMbuzyVyh6abwxeOGNONfikNNQQXQIQuWqrpp13taga0kpdJ2syi/VaRpz43Ur3+k1WzGh+uIJo/eXwbQ+TuHtVbxlYpeweMtfOcwm2BskYho8IxpVoXHwUhKgqIy06slcY2IxlCxxhGT3yPFoPV0bi8kX7H7MMg7Hl32JrJq0J8f0PZIoET555KcuTW5SiRE1O8EGKycOFPacL/644ZfdpHy1TX1KTsFtTKVjmvxS5QEXoYNNLR+Xz4K1Re3qOGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756202771; c=relaxed/relaxed;
	bh=yfEvTdP8OMZx3Uvax13oqPCUxjoe2ObopJrczyfNJ7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9wkYvxzrszQgbEJ/xb2k3TipKbaEREX98I36f4Do8gHPVfORhf9kQ00kN1SwsCMjQHuMmVhyg9tYLBt9PNMDwbvp+sxYbKqrhlgfzm4JrsaVDpJ+P22ruJ4lZte/Zdow00IqEepu/XlyFn0gL7k80aXn68S6TNWBKgkvldRp4M7QPYRJGKwpjZsse+EaW/K23EdFnRUS/eiCEKkMQtyaHeqiyDPeDxrPPlf/Fd56T14bteDngkzL1EixwemVCEtSNiiyo55DBzkpA3eDDn99/ptJimBwNFqqsiR5zPuoJBTHoSrsqidiyHDl7R9Jbl2WtdqHSbo09RWzPECSw6KxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PwkFVEvh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PwkFVEvh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB3G916q0z3dRQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 20:06:08 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q98Ol9008931;
	Tue, 26 Aug 2025 10:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=yfEvTd
	P8OMZx3Uvax13oqPCUxjoe2ObopJrczyfNJ7k=; b=PwkFVEvh8VEr2p5Z89g+G7
	OcRD8wOk3IHi1D1CAi1JRDiwMgrNq/mH1uMrJ5wrgUtdX5669JIIS2PrordjbLYx
	r2o6zFyo0G2cQeJHnTPfrt7CVjKR+R/1Zl55Eq27ejW7qVx7gfS7Gfepz6uy+PiM
	t798RVOKNR0cdyNuIILoe9zahFmALjK3A7KMRNpuF5b580rjISijF05XXU9R7lE+
	vv+nzdXjYlfmz1GSCVobSSnbvspkIRisRAiuA/VDIRJHo0VHcdjv2aFl72pNsL1x
	bWmivbCtcj01M0uNXsszMrM1HXfGU1FXKeYIUXAuzROIjYYmppKV/XxhLMiZGmGg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avdswj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:05:19 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57QA59qf025127;
	Tue, 26 Aug 2025 10:05:18 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avdswe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:05:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q7UgP8002543;
	Tue, 26 Aug 2025 10:05:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrypj6kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:05:17 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57QA5DIT50594212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Aug 2025 10:05:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3911E20063;
	Tue, 26 Aug 2025 10:05:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F5CC20040;
	Tue, 26 Aug 2025 10:05:04 +0000 (GMT)
Received: from [9.39.23.183] (unknown [9.39.23.183])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Aug 2025 10:05:04 +0000 (GMT)
Message-ID: <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
Date: Tue, 26 Aug 2025 15:35:03 +0530
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
To: K Prateek Nayak <kprateek.nayak@amd.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
        Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
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
        Madhavan Srinivasan <maddy@linux.ibm.com>,
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
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250826041319.1284-1-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uGQuBa1nC4_TybwDa_PF212jwdXWPegi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfXxUR18LG6id+8
 cifRDYAQOr1tXWx9SgcNQM6dWtDCpd6fZoA9ntMZMFc3a9etCqoFE7WvzJfIpYpPezhSUFgz2Qq
 wMaFsKnj4v5s/OI0GC1S7TyDdxJa2HFqaEbxkjcoc0P7W5kvLnkJZSpZsgh1kEwBTi5XKTfncVh
 x4TZUgi6iJedAUGPUI4PpUra8S58w7I/JCreN1vo7yqE7LNa1WzgM69ZI36f1fd9R40XaeDV0Jm
 wvjjwPsre0pom2Xn1oZtB+qNBFXG13X1cDeG3qjDt1zxKUSywd00dSqKQq26DxqqWXerOxyNp1i
 4mxSRZO0qHuBaN71FSfwhkFpXqd9q1S0zH1E8+p9Y9/P706KNzy02GMiorLUtGnrT4fo7cm5/kU
 61CxWupl
X-Proofpoint-ORIG-GUID: yP65Ia-GiOKTqCIl4llIBnzZIDcWEbSZ
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68ad86df cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=WsHKUha7AAAA:8
 a=zd2uoN0lAAAA:8 a=eqgBTtMHAimxLhlMCKkA:9 a=QEXdDO2ut3YA:10
 a=H4LAKuo8djmI0KOkngUh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/26/25 9:43 AM, K Prateek Nayak wrote:
> This version uses Peter's suggestion from [1] as if and incrementally
> adds cleanup on top to the arch/ bits. I've tested the x86 side but the
> PowerPC and the s390 bits are only build tested. Review and feedback is
> greatly appreciated.
> 
> [1] https://lore.kernel.org/lkml/20250825091910.GT3245006@noisy.programming.kicks-ass.net/
> 
> Patches are prepared on top of tip:master at commit 4628e5bbca91 ("Merge
> branch into tip/master: 'x86/tdx'")
> ---
> changelog v6..v7:
> 
> o Fix the s390 and ppc build errors (Intel test robot)
> 
> o Use Peter's diff as is and incrementally do the cleanup on top. The
>    PowerPC part was slightly more extensive due to the lack of
>    CONFIG_SCHED_MC in arch/powerpc/Kconfig.
> 
> v6: https://lore.kernel.org/lkml/20250825120244.11093-1-kprateek.nayak@amd.com/
> ---
> K Prateek Nayak (7):
>    powerpc/smp: Rename cpu_corgroup_* to cpu_corgrp_*
>    powerpc/smp: Export cpu_coregroup_mask()
>    powerpc/smp: Introduce CONFIG_SCHED_MC to guard MC scheduling bits
>    sched/topology: Unify tl_smt_mask() across core and all arch
>    sched/topology: Unify tl_cls_mask() across core and x86
>    sched/topology: Unify tl_mc_mask() across core and all arch
>    sched/topology: Unify tl_pkg_mask() across core and all arch
> 
> Peter Zijlstra (1):
>    sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
> 
Can the names be standardized to begin with tl_ ?

arch/powerpc/kernel/smp.c:			SDTL_INIT(smallcore_smt_mask, powerpc_smt_flags, SMT);
arch/powerpc/kernel/smp.c:			SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
arch/s390/kernel/topology.c:	SDTL_INIT(cpu_book_mask, NULL, BOOK),
arch/s390/kernel/topology.c:	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
kernel/sched/topology.c:	tl[i++] = SDTL_INIT(sd_numa_mask, NULL, NODE);
kernel/sched/topology.c:		tl[i] = SDTL_INIT(sd_numa_mask, cpu_numa_flags, NUMA);

