Return-Path: <linuxppc-dev+bounces-9673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878EAE5EB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 10:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRHcs21M8z2xRq;
	Tue, 24 Jun 2025 18:07:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750752477;
	cv=none; b=VI/1X1I+7D0j7wURaFVagjb7A1BIqGxAZ1JoThCQyVqt5+I+fW8kE2LRE0nguT1pKyoHEPGvHBhszEvMK2HIXLpkB7ENBcwFWVts0ip80RLMSGiT3SN1vrEpmn5fTYOkLI4XhBgEnc01RNjONKyBPgWHRvX3g0/BirVrq5C1GfUrlOGgDdJAyC/EnHyPuE3FbDue5K1txP+V7FsY7YNu4Gw8F8sUAmPSbdDEBH0MmQ+fS6aWRXEaNUkwhZHc4dEq2nU14CKAs6tC3Yok67V5TWadCdPqPhf8QfOJuC+uNaGUKiImyzauM/ugUtSWfEn1nP6drmdYdv56+JdyQGeU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750752477; c=relaxed/relaxed;
	bh=aEKaHr7bzVOBX6mtsl4IPvcEgrMN7hu031sel/DT8/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XLcZy9X0o6wvQCgJZc8AZbV+J4Yve5+Of4Wy4SH24tUMgtPmS0DIjUr5vwCvU8XUe9HIz28yCiRUM9M4ombK+PIa8p95/LMy6n7MYa/LSlR7OrZctzK11XLZMjTFlIaqjLzv7ziupn9zEOxoc7HdzbcHX81lCbrbtTvfur5FKVMUkiecupolDVr8JVFsHP0sZONGheXpOLiNptxyrPpr6oB+J7Ab5xcI3ylngxdYbjNe77XdapEmYDB9ExnaNqszChIg1WmTZmx2d8rsRSJa+4dfvs3y7M2/H2v7a+BUSp0HvNm32hADmSUIttzYfBYKGS14QAWtDAqxHGexz/xvOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FYxRxJvv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FYxRxJvv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRHcq55gzz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 18:07:54 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4098209f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750752471; x=1751357271; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEKaHr7bzVOBX6mtsl4IPvcEgrMN7hu031sel/DT8/Y=;
        b=FYxRxJvvh/kE+XnGP5hrICQXXp8JKhOUAQ0sc3mGw7Siq/DIBD+lWVHBehzdRFIXQ+
         izo4OTdX9dHWxlUlwi4PTx+spUncZymi54I8NJIx9RJMVcf/v6cdqHlz6qk2vXDpjnZW
         WLWyU5d90sL7ntpnuPQernzp/hXTpSCF4xya1BFErEMpdZw+krWLCpaiWzEvv/BQOPKN
         mCAi0c2v5vD1LmviG+i8n/XoQZiZHcoqk9Lc13Lz1AM43unXnRLLWZooQipPcL1VLiAw
         G/3m5YYmuiWYBTjBtmTZTTgWwsCx5EC9ctVYCR043DgvSvMRVvg5WS6gHI500FO8CsHb
         dw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752471; x=1751357271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEKaHr7bzVOBX6mtsl4IPvcEgrMN7hu031sel/DT8/Y=;
        b=eJCwVI59XlHl8ZxNJsHQ54t1/MTDV5vO8BkCJ9Br1cXXODqjbRPwMF2pi3vGXTGx5L
         xSKyrw35VTQ0TXrSJDKtsvO8jUMA/5v0/W2iRyZfCs5Ny2iN4nGwmmQx34yPhBygF2lo
         F81646iRdjvZwDnUNSoIZ16BaHec0UqfvLJ/QmpZNktRsGBtosMbQ/7Uc7KaWTJDcJkM
         mxE4WH9FSghgO1+35k+DAB3hu2un9U7T9tvk0XAUV4N3fC7Rre983IN+anXOQAv4IiKG
         jzHlyh48Pvgn/E1NlANeNnCg4q2009xRIaE+AuLaLW/HljY+e0uKNNl9HuQRUCdMqnD4
         /1ag==
X-Forwarded-Encrypted: i=1; AJvYcCV20HKpZDbOfnH02voZ3HfKKQrFMHccQqkq3KaxMWLQQ/DXl7b/1UW1ntuGBrR1/yjZhT5FMxLhh0EiLMY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyPj1zPbrs9Z5S35sS1CMDn9ezAvCcosxfQbWbWjuX6dX4f2SSc
	gn77PJHZoyc456uHZzcHScGGdIY7BUxb5SZKiCF5gtYAHmjh6eWKAZ7A
X-Gm-Gg: ASbGncu4/LjerJCuf8QnkOQL8M84+SjUJaH0HZlLH6mOvpmvlum923cH9FkQuTmjBp6
	XrobuAT1bhSvsUs+/CYd0bIbXU4IPVkGIn6dJtkdnjStGTqLYO/eH9tqoc8HIs28mdQikWhZZN9
	6rQbK2Q1c3TlkLGg3CWihVBZPX3vPSmSnEiKtNsRiFgWUvLSTTaw21b1Pc01KDkj42zyQOS1DBI
	8pA2p4O++l/7xhKVh+AHIHvszkuzwDojz7g67bOmOd+7a4+GKzWarTJjiWwmdWNMGoHKMPhrSU6
	cXEFEqJrD96r81s/lx6B3LSSVO0Rv5JAeQ0ylvL9x7AuD5XKB6sr9GxuUbGKmLky+zfQ+KaX8l9
	Mt+IEgsJACJlIeBimrFdqwe0i
X-Google-Smtp-Source: AGHT+IGj40J3gYQNZuNyHWQXqC5QGveSgT4VbYt/zXOwee83nuPUMNJqpNFfTApYGAVg7P7wmmNZYg==
X-Received: by 2002:a05:6000:4028:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a6d12eb400mr12534935f8f.48.1750752470752;
        Tue, 24 Jun 2025 01:07:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45366b4d0adsm122345145e9.14.2025.06.24.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:07:50 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:07:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to
 copy_from_user_iter()
Message-ID: <20250624090748.056382c4@pumpkin>
In-Reply-To: <2f569008-dd66-4bb6-bf5e-f2317bb95e10@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
	<CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
	<2f569008-dd66-4bb6-bf5e-f2317bb95e10@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 24 Jun 2025 07:49:03 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 22/06/2025 =C3=A0 18:57, Linus Torvalds a =C3=A9crit=C2=A0:
> > On Sun, 22 Jun 2025 at 02:52, Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote: =20
> >>
> >> The results of "access_ok()" can be mis-speculated. =20
> >=20
> > Hmm. This code is critical. I think it should be converted to use that
> > masked address thing if we have to add it here. =20
>=20
> Ok, I'll add it.
>=20
> >=20
> > And at some point this access_ok() didn't even exist, because we check
> > the addresses at iter creation time. So this one might be a "belt and
> > suspenders" check, rather than something critical.
> >=20
> > (Although I also suspect that when we added ITER_UBUF we might have
> > created cases where those user addresses aren't checked at iter
> > creation time any more).
> >  =20
>=20
> Let's take the follow path as an exemple:
>=20
> snd_pcm_ioctl(SNDRV_PCM_IOCTL_WRITEI_FRAMES)
>    snd_pcm_common_ioctl()
>      snd_pcm_xferi_frames_ioctl()
>        snd_pcm_lib_write()
>          __snd_pcm_lib_xfer()
>            default_write_copy()
>              copy_from_iter()
>                _copy_from_iter()
>                  __copy_from_iter()
>                    iterate_and_advance()
>                      iterate_and_advance2()
>                        iterate_iovec()
>                          copy_from_user_iter()
>=20
> As far as I can see, none of those functions check the accessibility of=20
> the iovec. Am I missing something ?

The import_ubuf() in do_transfer() ought to contain one.
But really you want the one in copy_from_user_iter() rather than the outer =
one.

Mind you that code is horrid.
The code only ever copies a single buffer, so could be much shorter.
And is that deep call chain really needed for the very common case of one b=
uffer.

	David


>=20
> Christophe


