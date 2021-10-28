Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3743DC65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:52:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfySr6pxGz2yNG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 18:52:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=FXhe5yXx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=FXhe5yXx; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfwv34Yzlz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 17:41:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635403130;
 bh=9epiwmWdzTgZY2j4GBWRs9N0QEWknADgKRkQPvp+Ggo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FXhe5yXxylYP540/EC+4AzkmLOP3fNSEmO39fyo/3NOlbWcEm0ryYTd7J3Iv20szB
 cWKWEC4dZ521NZJ4gyIpkKod8spMS5RmsFlBvqxTT96Vwc/S6HyYHyyyo0FoSjpetw
 nwPjJnU+hcraQ+NzVcLrxZf8To+aYZc5aH/99quU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.46]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1mfR6019Wc-000dpr; Thu, 28
 Oct 2021 08:38:50 +0200
Message-ID: <6470d500-a832-9e1f-e3b9-4d3972b3996e@gmx.de>
Date: Thu, 28 Oct 2021 08:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 16/45] parisc: Use do_kernel_power_off()
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-17-digetx@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20211027211715.12671-17-digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FyRzIrUgBb05q0bHWFRS/zQ/jjhGXy+pktz0g9vMu8rSAyG2PhH
 igLh0yuSJkfQClwGAYYVp96vDjlam7EqP3CW0lWkZ155s/JTRG7aXysFtzh8fsHm3d7JOnd
 U2wPiCoWHArr/c1zeopIGDkaYwvec8wHmOgMEvIr7aPgxK9GcFiXcIhkSKruN1bnrxyn2QX
 umWMtuIv0Xa3Bg/ofbf6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nt03nam4XH8=:N7PuLhTcs13ezPdb4QL3P5
 EAsOC32SEC/CwoA2+8DjNnTsILfn+sFrb9LZytvE/YP2J2Aj7Qx7fkEO40fY8T8rIBLGw9GX+
 NIsaN0+sjNJKdkOQlJE/AFyfJG+vQ7ahzCRk2HMLrf3z5M6K/b0L71tddrkVIJCMb7IuCUzph
 ykgDP6aZxfqVXIMaikKg097ePHHG0x47b/94G1+2NvXBe71nBfFTfm04TrvRNne2czLnMB+Lg
 v+wFHtJZ2jQ9cLfCu2fzZQuGkclVf14XlYnoDKMRVnVFWWYf0adoOjwfKSRtptB20/q31drw2
 HePgYF8sylMcfQbim3Wp4ygBdzf5/6i3x4H4dnB1q/EhvkJY/KiaZgrjHxrJkHNauXcVxsg6y
 3vvk7psmlYjcJLo6ddOdIBc9OIQs133Ce1iU2wSod2qhYwBPSJppgIk8kJCYKzZxAzsnModUK
 BgEImgsOUGiDlYZe9Muppxy4TrQaqVmfjaM9kmqq8Gvz9GaOjVqBYmFsm570hW8BuF9BI+r+S
 0GJuN3cdiVBY0G0MhcxnoHe4O22baIwcBDk2FnckJriXO5mZE3hJQVTcEKeAb2ybK5KNuVVY6
 nww/BdElXnSWt1HhtpoHRHlgigO4KvVdiDhtBi8tFoyeYg8pvvK9qgrlLqCEJsbs8TBaWRdRr
 7fvMB1yoKM8dWEL+Z/gHindYZd433ys7huBzX1XyE7cCnO+L/FE5ZfETDY8DSBwlBCCD940Ri
 wkqaYntrDtmIkWD9BWTD4j7K3fgZUU7IPEaJZjdl5xWo8e268I+GMSTVMrUSVDmQzI7cEG+Lb
 i0qZzTuZiztLiwLZgXQVnYgopvNIgyfo6LMbZ9e4NuBR0ff+vu+fsAwWJH4T3BJlzoZYXX193
 PLDnh+2eGZNNZJ83DOYN1ApcqeJpwMwKyPuCFuf/SxuBIQ7A6oWrcCikiPFJaPxKlXhX5RTg8
 v7QQ4c9ImeWqMCb0i29R5vmks8Ui9IG2X5j/SIZwSpXutCAWE2F/LMHO+pOK/jVtTRVpgu0WW
 MapTUMEB41Z0LdVwL6aYL1P3sWB52Pfffr4C3r7aA/3cWiJWf1QCoiwOmHCTExfYhCTFuQCe5
 +ZRYgxUKbSq514=
X-Mailman-Approved-At: Thu, 28 Oct 2021 18:51:39 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-sh@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-acpi@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 openbmc@lists.ozlabs.org, x86@kernel.org, linux-csky@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/21 23:16, Dmitry Osipenko wrote:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off(=
)
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Helge Deller <deller@gmx.de> # parisc



> ---
>  arch/parisc/kernel/process.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> index ea3d83b6fb62..928201b1f58f 100644
> --- a/arch/parisc/kernel/process.c
> +++ b/arch/parisc/kernel/process.c
> @@ -26,6 +26,7 @@
>  #include <linux/module.h>
>  #include <linux/personality.h>
>  #include <linux/ptrace.h>
> +#include <linux/reboot.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task.h>
> @@ -114,8 +115,7 @@ void machine_power_off(void)
>  	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
>
>  	/* ipmi_poweroff may have been installed. */
> -	if (pm_power_off)
> -		pm_power_off();
> +	do_kernel_power_off();
>
>  	/* It seems we have no way to power the system off via
>  	 * software. The user has to press the button himself. */
>

