Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F09AB343DE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 12:13:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J76C5Vl4zDqN7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 20:13:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=mchehab+samsung@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="d9cIWZCZ"; dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J74G6RsdzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 20:11:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RqlFiW8mqvn7VXsVgTdqn3QWI09o+fvsDMKwHHMYzmM=; b=d9cIWZCZ55BJMQwQks2BNYpnDx
 FqYMGyyRB1/+xnBZRQfrn9L/vQOb3XFT6N2WpEBsZAYZoZbB/q7ZATyrLrNVWfSWI25HFL3inBEUU
 vUdxdMhnNSspqMB6VC5iO2IIejt7RRQ3/VUlXkNtF+IYokbxbNlXoEDmre6nm5C0Aej2yZ/tky0mB
 tEH7cJigZ0HyD2xXpUJZ1kcoRPkbjssCBOIh75l3gt6dOnBtH1yDtowQkM7ht2irwKoblXvOsRAQX
 qyMsNFrrpG+tlA7Ihz3bC6PHmi8cqIpfcR2sloY0tI/zNa9b7flEVlJIBlvKL5taPWiCjXJ2TFzd4
 KCADzMrQ==;
Received: from [187.113.6.249] (helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY6PB-0005Su-8Q; Tue, 04 Jun 2019 10:10:57 +0000
Date: Tue, 4 Jun 2019 07:10:48 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 09/22] docs: mark orphan documents as such
Message-ID: <20190604071048.4f226fff@coco.lan>
In-Reply-To: <2891a08c-50b1-db33-0e96-740d45c5235f@c-s.fr>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
 <2891a08c-50b1-db33-0e96-740d45c5235f@c-s.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Donnellan <ajd@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-pm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Georgi Djakov <georgi.djakov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, 3 Jun 2019 09:32:54 +0200
Christophe Leroy <christophe.leroy@c-s.fr> escreveu:

> Le 30/05/2019 =C3=A0 01:23, Mauro Carvalho Chehab a =C3=A9crit=C2=A0:
> > Sphinx doesn't like orphan documents:
> >=20
> >      Documentation/accelerators/ocxl.rst: WARNING: document isn't inclu=
ded in any toctree
> >      Documentation/arm/stm32/overview.rst: WARNING: document isn't incl=
uded in any toctree
> >      Documentation/arm/stm32/stm32f429-overview.rst: WARNING: document =
isn't included in any toctree
> >      Documentation/arm/stm32/stm32f746-overview.rst: WARNING: document =
isn't included in any toctree
> >      Documentation/arm/stm32/stm32f769-overview.rst: WARNING: document =
isn't included in any toctree
> >      Documentation/arm/stm32/stm32h743-overview.rst: WARNING: document =
isn't included in any toctree
> >      Documentation/arm/stm32/stm32mp157-overview.rst: WARNING: document=
 isn't included in any toctree
> >      Documentation/gpu/msm-crash-dump.rst: WARNING: document isn't incl=
uded in any toctree
> >      Documentation/interconnect/interconnect.rst: WARNING: document isn=
't included in any toctree
> >      Documentation/laptops/lg-laptop.rst: WARNING: document isn't inclu=
ded in any toctree
> >      Documentation/powerpc/isa-versions.rst: WARNING: document isn't in=
cluded in any toctree
> >      Documentation/virtual/kvm/amd-memory-encryption.rst: WARNING: docu=
ment isn't included in any toctree
> >      Documentation/virtual/kvm/vcpu-requests.rst: WARNING: document isn=
't included in any toctree
> >=20
> > So, while they aren't on any toctree, add :orphan: to them, in order
> > to silent this warning. =20
>=20
> Are those files really not meant to be included in a toctree ?
>=20
> Shouldn't we include them in the relevant toctree instead of just=20
> shutting up Sphinx warnings ?

This is a good point. My understanding is that those orphaned docs
are there for two reasons:

1) someone created a new document as .rst but there's no index.rst file yet,
as there are lots of other documents already there not converted. That's
the case, for example, of the ones under Documentation/arm;

2) They're part of an undergoing effort of converting stuff to ReST.
One opted to keep it orphaned temporarily in order to avoid merge
conflicts.

That's said, I have myself a big (/86 patches and growing) series
with do a huge step on txt->rst conversion (it covers a significant
amount of documentation). On this series, I'm removing the orphaned
tags for several files (including, for example, those at Documentation/arm).

Yet, it is a lot easier to see if such series is not introducing
warnings regressions if we first address those.

It should be notice that discovering the orphaned files should be as
simple as:

	git grep -l ":orphan:" Documentation

>=20
> Christophe
>=20
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >   Documentation/accelerators/ocxl.rst                 | 2 ++
> >   Documentation/arm/stm32/overview.rst                | 2 ++
> >   Documentation/arm/stm32/stm32f429-overview.rst      | 2 ++
> >   Documentation/arm/stm32/stm32f746-overview.rst      | 2 ++
> >   Documentation/arm/stm32/stm32f769-overview.rst      | 2 ++
> >   Documentation/arm/stm32/stm32h743-overview.rst      | 2 ++
> >   Documentation/arm/stm32/stm32mp157-overview.rst     | 2 ++
> >   Documentation/gpu/msm-crash-dump.rst                | 2 ++
> >   Documentation/interconnect/interconnect.rst         | 2 ++
> >   Documentation/laptops/lg-laptop.rst                 | 2 ++
> >   Documentation/powerpc/isa-versions.rst              | 2 ++
> >   Documentation/virtual/kvm/amd-memory-encryption.rst | 2 ++
> >   Documentation/virtual/kvm/vcpu-requests.rst         | 2 ++
> >   13 files changed, 26 insertions(+)
> >=20
> > diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/accele=
rators/ocxl.rst
> > index 14cefc020e2d..b1cea19a90f5 100644
> > --- a/Documentation/accelerators/ocxl.rst
> > +++ b/Documentation/accelerators/ocxl.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >   OpenCAPI (Open Coherent Accelerator Processor Interface)
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/Documentation/arm/stm32/overview.rst b/Documentation/arm/s=
tm32/overview.rst
> > index 85cfc8410798..f7e734153860 100644
> > --- a/Documentation/arm/stm32/overview.rst
> > +++ b/Documentation/arm/stm32/overview.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >   STM32 ARM Linux Overview
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > diff --git a/Documentation/arm/stm32/stm32f429-overview.rst b/Documenta=
tion/arm/stm32/stm32f429-overview.rst
> > index 18feda97f483..65bbb1c3b423 100644
> > --- a/Documentation/arm/stm32/stm32f429-overview.rst
> > +++ b/Documentation/arm/stm32/stm32f429-overview.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   STM32F429 Overview
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > diff --git a/Documentation/arm/stm32/stm32f746-overview.rst b/Documenta=
tion/arm/stm32/stm32f746-overview.rst
> > index b5f4b6ce7656..42d593085015 100644
> > --- a/Documentation/arm/stm32/stm32f746-overview.rst
> > +++ b/Documentation/arm/stm32/stm32f746-overview.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   STM32F746 Overview
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > diff --git a/Documentation/arm/stm32/stm32f769-overview.rst b/Documenta=
tion/arm/stm32/stm32f769-overview.rst
> > index 228656ced2fe..f6adac862b17 100644
> > --- a/Documentation/arm/stm32/stm32f769-overview.rst
> > +++ b/Documentation/arm/stm32/stm32f769-overview.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   STM32F769 Overview
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > diff --git a/Documentation/arm/stm32/stm32h743-overview.rst b/Documenta=
tion/arm/stm32/stm32h743-overview.rst
> > index 3458dc00095d..c525835e7473 100644
> > --- a/Documentation/arm/stm32/stm32h743-overview.rst
> > +++ b/Documentation/arm/stm32/stm32h743-overview.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   STM32H743 Overview
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Document=
ation/arm/stm32/stm32mp157-overview.rst
> > index 62e176d47ca7..2c52cd020601 100644
> > --- a/Documentation/arm/stm32/stm32mp157-overview.rst
> > +++ b/Documentation/arm/stm32/stm32mp157-overview.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   STM32MP157 Overview
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20
> > diff --git a/Documentation/gpu/msm-crash-dump.rst b/Documentation/gpu/m=
sm-crash-dump.rst
> > index 757cd257e0d8..240ef200f76c 100644
> > --- a/Documentation/gpu/msm-crash-dump.rst
> > +++ b/Documentation/gpu/msm-crash-dump.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   MSM Crash Dump Format
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/Documentation/interconnect/interconnect.rst b/Documentatio=
n/interconnect/interconnect.rst
> > index c3e004893796..56e331dab70e 100644
> > --- a/Documentation/interconnect/interconnect.rst
> > +++ b/Documentation/interconnect/interconnect.rst
> > @@ -1,5 +1,7 @@
> >   .. SPDX-License-Identifier: GPL-2.0
> >  =20
> > +:orphan:
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   GENERIC SYSTEM INTERCONNECT SUBSYSTEM
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptop=
s/lg-laptop.rst
> > index aa503ee9b3bc..f2c2ffe31101 100644
> > --- a/Documentation/laptops/lg-laptop.rst
> > +++ b/Documentation/laptops/lg-laptop.rst
> > @@ -1,5 +1,7 @@
> >   .. SPDX-License-Identifier: GPL-2.0+
> >  =20
> > +:orphan:
> > +
> >   LG Gram laptop extra features
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >  =20
> > diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/pow=
erpc/isa-versions.rst
> > index 812e20cc898c..66c24140ebf1 100644
> > --- a/Documentation/powerpc/isa-versions.rst
> > +++ b/Documentation/powerpc/isa-versions.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   CPU to ISA Version Mapping
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  =20
> > diff --git a/Documentation/virtual/kvm/amd-memory-encryption.rst b/Docu=
mentation/virtual/kvm/amd-memory-encryption.rst
> > index 659bbc093b52..33d697ab8a58 100644
> > --- a/Documentation/virtual/kvm/amd-memory-encryption.rst
> > +++ b/Documentation/virtual/kvm/amd-memory-encryption.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   Secure Encrypted Virtualization (SEV)
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/Documentation/virtual/kvm/vcpu-requests.rst b/Documentatio=
n/virtual/kvm/vcpu-requests.rst
> > index 5feb3706a7ae..c1807a1b92e6 100644
> > --- a/Documentation/virtual/kvm/vcpu-requests.rst
> > +++ b/Documentation/virtual/kvm/vcpu-requests.rst
> > @@ -1,3 +1,5 @@
> > +:orphan:
> > +
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   KVM VCPU Requests
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  =20



Thanks,
Mauro
