Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FD5FD87C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 13:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp6wX12tMz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 22:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=hSkbNoXo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=hSkbNoXo;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnXNh1gvRz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 23:42:26 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id q9so33178021ejd.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=scSSoPVjvPcIKMwAKdcIxF1HMnXwBEuvlyuD0JbeDac=;
        b=hSkbNoXoG3wWcVdKnqVO7XYK1bv0MH9u8oEv95OaWkkCTB9RsoNg9sS+DyfAXD0gi8
         C3B5RxdZ6EF3FePvqnrCKkr5w8XgiGA0OEB2iK+NsGb9ZOHdvUgBAY5mEupVk514sXh2
         BcfULR6zZ2AZhQJP/B28JemyEcyeDcI3AKRJ5lPKFWuGde9NbfJyX15rLE2gsyDez6YX
         OKDkOurVilre1ybmB6wqSmbSEpcfuh+ukasYa8QPIj2WOxaDkWQTz+Nri8qre79tIxTd
         1cFDVYDQytan/tbkNZZVN4NNSOJbGSrVUq2mGHauT+3m9QGeWYsm/jufVV+rUDLqTO07
         hCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scSSoPVjvPcIKMwAKdcIxF1HMnXwBEuvlyuD0JbeDac=;
        b=InHSR9XZZ6lzXx4QUiY1wvlsTz4ypaC5kvZbouv0f3MOgS+tVsZFioOhbeIIBU9OFn
         N47Y+oGkM0ohfxw++ymytxtqSpxa73szhmIXM4jQ3lDGHGIdbN6o1utZRMsCSrDbnSrG
         4aBsHGOzILWILFJJGb4f3A4xG9YIrwncTtsf3mZf9PKcBG1ihWsoiPv5BelMdMBte+We
         GEFu5zdfPtsHrUD/5nrfR44mocBWOQ/6i26HCi49RMwRRjUYTuUR/+LL3ASl/pLKKQSz
         /Oc/N2TVG7B7E6tHmraH7QJN4dBWE8CgV88Y5NVnEP2Hxz1W9Mn2mYAUnCDuTtQ86X0Q
         zGnw==
X-Gm-Message-State: ACrzQf0XeadRrjESIpntRLtrR6cUR2OI6dbO1sv7vyZxmWxX9EDPeyJq
	WNX2EQ9gyecjqGMqNumWbroQ+A==
X-Google-Smtp-Source: AMsMyM5pMRTzBK4wxOaeWPxAICeTFfKr9UUi5U35RJKBVu1VmBh/W7bpRQUc+vTTEtwGS2qmCt2lPQ==
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id ia11-20020a170907a06b00b0078dd25fb726mr7250759ejc.203.1665578537183;
        Wed, 12 Oct 2022 05:42:17 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id w21-20020aa7da55000000b0044e01e2533asm11133463eds.43.2022.10.12.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 05:42:16 -0700 (PDT)
Date: Wed, 12 Oct 2022 14:42:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221012124215.edmgo6767yipfkt2@kamzik>
References: <20221012081905.1800640-1-ajones@ventanamicro.com>
 <20221012082422.uavybxdfmv4xkhxi@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012082422.uavybxdfmv4xkhxi@kamzik>
X-Mailman-Approved-At: Thu, 13 Oct 2022 22:37:49 +1100
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Adding more people and lists to CC in order to point this patch out,
because, based on a quick grep of cpuinfo seq operations, I think at least
openrisc, powerpc, and s390 also need an equivalent patch (and I've
already sent a patch for riscv). While the test is simple (see next
paragraph) I'm not equipped to test on each architecture.

To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to a
shell, do 'cat /proc/cpuinfo', and look for a kernel warning.

Thanks,
drew

On Wed, Oct 12, 2022 at 10:24:22AM +0200, Andrew Jones wrote:
> On Wed, Oct 12, 2022 at 10:19:05AM +0200, Andrew Jones wrote:
> > Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> > started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> > are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> > start and next seq operations implement a pattern like
> > 
> >   n = cpumask_next(n - 1, mask);
> >   show(n);
> >   while (1) {
> >       ++n;
> >       n = cpumask_next(n - 1, mask);
> >       if (n >= nr_cpu_ids)
> >           break;
> >       show(n);
> >   }
> > 
> > which will issue the warning when reading /proc/cpuinfo. Ensure no
> > warning is generated by validating the cpu index before calling
> > cpumask_next().
> > 
> > [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Cc: Yury Norov <yury.norov@gmail.com>
> > ---
> 
> Forgot the changelog...
> 
> v2:
>   - Added all the information I should have in the first place to the
>     commit message [Boris]
>   - Changed style of fix [Boris]
> 
> >  arch/x86/kernel/cpu/proc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> > index 099b6f0d96bd..94ac02c8dd6f 100644
> > --- a/arch/x86/kernel/cpu/proc.c
> > +++ b/arch/x86/kernel/cpu/proc.c
> > @@ -153,6 +153,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
> >  
> >  static void *c_start(struct seq_file *m, loff_t *pos)
> >  {
> > +	if (*pos >= nr_cpu_ids)
> > +		return NULL;
> > +
> >  	*pos = cpumask_next(*pos - 1, cpu_online_mask);
> >  	if ((*pos) < nr_cpu_ids)
> >  		return &cpu_data(*pos);
> > -- 
> > 2.37.3
> > 
