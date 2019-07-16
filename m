Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5999A6A64A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 12:16:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nxBL3JV2zDqSq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 20:16:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="KAtOigf2"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nx8G2zWpzDq77
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 20:14:20 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id f17so4895486pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 03:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tmWzuRj9Y8Rn/r16lIRyg5jwtGJ9nynfw0uohRu6k2o=;
 b=KAtOigf2Oc9xYw3+dOxD9HqWXPLvbyeFTY1yERB+lcTUiKxn0onhKAn2eSSU2evMlN
 DV/XVJTUAM2BITFnkKRi6xErSZxL3AAhkWKFiuzIHWL4/J2i7Nh1jey+y3wQ/TYWuF3c
 a+Eo2P1WXSxGFIfJYyvmhhbFEexNIUH1jCbpjXVqUvler8kfIxS2uFrBoDgmsyMMMTik
 rvcdKRYaz24FEbxamPrZHZWVWb76QRqv9Z+FTSi6uVo5dEYFer2trAUwlcsVqiJHrdZS
 hD0SM75lfUioSSdZ+vSrLrjq1YeShNB4AfsrJAcT8PjYY38sTfsBKUobjvkFsI4XYiN4
 DD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tmWzuRj9Y8Rn/r16lIRyg5jwtGJ9nynfw0uohRu6k2o=;
 b=bASGUGi72OpEUD1oUHQxEmClscGIFWPp4b1g/my033jjn5tf6bz4u5ypdHn+Qvrh/n
 j3CHheL1Q7T5gkmC78UF60dugOoJiToDRJ3FNHIg7EHjoyvhu1ExZ9dilq8s/8MGIRj2
 I0SZKUEK/+X7r6tX2q/PYfzNRJ5ok7aEr5mv8a8WT16S08UEZn90Hlttr9fTs9pokThR
 WTYWDnf3LEB2fDXM1hDpygG4XnTKq1WI21wthrBcSjypxzhRakJYvdN+oqdGFitA77Oy
 042C0Q/Np8YQbBo6i4lmcz0pYnAd4WdQx5G8Ri2QMXkP04cOICtydZ7W7DQhdRMvgbHN
 9aSg==
X-Gm-Message-State: APjAAAUkF8KKYyTcgNRF2ejyi90DcyzRG3MjWx7ta1E6mTEITpZaaeSi
 9/cptLSUQdXsNK8pFXc/ws0UZw==
X-Google-Smtp-Source: APXvYqzBphLPq84GuNMQq2Ypj7vpkoiFF0ipulNv01B65gbXobE3Luly7Rk6v8kET2o+vxGtcp0/UQ==
X-Received: by 2002:a63:e1e:: with SMTP id d30mr32421799pgl.100.1563272058631; 
 Tue, 16 Jul 2019 03:14:18 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id f12sm17112423pgq.52.2019.07.16.03.14.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 03:14:18 -0700 (PDT)
Date: Tue, 16 Jul 2019 15:44:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 00/10] cpufreq: Migrate users of policy notifiers to QoS
 requests
Message-ID: <20190716101416.ntk353cfnrcykoek@vireshk-i7>
References: <cover.1563269894.git.viresh.kumar@linaro.org>
 <CAJZ5v0iqYHNt6NQy3Fi1B=XtjNOm2x0mX3+7eWBREgFZRpUS+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iqYHNt6NQy3Fi1B=XtjNOm2x0mX3+7eWBREgFZRpUS+w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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
 Linux PM <linux-pm@vger.kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Robert Moore <robert.moore@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Rui <rui.zhang@intel.com>, Javi Merino <javi.merino@kernel.org>,
 Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16-07-19, 12:06, Rafael J. Wysocki wrote:
> On Tue, Jul 16, 2019 at 11:49 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > Now that cpufreq core supports taking QoS requests for min/max cpu
> > frequencies, lets migrate rest of the users to using them instead of the
> > policy notifiers.
> 
> Technically, this still is linux-next only. :-)

True :)

> > The CPUFREQ_NOTIFY and CPUFREQ_ADJUST events of the policy notifiers are
> > removed as a result, but we have to add CPUFREQ_CREATE_POLICY and
> > CPUFREQ_REMOVE_POLICY events to it for the acpi stuff specifically. So
> > the policy notifiers aren't completely removed.
> 
> That's not entirely accurate, because arch_topology is going to use
> CPUFREQ_CREATE_POLICY now too.

Yeah, I thought about that while writing this patchset and
coverletter. But had it not been required for ACPI, I would have done
it differently for the arch-topology code. Maybe direct calling of
arch-topology routine from cpufreq core. I wanted to get rid of the
policy notifiers completely but I couldn't find a better way of doing
it for ACPI stuff.

> > Boot tested on my x86 PC and ARM hikey board. Nothing looked broken :)
> >
> > This has already gone through build bot for a few days now.
> 
> So I'd prefer patches [5-8] to go right after the first one and then
> do the cleanups on top of that, as somebody may want to backport the
> essential changes without the cleanups.

In the exceptional case where nobody finds anything wrong with the
patches (highly unlikely), do you want me to resend with reordering or
you can reorder them while applying? There are no dependencies between
those patches anyway.

--
viresh
