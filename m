Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEA48AB70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 11:32:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY6TV5XGBz30H3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 21:32:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cv7XWVna;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cv7XWVna; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY6Sm09Mvz2yN3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 21:32:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B9RkCF013712; 
 Tue, 11 Jan 2022 10:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=4ZMFTZXf7hlcK7/oqIgDRGd1D0qV4EjXs38VeR/nWD0=;
 b=cv7XWVna5SLB2NEsBk/OWsCXyU+ivuXerpvpBKHJaGovNKEtKKdVmVzLQGzKYrvjDwNA
 5LIswN1XO1Ezaxy9vF6/Cu/FbHhX+OQQ8j+DHvwHM6qC17uoQ490DQW4p3HRUwPQVIcM
 7yJ383hC89hX9h14JCjmSX9MIYq7w/WzuvNOeHuDNbRZAcsN46/PJ7IGJQ9hd4FZ755C
 +nazIbpRjiDLcODg0PuJRrKXU5EfgRt1Z4gvYwt3lr9LdmbZZI6nTGfd99KgHeCLJs93
 2ig/tOPrV77xO3g6IPR+70eRvkKOnk62Q2DrRiG5qeqlH+8ltiA1RGPHJYRQoF+txhdD Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh79ks5ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 10:31:43 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20BA8db2029381;
 Tue, 11 Jan 2022 10:31:43 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh79ks5ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 10:31:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20BASWdR021967;
 Tue, 11 Jan 2022 10:31:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3df1vjc8n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 10:31:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20BAVcBd46793004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 10:31:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC293A408C;
 Tue, 11 Jan 2022 10:31:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88252A405C;
 Tue, 11 Jan 2022 10:31:37 +0000 (GMT)
Received: from localhost (unknown [9.43.113.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jan 2022 10:31:37 +0000 (GMT)
Date: Tue, 11 Jan 2022 16:01:36 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 11/13] powerpc64/bpf elfv2: Setup kernel TOC in r2 on entry
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <4501050f6080f12bd3ba1b5d9d7bef8d3aa57d23.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <d0e28f07-c24c-200d-de04-5d27c651a5e6@csgroup.eu>
In-Reply-To: <d0e28f07-c24c-200d-de04-5d27c651a5e6@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641896867.1ukblu8135.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: izk6wKCVy3XsnSMUy3f28k7Mqsw4QMOf
X-Proofpoint-ORIG-GUID: UB1NidJDBLQ7pmHuG9_-I7mR6_fVF_pZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110061
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
 Jiri Olsa <jolsa@redhat.com>, "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 06/01/2022 =C3=A0 12:45, Naveen N. Rao a =C3=A9crit=C2=A0:
>> In preparation for using kernel TOC, load the same in r2 on entry. With
>> elfv1, the kernel TOC is already setup by our caller so we just emit a
>> nop. We adjust the number of instructions to skip on a tail call
>> accordingly.
>>=20
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit_comp64.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_ji=
t_comp64.c
>> index ce4fc59bbd6a92..e05b577d95bf11 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>> @@ -73,6 +73,12 @@ void bpf_jit_build_prologue(u32 *image, struct codege=
n_context *ctx)
>>   {
>>   	int i;
>>  =20
>> +#ifdef PPC64_ELF_ABI_v2
>> +	PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct, kernel_toc));
>> +#else
>> +	EMIT(PPC_RAW_NOP());
>> +#endif
>=20
> Can we avoid the #ifdef, using
>=20
> 	if (__is_defined(PPC64_ELF_ABI_v2))
> 		PPC_BPF_LL(_R2, _R13, offsetof(struct paca_struct, kernel_toc));
> 	else
> 		EMIT(PPC_RAW_NOP());

Hmm... that doesn't work for me. Is __is_defined() expected to work with=20
macros other than CONFIG options?

>=20
>> +
>>   	/*
>>   	 * Initialize tail_call_cnt if we do tail calls.
>>   	 * Otherwise, put in NOPs so that it can be skipped when we are
>> @@ -87,7 +93,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen=
_context *ctx)
>>   		EMIT(PPC_RAW_NOP());
>>   	}
>>  =20
>> -#define BPF_TAILCALL_PROLOGUE_SIZE	8
>> +#define BPF_TAILCALL_PROLOGUE_SIZE	12
>=20
> Why not change that for v2 ABI only instead of adding a NOP ? ABI won't=20
> change during runtime AFAIU

Yeah, I wanted to keep this simple and I felt an additional nop=20
shouldn't matter too much. But, I guess we can get rid of=20
BPF_TAILCALL_PROLOGUE_SIZE since the only user is the function emitting=20
a tail call. I will submit that as a separate cleanup unless I need to=20
redo this series.

Thanks for the reviews!
- Naveen

