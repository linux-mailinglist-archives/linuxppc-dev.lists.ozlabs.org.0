Return-Path: <linuxppc-dev+bounces-3922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 753CF9EB55E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 16:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y737W1wC7z2ysB;
	Wed, 11 Dec 2024 02:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733845751;
	cv=none; b=RC8mjzicyX3eOsyMZbfSz5iUb2zQ/3JaH7VYeQt2AB/FlSMwibLDFyo3z015Vip9389twtVJ9N2gMYwb4RzGigLXk5KXWc+FGqmaT++obpXo7a+vq1ahL4KXzuxEatRb4IvnQzYPc4AbABL7hcVzoGhUL6GRC6U6QlJ5a+ct/NwOFmIj9Jk3AbpkHrPX8FUyWUaiipm4UYjCCEUOzmbeyjSLPXTSpJ3AT1qQ9QD7NVLEttPptPRJm58+SeI42J+LpfPHstFy4q2eZC+vBTdM/5DXm8w3X2+G+TSpgv+td68VYJL//ro+nWqRCWsf0E1qY2qIPzxcGvWbimz0WbmAew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733845751; c=relaxed/relaxed;
	bh=D/Rwez1TpZi0OQAp5ylPL1NO7to/Przt1wcc1OfzevU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5O9h50kk+23bTNiHO7A7qdp6gVnyKxv8Gazc/+EcS+uxzErKNceRHPqpHT9kTfSQ2nZEWUqfbKUWs+K85c8LsuJcbIIVTFlm4aWluhHAvxvr2JevpVyHt9zcNSK5XIbjo30NNcobpLXDVumbN533Svar1MVYPKGUa7hevh/GxmJCqetckW2cZoM9KhH4USmfYSHjk7hNPpZW8LjOVD7d7OvunOhB2Fyoe4tipshfY3wJ9Y1iGIcY54Vp84PMg1JuebR9cGs0G9BdJiFeob+qe971ujV5biWluiT/pw7ellwcFhRA+ROo1GbucIAckE4qsWT9UONgmHeiybXxROxIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.178; helo=mail-vk1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.178; helo=mail-vk1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y737S5kkDz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 02:49:08 +1100 (AEDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5174f298e18so736862e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 07:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845744; x=1734450544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/Rwez1TpZi0OQAp5ylPL1NO7to/Przt1wcc1OfzevU=;
        b=tBsSuG+RQ9jSzjqUcHdE+A5httJNDTEmBxlA5vh/lmhHJrj+sGzOIzTeheWiXqX8Hr
         mChKMRwS3KmjXFf/zcUan++H3kAS+4/o0u52g1W1iMgt3BPNgKxtJpN4wx8XZ5/9qt6y
         X3bm1rYoINlY2BZMSd4a6uybGro7lM4Zux3zMgqiDl/hKDcZ9VHUtNs2SFAOmZi5xeZh
         QKyHCK2P4B79jUlQfpLnRg1F8sC0FY9V6wzoKiTL8aI8F4lJ7pve/9uaesanhHjs2d02
         8bXlgMN1XA6apbKFiNb8RyD7tB92TQQfCTMJczbfo78UsQGyizlgZE9/PO6w1gHJyt6i
         Mc+A==
X-Forwarded-Encrypted: i=1; AJvYcCU04Wn1Hy7hgWyPba35nl3TJuH4UvDKjtvfATgcdfsK/qolS9Vk8TcelaTI0TvXPrY05znw3zcRLNU8SNI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw40bA3DLV7qGe9fvaZtqo+nLEK4n4FkuZqZRd+ojMxDPW7yy3V
	GSGAISk0JyQkXpi2jk/gSpPugsUHZflj+zmT3nzVcik8PFTQGO/uGuLnuwLL
X-Gm-Gg: ASbGncud2KTRN1Nr1lbkRgAfmnpJWk7M9MIIDSufd/pCKmI6IFjD/EBvQLIHbqZuKVu
	qyIJcg9gAYbaLp5XgAtpF8vdrmQr9xWlHbuULY89/ERc+ZPC7Soqg0NEKHs/jMZnxAA6trIhyKc
	NOAjkpizJdbvwe678ygMdl+Trxav0cVVPHqew0AU/OYtUpw6R7RY4sCX3RKozi0WxGvpJFFpcv2
	G20WJtY0l1dSy805jNNYDA7O6PO+8VrXjzK1vVXzqQw5rs+l0ikJgSyqL7vact595BNVSe0BuVk
	QMuoZ98p76/+6ucG
X-Google-Smtp-Source: AGHT+IHfn9o+r77pSRyDYRJ/Rhdoe8tZp0HvYzCCFND3xvaQH626mRG/hJrIQYqhhdJ99IdKJQi9bQ==
X-Received: by 2002:a05:6122:d16:b0:518:a0ac:1f42 with SMTP id 71dfb90a1353d-518a0ac367fmr1013056e0c.1.1733845743524;
        Tue, 10 Dec 2024 07:49:03 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-518947cdf65sm91856e0c.52.2024.12.10.07.49.03
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:49:03 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afdd15db60so1070064137.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 07:49:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAsk4vkSH0K1TZ+JnOu8zOIa1oUA+c4Qpoxdgyxovd2Ar24qonYa/Yp43mpWbuZW2UncIE6niyPbyVY0Y=@lists.ozlabs.org
X-Received: by 2002:a67:e916:0:b0:4af:d487:45ef with SMTP id
 ada2fe7eead31-4afd4874811mr12030637137.5.1733845742841; Tue, 10 Dec 2024
 07:49:02 -0800 (PST)
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
MIME-Version: 1.0
References: <a779f3f44c24716d783d782c935be9fe4f410bff.1733238060.git.geert+renesas@glider.be>
 <6392704d.c158.1938d27f38e.Coremail.00107082@163.com>
In-Reply-To: <6392704d.c158.1938d27f38e.Coremail.00107082@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:48:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTSnHnO7wm04TSBKPu+-aAO9JehW6rK5y6D0uBWu+6Pg@mail.gmail.com>
Message-ID: <CAMuHMdWTSnHnO7wm04TSBKPu+-aAO9JehW6rK5y6D0uBWu+6Pg@mail.gmail.com>
Subject: Re: [PATCH] genirq: Remove leading space from .irq_print_chip() callbacks
To: David Wang <00107082@163.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi David,

On Tue, Dec 3, 2024 at 4:34=E2=80=AFPM David Wang <00107082@163.com> wrote:
> At 2024-12-03 23:02:31, "Geert Uytterhoeven" <geert+renesas@glider.be> wr=
ote:
> >The space separator was factored out from the multiple chip name prints,
> >but several irq_chip.irq_print_chip() callbacks still print a leading
> >space.  Remove the superfluous double spaces.
> >
> >Fixes: 9d9f204bdf7243bf ("genirq/proc: Add missing space separator back"=
)
> >Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> >--- a/drivers/irqchip/irq-partition-percpu.c
> >+++ b/drivers/irqchip/irq-partition-percpu.c
> >@@ -98,7 +98,7 @@ static void partition_irq_print_chip(struct irq_data *=
d, struct seq_file *p)
> >       struct irq_chip *chip =3D irq_desc_get_chip(part->chained_desc);
> >       struct irq_data *data =3D irq_desc_get_irq_data(part->chained_des=
c);
> >
> >-      seq_printf(p, " %5s-%lu", chip->name, data->hwirq);
> >+      seq_printf(p, "%5s-%lu", chip->name, data->hwirq);
> > }
> >
> > static struct irq_chip partition_irq_chip =3D {
> >diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> >index 4783ab1adb8d953b..a3e88ced328a91f1 100644
> >--- a/drivers/soc/qcom/smp2p.c
> >+++ b/drivers/soc/qcom/smp2p.c
> >@@ -365,7 +365,7 @@ static void smp2p_irq_print_chip(struct irq_data *ir=
qd, struct seq_file *p)
> > {
> >       struct smp2p_entry *entry =3D irq_data_get_irq_chip_data(irqd);
> >
> >-      seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
> >+      seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
> > }
> >
> > static struct irq_chip smp2p_irq_chip =3D {
> >--
> >2.34.1
>
> Match with my check result against .irq_print_chip implementation under d=
rivers.
> But I think "%8s" and "%5s-%lu" should be "%s" and "%s-%lu", otherwise th=
ere would still
> be leading spaces when the device name string is short.

I believe these are present for alignment of later columns within the
same irqchip.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

