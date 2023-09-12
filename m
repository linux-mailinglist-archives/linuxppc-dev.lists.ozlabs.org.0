Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A339E79DC92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 01:17:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sUgi6LeH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlfd43nQTz3fhx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 09:17:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sUgi6LeH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlfcD6DWcz3gZj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 09:17:00 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-501eec0a373so10099328e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 16:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694560616; x=1695165416; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrbSVU4nZUFvuKXs1rDJFefP9fH0F3hyySGPvLoP9m8=;
        b=sUgi6LeHxBBKa1hbhfWy00YqQ7xC6Bi0VJyTU65wU/4oZiTTFuDFEKL1pzktCNiwHJ
         Z375w9XOHyMlKZWpMKMCLOXD2UTd5eLXpexNYH/Tb3UjoIG+4xcCvnP58nUfO7VTHC9j
         5kuKI604eA3GdPBNi8R5UAK63Ov0M0sarwM6x1zFEYqEZwfUVZLCcXRJNyA+Q32JksuA
         /bFZLhcATo4xNryvgtT3GTutLJKQtP1xFLpVwrT5ulUjna7R3WIwenM0T8ZjaQVsB7hW
         n7RTlS12DnME+S1PM8dUE3IINfYqgBW50Cabp9exfbCer5g0ZkIIp7PzMKT+y1Zq2uRE
         K2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694560616; x=1695165416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrbSVU4nZUFvuKXs1rDJFefP9fH0F3hyySGPvLoP9m8=;
        b=hp2WZn3lV9Ex5mYW2SNT+3DKw5KrvxagxiwIKpKim4KHlFYq5bwfExeAYj99rhM5/h
         +iAf98qjk+rrJn3J2XTMYtFFI9GgC0v8fn126jjn80s5zXEmehbW28+0C90NXmz2hFHp
         i/aoPAReX0XlvLbyFKl5HZUB2/74ga2mzFFsGVqtFF3VYK5KbqnJpCL/C8UHsev8k0Ht
         3dj4TZR9kJ4owLejTtWwKeBDIGN7WPn7bHggsU8mn4aCQ69anVIQpF390YNc/ZLBCrV4
         Idb1jlwgzjzhsXoWeL9gtvsc4Sg0LFdRo6dnXzy6rHGXm90C2U2e1VVoB0gwBZftKIXC
         sP5A==
X-Gm-Message-State: AOJu0YzahGGwRL38IdkfG/+iJzkSZtc7zo2dB7/a9VPXacRe9v/pVVyd
	iNPwmp6wt3Bx3P8UXTI6/APE8xIgiMqZJ0dyYU8=
X-Google-Smtp-Source: AGHT+IEBY3l3EINWayY7tuJfGoVDjPoP8cqckAfPldb0MCin3ecEklcSeeAUDt1vmekTIwLD2t/Y9JLbGHco4LHds+E=
X-Received: by 2002:a05:6512:31c3:b0:500:a694:46f with SMTP id
 j3-20020a05651231c300b00500a694046fmr951572lfe.19.1694560615656; Tue, 12 Sep
 2023 16:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230912224654.6556-1-puranjay12@gmail.com> <20230912224654.6556-6-puranjay12@gmail.com>
 <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk>
In-Reply-To: <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 13 Sep 2023 01:16:44 +0200
Message-ID: <CANk7y0iFdgHgu+RXYJvP3swaRS+-Lr0CgOAdcQWtjs4VkrOzdQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with B/H/W
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>, Shubham Bansal <illusionist.neo@gmail.com>, linux-riscv@lists.infradead.org, Daniel Borkmann <daniel@iogearbox.net>, Helge Deller <deller@gmx.de>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Luke Nelson <luke.r.nels@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Wang YanQing <udknight@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
 , Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 1:04=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Sep 12, 2023 at 10:46:53PM +0000, Puranjay Mohan wrote:
> > The JITs should not depend on the verifier for zero extending the upper
> > 32 bits of the destination register when loading a byte, half-word, or
> > word.
> >
> > A following patch will make the verifier stop patching zext instruction=
s
> > after LDX.
>
> This was introduced by:
>
> 163541e6ba34 ("arm: bpf: eliminate zero extension code-gen")
>
> along with an additional function. So three points:
>
> 1) the commit should probably explain why it has now become undesirable
> to access this verifier state, whereas it appears it was explicitly
> added to permit this optimisation.

I added some details in the cover letter.

For the complete discussion see: [1]

> 2) you state that jits should not depend on this state, but the above
> commit adds more references than you're removing, so aren't there still
> references to the verifier remaining after this patch? I count a total
> of 10, and the patch below removes three.

The JITs should not depend on this state for LDX (loading
a B/H/W.
This patch removes the usage only for LDX.

> 3) what about the bpf_jit_needs_zext() function that was added to
> support the export of this zext state?

That is still applicable, The verifier will still emit zext
instructions for other
instructions like BPF_ALU / BPF_ALU64

>
> Essentially, the logic stated in the commit message doesn't seem to be
> reflected by the proposed code change.

I will try to provide more information.
Currently I have asked Alexei if we really need this in [2].
I still think this optimization is useful and we should keep it.

Thanks,
Puranjay

[1] https://lore.kernel.org/all/CANk7y0j2f-gPgZwd+YfTL71-6wfvky+f=3DkBC_ccq=
sS0EHAysyA@mail.gmail.com/
[2] https://lore.kernel.org/bpf/CANk7y0hK9sQJ-kRx3nQpVJSxpP=3DNzzFaLitOYq8=
=3DPb6Dvk9fpg@mail.gmail.com/
