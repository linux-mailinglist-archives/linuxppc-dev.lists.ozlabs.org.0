Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 616346F3506
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 19:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q99FG1wy9z3bfp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 03:29:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PutcNnBd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PutcNnBd;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q99DM3zqrz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 03:28:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A48C6104F;
	Mon,  1 May 2023 17:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4347C433D2;
	Mon,  1 May 2023 17:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682962127;
	bh=CCSTeAPcL5yImgmfoxnZrX1sA47trLTyNX0j7mIfZ/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PutcNnBdjLULXG6S59IVCtwQBmr3y3j8vCFtgAQbV1danI+KBSpxetCDcUWMk76XR
	 VHaBzrrJyNO/u2PiM/AwJjPara6HwY7WlkI5grnZFJVHswbKr2+EK/TjAQvPKiBKWp
	 /i21RhHdlV88cDkP/q5+p3pciECYlmZNQy18htMnfclSogFk/6zsItTi4hFnoKTwx3
	 XL1kDaW6JYq8YtONw3NoRYlQYSaxxUrzuBEME6i4YI16mRQE+1/vSvu+k/sAFyJkZM
	 GTgiWQyqzu7J7xg+JlG8dyA+1ax+u10cV3jVxQ5xBiaUUoDq6Uu651hVo1itlD7KlX
	 R2oK2PBSBPiJA==
Date: Mon, 1 May 2023 18:28:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
Message-ID: <20230501-griminess-defiling-73b367bb2e47@spud>
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
 <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
 <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Xn+1gq4n0yNKfKi"
Content-Disposition: inline
In-Reply-To: <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
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


--2Xn+1gq4n0yNKfKi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 07:18:12PM +0200, Ricardo Ribalda wrote:
> On Mon, 1 May 2023 at 18:19, Nick Desaulniers <ndesaulniers@google.com> w=
rote:
> >
> > On Mon, May 1, 2023 at 5:39=E2=80=AFAM Ricardo Ribalda <ribalda@chromiu=
m.org> wrote:
> > >
> > > If PGO is enabled, the purgatory ends up with multiple .text sections.
> > > This is not supported by kexec and crashes the system.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_pura=
gory")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Hi Ricardo,
> > Thanks for the series.  Does this patch 4/4 need a new online commit
> > description? It's not adding a linker script (maybe an earlier version
> > was).

> Thanks for catching this. It should have said
>=20
> risc/purgatory: Remove profile optimization flags
     ^^
Perhaps with the omitted v added too?

Also while playing the $subject nitpicking game, is it not called
"profile**-guided** optimisation" (and ditto in the comments)?

Cheers,
Conor.

> Will fix it on my local branch in case there is a next version of the
> series. Otherwise, please the maintainer fix the subject.

> > > ---
> > >  arch/riscv/purgatory/Makefile | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Mak=
efile
> > > index 5730797a6b40..cf3a44121a90 100644
> > > --- a/arch/riscv/purgatory/Makefile
> > > +++ b/arch/riscv/purgatory/Makefile
> > > @@ -35,6 +35,11 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
> > >  CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
> > >  CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
> > >
> > > +# When profile optimization is enabled, llvm emits two different ove=
rlapping
> > > +# text sections, which is not supported by kexec. Remove profile opt=
imization
> > > +# flags.
> > > +KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-u=
se=3D%,$(KBUILD_CFLAGS))
> > > +
> > >  # When linking purgatory.ro with -r unresolved symbols are not check=
ed,
> > >  # also link a purgatory.chk binary without -r to check for unresolve=
d symbols.
> > >  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
> > >
> > > --
> > > 2.40.1.495.gc816e09b53d-goog
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>=20
>=20
>=20
> --=20
> Ricardo Ribalda
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--2Xn+1gq4n0yNKfKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE/2xwAKCRB4tDGHoIJi
0rKBAQC575nyVFklI17PZfvU+SuYFxAB+RFJK8A1hHd9GS1RpgEAgPt5XR7pInY2
HkHrcK2WfBr+2guYsn7t0z1AycqRdw4=
=tPhM
-----END PGP SIGNATURE-----

--2Xn+1gq4n0yNKfKi--
