Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AA86A68A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 12:29:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nxTs57DkzDqPG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 20:29:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nxS06s9MzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 20:28:00 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id j19so20509037otq.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 03:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InV49k/g4n8kkX89qOOPmJMNqj/Q2fuW/aBD6hhUrXA=;
 b=R4TS8ZSyxhR4sqdxJxaVyXtMNGDcXEcDoelJvBp/tZIE9S2VwzX60zP/w2s4joW03H
 q0wAJDc7JTU4nIBel21GqcGGe046kfkm+z42DHHnV9K2Jxcna3GEA//1uuVS6pD6xFdQ
 fa10/hnMUYyNqqYWJZ8azhf8AJYNeCxGlEbRnXD5IdmNGbug0Yno8sPz5m2dvM13kDTC
 VjzgQXnKwz354XLU2cOsPjct6y1ddyn6fAX+bdiEI1GjKRP3DDS74+VimfylmEgsQAxu
 zgLlMf75vwasveaxUNOU1UIlkX33acMbRMX1YbWKRoYa642yKzRNCW7VOFlBVKIrXWL3
 flIg==
X-Gm-Message-State: APjAAAUMje9WUGegrTL/xzA/hHoc/FfxQMY4W7KXF/fC40O4dbVn4g9k
 /iGUJGEU0DrjaMtsiHRxm+VAMWJmVR/7gHqj8Ak=
X-Google-Smtp-Source: APXvYqwNxa4ESy69KwPnztnMj6Vvcz27ajFqshxcVQs8WVfJTe1ykblJ31kt949Zta05jFdEjaTLyPSqql/gvXR4C4Y=
X-Received: by 2002:a05:6830:8a:: with SMTP id
 a10mr18446800oto.167.1563272877613; 
 Tue, 16 Jul 2019 03:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563269894.git.viresh.kumar@linaro.org>
 <CAJZ5v0iqYHNt6NQy3Fi1B=XtjNOm2x0mX3+7eWBREgFZRpUS+w@mail.gmail.com>
 <20190716101416.ntk353cfnrcykoek@vireshk-i7>
In-Reply-To: <20190716101416.ntk353cfnrcykoek@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 16 Jul 2019 12:27:46 +0200
Message-ID: <CAJZ5v0jZfmXN=juHX11vmSFj=vxS2Mu_b-OZprB9S+3LJjDb+g@mail.gmail.com>
Subject: Re: [PATCH 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Robert Moore <robert.moore@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Javi Merino <javi.merino@kernel.org>, Erik Schmauss <erik.schmauss@intel.com>,
 Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2019 at 12:14 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 16-07-19, 12:06, Rafael J. Wysocki wrote:
> > On Tue, Jul 16, 2019 at 11:49 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Hello,
> > >
> > > Now that cpufreq core supports taking QoS requests for min/max cpu
> > > frequencies, lets migrate rest of the users to using them instead of the
> > > policy notifiers.
> >
> > Technically, this still is linux-next only. :-)
>
> True :)
>
> > > The CPUFREQ_NOTIFY and CPUFREQ_ADJUST events of the policy notifiers are
> > > removed as a result, but we have to add CPUFREQ_CREATE_POLICY and
> > > CPUFREQ_REMOVE_POLICY events to it for the acpi stuff specifically. So
> > > the policy notifiers aren't completely removed.
> >
> > That's not entirely accurate, because arch_topology is going to use
> > CPUFREQ_CREATE_POLICY now too.
>
> Yeah, I thought about that while writing this patchset and
> coverletter. But had it not been required for ACPI, I would have done
> it differently for the arch-topology code. Maybe direct calling of
> arch-topology routine from cpufreq core. I wanted to get rid of the
> policy notifiers completely but I couldn't find a better way of doing
> it for ACPI stuff.
>
> > > Boot tested on my x86 PC and ARM hikey board. Nothing looked broken :)
> > >
> > > This has already gone through build bot for a few days now.
> >
> > So I'd prefer patches [5-8] to go right after the first one and then
> > do the cleanups on top of that, as somebody may want to backport the
> > essential changes without the cleanups.
>
> In the exceptional case where nobody finds anything wrong with the
> patches (highly unlikely), do you want me to resend with reordering or
> you can reorder them while applying? There are no dependencies between
> those patches anyway.

Please resend the reordered set when the merge window closes.
