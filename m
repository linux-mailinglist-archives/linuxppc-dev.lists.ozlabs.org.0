Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4528A4D79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 13:17:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ4QT6N86z3vbV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 21:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.169; helo=mail-yb1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ4Pz6gMnz3dRm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 21:17:10 +1000 (AEST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso2464340276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 04:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713179825; x=1713784625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDiun8fBl0neiQNLp2j8KsuRQma3u2I4LgI70HkeRT4=;
        b=mBnjvOv6CY93PlwXS2OM/fKK068CHY+vWQBry8vT2sOmUliFTFtjNEpQpnF7YSAWet
         kLCE433uAEwQHwtidkxZLY8d83CisKEl/zdmVxDWbe3LieuwNulEOzVtqxLI3ULwKJa5
         YuOsWVyymS2iJ3FUdcsyH53T5wXIr1T2QytSn3MZ8+UEgYmqghw0zGofRiXmni935RXm
         8Uvc4PBCEcFUPcNRDKC5tongrVxoWd7k1bU7D6ej0KbLAvH74KHANYp1ZFLCKay6iqPC
         J2DB/t2LHxBawMBzbAh8w1i6GJY/9ek5g2unEGAEWw6ddrUU3zxpMFjekTfY+hTs3wRQ
         shgg==
X-Forwarded-Encrypted: i=1; AJvYcCUUs1RdaR3S9xybvywzoRqpLXZOeIiRti3LBA8DwmWXWvJXJihKT9WnWHOMUSgtzPUUZZJI5yc+WVPPv6SLqYBABBRoHo8B6pEiHLw0xQ==
X-Gm-Message-State: AOJu0YwWpGr7esA3L+oDAJICJParQeizDBAR7cgwC5puYXPb5adg+dQ3
	9WqktchjtZbGjU2hqPP6WxAKNITLppySzfBY7gwC+4lsBvGRY46/5ed9HxWJ
X-Google-Smtp-Source: AGHT+IHqIj/U4WrwPp8ZL2sgOJ4S5YcPsk0KRwuyVXScdTBvcksx/TkUE2VbAT/kuj/eZhOCtujr4g==
X-Received: by 2002:a25:addc:0:b0:dc6:6307:d188 with SMTP id d28-20020a25addc000000b00dc66307d188mr9081100ybe.25.1713179824758;
        Mon, 15 Apr 2024 04:17:04 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 205-20020a2500d6000000b00dc25d5f4c75sm2001090yba.10.2024.04.15.04.17.03
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 04:17:03 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so2609007276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 04:17:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWalstmLZDG3KJGXUOJ4iWj3n17/7pajO3pmE5/ymJUCcmhf98nMajJXb5+KRMGNfy7RYyRFTY75UKasbxxOEyGQONRLnsvanpC7QumyA==
X-Received: by 2002:a25:4b82:0:b0:de0:f753:ad25 with SMTP id
 y124-20020a254b82000000b00de0f753ad25mr8758272yba.1.1713179822967; Mon, 15
 Apr 2024 04:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com> <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au> <87edb9d33r.fsf@mail.lhotse> <87bk6dd2l4.fsf@mail.lhotse>
In-Reply-To: <87bk6dd2l4.fsf@mail.lhotse>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Apr 2024 13:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Message-ID: <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Sean Christopherson <seanjc@google.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Sat, Apr 13, 2024 at 11:38=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> ...
> >> On Tue,  9 Apr 2024 10:51:05 -0700 Sean Christopherson <seanjc@google.=
com> wrote:
> ...
> >>> diff --git a/kernel/cpu.c b/kernel/cpu.c
> >>> index 8f6affd051f7..07ad53b7f119 100644
> >>> --- a/kernel/cpu.c
> >>> +++ b/kernel/cpu.c
> >>> @@ -3207,7 +3207,8 @@ enum cpu_mitigations {
> >>>  };
> >>>
> >>>  static enum cpu_mitigations cpu_mitigations __ro_after_init =3D
> >>> -   CPU_MITIGATIONS_AUTO;
> >>> +   IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AUTO=
 :
> >>> +                                                CPU_MITIGATIONS_OFF;
> >>>
> >>>  static int __init mitigations_parse_cmdline(char *arg)
> >>>  {
>
> I think a minimal workaround/fix would be:
>
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 2b8fd6bb7da0..290be2f9e909 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -191,6 +191,10 @@ config GENERIC_CPU_AUTOPROBE
>  config GENERIC_CPU_VULNERABILITIES
>         bool
>
> +config SPECULATION_MITIGATIONS
> +       def_bool y
> +       depends on !X86
> +
>  config SOC_BUS
>         bool
>         select GLOB

Thanks, that works for me (on arm64), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
