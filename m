Return-Path: <linuxppc-dev+bounces-6203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E96A367C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 22:47:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvlyK0zD6z2xfR;
	Sat, 15 Feb 2025 08:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739569641;
	cv=none; b=oxCpLYmtuM6k/j30pKuiZCzKK1nEh5GBDM6TezpU1BrBW1sLJkw1WwDTEc/emQlKWg+l5XNwXKmDqLJ9883n1KxsmMGFS1CdMzEVAAVRsV3A1FtlBZJ/EukMX5hZQ6alUINriigRpGogrzSQ2dKUfuB+hlqSIka9qbG6Qy1sP0Sm0Cn4NRDMlCeEfB7xByQ9bZuxYpcZJI/tb11F4eVyCFWzQ2W3V59iz4YFhpBgk+RriX/V9DytYaCbwC1GsCgi7JSgyDVWGIqLzscl18PJIzY22uwPu1ccxXpfCwUi2II0fuILIvxTp1HfSwp0lu2zrZkAJBtMQ5dRRZCxt4FESA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739569641; c=relaxed/relaxed;
	bh=sPrHjyB7ZPEKXqDVTRDLXSWkXWDHoJbDt80UqOOKgaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZsuFvNTj3jeESiL9koaZwr1DJbRi1Z4MwgRbP07K3SI6iA7QvpfqGMAnoi+yhrAgpEn/fU79dta1M7nVbRyvjijVCjEJQcvFdsaMajlZ/+aSXWpp3Fpc2RVYyKb4A4YHkR0kvBr4sy5ADF2KPgP4Q3pp/QA7Yv9oaVCNjOF9mkzovsFJZGF3hfMnWeyw7Zc8G1Zox8z2kS+kX8Nhu92sCDrAKFA+bx16H0saqYFeqG4Gk8BJeyWd0FEUYgI5FtxlfqNjiLBhCd/hnGaFTKWSiBMtMYTLJN5FRH4V2sArR8uQBTNnHkIC9DS74GLyXsLEcEVqij15EnFfg9ffjRgkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; dkim=pass (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=HpUymG9x; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=mail@rasmusvillemoes.dk; receiver=lists.ozlabs.org) smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=HpUymG9x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=mail@rasmusvillemoes.dk; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvlyG6Hvqz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 08:47:17 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso936753e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1739569632; x=1740174432; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPrHjyB7ZPEKXqDVTRDLXSWkXWDHoJbDt80UqOOKgaQ=;
        b=HpUymG9xYIZgCoketqkFykdbu7mZwlxjVHn/pl4YxprjOxp8vYzYzAxqIjLwq9GYS6
         jr5yOSFQuM+4Jlul+Xl9ie0nqJSelHtEptMeATT+KaNmZAdxKP9+F8dkpE+LMCSW1GWX
         t7X1kzzWbDH2sdTNKjBETUqrWm4/e0zpT01zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569632; x=1740174432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPrHjyB7ZPEKXqDVTRDLXSWkXWDHoJbDt80UqOOKgaQ=;
        b=nXD2D0WV2EP9COm/yjQZrpykCkLPCWN48F/mF6gTas0aAal5iada8cUWphXJi6tlep
         Z9yXEA5GvSiBukKhmZUERM7e+xRlz0MuMnh/bGyB9ni11r6lK2SmMRYAg0xXm1k9uc4E
         IWUIdTbGFCvtIVUYqalIRYuDXfpE2QzaQDN/AOwF7GhB69onTh3doINjcudh2jjBI8M1
         bWfwxX74DqiC1xNUbBgqacJACsDZrIIRO0qg2XeSBs50qA6eB8mUjGJ/6eQsJIAhRbFx
         Cd0JyNdgf9rYkeeLq407xYRbtyAmhdSU4b/URqmR1IJxyLAfd+wmI4ezUsMqKxhHtmQQ
         r2cw==
X-Forwarded-Encrypted: i=1; AJvYcCX4W4feCkZKPDBVXYoEr63kUtM6tBjs4Y4Egu7dQF8zvSi00V+B3I6Jk5SxnKpde83xf1rXH75Q/4E+4zw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpQO0O50zh8Gj1akBVEk/TGUmvF2YaKEQxHvMt/4sSIEGQFwkd
	ZRYks0Qx+x4E3825vmx5Myx1l2B4zqWp2Fj1QF9QYBpJJeS/yWv/0a4+REPso38qmb5vGZMl6vF
	PGcLesPRVHFww0Pj8kWwAY4ZbAk6uqmegPzPtHQ==
X-Gm-Gg: ASbGncuR4hIb7h30L6w3fGpRsgkikplwCDsOBH+qEPTgXBtpP/+Cky4dGCSvqp6MZMS
	BKkBDU/OGWWNCCLjJT8QtqxplOlv/6OLP1afDqImMC5FYBIRg0o/Kk+QdfDs4AFCvWpHTsx5r
X-Google-Smtp-Source: AGHT+IGZfHJGA1kl2ksp+VX8NZVZ/NtQgxO8KN5MDCBG/nThtsVDl27BgELuGsdF1JJSR2FyzMBbA6+syzVK0LhHZwU=
X-Received: by 2002:a05:6512:6c6:b0:545:2b68:936e with SMTP id
 2adb3069b0e04-5452fe5c675mr368049e87.25.1739569632059; Fri, 14 Feb 2025
 13:47:12 -0800 (PST)
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
References: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
 <Z69isDf_6Vy8gGcS@pathway.suse.cz> <Z69oxhkUzTfJ6YKi@smile.fi.intel.com> <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com>
In-Reply-To: <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 14 Feb 2025 22:47:01 +0100
X-Gm-Features: AWEUYZliySt2EpIgG7ZYOAvFUg1UiYEq1P2CaYZ90n2fK0WzUtLwjUi2YaJ10pw
Message-ID: <CAKwiHFjnY-c01rvkzNRz=h=L-AxRMyUtp2G0b17akF82tAOHQg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
To: Tamir Duberstein <tamird@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 14 Feb 2025 at 17:53, Tamir Duberstein <tamird@gmail.com> wrote:
>
> On Fri, Feb 14, 2025 at 11:02=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Feb 14, 2025 at 04:35:12PM +0100, Petr Mladek wrote:

> > > I have just quickly tested this before leaving for a week.
> > > And I am fine with the result.
> >

Thanks, Petr, for demonstrating how it looks in a failure case.

> > Seems reasonable to me. But I want a consensus with Rasmus.
>
> I have a local v4 where I've added the same enhancement as the scanf
> patches so that assertions log the line in the top-level test.
>
> I'll wait for Rasmus' reply before sending.

I think all my concerns are addressed, with the lines printed in case
of error telling what is wrong and not that memcmp() evaluating to 1
instead of 0, and with the final free-form comment including that "ran
448 tests". If you feel that word is confusing when there's
"obviously" only 28 "test" being done, feel free to change that to
"did 448 checks" or "did 448 individual checks" any other better
wording.

Rasmus

