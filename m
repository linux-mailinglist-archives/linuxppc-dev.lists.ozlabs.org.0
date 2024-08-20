Return-Path: <linuxppc-dev+bounces-232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A06958B63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 17:32:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpD3r35whz2yDk;
	Wed, 21 Aug 2024 01:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=XD+REJ7p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpD3q2WHHz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:32:21 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso60797171fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724167934; x=1724772734; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=reG4/g7c03D2ee4fl6pmLF83MA+CK6ivPFyQdUf/2ns=;
        b=XD+REJ7pC9TLIKcwSEnXgsMm26beijpp0hBa0JkYjRwjkgy6Rbl6b8yY6ciReOuDJa
         xF6E1pNMzXM5/YlYqlGKYQUPwYzAyHH21mEya30Aiy8dfG8w2qDFXOQxG51bW7BkzS4v
         KCjzbig57UUQEBqKFXoYsl48PDF1YlWqhip70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167934; x=1724772734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reG4/g7c03D2ee4fl6pmLF83MA+CK6ivPFyQdUf/2ns=;
        b=s0MVQIIEtOP61rX897B8mEGAw2Gl/gCappW60aHNmTep8FDzUR0sJ7c87JQUrEg7hl
         /xW3R7xLNgFKmqonWBo6pg8Mo2FblqcxfdMzj9xYTaFY+pIHwJK6E/wweas0MstkNn3s
         4t8ixj3Gfby2aEKX2dt4RFt1/rc6CRFA0sVaefzcMxpBzAz48+NqbSThHFIVyapTWBh0
         tHO3xUNfT4LpEEBqJCymCI+5v8oDcgg/ZrDA2f5WI0c3N7SngYM+XW6XR0XrWUj8Scul
         r2i/F+5prpbkKz+QG1367Hrxzin/E5QkPovi9mLZ/ScE5muTl63EFZ2HIO+ph0O5uCGu
         nmXg==
X-Forwarded-Encrypted: i=1; AJvYcCWNrfjb3vVqooDW7J1kurUpxzJLitKCKOgQUFtE0JUrpamBUMlNpLm0D9g/JaJOAjjtqU64NxcGH40WlOLOrswhrVCllIiyXOex1yfBTA==
X-Gm-Message-State: AOJu0Yyqznh19Cm5x1T+ePz7pt8C6QoNHu0R0CFMKarzAaHJ5Oyg7AZ5
	1CwiXer/eDWzzqc9JBNbJavEAo7P5QexmTSl3yg8cjf85vU9R1gximJMZn4M1dkZN7pIAcZc1Bw
	Qb4u+ZA==
X-Google-Smtp-Source: AGHT+IFv4JKT7ctJKe3uySvIVoy3Uqg/OU0JL5bp/GKwHXTrCwf9c/Qbuvqr7h2zH7rsF9wq4RktWw==
X-Received: by 2002:a05:651c:222b:b0:2ef:2bb4:45d with SMTP id 38308e7fff4ca-2f3be574b15mr117920781fa.9.1724167933378;
        Tue, 20 Aug 2024 08:32:13 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc082f4dsm6833741a12.96.2024.08.20.08.32.11
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 08:32:11 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bec7ee6f44so5232682a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 08:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdRGVp5czxDMSGjSoQL9RXdMezmcBn6+aMtp7ozfZ7Dsdp7en+AxZChhtdZbGfVH3swHYgzqmEdIP57JwJKeSQAbfiQSHrVa6tgmyNhQ==
X-Received: by 2002:a05:6402:2710:b0:57c:c166:ba6 with SMTP id
 4fb4d7f45d1cf-5beca5c5750mr8152922a12.19.1724167931490; Tue, 20 Aug 2024
 08:32:11 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240812082605.743814-1-mpe@ellerman.id.au> <20240819185253.GA2333884@thelio-3990X>
 <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
 <20240819195120.GA1113263@thelio-3990X> <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
 <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com> <87y14rso9o.fsf@mail.lhotse>
In-Reply-To: <87y14rso9o.fsf@mail.lhotse>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Aug 2024 08:31:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiS7PMtL6oR6acNgWZr0NN4Ax4PQD_CYJKCiKS0mT=Z7A@mail.gmail.com>
Message-ID: <CAHk-=wiS7PMtL6oR6acNgWZr0NN4Ax4PQD_CYJKCiKS0mT=Z7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@google.com, Liam.Howlett@oracle.com, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, linux-um@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon <linux-hexagon@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug 2024 at 23:26, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> > +static struct vm_special_mapping vdso_mapping = {
> > +     .name = "[vdso]",
> > +     .pages = syscall_pages;
>                               ^
>                               should be ,

Ack. Changed here locally. But I assume you also don't actually test sh...

It would be good to get acks from the architectures that still used
the legacy interface.

              Linus

