Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F1760B61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 09:17:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R97dd27V2z3c2f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 17:17:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.50; helo=mail-vs1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R97d36b8rz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 17:16:55 +1000 (AEST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-444c42f608aso1701389137.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690269411; x=1690874211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJjDsseCku7rw4c3XWBJPjjfZ2OLqB4Q28CEWAPlCas=;
        b=LCGfEuG2NrVTLMrO7aevx2mz81LL15puai2CEGipDSs08bqinqOLvIm8MbKxEFr0oT
         qqy3ZQxEK5v+K5HFkJ3MDNMipEkCZBxPYf80YTfrnxQiX2o7x5HC4k6BgkjpRdvAxIYT
         JWc+PFqKvOe2FWl1c+00dBBofPmdpBeTfYQHqYUV2iDN1xBvmD1CVTlWoizy6auDN12e
         wxjguFei+0Av/ALN5IcLVjX4nm3+X16TwiETB3kLWA0pp21HsyGzCxrSiBTpb5vS9h13
         yTV7QO7RlXdWRBiJK8SKZ4QHxnxypPUtGLsw5Im8+PHfcKlwuDlslLGoYz/DP/vW+WxV
         Iyig==
X-Gm-Message-State: ABy/qLYmq8/q4gE1voRkyWdtXJ+yCZXNQR/sVwmYb4uZMFz1nB+l8mU1
	6LVwKu+p/OINqkKQWVarc1khlB7JvuLi6rIv
X-Google-Smtp-Source: APBJJlH62PJXTHJKWWx7+3Q4qAhYR1UrgJTV7Rj3TuG1GXQjr5AY/zTdbmkATmy0O6cO/DZeTEAe5g==
X-Received: by 2002:a05:6102:2448:b0:444:e9a0:13f7 with SMTP id g8-20020a056102244800b00444e9a013f7mr4254548vss.5.1690269411385;
        Tue, 25 Jul 2023 00:16:51 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id q18-20020a67cc12000000b00446d8968615sm1733271vsl.2.2023.07.25.00.16.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 00:16:49 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-794cddcab71so1499404241.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:16:49 -0700 (PDT)
X-Received: by 2002:a25:10c5:0:b0:c91:717e:7658 with SMTP id
 188-20020a2510c5000000b00c91717e7658mr10654915ybq.2.1690269388936; Tue, 25
 Jul 2023 00:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
In-Reply-To: <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jul 2023 09:16:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzYxo83AXfWWVyp2fL3fcEUNgbG5aSZuA62FwO2i3jDg@mail.gmail.com>
Message-ID: <CAMuHMdXzYxo83AXfWWVyp2fL3fcEUNgbG5aSZuA62FwO2i3jDg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
To: Alexey Gladkov <legion@kernel.org>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, fweimer@redhat.com, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@monstr.eu, tony.luck@in
 tel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 6:25=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> This registers the new fchmodat2 syscall in most places as nuber 452,
> with alpha being the exception where it's 562.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
