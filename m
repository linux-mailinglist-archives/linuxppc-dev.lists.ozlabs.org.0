Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4613D6DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 10:28:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yzQq5SlxzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 20:28:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=hsinyi@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=YNsZvqMC; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yzMn3LwszDqZy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:26:13 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id t17so17515590ilm.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+T2+f3YUqy/mz/g0zqdHuyixNv3uIRSRLqHpYCvIA8=;
 b=YNsZvqMC3qBwhA390kR+0O1+Z775NXpgorZ1Uj0LTNfhunlCVnboeL+hdbdTD7zPyj
 cO4YdefQbXLyr/t0viYTQNIs2/R9znJRs+JPdwF+zlywPmjg5MJOT97iGih9buKS3tvr
 detFCcSpM8To0oU1Jp0ON3jtZma7mcyCUwQck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+T2+f3YUqy/mz/g0zqdHuyixNv3uIRSRLqHpYCvIA8=;
 b=WmCKdn2IEJTLKwxPhefh5KeXldnj9G/KyirbrooySVjdJrnR7HjiaAv27q1zQP4npz
 ccTlvQfLuIiaM70E7tRiEab5grIOIjVm7D0rf2c7oy7V+dMCI+6HIiyx+m0/BxEaX2wG
 tcFVYFzRDJyO8Medzxyx8gFM3m3qEnPovOmdXTTF+hapyU07RAvt8SVUisciTAydSRik
 F1yCLkXO7rkHi8Dwq50NzF4tfMiI/htCN1i11VCcYSWKdODefq8FyYxYyAfuSelGaB4g
 1hvH18O5DIJtXxom+aTn5iw46JVY31A411Zb2vKs0IPMDxpEw0W0RmwjsZGf2J7smC2m
 jsRg==
X-Gm-Message-State: APjAAAU4bqXyLliRmwiSaVR8T5M/6I4LR23GiNdms+8eQ0a5UbESq5u3
 +HTZs7TUNmlBvPzgXPvmv4fuEB6AJ8WefBXYEPQ9Lg==
X-Google-Smtp-Source: APXvYqzcJuvwLp0x5+fMsP13ADUUEVQCs/aLETOB1GPnAQGr8kZxelM+YUGAkJZnZhbBbnQ8HdB5j4UwUbclM7dRrHw=
X-Received: by 2002:a92:8851:: with SMTP id h78mr2599028ild.308.1579166769584; 
 Thu, 16 Jan 2020 01:26:09 -0800 (PST)
MIME-Version: 1.0
References: <20200115063410.131692-1-hsinyi@chromium.org>
 <20200115114112.GA3663@bogus>
In-Reply-To: <20200115114112.GA3663@bogus>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 16 Jan 2020 17:25:43 +0800
Message-ID: <CAJMQK-ip7C71=K+CViEKcc3ed4GPY_Uknm5uNgLJTzZb2aQOcA@mail.gmail.com>
Subject: Re: [PATCH v5] reboot: support offline CPUs before reboot
To: Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-csky@vger.kernel.org, Aaro Koskinen <aaro.koskinen@nokia.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-xtensa@linux-xtensa.org, Stephen Boyd <swboyd@chromium.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, Jiri Kosina <jkosina@suse.cz>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 15, 2020 at 7:41 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Jan 15, 2020 at 02:34:10PM +0800, Hsin-Yi Wang wrote:
> > Currently system reboots uses architecture specific codes (smp_send_stop)
> > to offline non reboot CPUs. Most architecture's implementation is looping
> > through all non reboot online CPUs and call ipi function to each of them. Some
> > architecture like arm64, arm, and x86... would set offline masks to cpu without
> > really offline them. This causes some race condition and kernel warning comes
> > out sometimes when system reboots.
> >
> > This patch adds a config ARCH_OFFLINE_CPUS_ON_REBOOT, which would offline cpus in
> > migrate_to_reboot_cpu(). If non reboot cpus are all offlined here, the loop for
> > checking online cpus would be an empty loop. If architecture don't enable this
> > config, or some cpus somehow fails to offline, it would fallback to ipi
> > function.
> >
>
> What's the timing impact on systems with large number of CPUs(say 256 or
> more) ? I remember we added some change to reduce the wait times for
> offlining CPUs in system suspend path on arm64, still not negligible.
>

This is not the final solution, but I would still provided some data
points here:

Tested on my arm64 with 4 cpu: 2 a53 and 2 a72.
Offlining 3 cpu takes about 60~65 ms
Offlining 2 cpu(a53+a72 or a72+a72) takes about 42~47 ms
Offlining 1 cpu(a53 or a72) takes about 23~25 ms.

It would take longer time for systems with large number of CPUs.
