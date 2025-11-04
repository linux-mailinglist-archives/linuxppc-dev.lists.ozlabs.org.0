Return-Path: <linuxppc-dev+bounces-13770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E730CC3320D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 23:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1MtF5WWsz2yD5;
	Wed,  5 Nov 2025 09:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762288575;
	cv=none; b=fCADZ+oQbgUd7xUZ+q8X//W5ZMVs24km/E26MShkSX5pVHzEJyLBdYqoBLb157qJ9ZYvaSMZn2kZHcX2jV9BE/CycNjcT6xMPhK4wavgrU+zjU9Q9qpAlkyfoGfPiDQNJsOVufD292eJZkHwy1DjPHTNuC0D3CemJmNZ0inplPPZdhcYrlrg3pgEZ+q9Og00CV25K2pJVCuw5MDUdiTU0gCWkgRUlkKMcV8rPS8DwC+VvSMKIAxuFxdD9lySYwhxw/TsuHm91pZ8YK8P/Jgjk057ty5kK2647/rE0GWE5EDGjl+0ZVydofyC2xkdeRpQLT5NftwrY/TsuBJUAWtFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762288575; c=relaxed/relaxed;
	bh=hNwxBRLVn+yjNsddWZjaRch63cYGP209xDEv1WXxmfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4UwEe4x08JhNa99i/svxMXS0sNLYo9avCHUiLmjkkjZC9OcIDHpOKlduhTubSfx/dnSSpslIftFK4d3d+MKAwa5IN+yqEWzge2r+/TOWEgGPx+qa3J5nDyuFk+11GMWxCXoA4M9HQyHzL1A5yI6X/0F3EWOfDIyC0ZJ9jjQtYpstJROU5Y1xZ6M4QS+Pmb/uHCF//cGziN+h2VAqRP7+tDDJndzNHMCpWyDHRNnbH5MztDZ9f52voT8o4eljP2ovxACxVxGHQVTbniW9G0lvUvNYsURQijFJ1w+PRR9TtDnQkPZiaDcxp7esS/ZcYunKDIeUWrDnbjc2w3KZ05zvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk; dkim=pass (1024-bit key; secure) header.d=surgut.co.uk header.i=@surgut.co.uk header.a=rsa-sha256 header.s=google header.b=gyaNPSY+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=dimitri.ledkov@surgut.co.uk; receiver=lists.ozlabs.org) smtp.mailfrom=surgut.co.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=surgut.co.uk header.i=@surgut.co.uk header.a=rsa-sha256 header.s=google header.b=gyaNPSY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=surgut.co.uk (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=dimitri.ledkov@surgut.co.uk; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1Kwr67MHz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 07:36:11 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b6d402422c2so300959666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 12:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=surgut.co.uk; s=google; t=1762288568; x=1762893368; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNwxBRLVn+yjNsddWZjaRch63cYGP209xDEv1WXxmfA=;
        b=gyaNPSY+V5wl9vXcNsbjupsa4EyR4KZzt69PKE1PyZwGTt2uzXt/K4Urex7ECEdY/e
         1OBIZHxtXtUeacSunx4NMcnW3KIG7H1LZ+zK0RekuR8+sYG9CcrfLQXDJMqgrh8mBw/U
         M7wPCedPCDGOKbJIFIlL0jhkvZzx2Sy697rwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762288568; x=1762893368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNwxBRLVn+yjNsddWZjaRch63cYGP209xDEv1WXxmfA=;
        b=YAlwrGs9i78M2f/2cTKDRcplBZUW6UAw8KPJVo61rQ3uaUbaj4xGrmY5bLlnKEm2hi
         Vr1amPUf+GwYEKOrta/k3SRGxFOCVhE+9Nl/abFIfnAjDOFmT/q4B8xWHeuKwwgGq+3J
         lkJlhi24NhPXBmvzXArHjlalJnTrM4KL2qG9+BE4SVQdzswvItNzLdUVokeRwt59ERC8
         IFpk3ZCEB37SgkJZKiuBDl/D3tmzzkmXg+1GoXss66qB5PVExpk4sSfGM1kaCpu0siUt
         KHvqxjeuFngd/7c1hKPuxSdCopx8Qy/elUcaSFaXPPYZo/VmVQurPVCIkzI64Lcu1Hwh
         Mjrw==
X-Forwarded-Encrypted: i=1; AJvYcCXu6zpEZFa+BquTIi7dDIsyAx9jEP6NOAng9A5JKl2KqPhQyGxMbXuwO++HM+ylAahCwUSYap6TrNEjchs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQJqXlPAwjzBCnuwZpCkL7yser1DLTR8elnk7lC0Jt6R0u7QXn
	4iexPQR7YEAMoJ83lcjEmfIYlCaHtOP5IXs47Z1tdbCQMSdqAqxhw0S2xwfFa+zPAIDAbVbq9Bo
	dnM+mc18D1fIHFWaPQ6SoFXbw3R032IJvz01R72UrYw==
X-Gm-Gg: ASbGncttrQbX1fOUD+pPLAPlRozNQvBQinA5MR/HYoiZAg2E1XvffpomPRSEcuDpe2o
	VEINgBXIBpRkDC4FNFG1mo/DM6w+VSetK5R9oyxW3QX8ciYX/uSz2cf27KPyuTsmGkZb5J1gUOt
	RXar2DxVEeZrfr08pk/ZerOAC7oLXoodTPaow7qaQijekbbOGNqEpRmLmcB/g1MjMl044ATgqYh
	ZO9fCwQIyscO9y8207h1F8WjMtnjJH9+YVttm0oZxpq5o0Dvnz07H+5Mzp8GveTR1V04F9Q3S9t
	D918I0lvd9z2VdEwMnsvAYjwflj5
X-Google-Smtp-Source: AGHT+IHv6MdLvjnzllIsscePyeEHR6x4pXQN16s0CZlQrgp3UqARDV08ZSSUX0hcwSQAb/R4xgOEgL2WxyZLFHbFBvI=
X-Received: by 2002:a17:906:6a08:b0:b71:edef:b1d5 with SMTP id
 a640c23a62f3a-b726515d4b4mr53315666b.11.1762288568344; Tue, 04 Nov 2025
 12:36:08 -0800 (PST)
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
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com> <aQpCE_XTU-bZHFbk@telecaster>
In-Reply-To: <aQpCE_XTU-bZHFbk@telecaster>
From: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
Date: Tue, 4 Nov 2025 20:35:57 +0000
X-Gm-Features: AWmQ_bnvWh1e0XqPfSnGn_fuTx1oqRO8eoa0E4M9C5uYfyqYXVvrzikkIncqudc
Message-ID: <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
Subject: Re: [mainline]Error while running make modules_install command
To: Omar Sandoval <osandov@osandov.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, 
	Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 4 Nov 2025 at 18:12, Omar Sandoval <osandov@osandov.com> wrote:
>
> On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
> >
> > On 04/11/25 4:47 pm, Samir M wrote:
> > > Hello,
> > >
> > >
> > > I am observing below error while running the make modules_install
> > > command on latest mainline kernel on IBM Power11 server.
> > >
> > >
> > > Error:
> > > DEPMOD  /lib/modules/6.18.0-rc4=E2=80=A8depmod: ERROR: kmod_builtin_i=
ter_next:
> > > unexpected string without modname prefix
> > >
> >
> > IBM CI has also reported this error.
> >
> >
> > Error:
> >
> >
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modnam=
e
> > prefix
> >   INSTALL /boot
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modnam=
e
> > prefix
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modnam=
e
> > prefix
> >
> >
> > Git bisect is pointing to below commit as first bad commit.
> >
> >
> > d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
> > commit d50f21091358b2b29dc06c2061106cdb0f030d03
> > Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> > Date:   Sun Oct 26 20:21:00 2025 +0000
> >
> >     kbuild: align modinfo section for Secureboot Authenticode EDK2 comp=
at
> >
> >     Previously linker scripts would always generate vmlinuz that has
> > sections
> >     aligned. And thus padded (correct Authenticode calculation) and unp=
added
> >     calculation would be same. As in https://github.com/rhboot/pesign
> > userspace
> >     tool would produce the same authenticode digest for both of the
> > following
> >     commands:
> >
> >         pesign --padding --hash --in ./arch/x86_64/boot/bzImage
> >         pesign --nopadding --hash --in ./arch/x86_64/boot/bzImage
> >
> >     The commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
> >     vmlinux.unstripped") added .modinfo section of variable length.
> > Depending
> >     on kernel configuration it may or may not be aligned.
> >
> >     All userspace signing tooling correctly pads such section to calcul=
ation
> >     spec compliant authenticode digest.
> >
> >     However, if bzImage is not further processed and is attempted to be
> > loaded
> >     directly by EDK2 firmware, it calculates unpadded Authenticode dige=
st
> > and
> >     fails to correct accept/reject such kernel builds even when propoer
> >     Authenticode values are enrolled in db/dbx. One can say EDK2 requir=
es
> >     aligned/padded kernels in Secureboot.
> >
> >     Thus add ALIGN(8) to the .modinfo section, to esure kernels irrespe=
ctive
> > of
> >     modinfo contents can be loaded by all existing EDK2 firmware builds=
.
> >
> >     Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in
> > vmlinux.unstripped")
> >     Cc: stable@vger.kernel.org
> >     Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> >     Link:
> > https://patch.msgid.link/20251026202100.679989-1-dimitri.ledkov@surgut.=
co.uk
> >     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> >  include/asm-generic/vmlinux.lds.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
> commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
> vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
> for some configurations, which confused drgn until I added a workaround
> (https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c230135=
95d391a).
> So there's some funkiness in this area.

The expectation is that said section is removed from the final binary.
But the fact that it is present with 0 length, indicates incorrect
linking. It also now makes sense why on x86/arm it is tripping up
section alignment.

As it is likely that it is the same underlying issue that such segment
exists in the first place.

I wonder if the original implementation of moving sections about and
when/where the builtin module info is kept is not as tidy as it was
intended to be.

I wonder if we should:
- rollback to the state of how things were before that feature was added
- keep the production / stripped / installed kernel build as is
- reshuffle of how modinfo is preserved in the unstripped kernel with
a bespoke linker script

Such that hopefully we have correct alignment, without any zero length segm=
ents.

Or possibly even link / split the built-in module info somewhere else entir=
ely.

As in revert both:
- d50f21091358b (kbuild: align modinfo section for Secureboot
Authenticode EDK2 compat, 2025-10-26)
- 3e86e4d74c049 (kbuild: keep .modinfo section in vmlinux.unstripped,
2025-09-18)

And try implementing the keeping of .modinfo section again.

Better structure tests, after linking would be nice to catch such
issues, because linker scripts are hard and trying to understand how a
linker script change affects the result.

--=20
Regards,

Dimitri.

