Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C86F3520
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 19:41:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q99WP5TKkz3bkb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 03:41:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ghv0PKPS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ghv0PKPS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q99VW6rnCz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 03:41:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F01F561E6C;
	Mon,  1 May 2023 17:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E2EC433D2;
	Mon,  1 May 2023 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682962864;
	bh=81z/8+VNCOs2KfOTGMvYGJr78DCfPa8M7ZOzDNUfnCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ghv0PKPSEF/qiYfWNIgVqzcxiV94CKnm+WiWCSyBxEUEJUm8nsJSuKOqtmJA871/J
	 ajyg3xFZJvtCjWeS5XL4b4A6p8W8Eh4h5g7M6hUgv55S5cuvquU2/FPaVa5zMKrCwl
	 p80tb777MSmmUOy4bAcn4YGjMwqaK97HS/0AXg1GmQZpUeeLgggQKhUGaoUJaJStfa
	 60Dn1OZ5gbzQA/kDtxoEWTYgtega7R78ZTGPMTGp8mczgGW/rre5vijVDFKcWvkkOr
	 osLrwqrSAODauKYj4W7bSX2Zm4Wj/8RL9xM/EboyvOZepXnzmaugABHmtdX2GOg6Wj
	 4b93L3bPQNt+Q==
Date: Mon, 1 May 2023 18:40:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
Message-ID: <20230501-cottage-overjoyed-1aeb9d72d309@spud>
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fl35W8zTCu+OA5lB"
Content-Disposition: inline
In-Reply-To: <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
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
Cc: Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Philipp Rudo <prudo@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ross Zwisler <zwisler@google.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--fl35W8zTCu+OA5lB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Ricardo,

On Mon, May 01, 2023 at 02:38:22PM +0200, Ricardo Ribalda wrote:
> If PGO is enabled, the purgatory ends up with multiple .text sections.
> This is not supported by kexec and crashes the system.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory=
")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  arch/riscv/purgatory/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index 5730797a6b40..cf3a44121a90 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -35,6 +35,11 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
>  CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
>  CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
> =20
> +# When profile optimization is enabled, llvm emits two different overlap=
ping
> +# text sections, which is not supported by kexec. Remove profile optimiz=
ation
> +# flags.
> +KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=
=3D%,$(KBUILD_CFLAGS))

With the caveat of not being au fait with the workings of either PGO or
of purgatory, how come you modify KBUILD_CFLAGS here rather than the
purgatory specific PURGATORY_CFLAGS that are used later in the file?

Cheers,
Conor.

> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved sy=
mbols.
>  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
>=20
> --=20
> 2.40.1.495.gc816e09b53d-goog
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--fl35W8zTCu+OA5lB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE/5qAAKCRB4tDGHoIJi
0tO7AQDCFxxBDCm6m1lRjliaYENcoYHVqFHrLwGzbHGrXVn/VQD/aKUuG6nnmBC9
4JdlDj98flb/kiL3Z25m/1+UmBAjSAk=
=uz5+
-----END PGP SIGNATURE-----

--fl35W8zTCu+OA5lB--
