Return-Path: <linuxppc-dev+bounces-12731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746ABC7951
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 08:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj0rf46Wrz3cDN;
	Thu,  9 Oct 2025 17:50:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759992658;
	cv=none; b=TnS21n/0/GG4iuAqD9k2UkdJCWu9BvVCUYnMD3sctIwz9DcObIKRobCrKUTfMAt0HW/yAvBl4Cay21jkfxDjAP6ejDH2D0Bok17NCeg64jjxs85+1lK6bMoXtckrutBX7UOtPP0mO6yCKgLC2Q4QodKia4UFSVEft7+lh7g9Td85jf2IE2CYNO7Qm8ES/mYyiNXrGR08qhSPgg0zU1GJHLR9tLTBRd7clHvDpPYhV++MTwp+YiumAFe71+ln0qWzyTOjuUY0Iw1QjVxdwIvABNqx28vs2U4iH3EMQYMlSHK5PY95QCzyEfTW7981RiWDNyIEM9/fxQFV98dhHo3zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759992658; c=relaxed/relaxed;
	bh=msPzO2LdAQxGndJ6DjHr10aS1oMz0X5JmsGbgMgwTiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKTb1DDs6G/x1Vp/MHTITpG5UV5UBppuQwmR4QEpMbpaJlyZIvyf4FApeASQocnLvOiJLV5rxFjCDMcicWfgwn3s8ofXrn2qN3RUUC5OqPWzvQ6Wjmfed6wBrCwxFBL1fLLb7bV7eugceFZxUnGwvbLWMF+iuWZT/oiawR7Aufmgbrr5n4iFVKvOP0gxC496Azfud0jW+7vh/bg0cyJyAGaiODi/snv9Cf7pC5Kz0/2QQYVJvTHWQr7jpa5f3B3jZJW3ntPChudjxwiK7iHPNY5+VnoQyEvwjYF0oY/jcxu/9q1f98eWT/+3CPURXaj2pspTuwKCRj7H5/a89Z8aKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HA/FqaCA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HA/FqaCA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj0rd12GLz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 17:50:56 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-791c287c10dso569770b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Oct 2025 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759992653; x=1760597453; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msPzO2LdAQxGndJ6DjHr10aS1oMz0X5JmsGbgMgwTiU=;
        b=HA/FqaCAQi/RPLzpQgtCBxBEcHaCuglaYdkyxB/2rJ/D65sM8eQ/lUIfLVh/KcOFJP
         DlVoKZrGRD4Hkxn1/08owSTNAtIoqdCyQ5ZranflCe9wyjdOXEe6inqXQlUITFXoUL4a
         477M+nwn6q30GvllriwfG47AkEfzLAv6MPW33GGGZ445pXFBeqFL8v/0ZcI7aP2HyHBU
         LMoNjxeeZGuh0mNg78z1bcEEfR1xOdLCSFUyydllgUc2Q5wqxMERFkDp/JweXfQjCGQ8
         GJ+Psr7t0xLWjUIdfIkiYNUnZ4Zq8NdBO1EG3aFTnFhdKQOzcIFVhDuRWJLUVeSKsZ36
         etTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759992653; x=1760597453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msPzO2LdAQxGndJ6DjHr10aS1oMz0X5JmsGbgMgwTiU=;
        b=LLUELmZeEzgEnyH29CV9L0LicypJho5miR9P9Mvp9/yRme1hPN4pSxV7V52T6KjSOx
         zNOnP/SId5KwZR1gd5GRu0SDZ6rwCbc3oe7VedKgjHd1wqe3HtxHU98pe9jnLJRTrOZ2
         Jo59LMPqoWD5BHyih4mLIY7RSCMyBCKeBv1u9IySngqoWksjZVJgm4A9FJGoeDuznlVq
         nPdII0pKNZXTsYeEj9APc48WtBhQq4+wG6gz4pwJdrJFCTqb/pfGMUrAJZ5dEkMZ3uo2
         9cGyIkhrPCMDB6FXlgNBglmdp2+eM8BI3TsrOdCdmgG9yg6EnghjMp0quOKlQRhyGcpF
         1ekg==
X-Forwarded-Encrypted: i=1; AJvYcCV++2LySRSvizOi7gD+UlKAwD9E4Bmr6QyfunoIQGvJWR98a6J0yQlBlcxr3X9ZikmxoOxxbZ8FpCcOyh0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1kXC3LclCRqQOVZzgQyIB4B3LRn6ezUJ1PSvneAX8pbnx1JSD
	LVb4odP63G1nB1/uN6Ug5F1wQ1unwls5fThGwNcrq5bVsU91wW2eIg9i
X-Gm-Gg: ASbGncvx/y9o6TfX1jeGcR+OI4trqJHEDWLZGjbsL0WGLYkEAxC6h3awYVNHlu85KMm
	6L1KDAGH4qQC81If7kXK9+uNoEwu1avTFY5LyO8APxmu8+nunhLDa5IPzc4H9vmwRF27szdiio5
	2mF+i+5PexcFF3uh3teGwfns0OKOjCTgG2Xs4ExnJkEHOmy/jJfgoQD0raGy43+gKi14km1554I
	DOm98jRtAgQijZP0xrT58P9MNm+6yflJyHao8wLX6Wym1C/jVDgyTWkGK3FsXcZgh5aPCvDRAod
	BhmVKfgkiKx5qBXIuDvsI32xLipBcNK4stT3XTzFfSzdMDQal3mbxLRTScaCR1g7r+ZnAoqGvg1
	e7FAZTRTAO5KPH/SFt3uJ4U+MS62mqPcB0fgIVtgF66YxBPWoMzKUJfGcqjq0XzXjDnObJvGK
X-Google-Smtp-Source: AGHT+IFMMMzSXgtEWLK41QXTNZ3lVQJZHbdPqEPiYgjhZ+ACp4v2JbI3obgmT4HZPDkdNTRW4JUzPw==
X-Received: by 2002:a17:903:1b30:b0:276:d3e:6844 with SMTP id d9443c01a7336-290272c0450mr82694985ad.33.1759992653189;
        Wed, 08 Oct 2025 23:50:53 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de56desm18189935ad.19.2025.10.08.23.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:50:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:50:44 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Doug Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Namhyung Kim <namhyung@kernel.org>,
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
Message-ID: <aOdbRI3BaMCbyvtv@mdev>
References: <aMpRqlDXXOR5qYFd@mdev>
 <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
 <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
 <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
 <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
 <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com>
 <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
 <CAP-5=fX4=fV70N3GCdXgV6o-YoJynnSppxJp0MwdRrtsyDrs0w@mail.gmail.com>
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
In-Reply-To: <CAP-5=fX4=fV70N3GCdXgV6o-YoJynnSppxJp0MwdRrtsyDrs0w@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 07, 2025 at 05:11:52PM -0700, Ian Rogers wrote:
> On Tue, Oct 7, 2025 at 3:58 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Oct 7, 2025 at 3:45 PM Ian Rogers <irogers@google.com> wrote:
> > >
> > > On Tue, Oct 7, 2025 at 2:43 PM Doug Anderson <dianders@chromium.org> wrote:
> > > ...
> > > > The buddy watchdog was pretty much following the conventions that were
> > > > already in the code: that the hardlockup detector (whether backed by
> > > > perf or not) was essentially called the "nmi watchdog". There were a
> > > > number of people that were involved in reviews and I don't believe
> > > > suggesting creating a whole different mechanism for enabling /
> > > > disabling the buddy watchdog was never suggested.
> > >
> > > I suspect they lacked the context that 1 in the nmi_watchdog is taken
> > > to mean there's a perf event in use by the kernel with implications on
> > > how group events behave. This behavior has been user
> > > visible/advertised for 9 years. I don't doubt that there were good
> > > intentions by PowerPC's watchdog and in the buddy watchdog patches in
> > > using the file, that use will lead to spurious warnings and behaviors
> > > by perf.
> > >
> > > My points remain:
> > > 1) using multiple files regresses perf's performance;
> > > 2) the file name by its meaning is wrong;
> > > 3) old perf tools on new kernels won't behave as expected wrt warnings
> > > and metrics because the meaning of the file has changed.
> > > Using a separate file for each watchdog resolves this. It seems that
> > > there wasn't enough critical mass for getting this right to have
> > > mattered before, but that doesn't mean we shouldn't get it right now.
> >
> > Presumably your next steps then are to find someone to submit a patch
> > and try to convince others on the list that this is a good idea. The
> > issue with perf has been known for a while now and I haven't seen any
> > patches. As I've said, I won't stand in the way if everyone else
> > agrees, but given that I'm still not convinced I'm not going to author
> > any patches for this myself.
> 
> Writing >1 of:
> ```
> static struct ctl_table watchdog_hardlockup_sysctl[] = {
> {
> .procname       = "nmi_watchdog",
> .data = &watchdog_hardlockup_user_enabled,
> .maxlen = sizeof(int),
> .mode = 0444,
> .proc_handler   = proc_nmi_watchdog,
> .extra1 = SYSCTL_ZERO,
> .extra2 = SYSCTL_ONE,
> },
> };
> ```
> is an exercise of copy-and-paste, if you need me to do the copy and
> pasting then it is okay.
Can we get whether a perf event is already in use directly from the
perf subsystem? There may be (or will be) other kernel users of
perf_event besides the NMI watchdog. Exposing that state from the perf
side would avoid coupling unrelated users through nmi_watchdog and
similar features.

> 
> Thanks,
> Ian
> 
> 
> > -Doug
> >

-- 
Jinchao

