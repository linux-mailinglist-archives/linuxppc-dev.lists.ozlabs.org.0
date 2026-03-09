Return-Path: <linuxppc-dev+bounces-17899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANrnC+7MrmnEIwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:36:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF37239D6E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:36:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTyj60S5Dz3bnm;
	Tue, 10 Mar 2026 00:36:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773063401;
	cv=none; b=M4NVzTE90GC1brVX67Y9SFmPcfSxnuUSfIDquLq7e7hBzL3sieqv/fKtyWx5F0e1ALgQOu2VYIgLoczUwx4S6zpNaHLcTUQEXOSqngzQa1tdnEDpzWhTqje6ojkjuu/zJDUVqPfeQSCsfl5EpqBRKQK+sQcBw+4S2oeao1iX6bO8nFyj3Os7x3CSruXJF0m9XAgZrhFT3UuAUlxyseUhyRNFVlaJBEaFFiRFTIB0bAdOovXDHXwqiS41l4kX7Ks8xgSBNkNKBSXW2T+EGGuXmA81z6+lwLNR8IZpUDqHHtFzPZfhv6MAqUOsS9SOVWhzzk3ZWsoiBufeJnLKUjfMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773063401; c=relaxed/relaxed;
	bh=fouSITbCIvr3LnA8anIj0g1Q2/TcilpfGN5od3Ot9mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIN3wPOKE7lDCAlVhtyeGJIzcAQwT6HdcpokfmdqlOaReVUCqfaTfHrC2+z3Wb4E7CHtW1WSWE1AMB7RxpJ/Md+PvmI+JgFpibw0pFDg9wF5xbDjpZKk/sQc6V3A80iY7U2xb2EibjVOyUHoVbJP130egURvE/U5czjams09o+hqHG3yKmacgP6qybPVgN+ih+S/IJJD0RJdyiBA4KR3N+YK8COT0ebTgC2xV5wwRxVxjj+t6n7yz2sJww7jySXk0dhqj3o5Vj0+z+fuCWIpCzJwBdIAyaAmX5Ues9EjjHqDPH9jkyh+Yv1sahS4FKM1iA6jx55cSAKWyd+dN7nb4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TlhDKYCU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TlhDKYCU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTyj51MMJz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 00:36:40 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MunZn1619459;
	Mon, 9 Mar 2026 13:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fouSIT
	bCIvr3LnA8anIj0g1Q2/TcilpfGN5od3Ot9mc=; b=TlhDKYCUvMDPScmpBEYTg9
	mYd49RmjBvAMCNiCNI0satUNigUxOppHC2uBLnv9VB9M5ER+cxlhOl9BAnZs9cxW
	tCda6m1dxytUAir+aD83L+2FNQySIoVaewLKG5aJ7UoCwXhsRBGo1ThB8y03UXqc
	Yf/0ACH1yxuO/KjUHReu91SRIKyQcNy1v272DDLi2tIqwOvfDIu7beAiIymALwCY
	SQOlK8pZT0vXypffz2u/7mBgN5Fa0mGg0sYcQeEgB6ASeUQiPM2gFP70/F312QIz
	MLO5j6IxMbRQUbUaQscwOUOsMGVd1sjjeV4g62zc2qwGYxUENttLlqHynl1wnndQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvr6h8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 13:36:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629BI9JL015771;
	Mon, 9 Mar 2026 13:36:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs121vu3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 13:36:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 629DaQe715073668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 13:36:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF1642004B;
	Mon,  9 Mar 2026 13:36:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E1FC20040;
	Mon,  9 Mar 2026 13:36:24 +0000 (GMT)
Received: from [9.39.22.34] (unknown [9.39.22.34])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Mar 2026 13:36:24 +0000 (GMT)
Message-ID: <d87a5a86-77f5-4bc1-a96d-216b46aa86e4@linux.ibm.com>
Date: Mon, 9 Mar 2026 19:06:23 +0530
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
Subject: Re: [PATCH v2 2/2] powerpc/crash: Update backup region offset in
 elfcorehdr on memory hotplug
To: Aditya Gupta <adityag@linux.ibm.com>
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mahesh@linux.ibm.com, mpe@ellerman.id.au, ritesh.list@gmail.com,
        shivangu@linux.ibm.com
References: <20260307052102.944952-3-sourabhjain@linux.ibm.com>
 <aayGKtxLIn02Gm08@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <aayGKtxLIn02Gm08@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEyMyBTYWx0ZWRfXx5guOGrm+3cu
 7G4SuKpAEBx/lCJQYzoRt3VdFoPK1xWW6kztl2fO8IvwzBjmh+F5CPfBF7+7O/m6Nr90akuiqBS
 X5n0tI7pstBVKMgZ7U1rBpJJJAMOmoPZZPX7rSiAmYYP0gUds/qjP5qf23l2ohcA2XjJTPzjoJw
 J5K0AqWv3Q6SArzegcwBkEet1FcaZuiJOua/bya9AJzXMTCvgzmxlKxk9HrzuVXqo+ER46sMcTK
 W2I9R2BAczPUkiIAcRqUnkLsaqOkiC0cNTdVbjS10GtcPhIa4BMuA+BwwWNCjLkwCatY4RXdOVc
 QrnRbnBFVJwQkkl0x7AuyHbiYdfWfQCEIjMcqVesHTCHgF3nQYPeDp3xgy/c5hPUF6cbiWEGMIk
 sEyIkmIEo8oev2CeL/52+0tbeW9bXv5AreBBtKMUE/mFOqDl1NunZcPhA5y9LX7+idsLE0GW3ou
 ngKXKWxdCaWm/1YuERQ==
X-Proofpoint-GUID: F0-kXt81HuRAqpbI1RtyG01-NZKt-7Mf
X-Proofpoint-ORIG-GUID: 5astUUG2TsyrmlEiEfscURaUToKa8YGt
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69aecce0 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=5N630-czqJLXAcTlrXoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090123
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SORTED_RECIPS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1CF37239D6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-17899-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:adityag@linux.ibm.com,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:ritesh.list@gmail.com,m:shivangu@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 08/03/26 01:43, Aditya Gupta wrote:
> On 26/03/07 10:50AM, Sourabh Jain wrote:
>> <...snip...>
>>
>> +#ifdef CONFIG_CRASH_DUMP
>> +/**
>> + * sync_backup_region_phdr - synchronize backup region offset between
>> + *			    kexec image and ELF core header.
>> + * @image: Kexec image.
>> + * @ehdr: ELF core header.
>> + * @phdr_to_kimage: If true, read the offset from the ELF program header
>> + *		    and update the kimage backup region. If false, update
>> + *		    the ELF program header offset from the kimage backup
>> + *		    region.
> nit: if sending a v4, can we add a comment in 'phdr_to_kimage' description that
> it is true in case of kexec_load and false in kexec_file_load, or maybe a
> different name for the boolean eg 'use_phdr_offset' or simply 'is_kexec_load' ?

I will update the comment and add how this function is called for 
kexec_load and kexec_file_load
syscall and keep the function arguments same.

>
> fwiw, part of the commit description mentions problem already fixed by patch 1
>
> Looks good. Tested in pseries qemu.
>
> Reviewed-by: Aditya Gupta <adityag@linux.ibm.com>
Thanks for the review.

- Sourabh Jain

