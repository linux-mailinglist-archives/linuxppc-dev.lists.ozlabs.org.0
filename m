Return-Path: <linuxppc-dev+bounces-12299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77614B7E3A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 14:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSD85sBpz3bpS;
	Wed, 17 Sep 2025 15:35:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758087352;
	cv=none; b=WR6E6izPZJsTtMC6yYF/PyN11vnuvcoQnn4YbpphOvfCWcNA482RbxTjnaKrRcdFATuOTxHobniwtfjARfXB+SIqdN0m7xaUueBGVA+Gj+0JK8ru3WgYYiS2o3bfu73za5ehHpZ0dIF8BRylF1q85CH1rW2LPFVZy2ELdVGelia6aHeRPgJTTEkNk6O20KhwF4Bl9VD0AMArgKF8eCK/f0aJPtZdSzVY7wRs1n7pOyfgywr65wa6RLcJrBYtq++LfDLz6AcQoWM27R/8Z9Oo0tJNnerzBd4+dd983AMEUC7J9ishjDUjtZUiMtmeNKiREAPOdi5gh6s532NIHLgCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758087352; c=relaxed/relaxed;
	bh=zn5yufe5FJPZP7aLgQtuZzK41dyB/XxonjsLI15VCDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUdkdum2mHcDJakUfv3rB4OP76/0hxVkZ6HGdgfZ88XfFbJlVaGtSyirwwYxYnTsCJaxn564zN5IcYA7cqfNXz2Z3c+7SHMv8cxt/YGIEzcY6QKf1pnWeKqjQQPAk+fcEcmOfOFY3go6Wywe7ggq7zSA1IODqoF+FFCFZlGGOW3w8PgtLFO7PhCCj119M+GjLrIkPpWTSe+3YGM3Opj0p/Jxb2ulKzrvGpbUVprUEFEsmcN1cWBPmIceuHLNfLizppmYJ54Ty1Lyq5QZRXChfqH4JGtYd5nCTvMtDKNQwaprb6o9wjRNeGn7MAgFEGrOCFOylWyA0qY/G57NxRkttw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PUMkzv3b; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PUMkzv3b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSD80DVZz30BW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 15:35:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7C1743F90;
	Wed, 17 Sep 2025 05:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD882C4CEF0;
	Wed, 17 Sep 2025 05:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758087349;
	bh=1WaN1+VS/2NmIW3J1I9V+lFYw7mqy2+wDfdY6Gnjxxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUMkzv3bXvKVKSNP8VsH1qHTukPPjaJa4BFrytybZbphIfxNx+82GJ3aQpfH5KqVE
	 /k5Io7gA9lNbE2sKWMXFiOe2QVlfxD/Q+pN2tCedPkhju7lgGwS9lQjcA56LnJ9uXK
	 t/Quwfw8CJFBZPAQm7+K413L9y7TeLZP8vwHLPCDG8B+kL7SZVe48doGfE/jhXETYJ
	 zmodle65GIEOC2+S32YHex8Iqwq82GCnyDglECXABU7Vrsg0oxkTsrTz85ZsT5YHIb
	 FBvUuXaipVLNF/3aTuXxwarP0T5nEYieBiSu6ed5jRnlDA1MH2A/ub3gBLcje/siZt
	 jo3sJG10UvOJg==
Date: Tue, 16 Sep 2025 22:35:46 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Jinchao Wang <wangjinchao600@gmail.com>,
	Doug Anderson <dianders@chromium.org>,
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
Message-ID: <aMpIsqcgpOH1AObN@z2>
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
 <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
 <aMoTOXIKBYVTj7PV@mdev>
 <CAP-5=fX7NJmBjd1v5y4xCa0Ce5rNZ8Dqg0LXd12gPrdEQCERVA@mail.gmail.com>
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
In-Reply-To: <CAP-5=fX7NJmBjd1v5y4xCa0Ce5rNZ8Dqg0LXd12gPrdEQCERVA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

On Tue, Sep 16, 2025 at 10:13:12PM -0700, Ian Rogers wrote:
> On Tue, Sep 16, 2025 at 6:47 PM Jinchao Wang <wangjinchao600@gmail.com> wrote:
> >
> > On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> > > On Tue, Sep 16, 2025 at 7:51 AM Jinchao Wang <wangjinchao600@gmail.com> wrote:
> > > >
> > > > Currently, the hard lockup detector is selected at compile time via
> > > > Kconfig, which requires a kernel rebuild to switch implementations.
> > > > This is inflexible, especially on systems where a perf event may not
> > > > be available or may be needed for other tasks.
> > > >
> > > > This commit refactors the hard lockup detector to replace a rigid
> > > > compile-time choice with a flexible build-time and boot-time solution.
> > > > The patch supports building the kernel with either detector
> > > > independently, or with both. When both are built, a new boot parameter
> > > > `hardlockup_detector="perf|buddy"` allows the selection at boot time.
> > > > This is a more robust and user-friendly design.
> > > >
> > > > This patch is a follow-up to the discussion on the kernel mailing list
> > > > regarding the preference and future of the hard lockup detectors. It
> > > > implements a flexible solution that addresses the community's need to
> > > > select an appropriate detector at boot time.
> > > >
> > > > The core changes are:
> > > > - The `perf` and `buddy` watchdog implementations are separated into
> > > >   distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
> > > > - Global function pointers are introduced (`watchdog_hardlockup_enable_ptr`)
> > > >   to serve as a single API for the entire feature.
> > > > - A new `hardlockup_detector=` boot parameter is added to allow the
> > > >   user to select the desired detector at boot time.
> > > > - The Kconfig options are simplified by removing the complex
> > > >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detectors to be
> > > >   built without mutual exclusion.
> > > > - The weak stubs are updated to call the new function pointers,
> > > >   centralizing the watchdog logic.
> > >
> > > What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is that
> > > enabling and disabling whatever the boot time choice was? I'm not sure
> > > why this has to be a boot time option given the ability to configure
> > > via /proc/sys/kernel/nmi_watchdog.
> > The new hardlockup_detector boot parameter and the existing
> > /proc/sys/kernel/nmi_watchdog file serve different purposes.
> >
> > The boot parameter selects the type of hard lockup detector (perf or buddy).
> > This choice is made once at boot.
> >
> >  /proc/sys/kernel/nmi_watchdog, on the other hand, is only a simple on/off
> > switch for the currently selected detector. It does not change the detector's
> > type.
> 
> So the name "nmi_watchdog" for the buddy watchdog is wrong for fairly
> obvious naming reasons but also because we can't differentiate when a
> perf event has been taken or not - this impacts perf that is choosing
> not to group events in metrics because of it, reducing the metric's
> accuracy. We need an equivalent "buddy_watchdog" file to the
> "nmi_watchdog" file. If we have such a file then if I did "echo 1 >
> /proc/sys/kernel/nmi_watchdog" I'd expect the buddy watchdog to be
> disabled and the perf event one to be enabled. Similarly, if I did
> "echo 1 > /proc/sys/kernel/buddy_watchdog" then I would expect the
> perf event watchdog to be disabled and the buddy one enabled. If I did
>  "echo 0 > /proc/sys/kernel/nmi_watchdog; echo 0 >
> /proc/sys/kernel/buddy_watchdog" then I'd expect neither to be
> enabled. I don't see why choosing the type of watchdog implementation
> at boot time is particularly desirable. It seems sensible to default
> normal people to using the buddy watchdog (more perf events, power...)
> and  CONFIG_DEBUG_KERNEL type people to using the perf event one. As
> the "nmi_watchdog" file may be assumed to control the buddy watchdog,
> perhaps a compatibility option (where the "nmi_watchdog" file controls
> the buddy watchdog) is needed so that user code has time to migrate.

Sounds good to me.  For perf tools, it'd be great if we can have a run-
time check which watchdog is selected.

Thanks,
Namhyung


