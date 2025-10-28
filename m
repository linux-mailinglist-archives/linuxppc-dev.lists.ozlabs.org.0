Return-Path: <linuxppc-dev+bounces-13467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BFDC16EAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 22:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx3DP1f4mz2yGM;
	Wed, 29 Oct 2025 08:19:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761660304;
	cv=none; b=GbhupujucLg394Ge4kQ18jw35zjtjW26rTnQZcqk2hFDaBpJx5qu5DWv5/rRBdGfoK8pcZpSHfsM/iBvvFJAkuUveMS4Otp640PREMfZdMuMb78VAOlLeSyOqj3LlOAW+X8ddOVzNaMxoaZ/99TvgB4B2vk9Kl7HYqwCA2KKKZcuY7DXmXyTxaxUaBzhT2aZfnKfSVkF3FbFIMkgyCI/jIAqCQCNNFT9HQYFoxzLWzw3p8Il9GCED9SAOlZ4QQFC7MSYl/X3JF3o7ZlHLvQqMQSFS9is9FEU4YiQGW6gMy0um9Q7rJJL5XpUa4aw0/2943PSj682tSqhHCD6XOflRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761660304; c=relaxed/relaxed;
	bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTFjkdsMXYDmPLmhxtRMbZvX54cmM1U3343LAPRF7NpEgQqXVtkuMaa9So3xzJZFvjiFO9to2kZ56qD5nVgB3v++C4nK1sRIgJeRAAqH1yZIaqd1hbu2RZmr6HdqxB8jifgxeECYovb/+ojszfL4VoOs6GClm+pLyZLEXBQ6S7qm293ZlbKjbnt0GecaBJY7sM4UNWCfc3aSDXoO8FTWn5mIE6CVr0wgft0ylbg2ePBfGcTQFZiN8QTGcgPpcSq7nppgpFO6xvLIJdjIExIQvfRVNClKHAJJDfkMUhVi5Ci1aFkVdAGmqUyWJ2uTD24EUgAP4lyTVIe8YWrkjtspoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Us2xuhxR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=ylavic.dev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Us2xuhxR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=ylavic.dev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12a.google.com (mail-yx1-xb12a.google.com [IPv6:2607:f8b0:4864:20::b12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwsZk5Zn7z2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:05:02 +1100 (AEDT)
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-63cf0df1abbso6770380d50.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761660298; x=1762265098; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=;
        b=Us2xuhxRWwJYLhMS+XkXg84M58ZVTrhFhYBwKxe1cNBlUP+D2B1rqCfxf74sjpEBxp
         JgVYZR8x2WyPB7xgKCoVfg46JpYwpG4D7r1rvUddGQeHU6C8pFhkeU8JDrR9IprzKfZ6
         uOU135/sQYRxA37AjZ/JPXxgvsj3AhaUzZoTIhaRXQUPvdU/tebt27NyzdAMQ7Bw9Wc1
         4reFMIkXGatvHVKlDaQq23wV/LWk4QwWQL86WNEYS0Nd6AQDXEFUyxVNrTRG+ZmBoZED
         QjiKWCEXNy3rXe9pkQQPSqBJxhInXqhpbGUAvU66wNWVZ6IEXLvFEEK44PrpaZ0j6Wai
         zLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761660298; x=1762265098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=;
        b=YZoAwQd5fWp7ljQxs1DVT6RIOTV480FX2LGYCYyMRbxacjP5GefHKkdKeL2l9Ltzh2
         yx55WbkBpjF/C3l5cIVL67xE7RUmNvstY25shao+eDhyfTrkz+zu8nRvYoydvh1rTvd/
         U8bATJVaDyPtko9ygDRPt2zXM60wtS4M77zsjf7loGe5CPMlyJg8A+vXIqxif3GdT+Oc
         RC9teAqxLJ1t+o+4zEPritHDhdXoqSvd2zWk6w9bmA4LJYZsluHBpmqARidHMQrJ/d5u
         FcmQdqZYDHt/TtuJZwxh6gSOGsDg0LwuI+3rY1RXQVpfgGHXX2hvFNqOMsMhBDWHjNuH
         ff6A==
X-Forwarded-Encrypted: i=1; AJvYcCXyMcifNsL9WinKMWd8/8jhDw7GVQ9eWxidEy152p9vgoLyBu+VOlAPljqktlch1j5zQyqVoi2joY7eznI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxyQpLNPOso5TRWciycsoPOmAI0IdaB63pPwH2w1nT1isdOH7Z9
	ypxI/6GR6h0DZOloH0TbS58h9F4+pUsIEy6skyIWSYRR3Z5yaE+x7gb14L4EZWD5YyTRO6+5d8w
	3cTo/aKlTiqzQFEfRfsAK8g/b/DhSx+M=
X-Gm-Gg: ASbGncutSWhubXw9RDA0EYwLF/1Tv65g0mqMCvag+Kh4w0T8pa1JiTW7mPefOrJl6F6
	mqZzNPPgqHKhsEb4RakD5AsOiyWS6ycqXtRYRI1CSssvhiWcDEiOyY84mbqrDG/7yVGflfofAfJ
	6uqlwR/kLx4QtBPZliRkK2VLWqc0idFiSfrfMZQ8QV3W9SM/jrojcoV/JQrRDfR1urE/QTOipPG
	jyCxGxmIRvVZsHzAY7mFulUrRQ5zzp/fr9BdCtVIeGT3zZe6d6nvIj42Ynn3poCJOrEP+/bOt4V
	rEBa97r+0VDn3BTM9w==
X-Google-Smtp-Source: AGHT+IGO59IsEPrMaZUmuz6Z8HqEjQzA2Ntsc7bvDVyVXUheTpOGkWA4zrFX+wmhIbJUO+iBKxLOdRdY9YaXu1dEED0=
X-Received: by 2002:a05:690e:d83:b0:63c:e90c:a6d8 with SMTP id
 956f58d0204a3-63f6ba849bamr2974242d50.44.1761660298140; Tue, 28 Oct 2025
 07:04:58 -0700 (PDT)
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
References: <20251027083700.573016505@linutronix.de> <20251027083745.231716098@linutronix.de>
In-Reply-To: <20251027083745.231716098@linutronix.de>
From: Yann Ylavic <ylavic.dev@gmail.com>
Date: Tue, 28 Oct 2025 15:04:46 +0100
X-Gm-Features: AWmQ_bnQq8Ze7k4D-80utHvwT6MTXau8I1_bRZ4nLy6wJZW1-jMkY-uZGE3OIrk
Message-ID: <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
Subject: Re: [patch V5 02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 10:32=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
> +
> +#define __put_kernel_nofault(dst, src, type, label)            \
> +do {                                                           \
> +       __label__ local_label;                                  \
> +       arch_get_kernel_nofault(dst, src, type, local_label);   \

Probably arch_put_kernel_nofault() instead?

> +       if (0) {                                                \
> +       local_label:                                            \
> +               goto label;                                     \
> +       }                                                       \
> +} while (0)


Regards;
Yann.

