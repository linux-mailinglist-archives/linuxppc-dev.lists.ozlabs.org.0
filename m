Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6396F8301
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 14:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCVSw5Z3Jz3fKq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 22:32:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0RRWvbKP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=conor.dooley@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0RRWvbKP;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Fri, 05 May 2023 22:32:01 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCVS10BP4z3bkh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 22:32:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683289921; x=1714825921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XweA9V5HDK7utS7/TPunyp7LYfGFUrdjDqzcDo9MXNU=;
  b=0RRWvbKPBq6sIFHpwVPBQtzxROQWI8T3cUH81U3pQkKXsIKCQQdK36N5
   bo6zLHM11BhIOU33Bxr2z002W9Lvnd5AkG7qq1OI+kYdvn/nO8KJ7tMsm
   ETDPHSACZdMpeU+92yjiiUTBVlo3Vs7JcRDxbI3zabeWKyAJZCGJkGLvE
   KPjp/C8WVKWEhqcgzy6bQ3aCbUIQxR0BNlJ6lH9hybqZQe4oOYsgvZeMd
   AGZ7m8ff5Sog3F2v7Q62n+4FOR6HMQ/IEUN5dpAJAK2rpQ8lQrxN0BSrr
   Iocvn2z4mmcEdTCzY7EqmOtCopKsiQ4YF5cW14w4pSa2X2DxXYI9jJjq3
   w==;
X-IronPort-AV: E=Sophos;i="5.99,252,1677567600"; 
   d="asc'?scan'208";a="150539472"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 May 2023 05:30:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 5 May 2023 05:30:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 5 May 2023 05:30:34 -0700
Date: Fri, 5 May 2023 13:30:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
Message-ID: <20230505-subsidy-shininess-46a8be31b267@wendy>
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
 <20230501-cottage-overjoyed-1aeb9d72d309@spud>
 <CANiDSCufbm80g4AqukpiuER17OXhD-yRNmTZRz7s_x-Xi9BDCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HCjo7mmLcFsfwCMI"
Content-Disposition: inline
In-Reply-To: <CANiDSCufbm80g4AqukpiuER17OXhD-yRNmTZRz7s_x-Xi9BDCw@mail.gmail.com>
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
Cc: Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, stable@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Philipp Rudo <prudo@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ross Zwisler <zwisler@google.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--HCjo7mmLcFsfwCMI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 09:54:43PM +0200, Ricardo Ribalda wrote:
> On Mon, 1 May 2023 at 19:41, Conor Dooley <conor@kernel.org> wrote:
> > On Mon, May 01, 2023 at 02:38:22PM +0200, Ricardo Ribalda wrote:
> > > If PGO is enabled, the purgatory ends up with multiple .text sections.
> > > This is not supported by kexec and crashes the system.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_pura=
gory")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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
> >
> > With the caveat of not being au fait with the workings of either PGO or
> > of purgatory, how come you modify KBUILD_CFLAGS here rather than the
> > purgatory specific PURGATORY_CFLAGS that are used later in the file?
>=20
> Definitely, not a Makefile expert here, but when I tried this:
>=20
> @@ -35,6 +40,7 @@ PURGATORY_CFLAGS_REMOVE :=3D -mcmodel=3Dkernel
>  PURGATORY_CFLAGS :=3D -mcmodel=3Dlarge -ffreestanding
> -fno-zero-initialized-in-bss -g0
>  PURGATORY_CFLAGS +=3D $(DISABLE_STACKLEAK_PLUGIN) -DDISABLE_BRANCH_PROFI=
LING
>  PURGATORY_CFLAGS +=3D -fno-stack-protector
> +PURGATORY_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D%
> -fprofile-use=3D%,$(KBUILD_CFLAGS))
>=20
> It did not work.

Unfortunately I am oh-so-far from an expert on this kind of thing, but I
had thought that PURGATORY_CFLAGS_REMOVE was intended for this sort of
purpose.

> Fixes: bde971a83bbf ("KVM: arm64: nvhe: Fix build with profile optimizati=
on")
>=20
> does this approach, so this is what I tried and worked.

That doesn't have a specific CFLAGS though afaict.
Perhaps Nick etc have a more informed opinion here than I do, sorry.

Thanks,
Conor.

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
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20
>=20
>=20
> --=20
> Ricardo Ribalda

--HCjo7mmLcFsfwCMI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFT21wAKCRB4tDGHoIJi
0vY1AP9RxvKzAScY63Nnz9Vp/3U8917fwYnV71pbtJgtzZt3WAEA8S2SNODAX7Qy
Vn7vxaBudJDiNoZ4dz80u4gzoYd3SwE=
=X4se
-----END PGP SIGNATURE-----

--HCjo7mmLcFsfwCMI--
