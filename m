Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEFE166574
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 18:53:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NhzF6q6gzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 04:53:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NhxG36vGzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 04:52:01 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KHoVIu097742; Thu, 20 Feb 2020 12:51:58 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubbk8sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 12:51:58 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01KHowdb021065;
 Thu, 20 Feb 2020 17:51:57 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 2y6896xkhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 17:51:57 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KHpv6j53084418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 17:51:57 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 042D6112065;
 Thu, 20 Feb 2020 17:51:57 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 035DF112061;
 Thu, 20 Feb 2020 17:51:55 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 17:51:55 +0000 (GMT)
Message-ID: <b19a8b0cb1ad8275458df16142756b30f8b288b7.camel@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat TM-related invalid form
 instructions on P9 like the valid ones
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Gustavo Romero <gromero@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 paulus@ozlabs.org
Date: Thu, 20 Feb 2020 14:51:49 -0300
In-Reply-To: <20200218211324.23045-1-gromero@linux.ibm.com>
References: <20200218211324.23045-1-gromero@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-jlIhWTfxHOxfCQ45o+IG"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_15:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200133
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-jlIhWTfxHOxfCQ45o+IG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Gustavo, comments inline:

On Tue, 2020-02-18 at 16:13 -0500, Gustavo Romero wrote:
<SNIP>
> diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv=
_tm.c
> index 0db937497169..cc90b8b82329 100644
> --- a/arch/powerpc/kvm/book3s_hv_tm.c
> +++ b/arch/powerpc/kvm/book3s_hv_tm.c
> @@ -3,6 +3,8 @@
>   * Copyright 2017 Paul Mackerras, IBM Corp. <paulus@au1.ibm.com>
>   */
>=20
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +

Could not see where is this used.

>  #include <linux/kvm_host.h>
>=20
>  #include <asm/kvm_ppc.h>
> @@ -44,7 +46,18 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>  	u64 newmsr, bescr;
>  	int ra, rs;
>=20
> -	switch (instr & 0xfc0007ff) {
> +	/*
> +	 * rfid, rfebb, and mtmsrd encode bit 31 =3D 0 since it's a reserved bi=
t
> +	 * in these instructions, so masking bit 31 out doesn't change these
> +	 * instructions. For treclaim., tsr., and trechkpt. instructions if bit
> +	 * 31 =3D 0 then they are per ISA invalid forms, however P9 UM, in sect=
ion
> +	 * 4.6.10 Book II Invalid Forms, informs specifically that ignoring bit
> +	 * 31 is an acceptable way to handle these invalid forms that have
> +	 * bit 31 =3D 0. Moreover, for emulation purposes both forms (w/ and wo=
/
> +	 * bit 31 set) can generate a softpatch interrupt. Hence both forms
> +	 * are handled below for these instructions so they behave the same way=
.
> +	 */
> +	switch (instr & PO_XOP_OPCODE_MASK) {
>=20
<SNIP>
> -	case PPC_INST_TRECHKPT:
> +	/* ignore bit 31, see comment above */
> +	case (PPC_INST_TRECHKPT & PO_XOP_OPCODE_MASK):
>  		/* XXX do we need to check for PR=3D0 here? */
>  		/* check for TM disabled in the HFSCR or MSR */
>  		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
> @@ -208,6 +224,8 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>  	}
>=20

Seems good, using the same flag to mask out bit 31 of these macros.
They are used only in a few places, and I think removing the macro bit
would be ok, but I think your way is better to keep it documented.=20

I just noticed that there is a similar function that uses PPC_INST_TSR:
kvmhv_p9_tm_emulation_early @ arch/powerpc/kvm/book3s_hv_tm_builtin.c.
Wouldn't it need to be changed as well?

>  	/* What should we do here? We didn't recognize the instruction */
> -	WARN_ON_ONCE(1);
> +	kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
> +	pr_warn_ratelimited("Unrecognized TM-related instruction %#x for emulat=
ion", instr);
> +
>  	return RESUME_GUEST;
>  }

I suppose this is the right thing to do, but I think it would be better
to give this change it's own patch.

What do you think?

Best regards,
Leonardo Bras


--=-jlIhWTfxHOxfCQ45o+IG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5OxzUACgkQlQYWtz9S
ttQkYxAAx8gegORSGUOrDvIhbnkhhLC6DodaVy7410rljqks5Wx+R0yMjFsoEx1g
a6jOLvmr5Tr52is0EZd9z/OtF8oweo+VakGhGGTnjByZBGWuqvj7LviZYDbIsXYU
UExOXD3vdzi8CkUdnWLRn8nDSCGIFDRY3YmZgczIM6JBiLdCOHhSUVBKtYwZsMhK
8cYqEwZL6Yu1tkV1OjI7ZBpucnYljJ9+xPdcPWK8dEqxoYCtcOXm8vIbw4ONAoyG
vDKEftPCinjePBYlGwipuMmswKWKJc9K9AO7oktHLsld81hXe3JyzhA8mKE4OT7W
v+3gtl8QueexKmg4JvZLY2hIfuNIDTXBYgjpoLtj0OnP3GL/KLgp31govpVOmdNb
YkGUMJAGzwulaNHVntpW10bZfKxOuwFvB9VSjL9L5h+3wcCVP7IsReakYnD0+JiV
Q06II0NWEMiSWaKaqljYtJWZ0xCxS6RlJw1FdYAzHIQflqHd9PDYreOc86SGm0ND
ERNT5IJZrmdMoW9SZuCZG6FzZZSsrOk35W0tssu2alDQPX689ePATgZb+p8KS61J
XvuPR8LFmSS73cYZ93508+SVuH8Q8/O1sn3Fnyz2QkJ52sRu9Iqk46fyO7BZ0FLf
hMqAvILhLMpBVgLdssAkRk7cpTIv39RuM90baQSTZzstqlCCUo0=
=rtFD
-----END PGP SIGNATURE-----

--=-jlIhWTfxHOxfCQ45o+IG--

