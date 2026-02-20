Return-Path: <linuxppc-dev+bounces-16990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBxzBYI2mGkkDAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 11:25:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A96166CDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 11:25:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHRFn6fYfz30Lv;
	Fri, 20 Feb 2026 21:25:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771583101;
	cv=none; b=iwdVrq/Ul6yJ5SpIgJgZGY8Mqbdf4A7kaVa4xt+hELQH/K/E/w1rfVmaN8jGgGR/+U4j33cqlcoN2W+EuH5V8ldcnYNs/eEimvl/WSjaLkqISRwmUQ5hrH6HUrs+XrFXjNxc9pkuCltmxFKxyrqx1YHJG23SoUue7GEo+R5WszqYgKpspMn2CzhFW8cyZKqGsnxOHAP4wUg55KnJTgGnQKnskbotE9zHZPmOHOTHAzfczpOWYmcFxmxG6PFM7W++0hatnjGkAm/0Irz11581TCvfrrziLYhtEuK/c4KbvNmYd2g9omVTpJZZMtQy7FgLeYRQ51JPNXMvrbZGUf2geg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771583101; c=relaxed/relaxed;
	bh=/qT1A6st+sJn+AkAuCoObzoRhuFFt8SNTEcmhpXmNho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvmY4zmE6o56Zav40f9zuZaq8vedMex7+U1BIQZIQQUI+WQDAKfIUHJcIsltBRsvb0vbM2YSbx7zbmuoRXGFmUfcYhduL6NvG9UDgtl49eBkWtJ7//GODox6DKnY4uvSqNQIFjx9h4SFGUrvTYXq/EV3iSaset7nfcfcOcbVADHKbWqlzb4SGSyceTGpuDREH0MHnEmJCbpyt/r0sFYdLmuudAapSEEc5vuORt0R7OWgZzNl+ALCjHCKHuQ5yKeAVMEmmJma7E3irw6w/nIkpSJdYSDQAdbOUfgNhlZkMjLGZdpv1AUJVthqv/84vwa2oG6MJJGIyrgwqomv8bcaEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JtMYCL2e; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JtMYCL2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHRFm68SSz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 21:25:00 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JL4h5s1273450;
	Fri, 20 Feb 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/qT1A6
	st+sJn+AkAuCoObzoRhuFFt8SNTEcmhpXmNho=; b=JtMYCL2e6NxUmEYHUOJfG9
	n31/LNHs5uEEWWoeuE7tseaxe7VBgdel+LCb74diMMNPgx28Ik7fnAxm2aG+DezM
	e6nr+fw8ut8d64bt/tUq8i1OxCFIHhlSqVxCGr+M7V17HJIPEatPVqtIwWAyNdqk
	DdGtna0V3+IdAKFwcF9T81bfGaXS7KYnVXSubxBTIeuoZdx0FStfBAmrzHPK3mNl
	yHaZYWRIcyNk1fXHk8SHSbetg3jsmkGVuJkGdRgGWOKfw1Wg6JE0JqUQjeTWt145
	HcqGcJg5MkjK2uZwJIuTVJZH4YouN7JSY1c3MjiYZHqiaASWTXNm10nq6ShDZThg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6v2gkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 10:24:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61KABInb001419;
	Fri, 20 Feb 2026 10:24:51 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb2br0k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 10:24:51 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61KAOlAA51184016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Feb 2026 10:24:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3A1B20073;
	Fri, 20 Feb 2026 10:24:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C52B2006A;
	Fri, 20 Feb 2026 10:24:46 +0000 (GMT)
Received: from [9.43.64.63] (unknown [9.43.64.63])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Feb 2026 10:24:45 +0000 (GMT)
Message-ID: <21a8553a-82c8-46f1-93cb-fbdb6ed32377@linux.ibm.com>
Date: Fri, 20 Feb 2026 15:54:45 +0530
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
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
References: <20260218050105.391285-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260218050105.391285-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E+/AZKdl c=1 sm=1 tr=0 ts=69983674 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=3KUUrtHc1-Y8H4gNG1cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4OCBTYWx0ZWRfXwcb1UD0kk/q2
 N5OhoEOUePk3q2fQMuFuZl4Gnh0+uoDWaXyFVA+F1rTuVNAHGLPpaYYAj1Cmd3GLAfoxQgvhKo8
 vRSaA3N89BcDQYAZQoSm7RUmSYpz2qhZyM6FsT0c8syGsvQpm+zQ4ecfSeY5poGI0a58b82Lh19
 +7DCzJDYMJbeGb1+nWAClynw3INzlqyjBqSHJ18bSsTfX2TlReCkPV6nhCioBidATrumZJzlIjS
 nK6AkbA+RI7vHulmEjJh7zQD/UfwoOQRmylhtSsnHmuXb/XQ9MKSrK0472JI4Bk8L5k/iSnfuDh
 ch1fCiQo23j/Rs79NeEK3cdtR6e6i8o5vamTbbpRr9ZBco6p+todlRCkfjzjTqv8x5JXDgxF5kN
 OqUMB8jdfxpUNLps+V1PLdCspgT5PZPcouO2xx1SSaN63UNPj9QlkysCDO7vtSOy2rITn4uK7p3
 Ah3srQYQyWQXvQAaZCw==
X-Proofpoint-ORIG-GUID: qD3ONe9FmBj3TCFnm6Oq2iTHpPbT34Gb
X-Proofpoint-GUID: ck8-6cr1kZsES9EWoIslVfoKZLljB0bK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200088
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ellerman.id.au:email];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-16990-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:ritesh.list@gmail.com,m:shivangu@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 16A96166CDF
X-Rspamd-Action: no action



On 18/02/26 10:31 am, Sourabh Jain wrote:
> With crash hotplug support enabled, additional memory is allocated to
> the elfcorehdr kexec segment to accommodate resources added during
> memory hotplug events. However, the kdump FDT is not updated with the
> same size, which can result in elfcorehdr corruption in the kdump
> kernel.
> 
> Update elf_headers_sz (the kimage member representing the size of the
> elfcorehdr kexec segment) to reflect the total memory allocated for the
> elfcorehdr segment instead of the elfcorehdr buffer size at the time of
> kdump load. This allows of_kexec_alloc_and_setup_fdt() to reserve the
> full elfcorehdr memory in the kdump FDT and prevents elfcorehdr
> corruption.
> 
> Fixes: 849599b702ef8 ("powerpc/crash: add crash memory hotplug support")
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kexec/file_load_64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index e7ef8b2a2554..ed76326f4b57 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -460,7 +460,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
>   	}
>   
>   	image->elf_load_addr = kbuf->mem;

> -	image->elf_headers_sz = headers_sz;
> +	image->elf_headers_sz = kbuf->memsz;

A comment here explaining why memsz is used instead of headers_sz and
also, another comment where memsz is set, as to why extra memory size
is accounted under it, improves readability...

Regardless..

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

