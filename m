Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2D460C23
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 02:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2SDg6wrqz3cRD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=H73sBxsM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=H73sBxsM; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2RHb47bNz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 11:36:43 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2RHF5R6Gz9Y;
 Mon, 29 Nov 2021 01:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638146198; bh=DI1VWBOrDzR1kSFvGVwF5e/uC6F95umcWDF0D1gW0co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H73sBxsM7L9z8xEfnp2Ak7MzBK8+vuHhYSpX9ZmIw96z66YhhL0jbzAc1kAW4E8/k
 E+n0myrDaFBdTPW3DCJBAB1QxLCznookgF41GB3ur/8AtJ172fB625fAJLQBCfF2Il
 1tVB3rwB3wCft3kEONBcl+9mGZ0YFJna/va55m2Id6G5OQJMzxWyiW8mEoVG9uWh4D
 9FU7cd4y+9BUv1/bcd+v0FTSSINIJ8msC5Z+cow25KP+uSrFkzTmZSbuYJNYmoN8pj
 wIHmD3sAFqkn2Up4Tyhb9Q0kZcFFYL4JTYDk03Wdeze2AnxwyR74tes3GEAEUnF7BY
 Uq7OHC/U12/7A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 01:36:24 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <YaQgiLw03lPyvuhr@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com>
 <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
 <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
X-Mailman-Approved-At: Mon, 29 Nov 2021 12:17:37 +1100
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

On Mon, Nov 29, 2021 at 12:53:51AM +0300, Dmitry Osipenko wrote:
> 29.11.2021 00:17, Michał Mirosław пишет:
> >> I'm having trouble with parsing this comment. Could you please try to
> >> rephrase it? I don't see how you could check whether power-off handler
> >> is available if you'll mix all handlers together.
> > If notify_call_chain() would be fixed to return NOTIFY_OK if any call
> > returned NOTIFY_OK, then this would be a clear way to gather the
> > answer if any of the handlers will attempt the final action (reboot or
> > power off).
> Could you please show a code snippet that implements your suggestion?

A rough idea is this:

 static int notifier_call_chain(struct notifier_block **nl,
 			       unsigned long val, void *v,
 			       int nr_to_call, int *nr_calls)
 {
-	int ret = NOTIFY_DONE;
+	int ret, result = NOTIFY_DONE;
 	struct notifier_block *nb, *next_nb;
 
 	nb = rcu_dereference_raw(*nl);
 
 	while (nb && nr_to_call) {
...
 		ret = nb->notifier_call(nb, val, v);
+
+		/* Assuming NOTIFY_STOP-carrying return is always greater than non-stopping one. */
+		if (result < ret)
+			result = ret;
... 
 	}
-	return ret;
+	return result;
 }

Then:

bool prepare_reboot()
{
	int ret = xx_notifier_call_chain(&shutdown_notifier, PREPARE_REBOOT, ...);
	return ret == NOTIFY_OK;
}

And the return value would signify whether the reboot will be attempted
when calling the chain for the REBOOT action. (Analogously for powering off.)

Best Regards
Michał Mirosław
