Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC12160A63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 07:25:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LYqy2ff9zDqW0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 17:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LYnm5W7yzDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 17:23:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=oOG0ChKN; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48LYnm0fb8z9sPJ;
 Mon, 17 Feb 2020 17:23:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581920588;
 bh=G5VQb8lXsUSyKr2/cDmTTQ4fWwjE/ITyQ16itirxZTM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oOG0ChKNZBPkonqAwRfMTxDYOs4CH8pvjWhNIOmL08Zx1F9qTG8JaE9ezdXXHvZEc
 nJGrfPFuv6IVuEjmcvbsj1V9CbFM6l3xc/CrZza+CppdkhrbntNBOI7mrk3jsuVFGZ
 OJp+nccm5S/kJfBGTpjvAEc685DIPPIQ3j8/iR9lxeqpo+Op51/4LCNG+gGMeloqE5
 RKPd06xHIzP8l75aW8nzktF7OZkU1sgqkFjY67U7nMAqCKzvUFDijWAknZsy7g2aKw
 Qq8RhT1dEWqlaBNraq0knwwyFRe+sLgWgII3kg4kpv2kh2zXyASdH2119jxpr3UGxF
 9WwbZH6x9FrLg==
Received: by neuling.org (Postfix, from userid 1000)
 id 0BB3B2C0229; Mon, 17 Feb 2020 17:23:08 +1100 (AEDT)
Message-ID: <1752a0c735a455c5d3ca09209f5a52748c8f7116.camel@neuling.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat unrecognized TM instructions
 as illegal
From: Michael Neuling <mikey@neuling.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Date: Mon, 17 Feb 2020 17:23:07 +1100
In-Reply-To: <20200217055712.GS22482@gate.crashing.org>
References: <20200213151532.12559-1-gromero@linux.ibm.com>
 <29b136e15c2f04f783b54ec98552d1a6009234db.camel@neuling.org>
 <20200217055712.GS22482@gate.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2020-02-16 at 23:57 -0600, Segher Boessenkool wrote:
> On Mon, Feb 17, 2020 at 12:07:31PM +1100, Michael Neuling wrote:
> > On Thu, 2020-02-13 at 10:15 -0500, Gustavo Romero wrote:
> > > On P9 DD2.2 due to a CPU defect some TM instructions need to be emula=
ted
> > > by
> > > KVM. This is handled at first by the hardware raising a softpatch
> > > interrupt
> > > when certain TM instructions that need KVM assistance are executed in=
 the
> > > guest. Some TM instructions, although not defined in the Power ISA, m=
ight
> > > raise a softpatch interrupt. For instance, 'tresume.' instruction as
> > > defined in the ISA must have bit 31 set (1), but an instruction that
> > > matches 'tresume.' OP and XO opcodes but has bit 31 not set (0), like
> > > 0x7cfe9ddc, also raises a softpatch interrupt, for example, if a code
> > > like the following is executed in the guest it will raise a softpatch
> > > interrupt just like a 'tresume.' when the TM facility is enabled:
> > >=20
> > > int main() { asm("tabort. 0; .long 0x7cfe9ddc;"); }
> > > and then treats the executed instruction as 'nop' whilst it should
> > > actually
> > > be treated as an illegal instruction since it's not defined by the IS=
A.
> >=20
> > The ISA has this:=20
> >=20
> >    1.3.3 Reserved Fields, Reserved Values, and Reserved SPRs
> >=20
> >    Reserved fields in instructions are ignored by the pro-
> >    cessor.
> >=20
> > Hence the hardware will ignore reserved bits. For example executing you=
r
> > little
> > program on P8 just exits normally with 0x7cfe9ddc being executed as a N=
OP.
> >=20
> > Hence, we should NOP this, not generate an illegal.
>=20
> It is not a reserved bit.
>=20
> The IMC entry for it matches op1=3D011111 op2=3D1////01110 presumably, wh=
ich
> catches all TM instructions and nothing else (bits 0..5 and bits 21..30).
> That does not look at bit 31, the softpatch handler has to deal with this=
.
>=20
> Some TM insns have bit 31 as 1 and some have it as /.  All instructions
> with a "." in the mnemonic have bit 31 is 1, all other have it reserved.
> The tables in appendices D, E, F show tend. and tsr. as having it
> reserved, which contradicts the individual instruction description (and
> does not make much sense).  (Only tcheck has /, everything else has 1;
> everything else has a mnemonic with a dot, and does write CR0 always).

Wow, interesting.=20

P8 seems to be treating 31 as a reserved bit (with the table definition rat=
her
than the individual instruction description). I'm inclined to match P8 even
though it's inconsistent with the dot mnemonic as you say.

Mikey
