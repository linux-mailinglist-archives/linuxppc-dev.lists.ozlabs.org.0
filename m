Return-Path: <linuxppc-dev+bounces-11984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B2B50F68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 09:30:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMC5p6n1bz3d2x;
	Wed, 10 Sep 2025 17:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757489438;
	cv=none; b=UfVN8b7a5zc2O5eQ4DWObzC1XLlPsyHH9sXksF/PZwLsHB1Bp1m5qVkeXrFpk2wN5qrrYHIK3/bZuNKAAR5LRCYMj8oX77IvCqgZf2TL/4zfksPm7wvA64OixGP78ao7fz0NtwHYBc2hhu+mc5Gegqyj7z54yxa9Em2m2PzBbVYHNW6oh85kUmu8K1p7MQnO3DNyuxa0m8705b3IYBiNgm5poFhwdxb/dJUkk4Pxr2n83i/U5QG6r6vTx4aIqrB3ywTa+44IRSSaTxsjqYInf5HenTM8ARk4H2cX31LB/ywO/aiYtdvNP4nbnXICQ4Kz80obThVwKEqAQhnBzJalCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757489438; c=relaxed/relaxed;
	bh=TSv3IIId7unI8UfEY8bPGg1xGNeJdhNHxN9/10PYUSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7xEVDK6pkr7+tgJvgVKuGnuKBkgJwzu8Zv+QxpnTrEdDW7twrtsvnnj+qcb1hP4N5gGWCQiiwnuHVTEb3QONxzsR1K1pmU/4JOIBZVt2DfVZtRTJmqrJPGYjLgWfjdzqKxiLsS4ze897pxJxuWD2kD1xP9Hp2J884YIjcKp39UDc/amt8szDkBn31VYItDk8258/spCCuWn7KY7ujS5fbR7Ajbw6W6kcIlP5ZIn+ufdafU/xEARGKvTgpVUKBZTGug/hIg8KQgqkj2iELw6hY0ssK/vAXd7A8IK373dGEG/MYOPlnOuA6ytE9xKDFBZtN0kfZL0rU02oXCFUgqURQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gs9NVCu6; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hRgsJ0tI; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gs9NVCu6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hRgsJ0tI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMC5n1X2bz3d28
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 17:30:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757489430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSv3IIId7unI8UfEY8bPGg1xGNeJdhNHxN9/10PYUSY=;
	b=Gs9NVCu69m5r0LTZPuDSY5kXuZlmJdmzg9I8iTRe99eIYFiI68O7jmHUfgOmv5F4vmkezL
	R0wFkuIvMdpGgzuwdyTW4Zd4DWuifbbG6jxxooB196ApNqNhr3X+z2rpKNfPnyvBrTKpSa
	bW9XLsaP1igDR/Xoma9FmHh/0qniDg0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757489431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSv3IIId7unI8UfEY8bPGg1xGNeJdhNHxN9/10PYUSY=;
	b=hRgsJ0tIUNluRmPsRYKjQl8rttz7imFT+3engNX65zIWY/ZPFss3sCmkU3KmM5KpQdQKE3
	0v0veJDdPCnKKxL7TKM7uI/auTMOEn+ngmlhpH1/6jCyll3AO7U7Pa2IkQwts1En4TqSOx
	SbJX5ibGxUJw4LO1t53mVZ2jRSKhzmM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-5himg5IEMR2fIUaEGfIUYA-1; Wed, 10 Sep 2025 03:30:28 -0400
X-MC-Unique: 5himg5IEMR2fIUaEGfIUYA-1
X-Mimecast-MFC-AGG-ID: 5himg5IEMR2fIUaEGfIUYA_1757489427
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45cb6d8f42bso62785475e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 00:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489427; x=1758094227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSv3IIId7unI8UfEY8bPGg1xGNeJdhNHxN9/10PYUSY=;
        b=jvjRWgqc5wh2etNf+Rxu1LUhq6LENeKsnVTGAx49FgLundHXf7PIezvMRveXX1Er1+
         199kgMj7v9RaD6dUl2NROzQU2MLM3qsFSIxc5LbpFYzE8489PWil83aX1atrIIniCM/+
         uXzLtLmeNZ40CtPWsJBgT4JjeGoxcJcNlLkF3yCa9zp+LaXrJkkSJWrBRBxWtpCLkmgG
         YgSQT/v+UypqpLJsUoFDyxEifPq7Ue0vrf/3+8dyZf/7adjdxHzcfXzMm1tbMDa4qk7n
         xKXMq8cSzVeVsueN2rIRbX2SIXLMrb0mGNYrFRdVjgTtTulRPwM8oZ5ZFJY9gsnlBoz9
         A1wg==
X-Gm-Message-State: AOJu0Yy8A/ioKQrfCbakTaUJGI48pR8vErsb+7O/+VwarD58oxd6f0WU
	s/SBbYjd1R+rmCzRYAEy4tiUM5yOocYnsB9yJ4RgYG3V0Ku/Chwi1k+HjnfM9xaCz9yWhWqdS5l
	obbDR7zqQVmdp+lrV9GOW3xJQOAbMXgcpu6XUl5epl/dK/FbS8TXZE0t0nY3M8hBIr+dIDXEs2w
	qL4QOQ5fukwvDPAuTc1MGXc/ujyj9xWc9525K2wo/XDg==
X-Gm-Gg: ASbGncseBqfY3mfNhBL1XUi8U7RBEKnpVFwuNbKDC5kotvJWCSFLElub8hgtFnwrShz
	4LL6IRs0q/VVansJRgWZgio7zmNUoIgJ1R1LcSYc8I3Tm80OFvW974hLC/dlVLQFUXkbq5UivW3
	bNmHqsQAhoAv8tFlZrrNnLV0LVLNxEZ2iYKSPOZKZQxdIj7+OzzG18V7mPRyGt5UqzLz+NXaYL9
	dGASzNCZ9TGqjMdPRVwjlI=
X-Received: by 2002:a05:6000:2087:b0:3de:c5b3:dda3 with SMTP id ffacd0b85a97d-3e645c9d0fbmr12128048f8f.44.1757489427435;
        Wed, 10 Sep 2025 00:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzuJXYwoOG98BtNJlZ2tE3xANYEOw3wxoX+SSNAaviVD84eLYQ2LV34osvXJQI60WO2kZRIXngmquFvmIfJHk=
X-Received: by 2002:a05:6000:2087:b0:3de:c5b3:dda3 with SMTP id
 ffacd0b85a97d-3e645c9d0fbmr12128022f8f.44.1757489427039; Wed, 10 Sep 2025
 00:30:27 -0700 (PDT)
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
References: <e8c743dfb16c6c00fd793d7afa6eed33c49f895f.1756202009.git.jstancek@redhat.com>
 <0ab92ae3-674f-445e-883c-0e511add85d2@redhat.com>
In-Reply-To: <0ab92ae3-674f-445e-883c-0e511add85d2@redhat.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 10 Sep 2025 09:30:10 +0200
X-Gm-Features: AS18NWAr8td3LOQLP511LSO5DpHnyQa1skw1nOcY5CC6N4rA6NZKjHj2YmR1a-c
Message-ID: <CAASaF6yOskaXhQzvqz_-fZekYimgbNspi0JfT4TAWL-rB6mMhg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/tools: drop `-o pipefail` in gcc check scripts
To: Joe Lawrence <joe.lawrence@redhat.com>, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, maddy@linux.ibm.com, npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Lw2zZM6zaGouWgLMFRjExMLUt5ltkPgPagpsP-bJOg_1757489427
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 3:32=E2=80=AFPM Joe Lawrence <joe.lawrence@redhat.c=
om> wrote:
>
> On 8/26/25 5:54 AM, Jan Stancek wrote:
> > We've been observing rare non-deterministic kconfig failures during
> > olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> > disabled and with it number of other config options that depend on it.
> >
> > The reason is that gcc-check-fpatchable-function-entry.sh can fail
> > if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> > there is still someone writing on other side of pipe. `pipefail`
> > propagates that error up to kconfig.
> >
> > This can be seen for example with:
> >   # (set -e; set -o pipefail; yes | grep -q y); echo $?
> >   141
> >
> > or by running the actual check script in loop extensively:
> >   ----------------------------- 8< -------------------------------
> >   function kconfig()
> >   {
> >     for i in `seq 1 100`; do
> >       arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
> >         ./scripts/dummy-tools/gcc -mlittle-endian \
> >         || { echo "Oops"; exit 1; }
> >     done
> >   }
> >
> >   for ((i=3D0; i<$(nproc); i++)); do kconfig & done
> >   wait; echo "Done"
> >   ----------------------------- >8 -------------------------------
> >
> > Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-funct=
ion-entry")
> > Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
> >  arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
> >  2 files changed, 2 deletions(-)
> >
> > diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh =
b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> > index 06706903503b..baed467a016b 100755
> > --- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> > +++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> > @@ -2,7 +2,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  set -e
> > -set -o pipefail
> >
> >  # To debug, uncomment the following line
> >  # set -x
> > diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/pow=
erpc/tools/gcc-check-mprofile-kernel.sh
> > index 73e331e7660e..6193b0ed0c77 100755
> > --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> > +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> > @@ -2,7 +2,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  set -e
> > -set -o pipefail
> >
> >  # To debug, uncomment the following line
> >  # set -x
>
> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
>
> This bug manifests when automated scripts expect to run a kernel build
> after `make olddefconfig`.  I reported this to Jan when I found that

Right, maybe we can still add that too.

Reported-by: Joe Lawrence <joe.lawrence@redhat.com>

Would anyone else also care to review, please?

Thanks,
Jan

> kpatch-build [1] instances were hanging (expecting to hear from a user
> that would never answer :(
>
> [1] https://github.com/dynup/kpatch/blob/master/kpatch-build/kpatch-build
> --
> Joe
>


