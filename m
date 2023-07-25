Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F176186B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:32:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Gdc3Vvvz3d9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 22:32:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.50; helo=mail-oo1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R97gN5qnGz2yW2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 17:18:56 +1000 (AEST)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5675add2980so3227536eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690269534; x=1690874334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lrkzr5cvjosFI//uEK1aHD1IOI0Bz2cNenZQg3FVc4w=;
        b=Bq36wYflhA1iQWVOd2IYM8eckFWZDXFUNWqSdS/ezZXYea/wPzT/IO22zZEf1u9qkh
         IjTRFU05EMIxh0eBnGMtanrwytLO8c7Jnl1KkLNjkVf0ryTkn/iGRWjPaqQ1rq30KMLX
         CObDLbQwtx3LZG3zZm6T3JDBmFDckqzHXEqLcUTxNgQ/QFkz5AGASnNoMiKaKZhxcU5X
         iZHyMMZfMOgA2EcgAxxLOt+z9FqKm/MDC3HP3VqY4XVmJRZsDmiA/8zCe1AeSQ0BBVkC
         JAhNnqQ7KKZ65pTJD4YMBP7SP11fndDDndEUtCBtNmD92hOjgECo7l2HYsQ1FdwL+X9e
         B3vQ==
X-Gm-Message-State: ABy/qLYWqgCsuYjbrjQ2qkoC8UEFJPBHUdF8AFO0O5+B3P/fhSXdNTqg
	viEPnUf56JEQIXX0Jk7smjQ/qdPVLRT5exjJ
X-Google-Smtp-Source: APBJJlFwP97Z63CuN4cSA45PbVx37GeyOAmZWQQeAVJElsCYGFJ1MSrSkBJI00xvKzm03vY8nKpoYw==
X-Received: by 2002:aca:1a07:0:b0:39d:f03e:71ca with SMTP id a7-20020aca1a07000000b0039df03e71camr11348228oia.53.1690269533838;
        Tue, 25 Jul 2023 00:18:53 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id bj39-20020a05680819a700b003a478233094sm4843544oib.56.2023.07.25.00.18.52
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 00:18:52 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a3efee1d44so3850709b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:18:52 -0700 (PDT)
X-Received: by 2002:a25:b07:0:b0:d07:bce0:be77 with SMTP id
 7-20020a250b07000000b00d07bce0be77mr6021730ybl.61.1690269511226; Tue, 25 Jul
 2023 00:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230628230935.1196180-1-sohil.mehta@intel.com> <20230710185124.3848462-1-sohil.mehta@intel.com>
In-Reply-To: <20230710185124.3848462-1-sohil.mehta@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jul 2023 09:18:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4HAMD5PA8OOsTGvx_1LuUw=Stegtcb9KQFVa-CP3T_w@mail.gmail.com>
Message-ID: <CAMuHMdX4HAMD5PA8OOsTGvx_1LuUw=Stegtcb9KQFVa-CP3T_w@mail.gmail.com>
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
To: Sohil Mehta <sohil.mehta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 25 Jul 2023 22:32:02 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner 
 <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-api@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <sv
 ens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 8:52=E2=80=AFPM Sohil Mehta <sohil.mehta@intel.com>=
 wrote:
> commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
> syscall definition for lookup_dcookie.  However, syscall tables still
> point to the old sys_lookup_dcookie() definition. Update syscall tables
> of all architectures to directly point to sys_ni_syscall() instead.
>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Namhyung Kim <namhyung@kernel.org> # for perf
> ---
> v2:
> - Rebased to v6.5-rc1. No other dependencies.
> - Added acquired tags.

>  arch/m68k/kernel/syscalls/syscall.tbl               | 2 +-

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
