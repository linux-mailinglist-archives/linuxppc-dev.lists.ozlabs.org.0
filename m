Return-Path: <linuxppc-dev+bounces-12261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469EB58C05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 04:50:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQmbp5lhgz301G;
	Tue, 16 Sep 2025 12:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757991030;
	cv=none; b=PTh3z0BrFcdE21yNVeif0/T2IUtcbOPKdumSrd3Tv9FhQrS82DecfCXw5kPDUmLwL9fhdAqd6SNsMsKISPywio7P0fqhyc5YEly+O9j7SdZ/j20PbR3VbpZBKhm9ZvSm/j0UBn+N80jFWuG8vlydg4OV3/+Wo4+mZ87pz77VduZ5FkX45SfE/EZPwG0fFSyb8IdBwzAriqMs1LRfy0c+qum82MWFGu2Uilcfwl3EjzWcx/jcvgzYfg4YfMAdOfyjw56vKzgvfHaDD/G/onDa/a1Or/G+emsVtSFTx7rD4Bbrn4X/N8e4yr2thxBr3+zpxcLu81dKBjJp1rw0G3hz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757991030; c=relaxed/relaxed;
	bh=0BZScZqwkLp8TBGKyHYDvCnuDY5A4//FIvL5EisHnTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSgTpcEidYmS6ZNR86T/AlxFnroaZohvlFuhlPYZP6eGYAsm2BN0VexEF9aXs/wS8JldA/MaS+Db2hnGjEbQ2BIOmcGGYbu6NlTUoo+sdx+zTKSy7eLpfzuH27bj244d0TmR9trjN35USPaaMcH+//Kx82RK1dqemXTYXdq3kFQrldZkdQUzAg5I5Kn2sTxt79sW449FeQO+honqB6GJDsnEwPAPYHoHnXyoYbaqaQoXAPNGTiT1n1MVkdNBuyDMWXseQ45plPq7oyx15n2ts+71nDVEUVw32HTUi+SYNb+TsEHswIEQzWbQnr8pbQ6evL4RKHTx4sFqffL6dNDCnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K/0GXMrE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K/0GXMrE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQmbn3J2Jz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 12:50:28 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-265abad93bfso87455ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 19:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757991026; x=1758595826; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BZScZqwkLp8TBGKyHYDvCnuDY5A4//FIvL5EisHnTk=;
        b=K/0GXMrEO/FRuP0XD1tEOFNRuBpKtbAwDXmJqNgID9mJYR9w8olg03xBcS5ukQjoJ4
         3JApY8OxXAjWsvG4tHJI5MAvo8hQPgQGxVcKoIC36tySPyNBzVm3u7ORCwuTqXZUzqHn
         KfWls1X3c+M2D74SRMZUgu0/RJTH/tX3rL27BRAegD8Ye0yi521mqH69L0H+Ma5+ujSq
         Y6LSOCXVpf8mIUTbCtF4tc1Yw/+itLKBEHnbQ/XwnPYDHDKWLvNnHTnoD6YsiaD+TWlK
         cbqYNlJwuHYxWYIgmpdu/o9l2r6k44Sd8z7wnq1w6JxiEkFeFZdoWMoXo0LO8wyawVN9
         aaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757991026; x=1758595826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BZScZqwkLp8TBGKyHYDvCnuDY5A4//FIvL5EisHnTk=;
        b=X7XkpRaFLAEY1QqszQWclBJCGQ2KNi/1Sw+0/w7NyH26zRn2jGfrXtCa8tsSBiePSM
         22hv4cvufbkfj8tgGs5HIg/p1OKeQBI0DbmmWQ73T3f0NvO1bCAHKZhM4odxirdaKv7k
         3+ek32DgAIWmrif9UZzSmu3RAFbfHDfz8PEs2hEBvuUglgSs8Cq9YHnJfhBbGB02g2SU
         bZj9GMKL4XaNs9IHn9i1bBe9i08+jJ8mwOR10d9/yw4y4SRko6UvrugZ2iT3tAYXwkEF
         1Bf6tnOBdhCfbHwyyVsibAIS1mT8xpkvlXCKdbm3cuzi7wgTO21wOAkLunTAhK+a38a/
         FuTg==
X-Forwarded-Encrypted: i=1; AJvYcCVhBf/RWW0dmA1h6uRjhFG9pjzCxPayYAa7VO8LF5tzlQEBALi9YtfSCjQ4cVpYqIg5rYSigcMQk1BYH04=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxoTiHjT1cGrR0fY9lqahTZCdMfFdYTm4hfqwwYKFT5IKvJUqBz
	4DwNHtydTluMMiw1LIeigN7708xMMGPPec0S0ZHnNOQookNZWSnyd7clO7IJyfGY0j/ZVEwOCLj
	+zws5sGqJegCtaMK6vbKHdhPOxn8KRZ5DWCwTPTXW
X-Gm-Gg: ASbGncuNtk9QhMBDxLFIWclc04TD5NVQViJklEt+oU/wlKjAvG9HAzGmQhnbb+YvDPg
	yjkXay/baV6JbLK9TztvWgMVlEDwHHcOt7mL0MtlrIv1+mSR6kDx2W81bWH3+S2LbL1YDN3rk2I
	ORfDcoqRGjbC15wXasu2c5/Mn1x+Hk1pX+dz4pR915JdqEszP6GjaBn2XA61yoVvVsDs9j71Qz8
	TgOTvNyaFw4O1s=
X-Google-Smtp-Source: AGHT+IFeyVTW5EhpdU5hsvYCz6r7UZGqUVYyh/d/fgXFv2LFAjtq9iQbsFb9hepaT779jpkPhC9wzFom13aDSrCRIGk=
X-Received: by 2002:a17:902:d2c1:b0:266:b8a2:f605 with SMTP id
 d9443c01a7336-267c9e63015mr1730905ad.3.1757991026132; Mon, 15 Sep 2025
 19:50:26 -0700 (PDT)
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
 <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com> <7366f87a-1924-4dac-8945-389e6674213f@gmail.com>
In-Reply-To: <7366f87a-1924-4dac-8945-389e6674213f@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 15 Sep 2025 19:50:15 -0700
X-Gm-Features: Ac12FXwGtpNoLqYtyQg6lqv50KBS7uhzhnYxEQJsAkff9-AdgmNoT3fws4BF21Q
Message-ID: <CAP-5=fUs7WPQ1U-iXzZQDwa5Bm0Fg11Riw20AFnDDOScoY6BnA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: remove HARDLOCKUP_DETECTOR_PERF
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, kees@kernel.org, masahiroy@kernel.org, 
	aliceryhl@google.com, ojeda@kernel.org, thomas.weissschuh@linutronix.de, 
	xur@google.com, ruanjinjie@huawei.com, gshan@redhat.com, maz@kernel.org, 
	suzuki.poulose@arm.com, zhanjie9@hisilicon.com, yangyicong@hisilicon.com, 
	gautam@linux.ibm.com, arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, 
	lihuafei1@huawei.com, coxu@redhat.com, jpoimboe@kernel.org, 
	yaozhenguo1@gmail.com, luogengkun@huaweicloud.com, max.kellermann@ionos.com, 
	tj@kernel.org, yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 6:47=E2=80=AFPM Jinchao Wang <wangjinchao600@gmail.=
com> wrote:
> Should we support both modularization and changing the backend after
> boot, so that the user has the choice?

Having both together and then being able to choose one or the other
sounds like the ideal solution. An issue is that
/proc/sys/kernel/nmi_watchdog is used to dynamically enable/disable
both watchdogs and presumably renaming it for the buddy could cause
issues in user code.

There can be unexpected consequences of the buddy watchdog, as the NMI
perf event goes away there can be extra cost in setting up the first
event such as allocating buffers for the PMU. While enabling the NMI
watchdog to avoid this cost is kind of odd, I think users would be
glad of a workaround for what may be perceived as a regression.

Thanks,
Ian

