Return-Path: <linuxppc-dev+bounces-9181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024AAD0CC4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 12:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDv9l3L01z2xnM;
	Sat,  7 Jun 2025 20:11:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749291115;
	cv=none; b=iSiP0vPPY1qJa1Vn1yUWpdDdiQnaAYWn99tYOYGfB7wgi2DLX81VLIRroeJuulwrqZDEgacTl9hjI0A4nozC/Kc8nhGaGulclnm3QX0XemCVcY3JJIidnITx5ldib112IkHwtOcVDxjocaOOazvmpzysl0WmCt4cDClG+pAkAOisCKWV/FbvK64yZowNxhzqIdU/T/UZKabehn5lYjDuyThctLIfr/VYKsb6sQ2/DzLyzexVer4e6+h8QxgpnbvPOhulIxigMDDUY51l5VeU9GrLSKmwd/UiaQPEZ2k42ST7Oqj8T6dA4ocLBhirOkViXKsgIcC0gY7oPdSwc8LY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749291115; c=relaxed/relaxed;
	bh=a9Z2Ac+KKGnD7WDg/Rf/EAdrhP7Piz0DHiDEmMWfG4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0EMTw9m94AP/a8IIxMOct85a1c8wGFbeikpfKzgIYe3xqUk/C78BuOndzdubLjfPKdpzhvrLKQ7YWY23qEMkYAquNhl8ceEYlkuVFL71heOb3dQ3QPQvTnOYwPcuzvH9KHRkVDKaQD+RY81P0b4lqzr7T6uk8vgBY0TglEsOAkVu6eYeS/6fBgiHlu2+AFo/MuPQHH+AyewN7TfwAcHFV/d56HFrUkH8RaUI4fM26ToStJwJSpJYJGw2OUAz5jR6wTy7eTFSog/SA5W1t+VGREsSUcrrrCpeH/CCEKtQilLEb9MVwo39ilf11uf8vnB2aF8MCn8G5lyqDbeTX3uYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AMuaoauD; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AMuaoauD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bDv9k4D1Dz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jun 2025 20:11:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 308DE5C5457
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jun 2025 10:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9579DC4AF0B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jun 2025 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749291111;
	bh=Ez+aVavrDl+bcGJ8v2v1Hbst6KI+rrbJU4JZFTLUG44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AMuaoauDy4Fw78pCdugebYV0sc9wAhwP1e1WkgFF5OirU19DndWt/99DBpJ+IzHXu
	 AHmz9TASVYGP3YzXiDWSIZHCcdoN0jUii29cGDRoM35d4DKm3n9o1QkhyAnxg3t2SS
	 3wQGBuPTxGuaaojC2DANw0kyFU+MKc9HYOjw48L+zU7BeYG+uidpBFxBXLp5G9cbJe
	 mvCARWPUrVIILLNyhI/+NNvyXVkiASQ+Znx5J6bkV7VTm5arPdYHTDl/L6JtaMDLrF
	 imEBMYmpPKHdzTehv9KS6/ZyH+xtkOZJ9M7yNH4DUTOUyZigmtz0wmFziWpjmIN8ac
	 mOEvkfu1R+oFQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so3017267e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Jun 2025 03:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTo9rBc9cx+Lw0MPS8z+T7lKaRNkRYXT3jTz5Mwr64gJE2z7hAH0DrIHotCIQGtKJEy7UZS6PN69nXVp8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLMZ8ecGIkuGe/trvhPYwPPABEzsXhSgzYzUeJu/X5cUE87w8G
	vEQNVw5L7XbjyQMkPCtqVer8CEk0l01fgYX4586m3G+XrXSsOCXYri7VYpqk+GkDcHPvKBu2iS1
	VeRPykg0la6QaBgLlRhWx4TanM1Gm4nk=
X-Google-Smtp-Source: AGHT+IEI2bs/0jXH/T7pWFaEju8lELpkZETzvdeIJrpTezJj9MSNL2pLm44w/DikSPpWhxkprvbylpNtTrpVMEO6vGw=
X-Received: by 2002:a05:6512:3d22:b0:553:24f4:8736 with SMTP id
 2adb3069b0e04-55366c38af4mr1542594e87.53.1749291110235; Sat, 07 Jun 2025
 03:11:50 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250602163302.478765-1-masahiroy@kernel.org> <3cebc3c4-dbaf-41f6-b98d-1d33bea2eeeb@csgroup.eu>
In-Reply-To: <3cebc3c4-dbaf-41f6-b98d-1d33bea2eeeb@csgroup.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Jun 2025 19:11:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvRFVOeQhVos1T-R-Uq9ekY9Fo7HS+D=TCZziLo5TpHQ@mail.gmail.com>
X-Gm-Features: AX0GCFskQI7_1BipMyRKkhnCetBQ-sEAvQ7WPpuNuUYF5uN2v6D3k9IXLtnWZ3w
Message-ID: <CAK7LNAQvRFVOeQhVos1T-R-Uq9ekY9Fo7HS+D=TCZziLo5TpHQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 3, 2025 at 3:50=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 02/06/2025 =C3=A0 18:32, Masahiro Yamada a =C3=A9crit :
> > The extra-y syntax is planned for deprecation because it is similar
> > to always-y.
> >
> > When building the boot wrapper, always-y and extra-y are equivalent.
> > Use always-y instead.
> >
> > In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
> > keep the current behavior: prom_init_check is skipped when building
> > only modular objects.
>
> I don't understand what you mean.
>
> CONFIG_PPC_OF_BOOT_TRAMPOLINE is a bool, it cannot be a module.
>
> prom_init_check is only to check the content of prom_init.o which is
> never a module.
>
> Is always-y to run _after_ prom_init.o is built ?

The intent of "make ARCH=3Dpowerpc modules"
is to compile objects that are necessary for modules,
that is, all built-in objects are skipped.

However,
always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_init_check
would generate prom_init_check regardless,
and its prerequisite, prom_init.o as well.

With CONFIG_MODULES=3Dy and
CONFIG_MODVERSIONS=3Dn,
and without ifdef KBUILD_BUILTIN,

$ make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-   modules

would result in this:


  CC [M]  arch/powerpc/kvm/book3s_xive_native.o
  CC [M]  arch/powerpc/kvm/book3s_64_vio.o
  LD [M]  arch/powerpc/kvm/kvm.o
  CC [M]  arch/powerpc/kvm/book3s_hv.o
  AS [M]  arch/powerpc/kvm/book3s_hv_interrupts.o
  CC [M]  arch/powerpc/kvm/book3s_64_mmu_hv.o
  CC [M]  arch/powerpc/kvm/book3s_64_mmu_radix.o
  CC [M]  arch/powerpc/kvm/book3s_hv_nested.o
  CC [M]  arch/powerpc/kvm/book3s_hv_tm.o
  LD [M]  arch/powerpc/kvm/kvm-hv.o
  CC [M]  arch/powerpc/kernel/rtas_flash.o
  CC      arch/powerpc/kernel/prom_init.o
  PROMCHK arch/powerpc/kernel/prom_init_check
  CC [M]  kernel/locking/locktorture.o
  CC [M]  kernel/time/test_udelay.o
  CC [M]  kernel/time/time_test.o
  CC [M]  kernel/backtracetest.o
  CC [M]  kernel/torture.o
  CC [M]  kernel/resource_kunit.o
  CC [M]  kernel/sysctl-test.o
  CC [M]  fs/ext4/inode-test.o
  LD [M]  fs/ext4/ext4-inode-test.o
  CC [M]  fs/fat/namei_vfat.o
  LD [M]  fs/fat/vfat.o
  CC [M]  fs/fat/fat_test.o
  CC [M]  fs/nls/nls_ucs2_utils.o
  CC [M]  fs/netfs/buffered_read.o
  CC [M]  fs/netfs/buffered_write.o
...



You can see these two lines:

  CC      arch/powerpc/kernel/prom_init.o
  PROMCHK arch/powerpc/kernel/prom_init_check

are supposed to be skipped when "make modules",
but actually compiled without ifdef.

So, I added ifdef KBUILD_BUILTIN to preserve
the current behavior.







> Christophe
>
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >   arch/powerpc/boot/Makefile   | 6 +++---
> >   arch/powerpc/kernel/Makefile | 4 +++-
> >   2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 184d0680e661..b003f7ac8755 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -242,13 +242,13 @@ $(obj)/wrapper.a: $(obj-wlib) FORCE
> >   hostprogs   :=3D addnote hack-coff mktree
> >
> >   targets             +=3D $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a)=
 zImage.lds
> > -extra-y              :=3D $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o =
\
> > +always-y     :=3D $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
> >                  $(obj)/zImage.lds $(obj)/zImage.coff.lds $(obj)/zImage=
.ps3.lds
> >
> >   dtstree             :=3D $(src)/dts
> >
> >   wrapper             :=3D $(src)/wrapper
> > -wrapperbits  :=3D $(extra-y) $(addprefix $(obj)/,addnote hack-coff mkt=
ree) \
> > +wrapperbits  :=3D $(always-y) $(addprefix $(obj)/,addnote hack-coff mk=
tree) \
> >                       $(wrapper) FORCE
> >
> >   #############
> > @@ -455,7 +455,7 @@ WRAPPER_DTSDIR :=3D /usr/lib/kernel-wrapper/dts
> >   WRAPPER_BINDIR :=3D /usr/sbin
> >   INSTALL :=3D install
> >
> > -extra-installed              :=3D $(patsubst $(obj)/%, $(DESTDIR)$(WRA=
PPER_OBJDIR)/%, $(extra-y))
> > +extra-installed              :=3D $(patsubst $(obj)/%, $(DESTDIR)$(WRA=
PPER_OBJDIR)/%, $(always-y))
> >   hostprogs-installed :=3D $(patsubst %, $(DESTDIR)$(WRAPPER_BINDIR)/%,=
 $(hostprogs))
> >   wrapper-installed   :=3D $(DESTDIR)$(WRAPPER_BINDIR)/wrapper
> >   dts-installed               :=3D $(patsubst $(dtstree)/%, $(DESTDIR)$=
(WRAPPER_DTSDIR)/%, $(wildcard $(dtstree)/*.dts))
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefil=
e
> > index 4d2daa8e7bca..ac01cedad107 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -201,7 +201,9 @@ obj-$(CONFIG_ALTIVEC)             +=3D vector.o
> >
> >   obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_init.o
> >   obj64-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_entry_64.o
> > -extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_init_check
> > +ifdef KBUILD_BUILTIN
> > +always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_init_check
> > +endif
> >
> >   obj-$(CONFIG_PPC64)         +=3D $(obj64-y)
> >   obj-$(CONFIG_PPC32)         +=3D $(obj32-y)
>


--=20
Best Regards
Masahiro Yamada

