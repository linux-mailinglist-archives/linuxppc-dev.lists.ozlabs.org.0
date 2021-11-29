Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A29D460C21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 02:18:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2SD31C09z3cYF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:18:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=CbL6Dkr0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=CbL6Dkr0; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2R4L5Y9Mz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 11:26:58 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2R463HYCz9Y;
 Mon, 29 Nov 2021 01:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638145614; bh=rYhG1/gOEGdeEm/s8Gt8rEBk1iF8QMIsgq7S9tytKm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CbL6Dkr0hp6+eWfnOkswWvW2NOKJ79Uh6/l2ZCnK5kWTiOO50iqx187Rg4dryYZZY
 bxYRz4m9fgWtZVh11lmgMaMMzocpKUJUWIlke/44DEMmzJJm4vDOSxFAyf1Gq25nhd
 1THlT17c8aj7yKXukSvNxOS2rqgVH1j/XRMa1p7Hswrcs4jJdmmxtpOwmRnm9PweUg
 dgln8/6i94ET+XVFAx+2l6pzk4WNbL+PWxg255szxizJhOsvQ3eK1ntEQbcIyPN3HU
 KJwCs9dJC+yqQftWDNSkBS/r4FvpiW2ousq8It65okWyLREqQTSJR+N2Sf4mDmjtBp
 iZvEDATRHwtcA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 01:26:42 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
Message-ID: <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
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

On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
> 28.11.2021 03:28, Michał Mirosław пишет:
> > On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
> >> Add sanity check which ensures that there are no two restart handlers
> >> registered with the same priority. Normally it's a direct sign of a
> >> problem if two handlers use the same priority.
> > 
> > The patch doesn't ensure the property that there are no duplicated-priority
> > entries on the chain.
> 
> It's not the exact point of this patch.
> 
> > I'd rather see a atomic_notifier_chain_register_unique() that returns
> > -EBUSY or something istead of adding an entry with duplicate priority.
> > That way it would need only one list traversal unless you want to
> > register the duplicate anyway (then you would call the older
> > atomic_notifier_chain_register() after reporting the error).
> 
> The point of this patch is to warn developers about the problem that
> needs to be fixed. We already have such troubling drivers in mainline.
> 
> It's not critical to register different handlers with a duplicated
> priorities, but such cases really need to be corrected. We shouldn't
> break users' machines during transition to the new API, meanwhile
> developers should take action of fixing theirs drivers.
> 
> > (Or you could return > 0 when a duplicate is registered in
> > atomic_notifier_chain_register() if the callers are prepared
> > for that. I don't really like this way, though.)
> 
> I had a similar thought at some point before and decided that I'm not in
> favor of this approach. It's nicer to have a dedicated function that
> verifies the uniqueness, IMO.

I don't like the part that it traverses the list second time to check
the uniqueness. But actually you could avoid that if
notifier_chain_register() would always add equal-priority entries in
reverse order:

 static int notifier_chain_register(struct notifier_block **nl,
 		struct notifier_block *n)
 {
 	while ((*nl) != NULL) {
 		if (unlikely((*nl) == n)) {
 			WARN(1, "double register detected");
 			return 0;
 		}
-		if (n->priority > (*nl)->priority)
+		if (n->priority >= (*nl)->priority)
 			break;
 		nl = &((*nl)->next);
 	}
 	n->next = *nl;
 	rcu_assign_pointer(*nl, n);
 	return 0;
 }

Then the check for uniqueness after adding would be:

 WARN(nb->next && nb->priority == nb->next->priority);

Best Regards
Michał Mirosław
