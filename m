Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41A460A6D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 22:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Mfh5Fxsz3c90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 08:53:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=qeLiiTlD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=qeLiiTlD; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2LsY0Qg6z2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 08:17:20 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2LsJ1Lcdz9y;
 Sun, 28 Nov 2021 22:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638134236; bh=AVVRrFppT2KXeoQ1knr4qxNAWz0fqZEqjSZX5XRty4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qeLiiTlDKcoC3FvftCsYmUekeo8vu2N1pSF3fCD2tgheWVvyonhdof+qu+Ea9djoI
 F0VfIqhNPcyB+IepSkiEVfWMkXITXgi5yRN5hDrKipQbOIN/UYPiCQ3ypFE5/lr3yX
 t143o/oCoxAN5HQdJgLvzJt9p7M6RWXHGnJUqKSETKZD7q6dZ+W4qIz0kh2v3idXT1
 jUvuN2o4SCcowRIIDi5HFtYotMwlOnPhdI33AjtMrxHoxjMEAOO/hdSLgu27razlyO
 MB5TcQY9Ad3wE8nllR9aML4jKPT5UuRgghYO2j4ETJ73vP6/OvL2peMilDKCW68Ia0
 6xDNHfFLM+f6A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 22:17:06 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com>
 <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
X-Mailman-Approved-At: Mon, 29 Nov 2021 08:51:06 +1100
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
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 29, 2021 at 12:04:01AM +0300, Dmitry Osipenko wrote:
> 28.11.2021 03:43, Michał Mirosław пишет:
> > On Fri, Nov 26, 2021 at 09:00:44PM +0300, Dmitry Osipenko wrote:
> >> SoC platforms often have multiple ways of how to perform system's
> >> power-off and restart operations. Meanwhile today's kernel is limited to
> >> a single option. Add combined power-off+restart handler call chain API,
> >> which is inspired by the restart API. The new API provides both power-off
> >> and restart functionality.
> >>
> >> The old pm_power_off method will be kept around till all users are
> >> converted to the new API.
> >>
> >> Current restart API will be replaced by the new unified API since
> >> new API is its superset. The restart functionality of the sys-off handler
> >> API is built upon the existing restart-notifier APIs.
> >>
> >> In order to ease conversion to the new API, convenient helpers are added
> >> for the common use-cases. They will reduce amount of boilerplate code and
> >> remove global variables. These helpers preserve old behaviour for cases
> >> where only one power-off handler is expected, this is what all existing
> >> drivers want, and thus, they could be easily converted to the new API.
> >> Users of the new API should explicitly enable power-off chaining by
> >> setting corresponding flag of the power_handler structure.
> > [...]
> > 
> > Hi,
> > 
> > A general question: do we really need three distinct chains for this?
> 
> Hello Michał,
> 
> At minimum this makes code easier to follow.
> 
> > Can't there be only one that chain of callbacks that get a stage
> > (RESTART_PREPARE, RESTART, POWER_OFF_PREPARE, POWER_OFF) and can ignore
> > them at will? Calling through POWER_OFF_PREPARE would also return
> > whether that POWER_OFF is possible (for kernel_can_power_off()).
> 
> I'm having trouble with parsing this comment. Could you please try to
> rephrase it? I don't see how you could check whether power-off handler
> is available if you'll mix all handlers together.

If notify_call_chain() would be fixed to return NOTIFY_OK if any call
returned NOTIFY_OK, then this would be a clear way to gather the
answer if any of the handlers will attempt the final action (reboot or
power off).

> 
> > I would also split this patch into preparation cleanups (like wrapping
> > pm_power_off call with a function) and adding the notifier-based
> > implementation.
> 
> What's the benefit of this split up will be? Are you suggesting that it
> will ease reviewing of this patch or something else?

Mainly to ease review, as the wrapping will be a no-op, but the addition
of notifier chain changes semantics a bit.

Best Regards
Michał Mirosław
