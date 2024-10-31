Return-Path: <linuxppc-dev+bounces-2752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A19B83E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 21:00:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfZcR5lrtz2y1j;
	Fri,  1 Nov 2024 07:00:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730404855;
	cv=none; b=foE+rB4bh2lytStFevxK9H/gCq+aVyr3JFZusTnUAX/PIyuYiqJfSvsX+jp9wNqvRvKGULEECyFutTERVsG715oSBeZJYH/xVQQvJ1mB4645ZRgjHAQp2I6hYmpqE6nfrxO4dpH9yoE541pTik1SEWf5P1BUwzZLxmTtdC4+eKiAS7CILLxrltl3AdNHKiHeYsc39PghpMxl1IRuXKHg36Ha43tr4pXz3rzoCd4XaKhp9EHF5NDwyeRwhGqyGgKXP0p7660SgAgVmomFrqwBh9EXlzU6Fydm0MpXmHvpkCzLy8GT+qTw1yKDQHdZv1ehG4FfiDF+PTzlpw9po0RALw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730404855; c=relaxed/relaxed;
	bh=jkl3TjMzcf3dryOCaAILRFpWIEyfiit3GjcJM3g5SKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvFfkYE94h/9yVLXPbdFCyquRLS+ypqVZh6jtzOTlkLTfRi6H7wfIYKpS7y6A9TX4z4HgZTK2nplD/k3jJFwhwhNcsTgjWg4+A0TQqHnviP+axCpmTSUP9JpAFzi+ZPrlN3Zw5KroFDARuxMWIrGrwyGVrm8x7n+x9l9qPY1OWeCQ+uUxt3a+XH6hgJdNmN0ZS4aEY/59OIsdl+6tM6g33n9xeCxcp8GE/0F93BsRi/rUC0BOqspxzI5m4Hr5I+i4mD3ngxuesAk+YsPPaGonUHOz1l2k/rcIJM7CYsIN3O4PhgT5BOVJY9i1HV0HERIVau4YlGZxJQoTg0JYVgDAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VBrlzume; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VBrlzume;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfZcP2fHSz2y0K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 07:00:51 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e66ba398so989e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 13:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730404841; x=1731009641; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jkl3TjMzcf3dryOCaAILRFpWIEyfiit3GjcJM3g5SKw=;
        b=VBrlzume7PPkNY+CAPI+3T2YBcZdNOc7ob0bBkPDElv2FZSJFEvQ2CBJkzf09C8QTm
         1O23msEqC6qDZ02P2qkPIiOmTTMhDyjdHvCDvJ6D6ubLPGaDCf7hEE39bJtkRuiCCQp3
         Vh9DCkhoUsJDmwKcV+cCdkceCB1O4ybTWy4ySJQM04cWOgbyytoZ35mFT6Nm37I4fpfN
         fgzQxxxsLwVma2vlky5bOz4G/mS1gZN0TdjAO4JR/0QljoK82vvl9I0bjJ9ApTVOGlF+
         IhWnNQc/I68z2FRWtWFjXT33AR+WNTfrnFpzkRUYaTYiV+AjRyc07lOnwg2kQupKWmq1
         iqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404841; x=1731009641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkl3TjMzcf3dryOCaAILRFpWIEyfiit3GjcJM3g5SKw=;
        b=d7HrXLN8o7lT0BlmcTBipNLxhpDU7Ut3xMxmkGHQrp9AbeAsz7BXqPXvcrUMlXyDo+
         8cvAiTU7lUtR9+vZFieyLripg1LI+kR+gFajZ8MY2IuivIxg+xbgIyTxsBdUJi1Y7vSk
         ZmtA4A+E6m1sBHFbJXofmyQbWsmSuKOdrzSFr1vIgy8S0kpqXr7liAROquGxq8Y/JlBj
         6L8W/FqkluQNc+xjWSCDjjBGmlNP+ozL5yyjazHiEDZ75hyfMTPcQdPFcGoaDOKmC8/M
         maD7OGhfi88/WhJ5lm3LToeEyT7/mQGJ+ZVCJ+gUzG91qzRoT0iAyxznWEPQFme4gMoV
         AUJA==
X-Forwarded-Encrypted: i=1; AJvYcCUhdZax4yHc3jaHqTgJ1JD/lb1D+1YswdJKDxuWCQRKCyFuKlGISY9Ix7rd6BOY248A/i3WUIoUj5QJrZ0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcBjrkZCNGercUXQ7K1fXVqJnnO7WmAoj/thZWIdn/gfQb3ZAg
	vuS1/qmMeKwBLZLYPVpNoSUJ+KlFBcX3DbFVUenoRncRiTA57joG7sjCIDM93yKkbeUbDqamAi7
	ise0xjjVU0DQUYWleWY33Pxus/zfnAk4m9qXd
X-Gm-Gg: ASbGnctM0A8WFj0PgmawxGc8w9jKpGPE2dB49HV59HwUUY92NGRAK6bkUPBDGYQwU1h
	MU3yqyQvQ0h8IXFPjDX8cbLa001WSB9oibkBzTMja12StjcK7svQfQWokjMar4w==
X-Google-Smtp-Source: AGHT+IEW2y5lzn/VGPepBdOsO+AzXleOvvzprjMKDOQXm2ENavWPeRp4bswreZ8MVte2QFNa89v1fS8lAyebQn8YFdc=
X-Received: by 2002:a05:6512:4024:b0:53b:5ae5:a9c8 with SMTP id
 2adb3069b0e04-53c7bb8e9f5mr385129e87.7.1730404840475; Thu, 31 Oct 2024
 13:00:40 -0700 (PDT)
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
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com> <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
In-Reply-To: <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 31 Oct 2024 13:00:28 -0700
Message-ID: <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> The question is, if only extended moversions are used, what new tooling
> requirements are there? Can you test using only extended modversions?
>
>   Luis

I'm not sure precisely what you're asking for. Do you want:
1. A kconfig that suppresses the emission of today's MODVERSIONS
format? This would be fairly easy to do, but I was leaving it enabled
for compatibility's sake, at least until extended modversions become
more common. This way existing `kmod` tools and kernels would continue
to be able to load new-style modules.
2. libkmod support for parsing the new format? I can do that fairly
easily too, but wanted the format actually decided on and accepted
before I started modifying things that read modversions.
3. Something else? Maybe I'm not understanding your comment?

