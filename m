Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72234855F9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 11:41:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYcIOh7n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBSg2fVjz86Sb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 21:41:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYcIOh7n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbBLg3fTxz3w57
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 21:36:27 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41F90FQm013242;
	Thu, 15 Feb 2024 10:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0Lkd6nG2l1dtyAWgztLgpaGyC5DsaIeusO5eKZMkEBg=;
 b=jYcIOh7nez39njav3GC+DYC+yt409Qu6wbgK8IAgfjq1xHTLU8Hg3uK59a3ec2aQg7j1
 S9Ngzs44XvxgSv9M0uaX0a0dOQObQvoFwEVGPyJAsKtNtTLZlsl44/YtMdlVcmhGUMHC
 j5YSe0Dpf+Jd25x4gkrh6nuElo1ldSJbE57Gb3WWhLz8UtQ8vWzKMi/bnGIn6NW8Vvg6
 KzOzQ1tThT+6vC+mop3oMJG9WfZIVkFR/ycqkVtNchWTQc6d4nMYtbQbnc2BhLQQe0Pm
 crSCNy8cy/xvEYWW/jbNVpdfR6lTYas8ePKAq08WqK88bQCXB3asvPGSj/d5g8axZdn2 GQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9fkkt7ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 10:35:54 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41F9e2Ap009904;
	Thu, 15 Feb 2024 10:35:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p633mrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 10:35:54 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FAZooO18154122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 10:35:52 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49FEA20043;
	Thu, 15 Feb 2024 10:35:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31D8A2004B;
	Thu, 15 Feb 2024 10:35:47 +0000 (GMT)
Received: from [9.43.101.252] (unknown [9.43.101.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 10:35:46 +0000 (GMT)
Message-ID: <71d6f107-7fd5-45f9-b2cd-e2d1b018720a@linux.ibm.com>
Date: Thu, 15 Feb 2024 16:05:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] powerpc/bpf: enable kfunc call
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20240201171249.253097-1-hbathini@linux.ibm.com>
 <20240201171249.253097-2-hbathini@linux.ibm.com>
 <4dd99601-6990-444c-af23-95cb3f7b156b@csgroup.eu>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <4dd99601-6990-444c-af23-95cb3f7b156b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TrzXTGFBWof91yLdJ646PcDA4ucgAwkv
X-Proofpoint-ORIG-GUID: TrzXTGFBWof91yLdJ646PcDA4ucgAwkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150083
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/02/24 1:24 pm, Christophe Leroy wrote:
> 
> 
> Le 01/02/2024 à 18:12, Hari Bathini a écrit :
>> With module addresses supported, override bpf_jit_supports_kfunc_call()
>> to enable kfunc support. Module address offsets can be more than 32-bit
>> long, so override bpf_jit_supports_far_kfunc_call() to enable 64-bit
>> pointers.
> 
> What's the impact on PPC32 ? There are no 64-bit pointers on PPC32.

Yeah. Not required to return true for PPC32 case and probably not a
good thing to claim support for far kfunc calls for PPC32. Changing to:

+bool bpf_jit_supports_far_kfunc_call(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}

>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>
>> * No changes since v1.
>>
>>
>>    arch/powerpc/net/bpf_jit_comp.c | 10 ++++++++++
>>    1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
>> index 7b4103b4c929..f896a4213696 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -359,3 +359,13 @@ void bpf_jit_free(struct bpf_prog *fp)
>>    
>>    	bpf_prog_unlock_free(fp);
>>    }
>> +
>> +bool bpf_jit_supports_kfunc_call(void)
>> +{
>> +	return true;
>> +}
>> +
>> +bool bpf_jit_supports_far_kfunc_call(void)
>> +{
>> +	return true;
>> +}
