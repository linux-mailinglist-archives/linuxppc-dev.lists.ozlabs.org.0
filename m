Return-Path: <linuxppc-dev+bounces-17085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xSypHXcjnWkcNAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 05:05:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1D181872
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 05:05:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKkdX6GZXz3cDT;
	Tue, 24 Feb 2026 15:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771905904;
	cv=none; b=DU+5tLHAcJKgOcbJc+UrleHTVDdX4HV7Nh9ASZww3MUVh56qjjdCPVnr4GIDaVnVu9bd7GIsxE3Q3DP1kJG9LyoK/csDUnyIT6VxsFoAu+2jNaOYqy+TCX97kt6IeIr1vTTR4bpzQ4Aa7P7235E4QHv106YZlOFkPgO2LhMkFJjVPmur/rfZtzPSdCPeQSKuceE04KjODM5ulaBQrA7FPk8jvjrLlcHtSmz9ne7DTlzQ17yPzGCNLpUE9y/IBulQp9HiBvHd6rHO3LYoebCREYndQiCmMYW8wZSA2Y9xk7OYPReqkrDNJhuc+9D65v05FfGJPVz0wlacXl/HvZQsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771905904; c=relaxed/relaxed;
	bh=CWvD8IPypkRZgxlOxv/JnqzeVGYPURFB61q7xCa7kNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7f7PJZ/whWraGKZv3sW7rBeUIHkibkAn9QBg8ZMiEmGEDZFblR8CdRqkKC2sqEm78aKNXJztF4Dhh0Qx9DFUdeozmUq/Ji35Xgh71OTmS6Ptj3atxm69diYo/7qndTCWX3jwgXT/0CoaRL6KA5oBsDp4ETaNDQRs2EM2WgqioebhY2Y4Z1O/2yr5xGCjnahbgjSrSmn+QRdk4+UDHX4gfaQ8MNrFtKwgHB3QbztP7asuSkTu17l/pKQPLAYEu68CZDbkVz8jQdYpudq9fe98ohXNrqqmMwXn5bP3+lobDnHnoCQ6s2CHK+lDYRxTm/NFWJaFUWk4yjzPIVMvBOgQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dU8uXAkv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dU8uXAkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKkdW5WYhz3c9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 15:05:03 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0L2uR1191599;
	Tue, 24 Feb 2026 04:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CWvD8I
	PypkRZgxlOxv/JnqzeVGYPURFB61q7xCa7kNQ=; b=dU8uXAkv+RqiuY3/sSRoh4
	DbfFQcxDT4qbP+IhtLE3l7mjFZhJot6CKoa3YYPGZQLnnJe55AWL7VG4wHJpTwKN
	SVo64HwksFwB3ucUYcuOITyosEVHI7l9EfDBouAV9tfKi6KQTfyvldlTiUCefl8K
	tgM76Daa1UlQIxBZlwtvlmGebu7qIEJUdSrI+WpLD6M/Y0wvnXTyRD+NuSzAEGwH
	9zPbDOwqAUOa1/4WjR7+g0ovOpP0RNA4UxNJqeDmYmvImJwVv/wJVufNsM55AmJ3
	YFPZI8ec5FolAaZBfKrHkKvQp6t77XoZUcJmjppEy7l6asYjAiL9Dsv61b6/KgSw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4e39u0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 04:04:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61O1A5fC015970;
	Tue, 24 Feb 2026 04:04:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1sffym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 04:04:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61O44n9731195476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 04:04:49 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A87C2004B;
	Tue, 24 Feb 2026 04:04:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13C7B20043;
	Tue, 24 Feb 2026 04:04:48 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Feb 2026 04:04:47 +0000 (GMT)
Message-ID: <7061c762-cb20-4ec0-8c7b-2899ecc47503@linux.ibm.com>
Date: Tue, 24 Feb 2026 09:34:46 +0530
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
Subject: Re: [PATCH] powerpc/crash: adjust the elfcorehdr size
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
References: <20260218050105.391285-1-sourabhjain@linux.ibm.com>
 <21a8553a-82c8-46f1-93cb-fbdb6ed32377@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <21a8553a-82c8-46f1-93cb-fbdb6ed32377@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XMs9iAhE c=1 sm=1 tr=0 ts=699d2366 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=_wgSUu-TgyWQHSV5L6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TrDpG23PzgnsDEYr_ikCJXf3U901TT31
X-Proofpoint-ORIG-GUID: k-DmLl99fXOtZ15ROnjEY1G8NV2fvtDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOSBTYWx0ZWRfXye17xDi+6AiD
 H32slUwRSMLJtVVhKshjxhWdjOTuT41UOj1qj/HboOwxv1TQTgnoIdg9x6p0ymG1xiXvLusb/tU
 WbWbFPntezK8837vN0EXdsZ2Lhf3Pg0a3ziEUpLcN2Q5uu6lHwT8FReQXPAnBwUZV6uVWBO3HEC
 b3pmNbkeqywOU5Of97OBrxOFUbIkdhg7fOuarWgz9TaeH45xJohITqZ5voSWH35AW9Ng4b4F2jE
 LiM/9KI/TDH908wIENOzOn8qz0rpV/FHaWkSzrUNld0Q6vHEY76fZ9Sm6/L2YM6sQuGvuNEcFVO
 UqcBxjf3HFiqqG+QzbXyZwes0HNcAOczlrxyDEUr9qXRQpYodCvrrljmYRBFEV9iIHOTwcAxQ4D
 B9dMO5b2FeRS2/KHoMZSIX0o9oH2ir2YzwqHGwSScPImDaTyP/nKZaE2Skecl11HzNJBpHstkaA
 9e2Am9HgYW0oAOAqz8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602240029
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SORTED_RECIPS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17085-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:ritesh.list@gmail.com,m:shivangu@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 00F1D181872
X-Rspamd-Action: no action



On 20/02/26 15:54, Hari Bathini wrote:
>
>
> On 18/02/26 10:31 am, Sourabh Jain wrote:
>> With crash hotplug support enabled, additional memory is allocated to
>> the elfcorehdr kexec segment to accommodate resources added during
>> memory hotplug events. However, the kdump FDT is not updated with the
>> same size, which can result in elfcorehdr corruption in the kdump
>> kernel.
>>
>> Update elf_headers_sz (the kimage member representing the size of the
>> elfcorehdr kexec segment) to reflect the total memory allocated for the
>> elfcorehdr segment instead of the elfcorehdr buffer size at the time of
>> kdump load. This allows of_kexec_alloc_and_setup_fdt() to reserve the
>> full elfcorehdr memory in the kdump FDT and prevents elfcorehdr
>> corruption.
>>
>> Fixes: 849599b702ef8 ("powerpc/crash: add crash memory hotplug support")
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kexec/file_load_64.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kexec/file_load_64.c 
>> b/arch/powerpc/kexec/file_load_64.c
>> index e7ef8b2a2554..ed76326f4b57 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -460,7 +460,7 @@ static int load_elfcorehdr_segment(struct kimage 
>> *image, struct kexec_buf *kbuf)
>>       }
>>         image->elf_load_addr = kbuf->mem;
>
>> -    image->elf_headers_sz = headers_sz;
>> +    image->elf_headers_sz = kbuf->memsz;
>
> A comment here explaining why memsz is used instead of headers_sz and
> also, another comment where memsz is set, as to why extra memory size
> is accounted under it, improves readability...

Sure I will update the commit message in the next version.

>
> Regardless..
>
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
Thanks for the review.

- Sourabh Jain

