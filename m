Return-Path: <linuxppc-dev+bounces-13249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C4C045D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 07:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct9xS5wcTz30RJ;
	Fri, 24 Oct 2025 16:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761282716;
	cv=none; b=djoHmnxqyzY8pP5X/66BbOolvOeyiM/N6INFaieGKdeaaxCa7mRIXR+OGhXSoLwlv0elJ45YFChRW3IFtjJShKAJwA2PoVn5V0QDdqCD9R4UAXMGfHfOAYylP/ggCK8IOZPWNCiCNrp+B8CDfkAKurB70lXeTm5mxEhQjtoJjOHT4o/YqDPf0a2R+c2gTQnpbRmaP3iaGchgj2saVnOteCmiBhDnObarLNuNecv8u2ihA9Fh9duqwke0mN4HeI+5PvHpMP+Jgj2rqmXgF9GTX3rOKZD9RBsLbfU8ywszX0NC312yP+uX3WEYSmb6CHWpAwgOjribWzbQQXl0M+yQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761282716; c=relaxed/relaxed;
	bh=kfO6OcObvnQyI6NofyqiFmtJDExYNJ0QDmCFYZPT05Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FepRfypHac7aOcSHFkRIvZbkEKpqKttRs+AyJqblkuqrQEuCD3O9svFKS/MgZgkv5tZhR3BcGEKfpNjQhzN9VOJS0gxodlmjCbPbWrhNOOY2xkMZ0VMULVaYmnb72ufXGH/L0lKX/Avkh4soVi8iYaouoSNYZgMvoTrtMonzCXTFb6pe/Kdy1DYA3EimUV/iTc1wFN0bVHPAes4e4KDZvomph9M2JVdBAwCadMxAgkFmL6+uG/1flmELOo0m4PQqHMDqd5dtie1azpx1rTAR+3drPMrl+AA7+CDEQefF6e2T1c3OFVGHvmLUOMo95+FhC9+RdBFedstp6avdvXyWTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KZZSK6H6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KZZSK6H6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct9xR3f67z2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 16:11:54 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NFYQuU013852;
	Fri, 24 Oct 2025 05:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kfO6Oc
	ObvnQyI6NofyqiFmtJDExYNJ0QDmCFYZPT05Y=; b=KZZSK6H6TwVEFFwjcVnGdQ
	7qRj0URQEsc7CeY4GMFOwf56P3skLPXrtjsgVtchxj2HjS/OF0shO8CJtNjDQo9W
	KrSvgQ1tH7FHApmiJFPfMlThwoVywehJJyfSO5LKfOL+DecynTMem0cmv0Ex1X6z
	2XPtiSmkRWhGTjYd2CPNBtLya/OXJt/x7pSTo/QZJsRsUrfjvQx5ynh4LCr3KlG6
	bCo+ZeBHfgBWdaVUBDS1Tj9tvRyldClhrdHojb36EiJLA8ZhZRISH3Rd+BjMcn+H
	a+m9y6Y8RGdng1gNgTU5VVe1Z8ITAnTKt6awp+OgcakT4pUL4QTgBDmn24Oq1sjA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v30w44u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 05:11:44 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59O5AaME018376;
	Fri, 24 Oct 2025 05:11:44 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v30w44u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 05:11:44 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59O0uVsl032096;
	Fri, 24 Oct 2025 05:11:43 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49vp7n9fas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 05:11:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59O5BdRI51577264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Oct 2025 05:11:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23C762004B;
	Fri, 24 Oct 2025 05:11:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3107020049;
	Fri, 24 Oct 2025 05:11:37 +0000 (GMT)
Received: from [9.124.221.207] (unknown [9.124.221.207])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Oct 2025 05:11:36 +0000 (GMT)
Message-ID: <1c53ad36-7f82-4f3c-b2b2-0d415aed37ad@linux.ibm.com>
Date: Fri, 24 Oct 2025 10:41:35 +0530
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
Subject: Re: [PATCH v2] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: Jiri Bohac <jbohac@suse.cz>
Cc: linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
References: <20251023121413.56963-1-sourabhjain@linux.ibm.com>
 <aPpIdHMnSHRq8M6B@dwarf.suse.cz>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <aPpIdHMnSHRq8M6B@dwarf.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3KghY9z8t-vjXPWt1dPyTKnNTTYeVELv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX0plbYPtAQ4pe
 BDL3I9ZSiXdVOwFNfZu1qs22W0ljdxLYRfRVv5irwWR0wAjsD+ZU+Q7GrCqnh2b68bfjQJSdZ7p
 n7lRWM7YBMH953vhauC7tar8G+FNWB1ohelBYUFpYrIpsEVuhYfBELO2d4qNdfl95VwdXiazJkP
 uDA7mQApr7k5gBa0VgCDWUIZuasDwR4hN0hqkBfC12NaBrBA87hAYimKBwmk9PQRSNTm6RkMB3P
 vDMvieTC9vWQoorOWTeNd/OgBDBCAK1KivwullinxinrpENkl2GMvTKgGW2pPb70exysM8mNqtg
 AEMlWRfxa1c7V3feask+3IZTojpNIiyYkTDrR/iyX8IiTRcNW/rjWgr5bbvrld2yFGZXnnhLXC1
 QZMqc5z207cBAb9aOA5AZ/ckCJ0gwg==
X-Authority-Analysis: v=2.4 cv=MIJtWcZl c=1 sm=1 tr=0 ts=68fb0a90 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=wrVjzdWE3tFTcSlGGs4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Eh-pjN1mH6PjHoSJcfNcqcYnhoa-tkr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 23/10/25 20:53, Jiri Bohac wrote:
> On Thu, Oct 23, 2025 at 05:44:12PM +0530, Sourabh Jain wrote:
>> @@ -595,6 +602,13 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>>   	if (ret)
>>   		goto out;
>>   
>> +	for (i = 0; i < crashk_cma_cnt; ++i) {
>> +		ret = crash_exclude_mem_range(tmem, crashk_cma_ranges[i].start,
>> +					      crashk_cma_ranges[i].end);
>> +		if (ret)
>> +			goto out;
>> +	}
>> +
> I think the loop needs to check if tmem->nr_ranges == tmem->max_nr_ranges and
> reallocate in each iteration, just like it's done when excluding the crashk_res
> region above:

Yeah, nice catch. I thought it would get adjusted automatically, as it is
done in the add_mem_range function.

Thanks for the review. I will update the patch and send v3.

>          /* Reallocate memory ranges if there is no space to split ranges */
>          tmem = *mem_ranges;
>          if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>                  tmem = realloc_mem_ranges(mem_ranges);
>                  if (!tmem)
>                          goto out;
>          }
>
>          /* Exclude crashkernel region */
>          ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
>          if (ret)
>                  goto out;
>
>
>


