Return-Path: <linuxppc-dev+bounces-12439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F6B8BF00
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 06:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTGWM0f1yz30RJ;
	Sat, 20 Sep 2025 14:25:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758089654;
	cv=none; b=nwyTYZFKc2negHEChqFJbZWUIaimuTd/R6EEceE0V9GVt0ExgfknF2EzHYHAb4VinJmE52iNZSF43D47Qqxe0oLUW8DnYvyA1NoXls+n/1NbWMSQKBbNq20Qcjm7qek/JMQ8i6Q736m8wyVvlPxMw/MC9KDpdAdQyI55Bt23pcvxp8CSrldHYXVPpy+4QuVMvBRjNrfN0NEluUJR9KT1QTJZdWdx76BvYSrlmmKsot/Ecy1hd7/w2IiEz8eRANBnW170EU9cnauLLBfTUMdRMW6TBB6pcHjkS6CWDoxf1VzA5x3uhaqyQK5LrTkkZ8vUG08Eiz3eRab6/ijePLiYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758089654; c=relaxed/relaxed;
	bh=FmzfgTfio2uU1BYpRua3Nqm7f01ztuczzsg9vKgt8Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cy48JHR3w52UBGiuC/WcSPdP6FqJTkAM8SrG9AuQlyCJUYqNrzPbTjQv6Mml5+5CbKFFSiCvcgwy6WtvfZZO5+Ec2kZB6KT9cRJOdEJCT5RFueCAald+eEAle+OZTZj/9XZrwfc/YfojAFaSNXMoitfJWmT5yLMEFq7UI9aMX/ua40spBMSUw04IvcYj5f6q+2p/Dg74ele9qa/tP3Ef+TuoZPNn0Ud2CalomB0yV3UT09DX5b/5vQg0mb4bf3UNIaK+fs9FkE62SpoZKLTw5t2noqkLSgZrprMyLyj42+bYhwVOH5ug8ThtIWazlmDcPqiW/GZiCDSeVBRpTiGGRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UtvlO8dL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UtvlO8dL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRT4P6MNcz3cYJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 16:14:12 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-772627dd50aso575913b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 23:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758089651; x=1758694451; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FmzfgTfio2uU1BYpRua3Nqm7f01ztuczzsg9vKgt8Hk=;
        b=UtvlO8dLtz1EHZ3+uQGQyqGA23uRjxJ2P88aoa/5ENI7mrdyJrR8mRxMXqqJRpajBQ
         LIhzHHT+87DAqZ2ci5bz+zfCP02M14lODOpAETk1rU02ap5pWUo0hsUSVomkOeaDEEHD
         cVChVjIrB0Ro0/g5UAevw2WMzWO370MbS5/Pe9V5sNYZi3rWBEJIEeXpLfJ+Dr7NOioJ
         BFFVTLaPBzXPwPVJOjgDR8WIujc7jM+gNygzrgGD0sZuu8nw1r9lBQ6KDtCJhNFNV7cM
         SNEJdnznxndFQHAAfwk3uBiZf5SwY8VYWyBXyBm0Zul6UNrO9a7Uab6/HWJxY4kmP5Zp
         c7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758089651; x=1758694451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FmzfgTfio2uU1BYpRua3Nqm7f01ztuczzsg9vKgt8Hk=;
        b=wSMZCSqJIqKQcUVNVE1LGEe3SvoxNsb84ICuRrp7Pl/lCNIlpxjFShcrkDkIahbfGJ
         wO9hpF+xECym/bN3/g9VNcqThY6Qk+W9GHf6NS+i/vpGa1AEnLUGH43teJOBvYU2zIxY
         fgGxxeJlHWU6o36toc3Tr+PS2erpgnvOrbNVkiaJ2nKulFTEZuxONyJklN0MHADt1A7v
         uX2vTFS78GW9u2qjIv0VXYNuEO8wPCrZYBQ+BNKeU+gK6HzqFRGAoCgoWu/Ug0tEt5Si
         blyKG2RCm1c47tZel204YNdODEZTV8wXNtyiAIEZAPvoVINOnffYhWKgTvfJlIkKLIeP
         cnCg==
X-Forwarded-Encrypted: i=1; AJvYcCWBKHcsggrdlC5twnjACR10fu8gDpVeOe8sSkYFWNJM0SE8P3f8l5BXqQGSRvK6N7VUgDo2nhQ5WQUOj0k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxANSIfiVjYorLSF3JDJGckuu9uoB2WrYFAzkf0UkdL139UOEfS
	s69I7SyV8Qx2z7rDbyoceC4GuVH7aRjiznFeJaM7ZOZaGR/8KbJuQTXK
X-Gm-Gg: ASbGnctORe6l/kUz76NHGzlzCSFIbRUtOAR9Krxly/67t0ORCISPKs+3mqHRYR7X8at
	DpiCrHx8tu0zmmbE7voju/i5tl+fuVWAsCZ5/mavVGgtIpdp6DmEerZtIv3oZ4VeU33sfLGTlDt
	AIsNL90J59Yw2J+RAKcNUQsYcRFDcs8Fp5hMRLTUX//QJME8UVx0B1tkFK4GM+RVOpyk0ZmZotW
	b0Su8sQhU7evNhyW7UU7+zX7JhrFKEtdkXOBkPHHU7hIcwNiyKjVAckXDeEBfp98KkaVAF63Otc
	/mbrGBALCA/HmHgTc8dm+nYctH3i5sh+ZZeDiA7wxefK6mrkV55GVZoW2HKkU6O33bDwiuHyH+k
	5u+a3vB9qR/Ziuq2QSXhgKuRKyyVksr+Wac9cb8M7
X-Google-Smtp-Source: AGHT+IFbOOUPuUp71MZLUCXJnIvNlVqkzTniqbE7azWA2KDlmn7NJjUtb/+FLQYp6JRxCAhLg6/vEQ==
X-Received: by 2002:a05:6a20:3d10:b0:243:b089:9fbe with SMTP id adf61e73a8af0-26701102125mr7170178637.31.1758089650568;
        Tue, 16 Sep 2025 23:14:10 -0700 (PDT)
Received: from localhost ([146.19.163.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b169f2edsm12638506a12.19.2025.09.16.23.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:14:10 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:14:02 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Doug Anderson <dianders@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
	akpm@linux-foundation.org, catalin.marinas@arm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, kan.liang@linux.intel.com, kees@kernel.org,
	masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
	thomas.weissschuh@linutronix.de, xur@google.com,
	ruanjinjie@huawei.com, gshan@redhat.com, maz@kernel.org,
	suzuki.poulose@arm.com, zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com, gautam@linux.ibm.com, arnd@arndb.de,
	zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com,
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com,
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org,
	yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup
 detector
Message-ID: <aMpRqlDXXOR5qYFd@mdev>
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
 <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
 <aMoTOXIKBYVTj7PV@mdev>
 <CAP-5=fX7NJmBjd1v5y4xCa0Ce5rNZ8Dqg0LXd12gPrdEQCERVA@mail.gmail.com>
 <aMpIsqcgpOH1AObN@z2>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMpIsqcgpOH1AObN@z2>
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 10:35:46PM -0700, Namhyung Kim wrote:
> Hello,
> 
> On Tue, Sep 16, 2025 at 10:13:12PM -0700, Ian Rogers wrote:
> > On Tue, Sep 16, 2025 at 6:47 PM Jinchao Wang <wangjinchao600@gmail.com> wrote:
> > >
> > > On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> > > > On Tue, Sep 16, 2025 at 7:51 AM Jinchao Wang <wangjinchao600@gmail.com> wrote:
> > > > >
> > > > > Currently, the hard lockup detector is selected at compile time via
> > > > > Kconfig, which requires a kernel rebuild to switch implementations.
> > > > > This is inflexible, especially on systems where a perf event may not
> > > > > be available or may be needed for other tasks.
> > > > >
> > > > > This commit refactors the hard lockup detector to replace a rigid
> > > > > compile-time choice with a flexible build-time and boot-time solution.
> > > > > The patch supports building the kernel with either detector
> > > > > independently, or with both. When both are built, a new boot parameter
> > > > > `hardlockup_detector="perf|buddy"` allows the selection at boot time.
> > > > > This is a more robust and user-friendly design.
> > > > >
> > > > > This patch is a follow-up to the discussion on the kernel mailing list
> > > > > regarding the preference and future of the hard lockup detectors. It
> > > > > implements a flexible solution that addresses the community's need to
> > > > > select an appropriate detector at boot time.
> > > > >
> > > > > The core changes are:
> > > > > - The `perf` and `buddy` watchdog implementations are separated into
> > > > >   distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
> > > > > - Global function pointers are introduced (`watchdog_hardlockup_enable_ptr`)
> > > > >   to serve as a single API for the entire feature.
> > > > > - A new `hardlockup_detector=` boot parameter is added to allow the
> > > > >   user to select the desired detector at boot time.
> > > > > - The Kconfig options are simplified by removing the complex
> > > > >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detectors to be
> > > > >   built without mutual exclusion.
> > > > > - The weak stubs are updated to call the new function pointers,
> > > > >   centralizing the watchdog logic.
> > > >
> > > > What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is that
> > > > enabling and disabling whatever the boot time choice was? I'm not sure
> > > > why this has to be a boot time option given the ability to configure
> > > > via /proc/sys/kernel/nmi_watchdog.
> > > The new hardlockup_detector boot parameter and the existing
> > > /proc/sys/kernel/nmi_watchdog file serve different purposes.
> > >
> > > The boot parameter selects the type of hard lockup detector (perf or buddy).
> > > This choice is made once at boot.
> > >
> > >  /proc/sys/kernel/nmi_watchdog, on the other hand, is only a simple on/off
> > > switch for the currently selected detector. It does not change the detector's
> > > type.
> > 
> > So the name "nmi_watchdog" for the buddy watchdog is wrong for fairly
> > obvious naming reasons but also because we can't differentiate when a
> > perf event has been taken or not - this impacts perf that is choosing
> > not to group events in metrics because of it, reducing the metric's
> > accuracy. We need an equivalent "buddy_watchdog" file to the
> > "nmi_watchdog" file. If we have such a file then if I did "echo 1 >
> > /proc/sys/kernel/nmi_watchdog" I'd expect the buddy watchdog to be
> > disabled and the perf event one to be enabled. Similarly, if I did
> > "echo 1 > /proc/sys/kernel/buddy_watchdog" then I would expect the
> > perf event watchdog to be disabled and the buddy one enabled. If I did
> >  "echo 0 > /proc/sys/kernel/nmi_watchdog; echo 0 >
> > /proc/sys/kernel/buddy_watchdog" then I'd expect neither to be
> > enabled. I don't see why choosing the type of watchdog implementation
> > at boot time is particularly desirable. It seems sensible to default
> > normal people to using the buddy watchdog (more perf events, power...)
> > and  CONFIG_DEBUG_KERNEL type people to using the perf event one. As
> > the "nmi_watchdog" file may be assumed to control the buddy watchdog,
> > perhaps a compatibility option (where the "nmi_watchdog" file controls
> > the buddy watchdog) is needed so that user code has time to migrate.
> 
> Sounds good to me.  For perf tools, it'd be great if we can have a run-
> time check which watchdog is selected.
Considering backward compatibility, I prefer to keep
/proc/sys/kernel/nmi_watchdog and introduce a new file called
/proc/sys/kernel/hardlockup_detector_type, which only shows the default string
or the boot parameter.

The global str pointer hardlockup_detector_type was already introduced in the
patch, so exposing it in a file is straightforward.
> 
> Thanks,
> Namhyung
> 

-- 
Jinchao

