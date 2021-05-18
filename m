Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BF33880C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 21:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fl6B10XwCz2yxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 05:53:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=rWmOHDpX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.178; helo=mx02.puc.rediris.es;
 envelope-from=prvs=17683247c9=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=rWmOHDpX; dkim-atps=neutral
Received: from mx02.puc.rediris.es (outbound4sev.lav.puc.rediris.es
 [130.206.19.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fl69W4nJ6z2yWx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 05:52:44 +1000 (AEST)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es
 [130.206.24.44])
 by mx02.puc.rediris.es  with ESMTP id 14IJqLGC021071-14IJqLGE021071
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 18 May 2021 21:52:21 +0200
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPS id CE992C0F369;
 Tue, 18 May 2021 21:52:20 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTP id 1F1A8C4DECD;
 Tue, 18 May 2021 21:52:20 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FGLl_MBUKW7e; Tue, 18 May 2021 21:52:19 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy01.sim.rediris.es [130.206.24.69])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPA id CA431C0F369;
 Tue, 18 May 2021 21:52:14 +0200 (CEST)
Date: Tue, 18 May 2021 21:52:08 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v8 27/30] powerpc/kprobes: Don't allow breakpoints on
 suffixes
Message-ID: <20210518195208.GA28061@lt-gp.iram.es>
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-28-jniethe5@gmail.com>
 <cda38a1c-a78f-9eb5-8395-ce23caa2c81d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <cda38a1c-a78f-9eb5-8395-ce23caa2c81d@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Transfer-Encoding: quoted-printable
X-FE-Policy-ID: 2:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=DtLf7QggnK26vEPOtk+HjTk5d65deUhTfcLVTLFtJaE=;
 b=rWmOHDpXNumDOs9fG8w+ohHV4CMqu6cmh8EwYjTahDVUabOilxMI3KjPh4oBSL38E/690oj0A5wu
 myTv8/q9HMnUXZV4SJEjFCQRLA4JybiXqhJyrU0i9B5Dd2ynbbfGXBx+fJtpuZERldVaeVqo/OAo
 Sg29gm4pI1aZK+FLqS3QtTbpZpJrSS31VoPn6VKKnmB/xLUiST0oM/WAsIctAoqLLex9MbnBgRHG
 QMwMorMRMRVJrFV8Ym//0g3ESFsa1Xyda9e+8f6cdi6jvPppbsZ4MlMCd6d3Q1mIdEvaAvkEZllO
 1A/cQWin10sWjZTT5RnhEPFJuWCmHFHVNZZnnQ==
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
 alistair@popple.id.au, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 18, 2021 at 08:43:39PM +0200, Christophe Leroy wrote:
>=20
>=20
> Le 06/05/2020 =E0 05:40, Jordan Niethe a =E9crit=A0:
> > Do not allow inserting breakpoints on the suffix of a prefix instruct=
ion
> > in kprobes.
> >=20
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v8: Add this back from v3
> > ---
> >   arch/powerpc/kernel/kprobes.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >=20
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kpro=
bes.c
> > index 33d54b091c70..227510df8c55 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -106,7 +106,9 @@ kprobe_opcode_t *kprobe_lookup_name(const char *n=
ame, unsigned int offset)
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> >   	int ret =3D 0;
> > +	struct kprobe *prev;
> >   	struct ppc_inst insn =3D ppc_inst_read((struct ppc_inst *)p->addr)=
;
> > +	struct ppc_inst prefix =3D ppc_inst_read((struct ppc_inst *)(p->add=
r - 1));
>=20
> What if p->addr is the first word of a page and the previous page is no=
t mapped ?

IIRC prefixed instructions can't straddle 64 byte boundaries (or was it
128 bytes?), much less page boundaries.

>=20
> >   	if ((unsigned long)p->addr & 0x03) {
> >   		printk("Attempt to register kprobe at an unaligned address\n");
> > @@ -114,6 +116,17 @@ int arch_prepare_kprobe(struct kprobe *p)
> >   	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
> >   		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
> >   		ret =3D -EINVAL;
> > +	} else if (ppc_inst_prefixed(prefix)) {
>=20
> If p->addr - 2 contains a valid prefixed instruction, then p->addr - 1
> contains the suffix of that prefixed instruction. Are we sure a suffix =
can
> never ever be misinterpreted as the prefix of a prefixed instruction ?
>=20

Prefixes are easy to decode, the 6 MSB are 0b000001 (from memory).

After some digging on the 'net: "All prefixes have the major opcode 1. A
prefix will never be a valid word instruction. A suffix may be an
existing word instruction or a new instruction."

IOW, detecting prefixes is trivial. It's not x86...

	Gabriel

>=20
> > +		printk("Cannot register a kprobe on the second word of prefixed in=
struction\n");
> > +		ret =3D -EINVAL;
> > +	}
> > +	preempt_disable();
> > +	prev =3D get_kprobe(p->addr - 1);
> > +	preempt_enable_no_resched();
> > +	if (prev &&
> > +	    ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)prev->ainsn.=
insn))) {
> > +		printk("Cannot register a kprobe on the second word of prefixed in=
struction\n");
> > +		ret =3D -EINVAL;
> >   	}
> >   	/* insn must be on a special executable page on ppc64.  This is
> >=20
 

