Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD88B307B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 08:33:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=gmHnbQDK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQjc342S8z3vby
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 16:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=gmHnbQDK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQjbL4mJ8z3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 16:33:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714113198;
	bh=6Y3Pvzw551sAs1KbLGSUMWiK/mGngNA5pQ9eJ3QZexA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gmHnbQDKNIPhPiNHxlmWIEd/nQw7EaS2G27TLsj05iV33X07z4JbTtXZ4aTK6DQkU
	 eQepK8grflZG5lpLqXBxyvX9WzP+drv0ay8ABAFSR5G1zR38EXG54Fq/hRNwcH404H
	 1+K/mgWm75OwGeTfwZ5Ie2DHSLxWyua4RoUPE5akwWUnLBo91x8FKkX5nSI2HqFbJv
	 R4Pej7rSnY7BiJ+hXzm6yeOBPljLwhJUycQM07qLqe9/AUmymZGCGS0qA581eiDdAW
	 IYKn9XSIV4QdKjZxhS2VmXgJDS8AT+qXJcAKwxDtb5RgUDYWfG2O8xS3ASIIfArOWQ
	 39ZGEkJw1kSFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VQjbL38fsz4wyh;
	Fri, 26 Apr 2024 16:33:18 +1000 (AEST)
Date: Fri, 26 Apr 2024 16:33:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: linux-next: boot failure after merge of the modules tree
Message-ID: <20240426163317.4d908643@canb.auug.org.au>
In-Reply-To: <ZijNiXzNpfoyokrh@kernel.org>
References: <20240424183503.2a6ce847@canb.auug.org.au>
	<ZijNiXzNpfoyokrh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kBDTo./6+AX2Nu=yAld2Qcl";
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/kBDTo./6+AX2Nu=yAld2Qcl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Wed, 24 Apr 2024 12:14:49 +0300 Mike Rapoport <rppt@kernel.org> wrote:
>
> This should fix it for now, I'll rework initialization a bit in v6
> =20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1c4be3373686..bea33bf538e9 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -176,6 +176,7 @@ config PPC
>  	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>  	select ARCH_WANT_LD_ORPHAN_WARN
>  	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if PPC_RADIX_MMU
> +	select ARCH_WANTS_EXECMEM_EARLY         if EXECMEM
>  	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
>  	select ARCH_WEAK_RELEASE_ACQUIRE
>  	select BINFMT_ELF

I added the above to today's merge of the modules tree and it made the
boot failure go away.

--=20
Cheers,
Stephen Rothwell

--Sig_/kBDTo./6+AX2Nu=yAld2Qcl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYrSq0ACgkQAVBC80lX
0Gw4Jgf/Si1gEOcumL+/if4mFuaMXl46NLK++hY2yB0CEsh9NWe29U+NWSuU8iU8
hfBkQhpzeBrm34Xp6/vXZK7XWsAxDQBnYosoIQUNFtSzcN6KfOHyb1umpXqod6Wx
RcTGAJhQucD6bvq0D6/EMMz8DzU6uYjSspJQmlOQ1h/EufdYc80UWkePDLwREsfj
hKyLonbk8NFQnkHFtHW8OENvWix7KSdQlcWOKINSWdV4eEC7QM+E/LUphGKyjjXf
CmmqtU85OzcZNEbhVrkfVGxCt65hP0zD+ojuHuEKN/T02CKIYerA4CcntveYlcPU
M158NQ4XPx7utqeszCXpJbF/IH3bsw==
=jX/S
-----END PGP SIGNATURE-----

--Sig_/kBDTo./6+AX2Nu=yAld2Qcl--
