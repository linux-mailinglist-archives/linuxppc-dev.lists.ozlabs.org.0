Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF2424F6E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 10:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ4jm0f0Fz2yg4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 19:48:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NSAszJB3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NSAszJB3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ4hy1ySYz2yHP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 19:48:01 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19782pjx019516; 
 Thu, 7 Oct 2021 04:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=9Se5WKHnX8jbFBEShMVX4BL1t7RQhzEbdGNyiIBsYGQ=;
 b=NSAszJB3aF+1DGLImbLB+i1OUB5hVF/QCiUKA4vtZxwVxv/uJsStoPZ8RIQs0kmRyxqo
 586k6C30nHrFU4r3NU/arD936HA5jagKcoxz+qpgqdDgRd6NGnSjqyYmmEKeP+K8SyVm
 CuEreUDJ+Hexg/3fTgoLHeftkRvxGVluQE/RrCHGBMtw6N5EpOXcx7iAChz8h18YWA/c
 JEnQEfY9r0SkcfyQuDjTsCQH+QcQ+Pav+wDWftHl/J9IVPnFJmsdL3vipjARAwOGcefi
 A5InvFhICuitaWAGxdKziEls36d9WscaRJS623ePHlZtvknyRGQrRjC5qrNFSo9xWyP5 Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bhhkny4tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 04:47:39 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1975fdFe025742;
 Thu, 7 Oct 2021 04:47:38 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bhhkny4sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 04:47:38 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1978ftGA013738;
 Thu, 7 Oct 2021 08:47:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3bef2aagnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 08:47:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1978gAgY60096772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Oct 2021 08:42:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDAE0A4066;
 Thu,  7 Oct 2021 08:47:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D77CA405F;
 Thu,  7 Oct 2021 08:47:30 +0000 (GMT)
Received: from localhost (unknown [9.43.77.43])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  7 Oct 2021 08:47:29 +0000 (GMT)
Date: Thu, 07 Oct 2021 14:17:28 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 04/10] powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Jordan Niethe <jniethe5@gmail.com>, Johan Almbladh
 <johan.almbladh@anyfinetworks.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Song Liu <songliubraving@fb.com>
References: <cover.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
 <fc4b1276eb10761fd7ce0814c8dd089da2815251.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
 <90494652-7551-7ecb-e44d-a2adbb6a1afe@csgroup.eu>
In-Reply-To: <90494652-7551-7ecb-e44d-a2adbb6a1afe@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1633596209.h2aj4uqpon.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PxPgLOngBzB8tpLcpbYeP-MYOd5hg-Bp
X-Proofpoint-GUID: 6p_UiM5GdDBokMKazrXBWBZMy7WFmAhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070059
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 05/10/2021 =C3=A0 22:25, Naveen N. Rao a =C3=A9crit=C2=A0:
>> We aren't handling subtraction involving an immediate value of
>> 0x80000000 properly. Fix the same.
>>=20
>> Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for ext=
ended BPF")
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>> Changelog:
>> - Split up BPF_ADD and BPF_SUB cases per Christophe's comments
>>=20
>>   arch/powerpc/net/bpf_jit_comp64.c | 27 +++++++++++++++++----------
>>   1 file changed, 17 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_ji=
t_comp64.c
>> index d67f6d62e2e1ff..6626e6c17d4ed2 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>> @@ -330,18 +330,25 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *i=
mage, struct codegen_context *
>>   			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, src_reg));
>>   			goto bpf_alu32_trunc;
>>   		case BPF_ALU | BPF_ADD | BPF_K: /* (u32) dst +=3D (u32) imm */
>> -		case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -=3D (u32) imm */
>>   		case BPF_ALU64 | BPF_ADD | BPF_K: /* dst +=3D imm */
>> +			if (!imm) {
>> +				goto bpf_alu32_trunc;
>> +			} else if (imm >=3D -32768 && imm < 32768) {
>> +				EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
>> +			} else {
>> +				PPC_LI32(b2p[TMP_REG_1], imm);
>> +				EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
>> +			}
>> +			goto bpf_alu32_trunc;
>> +		case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -=3D (u32) imm */
>>   		case BPF_ALU64 | BPF_SUB | BPF_K: /* dst -=3D imm */
>> -			if (BPF_OP(code) =3D=3D BPF_SUB)
>> -				imm =3D -imm;
>> -			if (imm) {
>> -				if (imm >=3D -32768 && imm < 32768)
>> -					EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
>> -				else {
>> -					PPC_LI32(b2p[TMP_REG_1], imm);
>> -					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
>> -				}
>> +			if (!imm) {
>> +				goto bpf_alu32_trunc;
>> +			} else if (imm > -32768 && imm < 32768) {
>=20
> Why do you exclude imm =3D=3D 32768 ?
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Good catch -- that was from an earlier version where this was shared=20
across BPF_ADD and BPF_SUB. I missed updating this section before=20
posting.

Michael, please consider squashing in the below diff into this patch.

Thanks!
- Naveen


---
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_c=
omp64.c
index f5a804d8c95bc1..0fdc1ff86e4f1c 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -368,7 +368,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,=
 struct codegen_context *
 		case BPF_ALU64 | BPF_SUB | BPF_K: /* dst -=3D imm */
 			if (!imm) {
 				goto bpf_alu32_trunc;
-			} else if (imm > -32768 && imm < 32768) {
+			} else if (imm > -32768 && imm <=3D 32768) {
 				EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(-imm)));
 			} else {
 				PPC_LI32(b2p[TMP_REG_1], imm);
