Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B006F86DF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 18:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCbtb3Ggmz3fHw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 02:36:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Kl/H69+q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Kl/H69+q;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCbsj4ZpQz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 02:36:07 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5144043d9d1so1358006a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683304562; x=1685896562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpDnC2craXa71PgQOtY/fZMYoEOsNHjFRztUygfINOs=;
        b=Kl/H69+qiWpBGXQ74zpfcCM7yoeMNF0HUetUNsCOziEgzg4oZNsUjufnBCJaY0lRDs
         JVCQnZlsFUOs8L2OLxAB756zQr9tomaOqy9cgrko6dhSjJKLchInoaKe+4SAgdjSQMO/
         0TtzyRAMOo3O4gaV98JVsmeLkXaCAihpei+ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304562; x=1685896562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpDnC2craXa71PgQOtY/fZMYoEOsNHjFRztUygfINOs=;
        b=cJvgtNIsEHLnjLZGdj2UhkjdkBlvBrScn983/Jngy6nFjNIzvbNQCIpQPp7805fUVh
         j0obyaNX+u5NhS1I9ZE39LB8z6rfg6MW5eHRRPP/Uw8gqfAzLOLSiMAjGVhdYzoYWekm
         kRLsIvK+tFUge/kg8RonywJ35vKd9l/g9WEYhPFpfWEPZTvN1hI4DY/mbXsFrc++KFYQ
         SvgXjY23ZMD+NW2CnisEJxvnxfzRW6hy+84h/pX4dj2BceTUq+mUrDjPp1IqkMGW2U9h
         sGBsdd0314o/uT/JyKe6RBioRojhn/14+dPMlvIqXDk6I2c1jA3PNXxx/AXNLeTmnGA7
         HOqA==
X-Gm-Message-State: AC+VfDyG/AbKCqHdP9RP5THZPuu5u/w6yi3YOE4E0K2lpdW7mzCJsdvU
	5+QqhLpPiBUzNOMBK8G+MIGZXT+rclRUQEoYJe0=
X-Google-Smtp-Source: ACHHUZ4+7/NWl13nU61lgOakxqqBYV77/HuvAjeTFZqSez1hPYhiNRyI09BXhOpup9hN5I1PCNd6tw==
X-Received: by 2002:a17:90a:b007:b0:24d:f880:5192 with SMTP id x7-20020a17090ab00700b0024df8805192mr2019713pjq.19.1683304562076;
        Fri, 05 May 2023 09:36:02 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090a898800b0024e268985b1sm7147783pjn.9.2023.05.05.09.36.00
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 09:36:01 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a7ff4a454eso603665ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:36:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1981:b0:3ed:210b:e698 with SMTP id
 u1-20020a05622a198100b003ed210be698mr317734qtc.7.1683304539483; Fri, 05 May
 2023 09:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid> <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
In-Reply-To: <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:35:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
Message-ID: <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux
 ppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, May 4, 2023 at 7:36=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > From: Colin Cross <ccross@android.com>
> >
> > Implement a hardlockup detector that doesn't doesn't need any extra
> > arch-specific support code to detect lockups. Instead of using
> > something arch-specific we will use the buddy system, where each CPU
> > watches out for another one. Specifically, each CPU will use its
> > softlockup hrtimer to check that the next CPU is processing hrtimer
> > interrupts by verifying that a counter is increasing.
>
> Powerpc's watchdog has an SMP checker, did you see it?

No, I wasn't aware of it. Interesting, it seems to basically enable
both types of hardlockup detectors together. If that really catches
more lockups, it seems like we could do the same thing for the buddy
system. If people want, I don't think it would be very hard to make
the buddy system _not_ exclusive of the perf system. Instead of having
the buddy system implement the "weak" functions I could just call the
buddy functions in the right places directly and leave the "weak"
functions for a more traditional hardlockup detector to implement.
Opinions?

Maybe after all this lands, the powerpc watchdog could move to use the
common code? As evidenced by this patch series, there's not really a
reason for the SMP detection to be platform specific.


> It's all to
> all rather than buddy which makes it more complicated but arguably
> bit better functionality.

Can you come up with an example crash where the "all to all" would
work better than the simple buddy system provided by this patch? It
seems like they would be equivalent, but I could be missing something.
Specifically they both need at least one non-locked-up CPU to detect a
problem. If one or more CPUs is locked up then we'll always detect it.
I suppose maybe you could provide a better error message at lockup
time saying that several CPUs were locked up and that could be
helpful. For now, I'd keep the current buddy system the way it is and
if you want to provide a patch improving things to be "all-to-all" in
the future that would be interesting to review.
