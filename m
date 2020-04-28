Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65A1BC5BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 18:49:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BSKz232XzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 02:49:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BRgP0j6czDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 02:19:44 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SG54xE018804; Tue, 28 Apr 2020 12:19:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh6uktnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 12:19:35 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03SG684o023168;
 Tue, 28 Apr 2020 12:19:35 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh6uktmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 12:19:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SGFPEx019767;
 Tue, 28 Apr 2020 16:19:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5pfyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 16:19:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SGJUKp62390394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 16:19:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38939AE04D;
 Tue, 28 Apr 2020 16:19:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F6B8AE05F;
 Tue, 28 Apr 2020 16:19:29 +0000 (GMT)
Received: from localhost (unknown [9.85.73.214])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 16:19:29 +0000 (GMT)
Date: Tue, 28 Apr 2020 21:49:22 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 4/7] powerpc/ppc-opcode: consolidate powerpc
 instructions from bpf_jit.h
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200424070853.443969-1-bala24@linux.ibm.com>
 <20200424070853.443969-5-bala24@linux.ibm.com>
In-Reply-To: <20200424070853.443969-5-bala24@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1588090693.amos3csf0f.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_11:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=601 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280121
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S wrote:
> move macro definitions of powerpc instructions from bpf_jit.h to ppc-opco=
de.h
> and adopt the users of the macros accordingly. `PPC_MR()` is defined twic=
e in
> bpf_jit.h, remove the duplicate one.
>=20
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h | 139 +++++++++++++
>  arch/powerpc/net/bpf_jit.h            | 166 ++-------------
>  arch/powerpc/net/bpf_jit32.h          |  24 +--
>  arch/powerpc/net/bpf_jit64.h          |  12 +-
>  arch/powerpc/net/bpf_jit_comp.c       | 132 ++++++------
>  arch/powerpc/net/bpf_jit_comp64.c     | 278 +++++++++++++-------------
>  6 files changed, 378 insertions(+), 373 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index 2ae0afc5c2bb..6b9a891884be 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -79,6 +79,16 @@
>  #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
>  #define IMM_DS(i)              ((uintptr_t)(i) & 0xfffc)
>=20
> +/*
> + * 16-bit immediate helper macros: HA() is for use with sign-extending i=
nstrs
> + * (e.g. LD, ADDI).  If the bottom 16 bits is "-ve", add another bit int=
o the
> + * top half to negate the effect (i.e. 0xffff + 1 =3D 0x(1)0000).
> + */
> +#define IMM_H(i)                ((uintptr_t)(i)>>16)
> +#define IMM_HA(i)               (((uintptr_t)(i)>>16) +                 =
      \
> +					(((uintptr_t)(i) & 0x8000) >> 15))
> +

Not needed for this patch series, but at some point, we should move over=20
to using the PPC_LO(), PPC_HI() and PPC_HA() macros that are defined=20
later in this file.


- Naveen

