Return-Path: <linuxppc-dev+bounces-12241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A834B5812A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQTtg6dyBz3f5M;
	Tue, 16 Sep 2025 01:47:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757951243;
	cv=none; b=MY4AlyBh+sS4UhPgXJpbz6Bd7V6oscZFydoaC9Fi5SNrEHnrshDL9KutloUO6HYJ82VpF8s84sO5OIuhtSH5pxOPK6UUPFmBgVbJ/CXKNvZk3U2KdlsiEq4AVPblu2/aH+UQDJtomW6KAgWlAlMHZS3RCbIUH7pU+zT1D3nLhTQ8WBdLjMYcSzkpRjGl5O0HUOlHQM0qpboIE6RLC2P/q+6ZYWZk/n72Q3lhYK4HBNyI5w+6Nxn1bAzrLO/1ePKd1IZeIpa1VnqRKcQoeWrFU26ZSqnaN28/wFDml4TGjR7SEOaOAry4TGQER6564G1adbQVb+gm6QF82NJLnG9yLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757951243; c=relaxed/relaxed;
	bh=sF9n47OKYupJ+YpHurEgKB2LmOn4YAEsHDSQn4dI9Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ij49aD7brskjnfN9VISugBLpKkQEXu4+pWiXdct5LAhf2z5IpN5ismzNpOPT10mm0K6LvqzLQWzoy5tfkx6k0kyTfHGoXr3DEGFLMfnxC4lS8NaULQ94TlZO462NLUGIL4wDZUTmj7wb2DWtTtdWKGUNaS31ZKdaXcsOHZl4Tzfv5ruQ/54J0Etd3jGz3pwa1YFCE6Iff6C2vAxVBwNyZyhkOvJkNV9E071TwvPy++H3wkavGmICMCUnKkN3R+6+IZTZOer4ovItVujTIdFxl/Wf6JiXDTMObyobWMEyzWwi6C5i7q31LRsFiOHnoDU1o/x9/9HMZlnaHDH0uv3R7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AdYqaKAH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AdYqaKAH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQTtf5XGwz3f1P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:47:22 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-765936cbdfeso40680246d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757951238; x=1758556038; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF9n47OKYupJ+YpHurEgKB2LmOn4YAEsHDSQn4dI9Aw=;
        b=AdYqaKAHVKK0DA4Dj9hRF5bt7i3ApadwxuHrEUJAumS8bnkKLP8G5EfpK2hDe9fsAx
         Z0aXxAszFJOvkiTnozqqdbdlSN27aYg6+sc1OtMYtfpbYtzp6CBc3QeYDfW09uzmv+AA
         PuV83AmfONokV2mK/V7B7cQ5vN/HMcSpYjTpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757951238; x=1758556038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF9n47OKYupJ+YpHurEgKB2LmOn4YAEsHDSQn4dI9Aw=;
        b=eypkAQk1x+wUehVlDq+xYco7m+dyBXIRFD3QSI471MbNQknRsRx2OVcJLkgZt0LVde
         YpfpYtXnLq1ERTYrPYgRPopC0T6cohbLXNJPtMZYZ/sgO5IsOE9Z8l9Gm+/L5vEstVGw
         9vT4pSAC8Gh+EXRF3LlkL3fdLPFPHWeHjKEeIac0R/+7Y/MM2NHQaa4slEHl8FW3l+Qm
         ZhbDcn212KCLUpeTtN3TZkOEnExTZxkyhE5uICzAS50YTbyLapjZwK6n26MDmKuICMdO
         GG4Xm8n6IZS5WaQR0DUeCRmoGadwgPXcpqvdGlQA/9DEADL7ZYGn3cjES4Fliduh7SBU
         rxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCzVu3ZgviP7+IVIHGd9rWmcOXx6cvPhSh92Ionb+yR9zGQS1a91tDBs2Joe3e5zEim2sk0Lb+RlJDyM0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw23UI2CEZyGCI9580BbJbg+nfx+MNKkFXfEEX6ZL00e+f6lcfR
	aOHf9bvuaxrraQVnzTVUS2lWIWebaxzuHDOcF22vM1IQkta6FNwfcAx7+bLBcttB/XR5x1pmPcj
	92Pw=
X-Gm-Gg: ASbGncs3dSUaEOrf4/yNSqjw7u58XzPSTLvss9ljjMKIxhwmF+1Ze85NB36YGfOkcwa
	ywh1SWDCLbwpApFtiA9c3bXSsWoWTXLDsUevSVOlMHeIw7uf2NRbIVYbwRNssjE6SrU6FIMicEJ
	YfX6e0WXR6DoOGGN3yFwIi4oe7dBZ4QppiNbszNQk5sEuKU9K+GgsVNjtAF7CCzT+T1lSMkHsZ7
	WbNN3ZOaRKEuHcksoupUEBbTh+tjSvHxFXyGjsZn5/tQ/TY0K0M/FigWFhg1j9GOyw+OVJ8vJMo
	039370X177ZPPCENorhPkn4zmvtGDZ9JP0ISzBY0HJONo7tSlJ9WSnQSvr5/7LPQ3wAhArcNAFm
	SviSBhTQHyS0VllGPY5wf6FyIAoiVoPzreC+/beB+o83kt8LZ6zQ4HOCbjeYRg/sVRA==
X-Google-Smtp-Source: AGHT+IHqkm1BfpPrQZ2DwOFBZ8W7FPRIf76A6Rmw7EJ6k32K2fSnVaUTzOhy6uwuaUarXbOfcPdQDw==
X-Received: by 2002:a05:6214:f2e:b0:72b:5e10:55bb with SMTP id 6a1803df08f44-767c3772ce3mr155176646d6.48.1757951238350;
        Mon, 15 Sep 2025 08:47:18 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-77ef70bcc4esm27582876d6.41.2025.09.15.08.47.17
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 08:47:18 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-826fe3b3e2cso195154585a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 08:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJhyLygY6iZL2JXep4ZreAWG7SIM2uLtExOpniFIqgUy1PfoAkQWFVB9t5R0GtRjJTZvcMHMlekgvpnK8=@lists.ozlabs.org
X-Received: by 2002:a17:902:e80c:b0:264:ee2:c3f5 with SMTP id
 d9443c01a7336-2640ee2d03bmr82023175ad.19.1757950933588; Mon, 15 Sep 2025
 08:42:13 -0700 (PDT)
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
References: <20250915035355.10846-1-cuiyunhui@bytedance.com>
 <aMfpwYPX6_i6ROOY@willie-the-truck> <20250915103506.GA3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250915103506.GA3245006@noisy.programming.kicks-ass.net>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Sep 2025 08:42:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com>
X-Gm-Features: Ac12FXzAoIBOvB7DdouVYRPtMAe3U5Dl3CUX53Fx6WzMzB918sSg5cv2FslrCvs
Message-ID: <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com>
Subject: Re: [PATCH] watchdog: remove HARDLOCKUP_DETECTOR_PERF
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, kees@kernel.org, 
	masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org, 
	thomas.weissschuh@linutronix.de, xur@google.com, ruanjinjie@huawei.com, 
	gshan@redhat.com, maz@kernel.org, suzuki.poulose@arm.com, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, gautam@linux.ibm.com, 
	arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com, 
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com, 
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org, 
	wangjinchao600@gmail.com, yury.norov@gmail.com, thorsten.blum@linux.dev, 
	x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Mon, Sep 15, 2025 at 3:35=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Sep 15, 2025 at 11:26:09AM +0100, Will Deacon wrote:
>
> >   | If all CPUs are hard locked up at the same time the buddy system
> >   | can't detect it.
> >
> > Ok, so why is that limitation acceptable? It looks to me like you're
> > removing useful functionality.
>
> Yeah, this. I've run into this case waaay too many times to think it
> reasonable to remove the perf/NMI based lockup detector.

I am a bit curious how this comes to be in cases where you've seen it.
What causes all CPUs to be stuck looping all with interrupts disabled
(but still able to execute NMIs)? Certainly one can come up with a
synthetic way to make that happen, but I would imagine it to be
exceedingly rare in real life. Maybe all CPUs are deadlocked waiting
on spinlocks or something? There shouldn't be a lot of other reasons
that all CPUs should be stuck indefinitely with interrupts disabled...
If that's what's happening, (just spitballing) I wonder if hooking
into the slowpath of spinlocks to look for lockups would help? Maybe
every 10000 failures to acquire the spinlock we check for a lockup?
Obviously you could still come up with synthetic ways to make a
non-caught watchdog, but hopefully in those types of cases we can at
least reset the device with a hardware watchdog?

Overall the issue is that it's really awkward to have both types of
lockup detectors, especially since you've got to pick at compile time.
The perf lockup detector has a pile of things that make it pretty
awkward and it seems like people have been toward the buddy detector
because of this...

-Doug

