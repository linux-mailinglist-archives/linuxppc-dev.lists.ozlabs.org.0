Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B648E908
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 12:19:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZzMY1Jjsz3bYv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 22:19:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YF6yxxEc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YF6yxxEc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZzLk4t76z2ynQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 22:18:22 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20EApt5P028949; 
 Fri, 14 Jan 2022 11:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=kd8T9O3p29h8F5lsjDAZVzBlixnmUAhh/IcXT7fFzMs=;
 b=YF6yxxEcmUTIlReyHZYPdmcB/jvAiq0PiI5b9uCMDWXwdtFJ/SHv/I6pRSXw5BYvMwla
 Z7wKVpXhmC0PFfRvgkTzh9E72iqXAScjjvj0hCfBUHG5ab54pCvAO4kE07m7BOiM8JzP
 9ValSaJJDmsba9EpCqctfH8UQBk4UIDtvjx4Fo3SBhlqKJ1NTIjZQXW36euHHlBhZoS2
 pornvIDYH8APUBGr5Hr1senNg7EP0NmfPXqJbsxz75NijcIp+GWbj9pe6QyR9cmJlZrN
 nQel2+cJlCAhqYbg/abZpjOZHlSTtrCjh1Ufl+zanS0VDUYjXrD7zAV6/CnOR9tsOlpq Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dk7sy8d9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 11:17:58 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20EBFDoY031291;
 Fri, 14 Jan 2022 11:17:58 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dk7sy8d93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 11:17:57 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20EBCINt010072;
 Fri, 14 Jan 2022 11:17:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3df1vkasfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 11:17:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20EBHrjG46072234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 11:17:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB667A4054;
 Fri, 14 Jan 2022 11:17:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D6FFA405B;
 Fri, 14 Jan 2022 11:17:52 +0000 (GMT)
Received: from localhost (unknown [9.43.21.93])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jan 2022 11:17:52 +0000 (GMT)
Date: Fri, 14 Jan 2022 16:47:51 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 11/13] powerpc64/bpf elfv2: Setup kernel TOC in r2 on entry
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <4501050f6080f12bd3ba1b5d9d7bef8d3aa57d23.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <d0e28f07-c24c-200d-de04-5d27c651a5e6@csgroup.eu>
 <1641896867.1ukblu8135.naveen@linux.ibm.com>
 <080527ac-54f2-6e41-17a0-fdb7a556c30d@csgroup.eu>
 <01d558b9-82b7-f73e-70d6-d19a192d47b6@csgroup.eu>
In-Reply-To: <01d558b9-82b7-f73e-70d6-d19a192d47b6@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1642157523.jyz3p74ouz.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 90Zbb4VURnN2JHGPSCGOVHLoqZSSaJXZ
X-Proofpoint-ORIG-GUID: nMYp1gYkWl5F2metnTZ2fhpdATDmrOiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_04,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 adultscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140074
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 Jiri Olsa <jolsa@redhat.com>, masahiroy@kernel.org,
 "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 11/01/2022 =C3=A0 15:35, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 11/01/2022 =C3=A0 11:31, Naveen N. Rao a =C3=A9crit=C2=A0:
>>> Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 06/01/2022 =C3=A0 12:45, Naveen N. Rao a =C3=A9crit=C2=A0:
>>>>> In preparation for using kernel TOC, load the same in r2 on entry. Wi=
th
>>>>> elfv1, the kernel TOC is already setup by our caller so we just emit =
a
>>>>> nop. We adjust the number of instructions to skip on a tail call
>>>>> accordingly.
>>>>>
>>>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>>>> ---
>>>>>  =C2=A0 arch/powerpc/net/bpf_jit_comp64.c | 8 +++++++-
>>>>>  =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c
>>>>> b/arch/powerpc/net/bpf_jit_comp64.c
>>>>> index ce4fc59bbd6a92..e05b577d95bf11 100644
>>>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>>>> @@ -73,6 +73,12 @@ void bpf_jit_build_prologue(u32 *image, struct
>>>>> codegen_context *ctx)
>>>>>  =C2=A0 {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>>>>> +#ifdef PPC64_ELF_ABI_v2
>>>>> +=C2=A0=C2=A0=C2=A0 PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct=
, kernel_toc));
>>>>> +#else
>>>>> +=C2=A0=C2=A0=C2=A0 EMIT(PPC_RAW_NOP());
>>>>> +#endif
>>>>
>>>> Can we avoid the #ifdef, using
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (__is_defined(PPC64_ELF_ABI_v2))
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PPC_BPF_LL(_R2, _R13, offs=
etof(struct paca_struct, kernel_toc));
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0else
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EMIT(PPC_RAW_NOP());
>>>
>>> Hmm... that doesn't work for me. Is __is_defined() expected to work wit=
h
>>> macros other than CONFIG options?
>>=20
>> Yes, __is_defined() should work with any item.
>>=20
>> It is IS_ENABLED() which is supposed to work only with CONFIG options.

I suppose you are saying that due to the name? Since IS_ENABLED() and=20
IS_BUILTIN() seem to work fine too, once I define the macro as 1.

Along those lines, it would have been nice to have IS_DEFINED().

>>=20
>> See commit 5c189c523e78 ("powerpc/time: Fix mftb()/get_tb() for use with
>> the compat VDSO")
>>=20
>> Or commit ca5999fde0a1 ("mm: introduce include/linux/pgtable.h")
>=20
> Ah ... wait.
>=20
> It seems it expects a macro set to 1.
>=20
> So it would require arch/powerpc/include/asm/types.h to be modified to=20
> define PPC64_ELF_ABI_v2 or PPC64_ELF_ABI_v1 as 1

Thanks, that works.


- Naveen
