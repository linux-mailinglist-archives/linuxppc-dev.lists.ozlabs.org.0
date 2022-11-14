Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 467F2628331
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 15:49:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9sdR0zxPz3cMk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 01:48:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YUVENSN3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YUVENSN3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9scQ0NDMz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 01:48:05 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AEEdoNA015912;
	Mon, 14 Nov 2022 14:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Uk5EXZkBNF0tn4o07/dITg6sAe5THIbl29LANdGKdYE=;
 b=YUVENSN3WIZiTbw6pbWlJ+VcwBOLW1eRQ8HWO6eUXu+zWpeWbVXdxE0vg5X/uw6hzXEk
 3KwiuRe5kcqtN/kcOzFqB/zwO7ajvI+fctvUcLLGs5EYg8nIvv+qRtoNXcZf6zR2BsOS
 pnjVZSEFaH4LojhZFh6Tt9NnRu/trF7TIdwVFCwICEYqWRs/teWwL99bZ0j6WHzDJLhN
 ADl0nTh3SxNrCSnYFCFKMiz4dCI2F57/mKYxf/rmRe9uLDiQkRn/+g2hLX650YjQqFmN
 EW3ddAVcoxwuKVeVKkPJOGJdCtmS02torqExwpOriMDP/8/xbk//5+jxHrMLx3yk1O7x UA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuqmt06fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 14:47:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEEaE2v012383;
	Mon, 14 Nov 2022 14:47:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma02fra.de.ibm.com with ESMTP id 3kt349202h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 14:47:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AEEld8F66584858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 14:47:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2E24A4040;
	Mon, 14 Nov 2022 14:47:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBBE7A404D;
	Mon, 14 Nov 2022 14:47:35 +0000 (GMT)
Received: from [9.163.90.158] (unknown [9.163.90.158])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 14:47:35 +0000 (GMT)
Message-ID: <5b59b7df-d2ec-1664-f0fb-764c9b93417c@linux.ibm.com>
Date: Mon, 14 Nov 2022 20:17:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bi3vyvRwPIOVRHzXkZKMZVoheG3BAfsb
X-Proofpoint-GUID: bi3vyvRwPIOVRHzXkZKMZVoheG3BAfsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140103
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 11/11/22 4:55 pm, Christophe Leroy wrote:
> Le 10/11/2022 à 19:43, Hari Bathini a écrit :
>> Most BPF programs are small, but they consume a page each. For systems
>> with busy traffic and many BPF programs, this may also add significant
>> pressure on instruction TLB. High iTLB pressure usually slows down the
>> whole system causing visible performance degradation for production
>> workloads.
>>
>> bpf_prog_pack, a customized allocator that packs multiple bpf programs
>> into preallocated memory chunks, was proposed [1] to address it. This
>> series extends this support on powerpc.
>>
>> Patches 1 & 2 add the arch specific functions needed to support this
>> feature. Patch 3 enables the support for powerpc. The last patch
>> ensures cleanup is handled racefully.
>>

>> Tested the changes successfully on a PowerVM. patch_instruction(),
>> needed for bpf_arch_text_copy(), is failing for ppc32. Debugging it.
>> Posting the patches in the meanwhile for feedback on these changes.
> 
> I did a quick test on ppc32, I don't get such a problem, only something
> wrong in the dump print as traps intructions only are dumped, but
> tcpdump works as expected:

Thanks for the quick test. Could you please share the config you used.
I am probably missing a few knobs in my conifg...

Thanks
Hari
