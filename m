Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4F1D2F91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 14:23:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N9gH1BKQzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 22:23:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N9b41Zx0zDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 22:19:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49N9b342dMz9sVB;
 Thu, 14 May 2020 22:19:43 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v8 29/30] powerpc sstep: Add support for prefixed
 load/stores
Date: Thu, 14 May 2020 22:19:42 +1000
Message-ID: <3995356.VobCscqqe9@townsend>
In-Reply-To: <5a82008c-a5fa-0292-94fa-eb6fb0d41c42@csgroup.eu>
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-30-jniethe5@gmail.com>
 <5a82008c-a5fa-0292-94fa-eb6fb0d41c42@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday, 14 May 2020 4:15:06 PM AEST Christophe Leroy wrote:
> Shouldn't this patch go before patch 23 ?

Perhaps I am missing something, but it seems reasonable enough to me that y=
ou=20
would introduce the machinery for dealing with prefix instructions prior to=
=20
defining them. What would be the advantage of doing things the other way=20
around?

=2D Alistair

> Christophe
>=20
> Le 06/05/2020 =E0 05:40, Jordan Niethe a =E9crit :
> > This adds emulation support for the following prefixed integer
> >=20
> > load/stores:
> >    * Prefixed Load Byte and Zero (plbz)
> >    * Prefixed Load Halfword and Zero (plhz)
> >    * Prefixed Load Halfword Algebraic (plha)
> >    * Prefixed Load Word and Zero (plwz)
> >    * Prefixed Load Word Algebraic (plwa)
> >    * Prefixed Load Doubleword (pld)
> >    * Prefixed Store Byte (pstb)
> >    * Prefixed Store Halfword (psth)
> >    * Prefixed Store Word (pstw)
> >    * Prefixed Store Doubleword (pstd)
> >    * Prefixed Load Quadword (plq)
> >    * Prefixed Store Quadword (pstq)
> >=20
> > the follow prefixed floating-point load/stores:
> >    * Prefixed Load Floating-Point Single (plfs)
> >    * Prefixed Load Floating-Point Double (plfd)
> >    * Prefixed Store Floating-Point Single (pstfs)
> >    * Prefixed Store Floating-Point Double (pstfd)
> >=20
> > and for the following prefixed VSX load/stores:
> >    * Prefixed Load VSX Scalar Doubleword (plxsd)
> >    * Prefixed Load VSX Scalar Single-Precision (plxssp)
> >    * Prefixed Load VSX Vector [0|1]  (plxv, plxv0, plxv1)
> >    * Prefixed Store VSX Scalar Doubleword (pstxsd)
> >    * Prefixed Store VSX Scalar Single-Precision (pstxssp)
> >    * Prefixed Store VSX Vector [0|1] (pstxv, pstxv0, pstxv1)
> >=20
> > Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: - Combine all load/store patches
> >=20
> >      - Fix the name of Type 01 instructions
> >      - Remove sign extension flag from pstd/pld
> >      - Rename sufx -> suffix
> >=20
> > v3: - Move prefixed loads and stores into the switch statement
> > v6: - Compile on ppc32
> >=20
> >      - Add back in + GETLENGTH(op->type)
> >=20
> > v8: Use fallthrough; keyword
> > ---
> >=20
> >   arch/powerpc/include/asm/sstep.h |   4 +
> >   arch/powerpc/lib/sstep.c         | 163 ++++++++++++++++++++++++++++++-
> >   2 files changed, 165 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/sstep.h
> > b/arch/powerpc/include/asm/sstep.h index c3ce903ac488..9b200a5f8794
> > 100644
> > --- a/arch/powerpc/include/asm/sstep.h
> > +++ b/arch/powerpc/include/asm/sstep.h
> > @@ -90,11 +90,15 @@ enum instruction_type {
> >=20
> >   #define VSX_LDLEFT	4	/* load VSX register from left */
> >   #define VSX_CHECK_VEC	8	/* check MSR_VEC not MSR_VSX for reg >=3D 32 =
*/
> >=20
> > +/* Prefixed flag, ORed in with type */
> > +#define PREFIXED       0x800
> > +
> >=20
> >   /* Size field in type word */
> >   #define SIZE(n)		((n) << 12)
> >   #define GETSIZE(w)	((w) >> 12)
> >  =20
> >   #define GETTYPE(t)	((t) & INSTR_TYPE_MASK)
> >=20
> > +#define GETLENGTH(t)   (((t) & PREFIXED) ? 8 : 4)
> >=20
> >   #define MKOP(t, f, s)	((t) | (f) | SIZE(s))
> >=20
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index ecd756c346fd..6794a7672ad5 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -187,6 +187,44 @@ static nokprobe_inline unsigned long
> > xform_ea(unsigned int instr,>=20
> >   	return ea;
> >  =20
> >   }
> >=20
> > +/*
> > + * Calculate effective address for a MLS:D-form / 8LS:D-form
> > + * prefixed instruction
> > + */
> > +static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
> > +						  unsigned int suffix,
> > +						  const struct pt_regs *regs)
> > +{
> > +	int ra, prefix_r;
> > +	unsigned int  dd;
> > +	unsigned long ea, d0, d1, d;
> > +
> > +	prefix_r =3D instr & (1ul << 20);
> > +	ra =3D (suffix >> 16) & 0x1f;
> > +
> > +	d0 =3D instr & 0x3ffff;
> > +	d1 =3D suffix & 0xffff;
> > +	d =3D (d0 << 16) | d1;
> > +
> > +	/*
> > +	 * sign extend a 34 bit number
> > +	 */
> > +	dd =3D (unsigned int)(d >> 2);
> > +	ea =3D (signed int)dd;
> > +	ea =3D (ea << 2) | (d & 0x3);
> > +
> > +	if (!prefix_r && ra)
> > +		ea +=3D regs->gpr[ra];
> > +	else if (!prefix_r && !ra)
> > +		; /* Leave ea as is */
> > +	else if (prefix_r && !ra)
> > +		ea +=3D regs->nip;
> > +	else if (prefix_r && ra)
> > +		; /* Invalid form. Should already be checked for by caller! */
> > +
> > +	return ea;
> > +}
> > +
> >=20
> >   /*
> >  =20
> >    * Return the largest power of 2, not greater than sizeof(unsigned
> >    long),
> >    * such that x is a multiple of it.
> >=20
> > @@ -1166,6 +1204,9 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,>=20
> >   		  struct ppc_inst instr)
> >  =20
> >   {
> >  =20
> >   	unsigned int opcode, ra, rb, rc, rd, spr, u;
> >=20
> > +#ifdef __powerpc64__
> > +	unsigned int suffixopcode, prefixtype, prefix_r;
> > +#endif
> >=20
> >   	unsigned long int imm;
> >   	unsigned long int val, val2;
> >   	unsigned int mb, me, sh;
> >=20
> > @@ -2652,6 +2693,124 @@ int analyse_instr(struct instruction_op *op, co=
nst
> > struct pt_regs *regs,>=20
> >   			break;
> >   	=09
> >   		}
> >   		break;
> >=20
> > +	case 1: /* Prefixed instructions */
> > +		prefix_r =3D word & (1ul << 20);
> > +		ra =3D (suffix >> 16) & 0x1f;
> > +		op->update_reg =3D ra;
> > +		rd =3D (suffix >> 21) & 0x1f;
> > +		op->reg =3D rd;
> > +		op->val =3D regs->gpr[rd];
> > +
> > +		suffixopcode =3D suffix >> 26;
> > +		prefixtype =3D (word >> 24) & 0x3;
> > +		switch (prefixtype) {
> > +		case 0: /* Type 00  Eight-Byte Load/Store */
> > +			if (prefix_r && ra)
> > +				break;
> > +			op->ea =3D mlsd_8lsd_ea(word, suffix, regs);
> > +			switch (suffixopcode) {
> > +			case 41:	/* plwa */
> > +				op->type =3D MKOP(LOAD, PREFIXED | SIGNEXT, 4);
> > +				break;
> > +			case 42:        /* plxsd */
> > +				op->reg =3D rd + 32;
> > +				op->type =3D MKOP(LOAD_VSX, PREFIXED, 8);
> > +				op->element_size =3D 8;
> > +				op->vsx_flags =3D VSX_CHECK_VEC;
> > +				break;
> > +			case 43:	/* plxssp */
> > +				op->reg =3D rd + 32;
> > +				op->type =3D MKOP(LOAD_VSX, PREFIXED, 4);
> > +				op->element_size =3D 8;
> > +				op->vsx_flags =3D VSX_FPCONV | VSX_CHECK_VEC;
> > +				break;
> > +			case 46:	/* pstxsd */
> > +				op->reg =3D rd + 32;
> > +				op->type =3D MKOP(STORE_VSX, PREFIXED, 8);
> > +				op->element_size =3D 8;
> > +				op->vsx_flags =3D VSX_CHECK_VEC;
> > +				break;
> > +			case 47:	/* pstxssp */
> > +				op->reg =3D rd + 32;
> > +				op->type =3D MKOP(STORE_VSX, PREFIXED, 4);
> > +				op->element_size =3D 8;
> > +				op->vsx_flags =3D VSX_FPCONV | VSX_CHECK_VEC;
> > +				break;
> > +			case 51:	/* plxv1 */
> > +				op->reg +=3D 32;
> > +				fallthrough;
> > +			case 50:	/* plxv0 */
> > +				op->type =3D MKOP(LOAD_VSX, PREFIXED, 16);
> > +				op->element_size =3D 16;
> > +				op->vsx_flags =3D VSX_CHECK_VEC;
> > +				break;
> > +			case 55:	/* pstxv1 */
> > +				op->reg =3D rd + 32;
> > +				fallthrough;
> > +			case 54:	/* pstxv0 */
> > +				op->type =3D MKOP(STORE_VSX, PREFIXED, 16);
> > +				op->element_size =3D 16;
> > +				op->vsx_flags =3D VSX_CHECK_VEC;
> > +				break;
> > +			case 56:        /* plq */
> > +				op->type =3D MKOP(LOAD, PREFIXED, 16);
> > +				break;
> > +			case 57:	/* pld */
> > +				op->type =3D MKOP(LOAD, PREFIXED, 8);
> > +				break;
> > +			case 60:        /* stq */
> > +				op->type =3D MKOP(STORE, PREFIXED, 16);
> > +				break;
> > +			case 61:	/* pstd */
> > +				op->type =3D MKOP(STORE, PREFIXED, 8);
> > +				break;
> > +			}
> > +			break;
> > +		case 1: /* Type 01 Eight-Byte Register-to-Register */
> > +			break;
> > +		case 2: /* Type 10 Modified Load/Store */
> > +			if (prefix_r && ra)
> > +				break;
> > +			op->ea =3D mlsd_8lsd_ea(word, suffix, regs);
> > +			switch (suffixopcode) {
> > +			case 32:	/* plwz */
> > +				op->type =3D MKOP(LOAD, PREFIXED, 4);
> > +				break;
> > +			case 34:	/* plbz */
> > +				op->type =3D MKOP(LOAD, PREFIXED, 1);
> > +				break;
> > +			case 36:	/* pstw */
> > +				op->type =3D MKOP(STORE, PREFIXED, 4);
> > +				break;
> > +			case 38:	/* pstb */
> > +				op->type =3D MKOP(STORE, PREFIXED, 1);
> > +				break;
> > +			case 40:	/* plhz */
> > +				op->type =3D MKOP(LOAD, PREFIXED, 2);
> > +				break;
> > +			case 42:	/* plha */
> > +				op->type =3D MKOP(LOAD, PREFIXED | SIGNEXT, 2);
> > +				break;
> > +			case 44:	/* psth */
> > +				op->type =3D MKOP(STORE, PREFIXED, 2);
> > +				break;
> > +			case 48:        /* plfs */
> > +				op->type =3D MKOP(LOAD_FP, PREFIXED | FPCONV, 4);
> > +				break;
> > +			case 50:        /* plfd */
> > +				op->type =3D MKOP(LOAD_FP, PREFIXED, 8);
> > +				break;
> > +			case 52:        /* pstfs */
> > +				op->type =3D MKOP(STORE_FP, PREFIXED | FPCONV, 4);
> > +				break;
> > +			case 54:        /* pstfd */
> > +				op->type =3D MKOP(STORE_FP, PREFIXED, 8);
> > +				break;
> > +			}
> > +			break;
> > +		case 3: /* Type 11 Modified Register-to-Register */
> > +			break;
> > +		}
> >=20
> >   #endif /* __powerpc64__ */
> >  =20
> >   	}
> >=20
> > @@ -2760,7 +2919,7 @@ void emulate_update_regs(struct pt_regs *regs,
> > struct instruction_op *op)>=20
> >   {
> >  =20
> >   	unsigned long next_pc;
> >=20
> > -	next_pc =3D truncate_if_32bit(regs->msr, regs->nip + 4);
> > +	next_pc =3D truncate_if_32bit(regs->msr, regs->nip + GETLENGTH(op-
>type));
> >=20
> >   	switch (GETTYPE(op->type)) {
> >   =09
> >   	case COMPUTE:
> >   		if (op->type & SETREG)
> >=20
> > @@ -3205,7 +3364,7 @@ int emulate_step(struct pt_regs *regs, struct
> > ppc_inst instr)>=20
> >   	return 0;
> >   =09
> >    instr_done:
> > -	regs->nip =3D truncate_if_32bit(regs->msr, regs->nip + 4);
> > +	regs->nip =3D truncate_if_32bit(regs->msr, regs->nip +
> > GETLENGTH(op.type));
> >=20
> >   	return 1;
> >  =20
> >   }
> >   NOKPROBE_SYMBOL(emulate_step);




