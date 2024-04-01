Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70367894176
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 18:42:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j1i7juaL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7cHy1VnNz3dW8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 03:42:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j1i7juaL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7cHB4kw8z3bs2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 03:41:57 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-698d68337a8so21051546d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Apr 2024 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711989714; x=1712594514; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm96Do3HD9Ni1RnQFtInuSgt43w6ZXYVK1hdTCMkucA=;
        b=j1i7juaL88YyXLFEQPBSoHPCPBEF8D570kfvQPY+UWYHhqLZK/40TeVSWFSD4dqufc
         ZWmYKSt22nfT62UkPzsq9ISI3SM/Yare7l814kJQlwA/6duNTlyt+zsSnfHYL5iuXyci
         9Z036A6Twcw9rW4z9Ab+F4gc737NoHOhvkE78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711989714; x=1712594514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm96Do3HD9Ni1RnQFtInuSgt43w6ZXYVK1hdTCMkucA=;
        b=AeUBDhrbfCETjI1y+23Pnag7SgXJWbRkOzYfP/SPbdDvvO/wPS0BGHx0aPB5HHZpgF
         RWaxIx78qU2gCJ1NddNVQPWc2/AtJJIZVJQvdEvcMmHKBcbs/YeijLtmPRsAlRWrBfzf
         zlSwLF8UL0xfiB0xjSGRrLwWzkbnPJwnhVJLVDIaG+xZ1nGXmOCsrB8RO5AbCzbF5EGe
         IM62hegUgdYVrfwrtEabeKQVSGjFs87sJrRPfdtpbIu82nxzC06oMZE7iyYthcaREziN
         Oe0nxQRlLySJVYkXBHnGlW6JRO0FnXTqrjq8u5sFLBAq1t3t6p+2Ew1ZfgL7Q0sQWJu5
         m8uw==
X-Forwarded-Encrypted: i=1; AJvYcCXETy1szbKO+6YmTvXgB3bKozrDc0MIa9IZaQCzvqxSjbYZabrCHMZPXt6+jg9Imai1bxXwTpLW5LFE7ZFxItljnMxtVVXsPDFVQZpq+g==
X-Gm-Message-State: AOJu0YxQYf8N/FNL2MWAJRo5SQ7NvcBTkmXg9vrOljWGq6esY6TNowyP
	31JSSiWbSq4fX0sR+/ROua4d/p4n+sHSEm0qDaAu44rLmpgqxBCgtKykNCWQQlRetpjv8GL7J8E
	=
X-Google-Smtp-Source: AGHT+IHVzfA5irYiLfFmTWjsGpDMFBxL8tSwB94tHceyLXKQY54NUicg6q2JYdjKMqotmQOp5qI+bQ==
X-Received: by 2002:ad4:4e6a:0:b0:696:3cab:bc4b with SMTP id ec10-20020ad44e6a000000b006963cabbc4bmr9714401qvb.6.1711989713788;
        Mon, 01 Apr 2024 09:41:53 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id gv5-20020a056214262500b00696b1050be8sm4660814qvb.133.2024.04.01.09.41.53
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 09:41:53 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-432d55b0fa9so498991cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Apr 2024 09:41:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUIMYNaJFG3nbDH7VshdS33vDieAcjVWKCYKZc0LEWRufGdbaXPzFsOunqMDEMutS7Hu6OTNI3wm+6DTRfnvR55eslPSOXXY+1KPWnRA==
X-Received: by 2002:a05:622a:5a89:b0:431:4e0b:d675 with SMTP id
 fz9-20020a05622a5a8900b004314e0bd675mr1027105qtb.18.1711989713017; Mon, 01
 Apr 2024 09:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-5-yaoma@linux.alibaba.com> <87zfuofzld.ffs@tglx> <6109a3e3-ca88-4a4d-86c5-c4eb0d7f6f9c@linux.alibaba.com>
In-Reply-To: <6109a3e3-ca88-4a4d-86c5-c4eb0d7f6f9c@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Apr 2024 09:41:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xr8-rzANK8oKyEZpk1FZ2dy5HqBXKpk3O29PhG1fRowg@mail.gmail.com>
Message-ID: <CAD=FV=Xr8-rzANK8oKyEZpk1FZ2dy5HqBXKpk3O29PhG1fRowg@mail.gmail.com>
Subject: Re: [PATCHv12 4/4] watchdog/softlockup: report the most frequent interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>, pmladek@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jan.kiszka@siemens.com, deller@gmx.de, liusong@linux.alibaba.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, kernelfans@gmail.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Mar 25, 2024 at 2:48=E2=80=AFAM Bitao Hu <yaoma@linux.alibaba.com> =
wrote:
>
> Hi, Thomas
>
> On 2024/3/24 04:43, Thomas Gleixner wrote:
> > On Wed, Mar 06 2024 at 20:52, Bitao Hu wrote:
> >> +    if (__this_cpu_read(snapshot_taken)) {
> >> +            for_each_active_irq(i) {
> >> +                    count =3D kstat_get_irq_since_snapshot(i);
> >> +                    tabulate_irq_count(irq_counts_sorted, i, count, N=
UM_HARDIRQ_REPORT);
> >> +            }
> >> +
> >> +            /*
> >> +             * We do not want the "watchdog: " prefix on every line,
> >> +             * hence we use "printk" instead of "pr_crit".
> >> +             */
> >
> > You are not providing any justification why the prefix is not
> > wanted. Just saying 'We do not want' does not cut it and who is 'We'. I
> > certainly not.
> >
> > I really disagree because the prefixes are very useful for searching lo=
g
> > files. So not having it makes it harder to filter out for no reason.
> >
>
>
> Regarding the use of printk() instead of pr_crit(), I have had a
> discussion with Liu Song and Douglas in PATCHv1:
> https://lore.kernel.org/all/CAD=3DFV=3DWEEQeKX=3Dec3Gr-8CKs2K0MaWN3V0-0yO=
suret0qcB_AA@mail.gmail.com/
>
> Please allow me to elaborate on my reasoning. The purpose of the
> report_cpu_status() function I implemented is similar to that of
> print_modules(), show_regs(), and dump_stack(). These functions are
> designed to assist in analyzing the causes of a soft lockup, rather
> than to report that a soft lockup has occurred. Therefore, I think
> that adding the "watchdog: " prefix to every line is redundant and
> not concise. Besides, the existing pr_emerg() in the watchdog.c file
> is already sufficient for searching useful information in the logs.
> The information I added, along with the call tree and other data, is
> located near the line with the "watchdog: " prefix.
>
> Are the two reasons I've provided reasonable?

FWIW I don't feel super strongly about this, but I'm leaning towards
agreeing with Bitao. The sample output from the commit message looks
like this:

[  638.870231] watchdog: BUG: soft lockup - CPU#9 stuck for 26s! [swapper/9=
:0]
[  638.870825] CPU#9 Utilization every 4s during lockup:
[  638.871194]  #1:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.871652]  #2:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.872107]  #3:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.872563]  #4:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.873018]  #5:   0% system,          0% softirq,   100% hardirq,
   0% idle
[  638.873494] CPU#9 Detect HardIRQ Time exceeds 50%. Most frequent HardIRQ=
s:
[  638.873994]  #1: 330945      irq#7
[  638.874236]  #2: 31          irq#82
[  638.874493]  #3: 10          irq#10
[  638.874744]  #4: 2           irq#89
[  638.874992]  #5: 1           irq#102

...and in my mind the "watchdog: BUG: soft lockup - CPU#9 stuck for
26s! [swapper/9:0]" line is enough to grep through the dmesg. Having
all the following lines start with "watchdog:" feels like overkill to
me, but if you feel strongly that they should then it wouldn't bother
me too much for them all to have the "watchdog:" prefix.

Could you clarify how strongly you feel about this and whether Bitao
should spin a v13?

I believe that this is the only point of contention on the patch
series right now and otherwise it could be ready to land. I know in
the past Petr has wanted ample time to comment though perhaps the fact
that it's been ~1 month is enough. Petr: do you have anything that
needs saying before this patch series lands?

Thanks!

-Doug
