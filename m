Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7897F6BA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 06:21:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I/fMz3em;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc3HK0XDgz3dVC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 16:21:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I/fMz3em;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc3GT0QVrz3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 16:20:33 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sc3GR3Vb3z4wy1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 16:20:31 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Sc3GR3RbNz4x1R; Fri, 24 Nov 2023 16:20:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I/fMz3em;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Sc3GQ6m3wz4wy1
	for <linuxppc-dev@ozlabs.org>; Fri, 24 Nov 2023 16:20:30 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO2874N018495;
	Fri, 24 Nov 2023 05:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AsPhh417nnLhrpad4Q09H9MjFPzSgskKNiFfKfFcxzo=;
 b=I/fMz3emd/1n4OtTvdBxOgG+zsgKl1Z5kk1rl+9tgkIp1EvmLdGKJ8PpKxXIhm4UqAVF
 ywBBAeRrWz7WbqCdqG7cVj8yNV9blHdj17L0hO7pEjM2IELZaLXDmQa39OaO7Q1JmADD
 v1wykBut7NIfAqFC6OKsHkencgOpZl6AAXYn+0s8jXV9Gdgqb0nk86xR9NyCdpVKCrva
 opPW1Lwi5duEIaaN1P18oVqoCL3vJm3WfrDXewGw1Bv1Rc4DYq0fJ58iEhif1E8LKrY6
 FfTjB21QSAMq9FGhV6j6O6+67unBxVDHsIUPJl9IJD0DsEKScy3pBoQPkl3NLT2g5n74 HQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ujjs7k8vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 05:20:20 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO2G6fr010796;
	Fri, 24 Nov 2023 05:20:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf8003u71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 05:20:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AO5KGcO31326560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Nov 2023 05:20:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9ACD52004B;
	Fri, 24 Nov 2023 05:20:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B52B20040;
	Fri, 24 Nov 2023 05:20:15 +0000 (GMT)
Received: from [9.43.127.117] (unknown [9.43.127.117])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Nov 2023 05:20:14 +0000 (GMT)
Message-ID: <a5cf8f63-2dda-41d5-9231-aca25b7e6960@linux.ibm.com>
Date: Fri, 24 Nov 2023 10:50:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
To: Aneesh Kumar K V <aneesh.kumar@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
 <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
 <87fs0yjrjf.fsf@mail.lhotse>
 <e65c4dd0-df97-481d-b3e9-0088f2c9b2ea@linux.ibm.com>
 <47a119c1-05e9-47fb-9cc7-85aa7e1e4ae7@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <47a119c1-05e9-47fb-9cc7-85aa7e1e4ae7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7S_HEtvkILkZFzrn9EazI7Ru1N503CKd
X-Proofpoint-ORIG-GUID: 7S_HEtvkILkZFzrn9EazI7Ru1N503CKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311240040
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Aneesh,

On 22/11/23 17:50, Aneesh Kumar K V wrote:
> On 11/22/23 4:05 PM, Sourabh Jain wrote:
>> Hello Michael,
>>
>>
>> On 22/11/23 10:47, Michael Ellerman wrote:
>>> Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
>>> ...
>>>> I am not sure whether we need to add all the complexity to enable supporting different fadump kernel
>>>> version. Is that even a possible use case with fadump? Can't we always assume that with fadump the
>>>> crash kernel and fadump kernel will be same version?
>>> How sure are we of that?
>>>
>>> Don't we go through grub when we boot into the 2nd kernel. And so
>>> couldn't it choose to boot a different kernel, for whatever reason.
>>>
>>> I don't think we need to support different pt_reg / cpumask sizes, but
>>> requiring the exact same kernel version is too strict I think.
>> Agree.
>>> But maybe I'm wrong. Would be good to hear what distro folks think.
>> How about checking fadump crash info header compatibility in the following way?
>>
>> static bool is_fadump_header_compatible(struct fadump_crash_info_header *fdh)
>> {
>>      if (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC_OLD) {
>>          pr_err("Old magic number, can't process the dump.");
>>          return false;
>>      }
>>
>>      if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
>>          pr_err("Fadump header is corrupted.");
>>          return false;
>>      }
>>
>>      /*
>>       * If the kernel version of the first/crashed kernel and the second/fadump
>>       * kernel is not same, then only collect the dump if the size of all
>>       * non-primitive type members of the fadump header is the same across kernels.
>>       */
>>      if (strcmp(fdh->kernel_version, init_uts_ns.name.release)) {
>>          if (fdh->pt_regs_sz != sizeof(struct pt_regs) || fdh->cpu_mask_sz != sizeof(struct cpumask)) {
>>              pr_err("Fadump header size mismatch.\n")
>>              return false;
>>          } else
>>              pr_warn("Kernel version mismatch; dump data is unreliable.\n");
>>      }
>>
> You also want a fdh->version check?

Even though we don't have any action against an fdh->version right now, 
I think I should
check the fadump header version. Currently, if the version doesn't 
match, it means the
header is corrupted.

> I am still not sure you need the kernel_version check. IMHO that is too strict
> and can hit that check where you have kexec kernel which is not installed in /boot crashing?

If the kernel versions mismatch, we still collect the dump if the 
`pt_regs` and `cpu_mask`
sizes are the same across the kernels. The kernel version check is just 
to warn users that
the collected dump may be unreliable.

Should I remove the kernel_version filed from fadump crash info header 
and remove the
the kernel version check while processing the kernel dump?

Thanks,
Sourabh Jain
