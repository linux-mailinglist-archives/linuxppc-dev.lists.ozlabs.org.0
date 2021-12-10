Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBE471E5E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:53:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0LD1DHnz3cVM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:53:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9fP200qpz3c6D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:21:24 +1100 (AEDT)
Received: by mail-ot1-f54.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so10388080oto.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGnO4bxnTAqMK/uthYlBDN3+OwLPbg309qxpgobdKxI=;
 b=1I2pVelhuFbWAEfL8VBpPoO/10+iU+D0oM1jX1rMSmj94D7HRZ7NwGyaQPhRZggqB5
 sNDU96TarnjRH8KRmeFD6Es6benrZ/oEfBxGVeVjIr5uYZVXPUR4f1BNZqz6WqwJOCTR
 DFEDBfQtkZuuKANYSZLNnLm5GVoW+7u/XXEMmTu4qDj092swiXj3wbaiqQBtNuuE8KtC
 5AHfne0+BtDcvvwlgmm/MQ1fbo5A6Xc28vTDhqjlZEG0VwYtzjYAU32mPKB4XHk/nLc6
 lwEO/PxsnhpCJcmRjXE6IdJBztx8bqZWFjPVhehnnSfcrSqPe/gL0LYeTUAESv+mek2n
 kJBw==
X-Gm-Message-State: AOAM531HnE2tnBVGoqLVupEMRJRsWQkBpKDL5POzgTGZINuDB7A5atQe
 oPzS2Ekg63zw+56bSRYGtfi/0jbMM9j22x5tCJk=
X-Google-Smtp-Source: ABdhPJxyUbegeOKjvJ3CxiHL7dwpj9EzFVDPRUNdKiJGM3d307QrxgUO9bUGZj0EMwemLB2snxZHAeDirffJcqK0rDM=
X-Received: by 2002:a05:6830:1e57:: with SMTP id
 e23mr12377743otj.16.1639160481982; 
 Fri, 10 Dec 2021 10:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-5-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-5-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:21:11 +0100
Message-ID: <CAJZ5v0h_OfrQ92KqsUdiKAfUrXDT9dPXzq4S=b6zi4k_2cPAjg@mail.gmail.com>
Subject: Re: [PATCH v4 04/25] reboot: Correct typo in a comment
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
 linux-ia64@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alankao@andestech.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linux-sh list <linux-sh@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Correct s/implemenations/implementations/ in <reboot.h>.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

This patch clearly need not be part of this series.

> ---
>  include/linux/reboot.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index af907a3d68d1..7c288013a3ca 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -63,7 +63,7 @@ struct pt_regs;
>  extern void machine_crash_shutdown(struct pt_regs *);
>
>  /*
> - * Architecture independent implemenations of sys_reboot commands.
> + * Architecture independent implementations of sys_reboot commands.
>   */
>
>  extern void kernel_restart_prepare(char *cmd);
> --
> 2.33.1
>
