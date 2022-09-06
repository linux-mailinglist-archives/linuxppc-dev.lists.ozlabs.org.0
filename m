Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A6E5ADD15
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 03:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM7j86cbKz30Cx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 11:54:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=OBehsze0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=tm+ggl9y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=OBehsze0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=tm+ggl9y;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM7hL3Wszz306K
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 11:53:21 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 1E96432003CE;
	Mon,  5 Sep 2022 21:53:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 05 Sep 2022 21:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1662429196; x=
	1662515596; bh=qbVoAlsGWiigJK2Fhl2cHPwFlnrLX6Q1syA7bF4dzlg=; b=O
	Behsze0uaWJl7fYrH6vWgHiHNAht6V9+6eKDQvBb4iImNCKo3bNOb9kATaJ6A2yD
	XLtnT8wpsKci9JQ96HD22QaSedxUL+jVkAEj+z9JJtCPuRkpK0HCHy190kN8Bxvg
	TWNhd3r4AFXKIAFqb097/vjfKG2MIT9qpwD41W63/RWsgS6GtlAhwWwqc84gj5m1
	D2ynIaMSWZcNYEhvsFARbbYBUQw9kwqFFWmXyDPW3y9QOLGd5jloDAGVCmoji3jw
	+zuredolhSz+UUPWeEWGXc3KaiLI3YKuYMasdxVskpokM/SODbCOiMrgPm/6MXdB
	bbszspZYVXsdXsrkyu9JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662429196; x=
	1662515596; bh=qbVoAlsGWiigJK2Fhl2cHPwFlnrLX6Q1syA7bF4dzlg=; b=t
	m+ggl9yxKVk/TYAizVf93AhRTd2boCU7/ZyldmMALQ28N66NRAfHfswgM5S4ebqj
	KLzxJvgkQrrvdvRf0K0S7zkuow/t1n0rcGIeOnQciwNgjevcupVETSq+FCnaIV0z
	Fyv5HUWNJm0riF2JJx/qjBtcwutIC6IKDa0Nl1a3NA2bBKllvBQbNJGMD2+niLGj
	cGA0K80NVNRcdTCVgMnmgon1J40jNywQn8jZ+srqs4n3QGJsHju0Mo6qSud7Bo67
	IoNj90Qh73b1GfPtKSdtH+NMBSdmvLA5efYL+Gv+rlB6pe54Fqr0CubTZZLDg55C
	5WMs1gpIAp9n3Nk/1JDKw==
X-ME-Sender: <xms:DKgWY2mcKR0Ng6UXOrfR-EohAlPtVdKlDnj5TjPAqCtzZu8QPd-WkQ>
    <xme:DKgWY90KAFRXKsdRalFrbLf7IOSbctOqHmPWBQuNkJzfGIVPgDh4Gr6jAb92-u1sv
    CcIBRCg7VBRXYSVLg>
X-ME-Received: <xmr:DKgWY0qG426UbUyEFtX0hNp8iI1RF89ainXMAHNkDxMpSgUyHQk8mQWgMQFQFmYDP3L-x5teirshlqOTmuDqaBPD4OII9cUd1-OL_-v7UD_CYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeljedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepuddvfffgffeltefgleeludfgveej
    feelveevlefhuefgjeeuffefjedvudevfeffnecuffhomhgrihhnpehoiihlrggsshdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehr
    uhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:DKgWY6kVot6m9veqgvKybZsEEFIodbGMBqbGY06YuZvVvcd9Ru5jKw>
    <xmx:DKgWY03TiCyNxk2stez4ixTQ4P0Ux2Pah3pOuJNJQBiw2XLkHMctrQ>
    <xmx:DKgWYxvC-_U630ZYsrSY3JbgJYwe0Y1S501OMMhoXWvLF29q9MMtlQ>
    <xmx:DKgWY1KVCMAOLGFe4jrTM82w8gxIGtJUr_6nU0chomXsAr4cTDkFeg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 21:53:13 -0400 (EDT)
Message-ID: <4c9762e47c2283c2217caeb2863065c66c9a078e.camel@russell.cc>
Subject: Re: [RFC PATCH 1/4] powerpc/code-patching: add patch_memory() for
 writing RO text
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Gray
	 <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 06 Sep 2022 11:53:09 +1000
In-Reply-To: <d0ac912f-e665-42a1-c7bf-e62294e17b66@csgroup.eu>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
	 <20220901055823.152983-2-bgray@linux.ibm.com>
	 <d0ac912f-e665-42a1-c7bf-e62294e17b66@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Jason Baron <jbaron@akamai.com>, "npiggin@gmail.com" <npiggin@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-01 at 07:01 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 01/09/2022 =C3=A0 07:58, Benjamin Gray a =C3=A9crit=C2=A0:
> > From: Russell Currey <ruscur@russell.cc>
> >=20
> > powerpc allocates a text poke area of one page that is used by
> > patch_instruction() to modify read-only text when STRICT_KERNEL_RWX
> > is enabled.
> >=20
> > patch_instruction() is only designed for instructions,
> > so writing data using the text poke area can only happen 4 bytes
> > at a time - each with a page map/unmap, pte flush and syncs.
> >=20
> > This patch introduces patch_memory(), implementing the same
> > interface as memcpy(), similar to x86's text_poke() and s390's
> > s390_kernel_write().=C2=A0 patch_memory() only needs to map the text
> > poke area once, unless the write would cross a page boundary.
> >=20
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > ---
> > =C2=A0 arch/powerpc/include/asm/code-patching.h |=C2=A0 1 +
> > =C2=A0 arch/powerpc/lib/code-patching.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 65
> > ++++++++++++++++++++++++
> > =C2=A0 2 files changed, 66 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/code-patching.h
> > b/arch/powerpc/include/asm/code-patching.h
> > index 1c6316ec4b74..3de90748bce7 100644
> > --- a/arch/powerpc/include/asm/code-patching.h
> > +++ b/arch/powerpc/include/asm/code-patching.h
> > @@ -76,6 +76,7 @@ int create_cond_branch(ppc_inst_t *instr, const
> > u32 *addr,
> > =C2=A0 int patch_branch(u32 *addr, unsigned long target, int flags);
> > =C2=A0 int patch_instruction(u32 *addr, ppc_inst_t instr);
> > =C2=A0 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
> > +void *patch_memory(void *dest, const void *src, size_t size);
> >=20
> > =C2=A0 static inline unsigned long patch_site_addr(s32 *site)
> > =C2=A0 {
> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c
> > index 6edf0697a526..0cca39af44cb 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -14,6 +14,7 @@
> > =C2=A0 #include <asm/page.h>
> > =C2=A0 #include <asm/code-patching.h>
> > =C2=A0 #include <asm/inst.h>
> > +#include <asm/cacheflush.h>
> >=20
> > =C2=A0 static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr,
> > u32 *patch_addr)
> > =C2=A0 {
> > @@ -183,6 +184,65 @@ static int do_patch_instruction(u32 *addr,
> > ppc_inst_t instr)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > =C2=A0 }
> > +
> > +static int do_patch_memory(void *dest, const void *src, size_t
> > size)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long text_poke_addr, pat=
ch_addr;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 text_poke_addr =3D (unsigned
> > long)__this_cpu_read(text_poke_area)->addr;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D map_patch_area(dest, text=
_poke_addr);
>=20
> This is not in line with the optimisation done by=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220815114840.14=
68656-1-mpe@ellerman.id.au/

This patch hasn't changed since last year, thanks for the pointer.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return err;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_addr =3D text_poke_addr + o=
ffset_in_page(dest);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 copy_to_kernel_nofault((u8 *)patc=
h_addr, src, size);
>=20
> copy_to_kernel_nofault() has a performance cost.
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_icache_range(patch_addr, si=
ze);
>=20
> Is that needed ? We are patching data, not text.

It's necessary if it gets used to patch text, which it might.  Maybe we
should add a variable and only flush if the caller thinks it's needed.

The comment below should be updated for that too.

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unmap_patch_area(text_poke_addr);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +/**
> > + * patch_memory - write data using the text poke area
> > + *
> > + * @dest:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destination address
> > + * @src:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 source address
> > + * @size:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size in bytes
> > + *
> > + * like memcpy(), but using the text poke area. No atomicity
> > guarantees.
> > + * Do not use for instructions, use patch_instruction() instead.
> > + * Handles crossing page boundaries, though you shouldn't need to.
> > + *
> > + * Return value:
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 @dest
> > + **/
> > +void *patch_memory(void *dest, const void *src, size_t size)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t written, write_size;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // If the poke area isn't set up,=
 it's early boot and we
> > can just memcpy.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!this_cpu_read(text_poke_area=
))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return memcpy(dest, src, size);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (written =3D 0; written < siz=
e; written +=3D write_size) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 // Write as much as possible without crossing a
> > page boundary.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 write_size =3D min_t(size_t, size - written,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE - offset_i=
n_page(dest
> > + written));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 local_irq_save(flags);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 err =3D do_patch_memory(dest + written, src +
> > written, write_size);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 local_irq_restore(flags);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (err)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_=
PTR(err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dest;
> > +}
> > =C2=A0 #else /* !CONFIG_STRICT_KERNEL_RWX */
> >=20
> > =C2=A0 static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
> > @@ -190,6 +250,11 @@ static int do_patch_instruction(u32 *addr,
> > ppc_inst_t instr)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return raw_patch_instr=
uction(addr, instr);
> > =C2=A0 }
> >=20
> > +void *patch_memory(void *dest, const void *src, size_t size)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return memcpy(dest, src, size);
>=20
> In do_patch_memory() you have flush_icache_range(patch_addr, size);
>=20
> If that's really needed there, why don't we need it here as well ?

Good point.  I might make the arguments

	(void *dest, const void *src, size_t size, bool text)

and only do the icache flush if text is true.

>=20
> > +}
> > +
> > =C2=A0 #endif /* CONFIG_STRICT_KERNEL_RWX */
> >=20
> > =C2=A0 __ro_after_init DEFINE_STATIC_KEY_FALSE(init_mem_is_free);
> > --
> > 2.37.2

