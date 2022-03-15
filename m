Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633E4D9274
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 03:09:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHcKm6NWCz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 13:09:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Txt8hjlm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHcK85lgjz2xX8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 13:09:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Txt8hjlm; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KHcK625BJz4xvW;
 Tue, 15 Mar 2022 13:08:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1647310140;
 bh=DQLbu8ZK6+3euQ9kGSVBdD8oOAoWN4NLJ3/SuRxqoj4=;
 h=Date:From:To:Cc:Subject:From;
 b=Txt8hjlmsANTzVoejfKFDXpfCgSs+zImJFgReI1hIcIQVwIWhVYUUy7fkG2v2FlzU
 9V1fZJg3UZPRzjkTi1VbLd8jpkcEQoqt+C0Pdizq+uFznMFKiDft02OB/BPJXPUik6
 WcCB4Nl10Z1tsAzJ/KvT1h8CPF2Fiq67+u5vk0cDKk/QVuNcshxdenMM67DRfzYPjB
 PPcBcLNYbUc8lvVUAU3Ot+T9wNneRCQludKuyYNKKMlGErWj8P4bvreCQekS+4XpdB
 lGxmYyll9zmQUt+dXDpB5XT6gNhKRhOFID3n43Zd7cytGKEixajNbiOqkyVH9L0SGa
 eRol+s+mxqUtw==
Date: Tue, 15 Mar 2022 13:08:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the tip tree with the powerpc tree
Message-ID: <20220315130857.4610e761@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R8CDU9LS=P+IHhBLtfBWjSU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/R8CDU9LS=P+IHhBLtfBWjSU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/powerpc/include/asm/livepatch.h

between commit:

  a4520b252765 ("powerpc/ftrace: Add support for livepatch to PPC32")

from the powerpc tree and commit:

  a557abfd1a16 ("x86/livepatch: Validate __fentry__ location")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/livepatch.h
index 6f10de6af6e3,7b9dcd51af32..000000000000
--- a/arch/powerpc/include/asm/livepatch.h
+++ b/arch/powerpc/include/asm/livepatch.h
@@@ -14,21 -14,11 +14,11 @@@
  #ifdef CONFIG_LIVEPATCH
  static inline void klp_arch_set_pc(struct ftrace_regs *fregs, unsigned lo=
ng ip)
  {
 -	struct pt_regs *regs =3D ftrace_get_regs(fregs);
 -
 -	regs_set_return_ip(regs, ip);
 +	ftrace_instruction_pointer_set(fregs, ip);
  }
-=20
- #define klp_get_ftrace_location klp_get_ftrace_location
- static inline unsigned long klp_get_ftrace_location(unsigned long faddr)
- {
- 	/*
- 	 * Live patch works on PPC32 and only with -mprofile-kernel on PPC64. In
- 	 * both cases, the ftrace location is always within the first 16 bytes.
- 	 */
- 	return ftrace_location_range(faddr, faddr + 16);
- }
 +#endif /* CONFIG_LIVEPATCH */
 =20
 +#ifdef CONFIG_LIVEPATCH_64
  static inline void klp_init_thread_info(struct task_struct *p)
  {
  	/* + 1 to account for STACK_END_MAGIC */

--Sig_/R8CDU9LS=P+IHhBLtfBWjSU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIv9TkACgkQAVBC80lX
0GxapwgAoQr9a8aKDh1Z7ZcA4c3PuxMeuzY/xdE0XmKD0FQPpsro5Ml2UBIBj+wZ
1M66IkBYjOJuO5bxddhbmJoGD4gq3HecnOh3XCLWgWAmlc4D+NS4/AUUf7Fru6A4
A9g8YxADFbrUTFZt1/KqCiPHJ+DtTrW1I2wxLSK2HGUTfAEdadkfW/ak1Xiih/LM
EOCdHXOsilZdZZBQvWaHJa2VqAATJ6o5J8AsG/pgWf2IT1moKyxNhqcGYNuRnHeM
IDvdf9qpor50KuGfeoCgVnnEL5MspoXd6Nu0uiHJcEfZbrmjhnHZmsXsvDFkzbYP
LDegFiLVyJYGDm6Z39ysWI/T3UATQw==
=rRU0
-----END PGP SIGNATURE-----

--Sig_/R8CDU9LS=P+IHhBLtfBWjSU--
