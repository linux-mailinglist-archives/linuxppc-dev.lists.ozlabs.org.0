Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 822DB4480F6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 15:07:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HntH33D6wz3c91
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 01:07:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.52; helo=mail-ua1-f52.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HntGb4LSTz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 01:07:19 +1100 (AEDT)
Received: by mail-ua1-f52.google.com with SMTP id ay21so31622366uab.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 06:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=srssYsTsVb5ivMDmTAt6Y7lXgP/lHHGiJX97jzZpFII=;
 b=Ts6f/MlOnmmjyptE/fTxBdmb8sqCwXwwu/vctDrKGYM1/SzhXV/V/bOZ+WHRg/WopK
 T2Crb122bBytfc4TG2dz7aJylGGL0OpeWdGtuMHu4XRLiPw9UUdkXkOM0H3Vsn+EyyQJ
 7mNtm4soAL5ka9Ty+idpXejOSSYFwmQxDqxGZVT1X3huxg/CJRQqB3GFkMKVVbQJdmIt
 MVYLrlTQw+5JgxLPx8RUnQDkLJ9eUZwWQQVPTDIcy185AEuwAIvb4VgzVGBOtAtlF6DU
 X0pv3nXPRB75Wo/StSBVEUhatOY41wjqaTt+FYm0ErxGAxGqTYvPe3/1Lmj4Y2dAEgBY
 fvwg==
X-Gm-Message-State: AOAM531npOqNVf7cU42FikFNG3smo+B5CUAMe9fRFWL00dVCDbXIh0uG
 S3eBIZbVOQhFbClpu3uZ3Cd4tQOVrgo86W8M
X-Google-Smtp-Source: ABdhPJzBUGNByefDM7t3UBaEFltui041vmJuuxs4gifD4yJKDe2qqlJm9QxsPkLrr1O9GlAQbmoNCQ==
X-Received: by 2002:ab0:6883:: with SMTP id t3mr201818uar.66.1636380436000;
 Mon, 08 Nov 2021 06:07:16 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id bk3sm443137vkb.33.2021.11.08.06.07.14
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 06:07:15 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id p22so6555533vke.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 06:07:14 -0800 (PST)
X-Received: by 2002:a05:6122:1350:: with SMTP id
 f16mr21288847vkp.26.1636380434409; 
 Mon, 08 Nov 2021 06:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
In-Reply-To: <20211108101157.15189-43-bp@alien8.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
Message-ID: <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
To: Borislav Petkov <bp@alien8.de>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 openipmi-developer@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Borislav,

On Mon, Nov 8, 2021 at 11:13 AM Borislav Petkov <bp@alien8.de> wrote:
> From: Borislav Petkov <bp@suse.de>
>
> The notifier registration routine doesn't return a proper error value
> when a callback has already been registered, leading people to track
> whether that registration has happened at the call site:
>
>   https://lore.kernel.org/amd-gfx/20210512013058.6827-1-mukul.joshi@amd.c=
om/
>
> Which is unnecessary.
>
> Return -EEXIST to signal that case so that callers can act accordingly.
> Enforce callers to check the return value, leading to loud screaming
> during build:
>
>   arch/x86/kernel/cpu/mce/core.c: In function =E2=80=98mce_register_decod=
e_chain=E2=80=99:
>   arch/x86/kernel/cpu/mce/core.c:167:2: error: ignoring return value of \
>    =E2=80=98blocking_notifier_chain_register=E2=80=99, declared with attr=
ibute warn_unused_result [-Werror=3Dunused-result]
>     blocking_notifier_chain_register(&x86_mce_decoder_chain, nb);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Drop the WARN too, while at it.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Borislav Petkov <bp@suse.de>

Thanks for your patch!

> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -141,13 +141,13 @@ extern void srcu_init_notifier_head(struct srcu_not=
ifier_head *nh);
>
>  #ifdef __KERNEL__
>
> -extern int atomic_notifier_chain_register(struct atomic_notifier_head *n=
h,
> +extern int __must_check atomic_notifier_chain_register(struct atomic_not=
ifier_head *nh,
>                 struct notifier_block *nb);
> -extern int blocking_notifier_chain_register(struct blocking_notifier_hea=
d *nh,
> +extern int __must_check blocking_notifier_chain_register(struct blocking=
_notifier_head *nh,
>                 struct notifier_block *nb);
> -extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
> +extern int __must_check raw_notifier_chain_register(struct raw_notifier_=
head *nh,
>                 struct notifier_block *nb);
> -extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
> +extern int __must_check srcu_notifier_chain_register(struct srcu_notifie=
r_head *nh,
>                 struct notifier_block *nb);

I think the addition of __must_check is overkill, leading to the
addition of useless error checks and message printing.  Many callers
call this where it cannot fail, and where nothing can be done in the
very unlikely event that the call would ever start to fail.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
