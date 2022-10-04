Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DAA5F4214
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 13:38:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhbLV72nZz3f1v
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 22:38:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DQ7AqshQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DQ7AqshQ;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhZnZ2jVjz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:13:22 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id x32-20020a17090a38a300b00209dced49cfso10271089pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UHE2x7YnT+avJBdJRK8fICu4tqbTB0zv1A8Jd5IOhrw=;
        b=DQ7AqshQw7pAlndMjmyEf3HDNlexUBF+jB73J+4SoV4OjFHAeL9d93Pkb0EJq27wmV
         fMsaB2Ugk2jANVVFsgCVCwsCPcqfEpNwL8Phil7GBZGqFbBPLY20X/vyyyMA3GQqxwqr
         9GitSfUr/lUWnkoEFyKfW1UEPWDsM/lhvI/GgsbbZeTjM/BKXmE2CDDRkoVqqPha6oPu
         qT7JzbFbc8JYxA1Hnfg8ebCiWushyc4cczI9HWkbShP/pG31SGJukNeZLdU4X/4Dr/J1
         nBm7WS/ywrZAsUI2kefDBEEPXrA2HSCWcStoD/F24lMd+RQ2O+RyHYdGsKRKL5ywBm+U
         IhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UHE2x7YnT+avJBdJRK8fICu4tqbTB0zv1A8Jd5IOhrw=;
        b=nQUSWIMt8IIbah3wpWZLCQ+B1e+Im23d2wZ6MIMu2Ov8byLpyaEDPgyG38ZEq8K4LE
         45XI0nRB5A8gkpv/4h1gmo7TJRNDITQx85n0jvcyEJacofXW4TPGK/91vV8Bi0ZHPVhS
         wd3E40if/jLlsaX1ipK7tYYbLnHd8YQinOtJbOieACMD32KcuALW6vDweAWSBfsZ4/jG
         Yqcb8s3oVV8I2Dd+P090JXlVb993sdRHNx+ZllhuLBh1vDQYvr7F20tUj81UylRGVsHg
         OuXvdxNqEz1IetEvFSbPbEyROX0WQ9E0pG7JnN+UGl6CS2qEUsjmdtOVr5V4bfdEOA6y
         qxXw==
X-Gm-Message-State: ACrzQf3Clzd2l8zBXOkdjXxWADypSLdVO3GtOMxLqL9Db4NdMbO+HATm
	5wxTTsuX5rjBct84HhopOeZcQHJMolpd0uMDv36N2Q==
X-Google-Smtp-Source: AMsMyM7BhQDEzGuMq6uijGe+375QPbx+j/BjXkPK0/Xp2Q5WyeWrXvzrh6ljkVul43PLHCDTtENmDZivDluO/kqNLsY=
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr17237644pjb.164.1664881999182; Tue, 04
 Oct 2022 04:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101522.908560022@infradead.org>
In-Reply-To: <20220919101522.908560022@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Oct 2022 13:12:42 +0200
Message-ID: <CAPDyKFqDiqXSi5Gn9eyvhHhqHxJAPAt-HzmEDwYWaGvso2yn=w@mail.gmail.com>
Subject: Re: [PATCH v2 38/44] cpuidle,powerdomain: Remove trace_.*_rcuidle()
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 04 Oct 2022 22:33:53 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, linux-clk@vger.kernel.org, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, linux-sh@vger.kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, lpieralisi@kernel.org, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, kernel@pengutronix.de, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel
 .com, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, jolsa@kernel.org, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, chenhuacai@kernel.org, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, mturquette@baylibre.com, paul.walmsley@sifive.com, linux@rasmusvillemoes.dk, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, tony@atomide.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.
 pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, anup@brainfault.org, ryabinin.a.a@gmail.com, linux-alpha@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, pv-drivers@vmware.com, hpa@zytor.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, amakhalov@vmware.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, agross@kernel.org, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, atishp@atishpatra.org, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyu
 kov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, linux-hexagon@vger.kernel.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Sept 2022 at 12:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> OMAP was the one and only user.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

There are changes to the runtime PM core as part of $subject patch.
Perhaps move those parts into a separate patch? In any case, the code
looks good to me.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  arch/arm/mach-omap2/powerdomain.c |   10 +++++-----
>  drivers/base/power/runtime.c      |   24 ++++++++++++------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> --- a/arch/arm/mach-omap2/powerdomain.c
> +++ b/arch/arm/mach-omap2/powerdomain.c
> @@ -187,9 +187,9 @@ static int _pwrdm_state_switch(struct po
>                         trace_state = (PWRDM_TRACE_STATES_FLAG |
>                                        ((next & OMAP_POWERSTATE_MASK) << 8) |
>                                        ((prev & OMAP_POWERSTATE_MASK) << 0));
> -                       trace_power_domain_target_rcuidle(pwrdm->name,
> -                                                         trace_state,
> -                                                         raw_smp_processor_id());
> +                       trace_power_domain_target(pwrdm->name,
> +                                                 trace_state,
> +                                                 raw_smp_processor_id());
>                 }
>                 break;
>         default:
> @@ -541,8 +541,8 @@ int pwrdm_set_next_pwrst(struct powerdom
>
>         if (arch_pwrdm && arch_pwrdm->pwrdm_set_next_pwrst) {
>                 /* Trace the pwrdm desired target state */
> -               trace_power_domain_target_rcuidle(pwrdm->name, pwrst,
> -                                                 raw_smp_processor_id());
> +               trace_power_domain_target(pwrdm->name, pwrst,
> +                                         raw_smp_processor_id());
>                 /* Program the pwrdm desired target state */
>                 ret = arch_pwrdm->pwrdm_set_next_pwrst(pwrdm, pwrst);
>         }
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -442,7 +442,7 @@ static int rpm_idle(struct device *dev,
>         int (*callback)(struct device *);
>         int retval;
>
> -       trace_rpm_idle_rcuidle(dev, rpmflags);
> +       trace_rpm_idle(dev, rpmflags);
>         retval = rpm_check_suspend_allowed(dev);
>         if (retval < 0)
>                 ;       /* Conditions are wrong. */
> @@ -481,7 +481,7 @@ static int rpm_idle(struct device *dev,
>                         dev->power.request_pending = true;
>                         queue_work(pm_wq, &dev->power.work);
>                 }
> -               trace_rpm_return_int_rcuidle(dev, _THIS_IP_, 0);
> +               trace_rpm_return_int(dev, _THIS_IP_, 0);
>                 return 0;
>         }
>
> @@ -493,7 +493,7 @@ static int rpm_idle(struct device *dev,
>         wake_up_all(&dev->power.wait_queue);
>
>   out:
> -       trace_rpm_return_int_rcuidle(dev, _THIS_IP_, retval);
> +       trace_rpm_return_int(dev, _THIS_IP_, retval);
>         return retval ? retval : rpm_suspend(dev, rpmflags | RPM_AUTO);
>  }
>
> @@ -557,7 +557,7 @@ static int rpm_suspend(struct device *de
>         struct device *parent = NULL;
>         int retval;
>
> -       trace_rpm_suspend_rcuidle(dev, rpmflags);
> +       trace_rpm_suspend(dev, rpmflags);
>
>   repeat:
>         retval = rpm_check_suspend_allowed(dev);
> @@ -708,7 +708,7 @@ static int rpm_suspend(struct device *de
>         }
>
>   out:
> -       trace_rpm_return_int_rcuidle(dev, _THIS_IP_, retval);
> +       trace_rpm_return_int(dev, _THIS_IP_, retval);
>
>         return retval;
>
> @@ -760,7 +760,7 @@ static int rpm_resume(struct device *dev
>         struct device *parent = NULL;
>         int retval = 0;
>
> -       trace_rpm_resume_rcuidle(dev, rpmflags);
> +       trace_rpm_resume(dev, rpmflags);
>
>   repeat:
>         if (dev->power.runtime_error) {
> @@ -925,7 +925,7 @@ static int rpm_resume(struct device *dev
>                 spin_lock_irq(&dev->power.lock);
>         }
>
> -       trace_rpm_return_int_rcuidle(dev, _THIS_IP_, retval);
> +       trace_rpm_return_int(dev, _THIS_IP_, retval);
>
>         return retval;
>  }
> @@ -1081,7 +1081,7 @@ int __pm_runtime_idle(struct device *dev
>                 if (retval < 0) {
>                         return retval;
>                 } else if (retval > 0) {
> -                       trace_rpm_usage_rcuidle(dev, rpmflags);
> +                       trace_rpm_usage(dev, rpmflags);
>                         return 0;
>                 }
>         }
> @@ -1119,7 +1119,7 @@ int __pm_runtime_suspend(struct device *
>                 if (retval < 0) {
>                         return retval;
>                 } else if (retval > 0) {
> -                       trace_rpm_usage_rcuidle(dev, rpmflags);
> +                       trace_rpm_usage(dev, rpmflags);
>                         return 0;
>                 }
>         }
> @@ -1202,7 +1202,7 @@ int pm_runtime_get_if_active(struct devi
>         } else {
>                 retval = atomic_inc_not_zero(&dev->power.usage_count);
>         }
> -       trace_rpm_usage_rcuidle(dev, 0);
> +       trace_rpm_usage(dev, 0);
>         spin_unlock_irqrestore(&dev->power.lock, flags);
>
>         return retval;
> @@ -1566,7 +1566,7 @@ void pm_runtime_allow(struct device *dev
>         if (ret == 0)
>                 rpm_idle(dev, RPM_AUTO | RPM_ASYNC);
>         else if (ret > 0)
> -               trace_rpm_usage_rcuidle(dev, RPM_AUTO | RPM_ASYNC);
> +               trace_rpm_usage(dev, RPM_AUTO | RPM_ASYNC);
>
>   out:
>         spin_unlock_irq(&dev->power.lock);
> @@ -1635,7 +1635,7 @@ static void update_autosuspend(struct de
>                         atomic_inc(&dev->power.usage_count);
>                         rpm_resume(dev, 0);
>                 } else {
> -                       trace_rpm_usage_rcuidle(dev, 0);
> +                       trace_rpm_usage(dev, 0);
>                 }
>         }
>
>
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
