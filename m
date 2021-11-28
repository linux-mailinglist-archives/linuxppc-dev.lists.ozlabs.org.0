Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F84602F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 03:14:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1sWB57pYz3cns
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 13:14:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=oXqLZE7x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=oXqLZE7x; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1rCN2gH1z301K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 12:15:59 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1rCD4tJRz9Y;
 Sun, 28 Nov 2021 02:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638062155; bh=/7+VGRKxSD8xhQyHeA7wxZc9qtdjiI1iETTVe9pYPLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oXqLZE7x4BBzR6RgITz19akH85JDkj2nuDH72AAzGlf1Y19/zRhLT/EYzkjxSquZY
 lQDmdeOlt8p2X8CEQglQKE82HPyr+MOsLSpQnGJ3s5n+8hbJIsMdPOKL4fZcMf0jgO
 CJ7+TE23XroAl9jtGHsf4Kws8DhnEqHir6C7zTLETfSX3VrDeoLBt5clA/cf/ZoC7B
 31pS0P4z0OUxVHiLECVTcCPYSnqvN5IbEtxNoArldRfYbOgq5wGXjBIkaa3TdqpC0q
 PWCaSN/jTI85sRsru7LR0d1SZHbfWHN7MsxouM8JlzJ+q5vzkEduCAsbuKP/U7sT2N
 iLQXxOKkkTf7g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 02:15:51 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 18/25] x86: Use do_kernel_power_off()
Message-ID: <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-19-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211126180101.27818-19-digetx@gmail.com>
X-Mailman-Approved-At: Sun, 28 Nov 2021 13:13:21 +1100
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

On Fri, Nov 26, 2021 at 09:00:54PM +0300, Dmitry Osipenko wrote:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/x86/kernel/reboot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 0a40df66a40d..cd7d9416d81a 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -747,10 +747,10 @@ static void native_machine_halt(void)
>  
>  static void native_machine_power_off(void)
>  {
> -	if (pm_power_off) {
> +	if (kernel_can_power_off()) {
>  		if (!reboot_force)
>  			machine_shutdown();
> -		pm_power_off();
> +		do_kernel_power_off();
>  	}

Judging from an old commit from 2006 [1], this can be rewritten as:

if (!reboot_force && kernel_can_power_off())
	machine_shutdown();
do_kernel_power_off();

And maybe later reworked so it doesn't need kernel_can_power_off().

[1] http://lkml.iu.edu/hypermail//linux/kernel/0511.3/0681.html

Best Regards
Micha³ Miros³aw
