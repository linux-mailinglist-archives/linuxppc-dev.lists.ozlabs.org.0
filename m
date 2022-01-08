Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9D488757
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jan 2022 03:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JWgNy3yGkz3bcy
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jan 2022 13:08:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=FscL30pA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=FscL30pA; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JWc0B3V2lz2xXg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jan 2022 10:35:37 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4JWbzn6Bf4z9c;
 Sun,  9 Jan 2022 00:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1641684931; bh=PlUOfTOJmz/Ue3/EDBlVUxJ2DxqecfDU18/1xQbQtoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FscL30pAUhiOa20r1Aci5nnOyAPPM7+JoY4I/TdvClRTh0U4D6S+wg1hl5DP6lTxY
 uXsR1x49ZX58OBDSXL5QGeKh44OE5Qx3HX+fhAHnzzl6d2Bb3RMolFLW/CZs7ANyT9
 2B2bqDVSaDvrnFLV9W4laov2KVjSpYZyXNNSx0uhvIf6/Ty/Jc6im2Ya6WtOK+mKnU
 8tBa912YBdNEWU6kN5XGlGndW+KwbfYMSoJHIv4OJWOXoW7NdW+vFlXd5iG2C0Sl5t
 yLjrrdYJpGeB9xfuugFJFXVZkd4+VRh97hWFY+LEwPEsT5kUEeN00fOMl2F0IbFH2g
 x9nJQfgC6GmfA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date: Sun, 9 Jan 2022 00:35:15 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211212210309.9851-5-digetx@gmail.com>
X-Mailman-Approved-At: Sun, 09 Jan 2022 13:08:21 +1100
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
 Juergen Gross <jgross@suse.com>,
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

On Mon, Dec 13, 2021 at 12:02:52AM +0300, Dmitry Osipenko wrote:
[...]
> +/**
> + * struct power_off_data - Power-off callback argument
> + *
> + * @cb_data: Callback data.
> + */
> +struct power_off_data {
> +	void *cb_data;
> +};
> +
> +/**
> + * struct power_off_prep_data - Power-off preparation callback argument
> + *
> + * @cb_data: Callback data.
> + */
> +struct power_off_prep_data {
> +	void *cb_data;
> +};

Why two exactly same structures? Why only a single pointer instead? If
it just to enable type-checking callbacks, then thouse could be opaque
or zero-sized structs that would be embedded or casted away in
respective callbacks.

> +
> +/**
> + * struct restart_data - Restart callback argument
> + *
> + * @cb_data: Callback data.
> + * @cmd: Restart command string.
> + * @stop_chain: Further lower priority callbacks won't be executed if set to
> + *		true. Can be changed within callback. Default is false.
> + * @mode: Reboot mode ID.
> + */
> +struct restart_data {
> +	void *cb_data;
> +	const char *cmd;
> +	bool stop_chain;
> +	enum reboot_mode mode;
> +};
> +
> +/**
> + * struct reboot_prep_data - Reboot and shutdown preparation callback argument
> + *
> + * @cb_data: Callback data.
> + * @cmd: Restart command string.
> + * @stop_chain: Further lower priority callbacks won't be executed if set to
> + *		true. Can be changed within callback. Default is false.

Why would we want to stop power-off or erboot chain? If the callback
succeded, then further calls won't be made. If it doesn't succeed, but
possibly breaks the system somehow, it shouldn't return. Then the only
case left would be to just try the next method of shutting down.

> + * @mode: Preparation mode ID.
> + */
> +struct reboot_prep_data {
> +	void *cb_data;
> +	const char *cmd;
> +	bool stop_chain;
> +	enum reboot_prepare_mode mode;
> +};
> +
> +struct sys_off_handler_private_data {
> +	struct notifier_block power_off_nb;
> +	struct notifier_block restart_nb;
> +	struct notifier_block reboot_nb;

What's the difference between restart and reboot?

> +	void (*platform_power_off_cb)(void);
> +	void (*simple_power_off_cb)(void *data);
> +	void *simple_power_off_cb_data;
> +	bool registered;
> +};

BTW, I couldn't find a right description of my idea of unifying the
chains before, so let me sketch it now.

The idea is to have a single system-off chain in which the callback
gets a mode ({QUERY_*, PREP_*, DO_*} for each of {*_REBOOT, *_POWEROFF, ...?).
The QUERY_* calls would be made in can_kernel_reboot/poweroff(): all
would be called, and if at least one returned true, then the shutdown
mode would continue. All of PREP_* would be called then. After that
all DO_* would be tried until one doesn't return (succeeded or broke
the system hard). Classic for(;;); could be a final fallback for the
case where arch/machine (lowest priority) call would return instead
of halting the system in machine-dependent way. The QUERY and PREP
stages could be combined, but I haven't thought about it enough to
see what conditions would need to be imposed on the callbacks in
that case (maybe it's not worth the trouble, since it isn't a fast
path anyway?). The goal here is to have less (duplicated) code in
kernel, but otherwise it seems equivalent to your API proposal.

Best Regards
Micha³ Miros³aw
