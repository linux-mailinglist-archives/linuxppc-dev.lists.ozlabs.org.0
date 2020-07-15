Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A36502209A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 12:15:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Ctj58yKzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 20:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qlR93dSP; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6Cs63fQbzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 20:13:43 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id z13so1901200wrw.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Hn1Hbjff+9Afv2Xeip4oNSq9d24avIQDuzU6faxXekA=;
 b=qlR93dSPHSbqYU0Gl7DzP6gPZu10L3MypqxPjXRCd3zNlT8TlEC6m6Emrl5IBiFU1J
 DvS9LgkqWmXclVuVF7eg4Y3VJ/BFPwhIter84emkwYWrXg6eJKmAdTWpVOL02taH6M/s
 ws/vvSueQ8jw/viS+72dcaQPaxdYvi1GENdrZOfWMvPnL/0MCDx4q/mMSqFOp8QQHArp
 aZ2U5T4imohTHyYFz2Mc4/+JJEMmkH+o4DpX2yqPmu/O4oVsIWtL7T48dk1uGKNwpRgE
 CE5pZsKIyFkaJok/rludtGQVXlsS062uymdMtf9BELZ5hXh15NssRLqmPXbWGpr0sbBk
 L1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Hn1Hbjff+9Afv2Xeip4oNSq9d24avIQDuzU6faxXekA=;
 b=mW1mObCDN2T85NsyvxrawkzlgDENT5930tj2vj0LP80qhY7GBW8zPWFiwauoE9uxQH
 nqUwkljnF7PxiV4+LljV9KgxQAfnoGCgCL4AfA94G5rY6gMRd+lFDShL71N1KD+4viGi
 Jwu/ZaIF6qX9TsC1raBnjrKtPp59Krjh6xe9GLXx/pg/WOdIfzTXHFhkAE+2Qj036DnN
 3frkQCYitrdBl5PCx8QXiAXagRgvtNaqnwWv+5Fl+YbnQLQ5ZhhB4j5YMNbP8wW2jyKp
 XgC43c4FHvJczd3Pc2tfdlSDi2E6SDNKhZNAkO4hCN+aAReJkAtHJpSbNVxWTpxU+yWA
 XK1g==
X-Gm-Message-State: AOAM531tdX1T0jcYuNaY5OOmUF6Ie4BGTS4xC2d8M1OUODMYLZleNfZi
 5coDFzwKPqTTzVjYdMFhAxDDHw==
X-Google-Smtp-Source: ABdhPJz1sof9nbSox7QA78MbtsQxOffGJyaBrE6z+a2qbZEL+1W2WAWsKdYybzfKFDfNwDKsEZNt6w==
X-Received: by 2002:a5d:60c7:: with SMTP id x7mr9987696wrt.138.1594808020835; 
 Wed, 15 Jul 2020 03:13:40 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id 68sm2712443wmz.40.2020.07.15.03.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 03:13:40 -0700 (PDT)
Date: Wed, 15 Jul 2020 11:13:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 06/13] cpufreq: powernv-cpufreq: Functions only used
 in call-backs should be static
Message-ID: <20200715101338.GA3165313@dell>
References: <20200715082634.3024816-1-lee.jones@linaro.org>
 <20200715082634.3024816-7-lee.jones@linaro.org>
 <20200715094504.val6rb7wibysh7dn@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715094504.val6rb7wibysh7dn@vireshk-i7>
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
Cc: linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020, Viresh Kumar wrote:

> On 15-07-20, 09:26, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/cpufreq/powernv-cpufreq.c:669:6: warning: no previous prototype for ‘gpstate_timer_handler’ [-Wmissing-prototypes]
> >  drivers/cpufreq/powernv-cpufreq.c:902:6: warning: no previous prototype for ‘powernv_cpufreq_work_fn’ [-Wmissing-prototypes]
> > 
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  drivers/cpufreq/powernv-cpufreq.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> > index 8646eb197cd96..068cc53abe320 100644
> > --- a/drivers/cpufreq/powernv-cpufreq.c
> > +++ b/drivers/cpufreq/powernv-cpufreq.c
> > @@ -666,7 +666,7 @@ static inline void  queue_gpstate_timer(struct global_pstate_info *gpstates)
> >   * according quadratic equation. Queues a new timer if it is still not equal
> >   * to local pstate
> >   */
> > -void gpstate_timer_handler(struct timer_list *t)
> > +static void gpstate_timer_handler(struct timer_list *t)
> >  {
> >  	struct global_pstate_info *gpstates = from_timer(gpstates, t, timer);
> >  	struct cpufreq_policy *policy = gpstates->policy;
> > @@ -899,7 +899,7 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
> >  	.notifier_call = powernv_cpufreq_reboot_notifier,
> >  };
> >  
> > -void powernv_cpufreq_work_fn(struct work_struct *work)
> > +static void powernv_cpufreq_work_fn(struct work_struct *work)
> >  {
> >  	struct chip *chip = container_of(work, struct chip, throttle);
> >  	struct cpufreq_policy *policy;
> 
> Don't you want to drop this patch now ? As you already reviewed the
> other one on the list ?

Yes, please drop/ignore.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
