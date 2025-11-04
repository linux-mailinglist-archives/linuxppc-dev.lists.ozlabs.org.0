Return-Path: <linuxppc-dev+bounces-13728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D81C3089B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 11:36:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d14cN5dZfz3bfM;
	Tue,  4 Nov 2025 21:36:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762252564;
	cv=none; b=KxkcEvBRWxbIXmywubdR5zWGmvxyH8fv+aLA7fZ/FYpEtgs+e1h2HBCSTgocOpHvnYb2YTsXLtyU5ahxo229DanPEzgeLIxKAZ6j1fLrpBTTnkzDznDBGGEvAislsT3pACAUWk8iBV+j4t45povevKC3uFZSie3SPUzK2y86Q3APqjzOeRVqk030wLZPJ/EVm6zlLMHJN7zrZQjsxioYzRnE0EuYy2OnJYZOMRbXeyHtDgjahK9Wd+MyaeNDk9u5weqgtw5VYrUWs9ps6ynyqN8iWVJJk6RTZ6nJTqnG4VTJPfkpWjzuDw4TbR+wifSEbrKrc3pIdMBULvIarNaozg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762252564; c=relaxed/relaxed;
	bh=OKuYcb6shyYNmq/q4FSadLSNFH9ZQUIXn8Mz9bXJS/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNHT25v+Gyfyf2SE5BbnmyhXjMP/5vz+itiDDhNZNn96/6NutJgQbqzBoOIZK2rVk9TcWYjeclWmDG1CbPOVmb0DsCIsjerGx2Zf397AB21XkdYRAF0UIhj41+J4CniTovIHsF5Pf4TlDNZg62X1f5ylWfJxus64TH4DAxBzrgqtCjCRsjrwZGm1BiATG8sJ2H4LIcj5x3yBVBfccHslpfdjHddrREEJ47JpkYJCcSM7B/5+VbIStnir6QA7vNoujgywbFF6Pn+OsA3iISgy4AhL2hKdgntseRQkEuMFtLBnUZEWEVC4HsDh8oFlg3Xatj/wADnLdrCMmL49qkay/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NwHnhbSe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NwHnhbSe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d14cL2fxzz2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 21:36:01 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4AWCMt009411;
	Tue, 4 Nov 2025 10:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=OKuYcb
	6shyYNmq/q4FSadLSNFH9ZQUIXn8Mz9bXJS/k=; b=NwHnhbSeKrptbF8QIglxV8
	3oDA22GX/G7kawzdmavJSvy4QaLIIhrpM76cfPYyWzpLJNCZDtmd+uQ+792yVV1V
	Ql90JP8SQFiMHvDpbQudbVcmXJupKprCuLTdzALPpNxBbPDnA53GrdN6Vy5Ouabv
	gM9Y62eLJ5nhx+l1ryL3766L8f+t81+vFEpmZZiqTK1di0M5FLwzdJlg2VDirbBv
	JM9BGIXWEse/LH8nZtYk/b1NU+5LxHXiSZ8D5mLV18P6wT5aUmXY8ygJ9molu3A0
	XXssupX6dYwnhFYiFz3vLSxJdDDIFlqW3I/UnnNvVg7DrASGVFuqrsGe32KC8k1A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vubbw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 10:35:51 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A4AUBsn012670;
	Tue, 4 Nov 2025 10:35:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vubbvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 10:35:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A46xHfq021463;
	Tue, 4 Nov 2025 10:35:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrjjbkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 10:35:49 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A4AZjN632375146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Nov 2025 10:35:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A8A320049;
	Tue,  4 Nov 2025 10:35:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 667932004B;
	Tue,  4 Nov 2025 10:35:43 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Nov 2025 10:35:43 +0000 (GMT)
Message-ID: <722d72b5-cebf-48f2-8ad5-558ccd3c30f4@linux.ibm.com>
Date: Tue, 4 Nov 2025 16:05:42 +0530
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
Subject: Re: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
References: <20251103043747.1298065-1-sourabhjain@linux.ibm.com>
 <87y0on4ebh.ritesh.list@gmail.com>
 <7957bd55-5bda-406f-aab3-64e0620bd452@linux.ibm.com>
 <87wm463xtj.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87wm463xtj.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O4jDM6axMnUAqQJGEBhWa7jqEkUqKIZ6
X-Proofpoint-GUID: PZejwZBFQ9hmko76EjeixkrZr7eCnrqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfXyTfs0HIG/Bww
 2rGtj/jsLUiXDmA7ZsGR69mwXCNw1ANZs3shuUAamknaGtlhS+mpuIdt1indDnNzUUDyNsRBFhr
 IMWkkxoZO8x5k8xLgnYcvM15mNg+TMEsl7DM+u/assHxxy2u0e4CgNwuCRndaccJ/opKsV+vI1/
 W8fRrDW7t/MX3Rq334qTloVZYGFRWsAjHJmSP6k0JEj+8o1uzDdUTurtM1wnVqhrhYDk08LfKko
 Ly00aq1/rfjyqZZ9GEE6JtBKZGBXHun7gzp6o/4rMC+2wCShedbVaZaA8xTsvRM+EFgsqU2I/zC
 PhtxyrPMAxHTBzk1ZPg6pk8uIuGrj7uXQxAHAZROpYOZPsrEsadeRLkeO2jqIdfDya6jVluOg8j
 BYTsJlzpiATjzueb6bzFQcHr2tOGeA==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=6909d707 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=RPonDWm3pCHkDWdaMWMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 04/11/25 15:48, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>
>> I would like to keep kdump_cma_reserve() as is it because of two reasons:
>>
>> - It keeps setup_arch() free from kdump #ifdefs
> Not really.
>
> Instead of kdump_cma_reserve(crashk_cma_size), one could call
>
> reserve_crashkernel_cma(crashk_cma_size) directly in setup_arch().


reserve_crashkernel_cma() is not available unless the kernel is built 
with CONFIG_CRASH_RESERVE.
So, wouldn’t calling reserve_crashkernel_cma() directly from 
setup_arch() lead to a build failure? Or
am I missing something?



>
>> - In case if we want to add some condition on this reservation it would
>> straight forward.
>>
> Make sense.
>
>> So lets keep kdump_cma_reserve as is, unless you have strong opinion on
>> not to.
>>
> No strong opinion, as I said it was a minor nit. Feel free to keep the
> function kdump_cma_reserve() as is then.
>
> -ritesh
>


