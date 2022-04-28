Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C331D513FAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 02:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqDJQ4yXDz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 10:44:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=hdozdwCB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=hdozdwCB; 
 dkim-atps=neutral
X-Greylist: delayed 379 seconds by postgrey-1.36 at boromir;
 Fri, 29 Apr 2022 03:04:23 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq25z62W5z2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 03:04:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651165455;
 bh=DUb16bHT8ZVVcSBzzE8lnieko2RHZpG2zbwsEWdWo2c=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=hdozdwCBiGda9iEWWd7i2zbCiCD2+OZDN/5MSLFjodcDGoNKiUnU8nsDicBSunNoC
 220VNl8P1fyNiuxwMPJV6wYLNfHSsmlec6KYmLQBxuhaTxaoNhr065rUMSa8nU5QNK
 GVF+ZpcjFICmecje2oqBlhJY5d6G5c1VuLGWirCE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.133.159]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzyuS-1o6TNU3b1S-00x2R3; Thu, 28
 Apr 2022 18:56:03 +0200
Message-ID: <6a7c924a-54a9-c5ea-8a9d-3ea92987b436@gmx.de>
Date: Thu, 28 Apr 2022 18:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 12/30] parisc: Replace regular spinlock with spin_trylock
 on panic path
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-13-gpiccoli@igalia.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220427224924.592546-13-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5vdTXh07+igNuefls5XBW8Vnc+iEgtAi7WYk6EGDKuqY95FwGMe
 QwcWZKzUaEoh4UB+55vjZve/tYEaItgGsgQfOqHuHHkvtwYyxsf6YShgZsftQKYSmO6WQ+T
 ZC1GiQE33MbntUGomNddrKZxDF5sJxGJRqGlvPVNWYXBnGaRnQV/WvjdEKXY9QfAk5iDfpf
 2SF7pYcym4psStLDUUMNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qzrGhMxFzGs=:57gvbsSdjqK0BKwhySM2AX
 eDjYdElNhIgh5EeHfw41DRuAkgCJ5L91JkRA+XjybEpqAmIDb+gHdu1+Nq3C6sWdkCaxCRHXj
 l9aANGtBwxwcvwMV/UNeSndlMLohll1VzMxdjfNwrF4yjnJPZeDad3yBgarZ7UaSWoX4y9Bj6
 ywquLj+t2nFiXe+zIYfojV+1nerWeSdhfxWmDHB43039AUSg99ihgOFN1YCmEN8b7crOm8Km5
 zZ76av1lAhyV8742+hijZkWNFAMplqbTBgT8c+URAS8+kthDnd4hODIVxIQA2pKNeewnC2iKS
 CDIkDfil1WH1QJcgi7FIhtZUTRwG5zC+ZvdJtL242RMI9eeFvr4GHn5iTLMSn+D4hIyM/99uO
 9c2g1T8qp09BZnZHnChKfoHWmKZPqI5AvfTuVyUc/jGVSayDwdebo4JVihyUgGY1jIIXGmeCd
 f3ajRR4Dm78ND3fA4xUFBgKi3JBjSFLGmICaZ+5zJUx4Kv8Tv599hUPH88cfEswtg/ihOj7tI
 6xri3wkV0dkKn7sA+MOyPZvMbwQfr8hj4XgiUV0MfPez+CU9ADXm5vAF42/4R4rX87wK4pCKA
 11NgRpdT2V4KWvh+56eOzUzWn2EFSU1tm9eLdRyxxdPu2m3TK9xa7fLU6yh/Bq+/GhgKCFx0S
 lQRF7Zd2PY3i95ZHPtg2GhnpEJsa9/TXMBuRS/xRkwMHACbryFc4QKE2C+YAWXtQomBnVrWpp
 Pl5tJOYMVUFSnbtof7zMIy1+eerT7xJjyYjf48N6ugK/Zxb5F0hq1cBCBvUr/Fa4rh0PeszGY
 B4/4yQL9g0KsN7sVk7m4nvltcg9ev4OLGnW01H+QJOm/yPfYATuTHtF66GEC96Yzy4EEiXMLV
 Fcr8k58Lr7GjUyuyQvSKKXBg5fyBrdFALHvGr0D+VJCT5y6fBbgYOpA4gpkHzI6hkMXcdq6Zj
 TcoIICKwqfO3iFfin3vZhyquQ7cwptBSigBYJFRouC+4DohSIVD2mN39O5MlkozKUd9nHK/y6
 p6E++3u2gz8TVFlxvtIry1pQet8BLRtvR09M9PMmuy/cJ1o6ItvGcmRsfWESGb2LO2dnL9vDD
 pWFt2IdiGh37ycBLIxDUdPj9ApH7gEXDmj29BBbT75FzxFCXt4Gf9ucULvBTUFUmzRmBrJrvL
 ZS1DyFAjTPzBluwK9H9jaOPUK2JJ/AHFe0sHZfP7rdwe7iU0p4KM9ycmSiHaDUGUKObdoHjuV
 5SCUoOsylXH5fnNXjjP+vUqI26TW18y1/TZ1AJg==
X-Mailman-Approved-At: Fri, 29 Apr 2022 10:42:18 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 mikelley@microsoft.com, john.ogness@linutronix.de, corbet@lwn.net,
 paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 kernel@gpiccoli.net, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/28/22 00:49, Guilherme G. Piccoli wrote:
> The panic notifiers' callbacks execute in an atomic context, with
> interrupts/preemption disabled, and all CPUs not running the panic
> function are off, so it's very dangerous to wait on a regular
> spinlock, there's a risk of deadlock.
>
> This patch refactors the panic notifier of parisc/power driver
> to make use of spin_trylock - for that, we've added a second
> version of the soft-power function. Also, some comments were
> reorganized and trailing white spaces, useless header inclusion
> and blank lines were removed.
>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

You may add:
Acked-by: Helge Deller <deller@gmx.de> # parisc

Helge


> ---
>  arch/parisc/include/asm/pdc.h |  1 +
>  arch/parisc/kernel/firmware.c | 27 +++++++++++++++++++++++----
>  drivers/parisc/power.c        | 17 ++++++++++-------
>  3 files changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc=
.h
> index b643092d4b98..7a106008e258 100644
> --- a/arch/parisc/include/asm/pdc.h
> +++ b/arch/parisc/include/asm/pdc.h
> @@ -83,6 +83,7 @@ int pdc_do_firm_test_reset(unsigned long ftc_bitmap);
>  int pdc_do_reset(void);
>  int pdc_soft_power_info(unsigned long *power_reg);
>  int pdc_soft_power_button(int sw_control);
> +int pdc_soft_power_button_panic(int sw_control);
>  void pdc_io_reset(void);
>  void pdc_io_reset_devices(void);
>  int pdc_iodc_getc(void);
> diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware=
.c
> index 6a7e315bcc2e..0e2f70b592f4 100644
> --- a/arch/parisc/kernel/firmware.c
> +++ b/arch/parisc/kernel/firmware.c
> @@ -1232,15 +1232,18 @@ int __init pdc_soft_power_info(unsigned long *po=
wer_reg)
>  }
>
>  /*
> - * pdc_soft_power_button - Control the soft power button behaviour
> - * @sw_control: 0 for hardware control, 1 for software control
> + * pdc_soft_power_button{_panic} - Control the soft power button behavi=
our
> + * @sw_control: 0 for hardware control, 1 for software control
>   *
>   *
>   * This PDC function places the soft power button under software or
>   * hardware control.
> - * Under software control the OS may control to when to allow to shut
> - * down the system. Under hardware control pressing the power button
> + * Under software control the OS may control to when to allow to shut
> + * down the system. Under hardware control pressing the power button
>   * powers off the system immediately.
> + *
> + * The _panic version relies in spin_trylock to prevent deadlock
> + * on panic path.
>   */
>  int pdc_soft_power_button(int sw_control)
>  {
> @@ -1254,6 +1257,22 @@ int pdc_soft_power_button(int sw_control)
>  	return retval;
>  }
>
> +int pdc_soft_power_button_panic(int sw_control)
> +{
> +	int retval;
> +	unsigned long flags;
> +
> +	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
> +		pr_emerg("Couldn't enable soft power button\n");
> +		return -EBUSY; /* ignored by the panic notifier */
> +	}
> +
> +	retval =3D mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pd=
c_result), sw_control);
> +	spin_unlock_irqrestore(&pdc_lock, flags);
> +
> +	return retval;
> +}
> +
>  /*
>   * pdc_io_reset - Hack to avoid overlapping range registers of Bridges =
devices.
>   * Primarily a problem on T600 (which parisc-linux doesn't support) but
> diff --git a/drivers/parisc/power.c b/drivers/parisc/power.c
> index 456776bd8ee6..8512884de2cf 100644
> --- a/drivers/parisc/power.c
> +++ b/drivers/parisc/power.c
> @@ -37,7 +37,6 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> -#include <linux/notifier.h>
>  #include <linux/panic_notifier.h>
>  #include <linux/reboot.h>
>  #include <linux/sched/signal.h>
> @@ -175,16 +174,21 @@ static void powerfail_interrupt(int code, void *x)
>
>
>
> -/* parisc_panic_event() is called by the panic handler.
> - * As soon as a panic occurs, our tasklets above will not be
> - * executed any longer. This function then re-enables the
> - * soft-power switch and allows the user to switch off the system
> +/*
> + * parisc_panic_event() is called by the panic handler.
> + *
> + * As soon as a panic occurs, our tasklets above will not
> + * be executed any longer. This function then re-enables
> + * the soft-power switch and allows the user to switch off
> + * the system. We rely in pdc_soft_power_button_panic()
> + * since this version spin_trylocks (instead of regular
> + * spinlock), preventing deadlocks on panic path.
>   */
>  static int parisc_panic_event(struct notifier_block *this,
>  		unsigned long event, void *ptr)
>  {
>  	/* re-enable the soft-power switch */
> -	pdc_soft_power_button(0);
> +	pdc_soft_power_button_panic(0);
>  	return NOTIFY_DONE;
>  }
>
> @@ -193,7 +197,6 @@ static struct notifier_block parisc_panic_block =3D =
{
>  	.priority	=3D INT_MAX,
>  };
>
> -
>  static int __init power_init(void)
>  {
>  	unsigned long ret;

