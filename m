Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD143E124
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg4yM4Pvtz3c9c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:44:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iTF+KxXE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=green.hu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iTF+KxXE; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg4SB54BTz2xrx;
 Thu, 28 Oct 2021 23:22:01 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so4528747pjb.3; 
 Thu, 28 Oct 2021 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sEQTGe1SdVzMEvdAS+JHzGs+s//rKDLb3zrHBeoZhQ4=;
 b=iTF+KxXEUPxEL0X/A/h2gzR6rfhKbueZtpV43T9ecbwhzi0t+l3q/o5Ua3AWvU+Enc
 ByGkTqENMRntgh3iznFMDxu2CMYcinTkd+zVseDqmIBVqNiOOl7jtDTN28tXnXeh/eHS
 f+SIvvi2YC7tI22dM3EDibcHeQLa3iIqsv5H8CiejoyVxtmYKOA3VOetskmtU4Lx+Pqb
 LjWvbMeTK5pVAec3h6exgixTZBuA0b6b4pLrHZnH5EOvWXMCcJgTfSDot7PpiFpwOrmA
 UDe0Zf8yyrgR8VQIYltC0W9ualVYljq6alX4ZkNWzu2NeGmBPW3wY5ZPA2p2XVSWoIe3
 jylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sEQTGe1SdVzMEvdAS+JHzGs+s//rKDLb3zrHBeoZhQ4=;
 b=7oHNBcKXN6mcxUm7jW94fS77Frn8IO/DegLYEyhH2IAM6ARyJUzbq+4zy1QAzbAk4U
 fbzsYL97m0UaRrSM5E39rdTW5NXouEPdcVGamh+OTSiqmTIQRDiNNZJnbVm5SiRFK79h
 TeV/4OSugSbpLqYmoeucURNInLNV1G8l1am46gHHe3RADMxkrFk21/ooiCfGyAN67gYF
 mbFWXktW0KC8xSu9UXy4mNZSwxBwyPiTqbvjSaYR+nyyxJ373RAWScua7TtM2YNU3VkV
 R91zMUABc3UQPJ2Zz9siFfpgSNCNTTtWJVyCl3Xwu1dVc7Mcx2+RqFQOgyXfFehrx/qq
 s0XQ==
X-Gm-Message-State: AOAM531qIKylRPmKWwtjTXO5D3HxwBFDrBxCcvwrr/STNzD2WiOAu0wQ
 3VQvfMR9VCMDQnxmLG+/z9GXe6R0ln6evA9X+jo=
X-Google-Smtp-Source: ABdhPJwgRG6Z5IlQAMmxkEb7xwk/3DRskWOoc9lq5s+Jze0PB67uqVa13ZU9GrnI44E+cb/61DiEpYjC8sFDBN8RSYA=
X-Received: by 2002:a17:902:b716:b0:13f:b2d1:f316 with SMTP id
 d22-20020a170902b71600b0013fb2d1f316mr3644234pls.24.1635423719258; Thu, 28
 Oct 2021 05:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-16-digetx@gmail.com>
In-Reply-To: <20211027211715.12671-16-digetx@gmail.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Thu, 28 Oct 2021 20:20:00 +0800
Message-ID: <CAEbi=3eTruN6rYvEHCtyhTEZ=Ep8n6g75UMpHffc=0UrVTGbdQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/45] nds32: Use do_kernel_power_off()
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 28 Oct 2021 23:43:32 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-omap@vger.kernel.org, Alan Kao <alankao@andestech.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?Sy5DLiBLdWVuLUNoZXJuIExpbijmnpflnaTmiJAp?= <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dmitry Osipenko <digetx@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8828=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=885:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/nds32/kernel/process.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
> index 49fab9e39cbf..0936dcd7db1b 100644
> --- a/arch/nds32/kernel/process.c
> +++ b/arch/nds32/kernel/process.c
> @@ -54,8 +54,7 @@ EXPORT_SYMBOL(machine_halt);
>
>  void machine_power_off(void)
>  {
> -       if (pm_power_off)
> -               pm_power_off();
> +       do_kernel_power_off();
>  }
>
>  EXPORT_SYMBOL(machine_power_off);
> --
> 2.33.1
>

Loop in Alan and KC
