Return-Path: <linuxppc-dev+bounces-9622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D45AE3133
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 19:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQJQM4srgz30VR;
	Mon, 23 Jun 2025 03:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750614027;
	cv=none; b=OaUeaSxIXi41JMO+ro0nAhh8/Plh+PFn7rq5rT3G12AZd+F7uIiURw2oSTUUvAJaxb/4lmuNYOegmQ7hpN7dhx5CRhR1DbnqvLs5eWs0NKsjwCNZPo8rSL6ZOdSTQaUPScql5nIz7fPtJ0O9WPr0dwc6WvZYq7fI+6bqztzRpJpE4Yc+EH5NCyEToOiFVO5FIuZbDPpTj6BNtF2xQxk8S48JrelMkELnddBcVf7IgGj5e8dby4yo6mX4+Tw4O2J1jpOGYH+JpzflI5kOGjU0//rq+mrJXwa6NRD1BFByEnve1plxd9/Ibv1icuqhi5uBk+vTZzB7T6K0DYwbk3+aHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750614027; c=relaxed/relaxed;
	bh=Fg9hmyFycp3ZDNw8sLAPP4qprGRUQKA22JNcWYg14/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bktr+Zoa6lArRHyDUykniSs3h0DMwn7A68xocOMSLnVC0RzLbOZ2WOhcOg/7Ehc+eBSXfXsSGPtI1dfqFxfwW745VI6zT5i25z0aNnGdzmiJCGCrOQZNujmcq+7kSxEYkeIkar+QCd3BNGzje9sSUy+C9tuNdEnojxRLkbrrwrI2VEV3zF11558EMenbr9U+r2SKPugZmNRlp5Xgm5bMKaWkqdohOcTvCx7ERo/RvPaiqMD7OqB1kN7FLRfgiXJJRiXyRB7z/EYoNAnl+1ME8lpisfEriYVCwWW/ll0OCJi1pA+bTczmV2XyAecEK2QR1bBLfP5f44Iaw8FpitGSAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VchkHIeI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VchkHIeI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQJQK4Qsgz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 03:40:24 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so6466281a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 10:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750614019; x=1751218819; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg9hmyFycp3ZDNw8sLAPP4qprGRUQKA22JNcWYg14/Y=;
        b=VchkHIeIOHJQe3b4Uo5cuLw1wjzBW1Q62Y9tbpm7P9j8gO6yCLbmcRjyAJ4N9Czv7b
         eJi9II4matxc4rwUZ78fUbchXmYrpj1f6r2vtSIFyk5TtzKvJ0Xx8uYUuou1xTu6L2Sh
         HYu8xLoa2N40KAXV9X+xyxm91IUKDgkeN/gVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750614019; x=1751218819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg9hmyFycp3ZDNw8sLAPP4qprGRUQKA22JNcWYg14/Y=;
        b=Og9VzTKzkOtsMidAQ1VK1vdLjOzUIuFB8kXhSw8H7DD4Dk864XsFotEmw8hJq5NudO
         uVjKzaa3d4kXdpr5QhcDu3gh0m8MvfwYVbd55H0mE4JA/qi0vwFsvBx0/vQs/UmomkQh
         bN6e4xPMmEx2qsHl65jYrKTf/k6Wp/2guWR3TzGDKF8Q/wwdWjb2mZTTJdGlwSWrb3Qq
         sG7plhCFDiahYwO1S+hBOLPovjDHR8wYhkZu28JweEUXq0vjc6AzTkLdy4CS1TiJcAjB
         lY2qQyXW6VB9HN3hEFE3G+I2N4KA9IDylLBsx8pF9YJbjbJnz05A4q7mExG5vCSbEzgR
         8ciw==
X-Forwarded-Encrypted: i=1; AJvYcCX2WlocmK0O3NCFTATUVRuGb2rFLqxK+NNv/w6rjzcGbBv6wdh4EGYgTdhKOXFJJ1pA9BEdfD5yyNYiKUE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkEsdYKT3/XE1R9bJyXOE/0t+wxATwMYyLsGN7MB8t7x0zKFBp
	Q4JS0CnzmYfb0M8/EYUhSlTRPpR9DUMzDdaPxggOSpbetogwGtwyCEsFRH9bNvpgYUEnRFKTPXq
	FSwPqGv8=
X-Gm-Gg: ASbGncvgxVE7+M9G/InvbC5bUreOA9oKPcHtgqYLLLt4mN3nY3Wm0wHxEWCsvhjlP4a
	RLQ1m+/wTBuUYUwdAjh7qa2u5bX3lyaaE+RiRtN85bNOh6VXcj8AJ6k0vBSOhwPnIj4dp8vhHZx
	enQgtWVYzsJEG00jSXaICud0o22bQS9gHWUsxYGLzELpkQ8w2CFtwE9/MtET5/CFlD7Lk0xmer1
	+fIfDs8YuATwvpMUdh4T04JOkiR00NungJFrcrGQGM/hw+ord004bBUgnvHemICBl61MJT3DVoF
	2R7zUMFT+ODrWraV16XLcECPJDKMIarqqZnFgL2+Dnh7sB+MnVBizZGw/fhBpUjmbMXME9uVSnZ
	KNgBpaBrxcga2Iv3xnclphT+lpvE3TvUdW2vL
X-Google-Smtp-Source: AGHT+IHzoeR5z6HYJHLy/1ZE8ucecd7mn55oFDEuibK/lcnfn3/PA/ZAHI56h8Q/rGq7kRhqVsb6aA==
X-Received: by 2002:a17:907:7fa3:b0:ad8:a329:b490 with SMTP id a640c23a62f3a-ae05794247emr967135766b.23.1750614019304;
        Sun, 22 Jun 2025 10:40:19 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408300dsm572238466b.95.2025.06.22.10.40.17
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 10:40:17 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so6466245a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 10:40:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZJ7XMpt2UupJKsJ9s2VoWxtVZ0nh7qDou9hXZSJ+cO2OB2Btzl2BLpd5NX1391r2CoEL27n0x3OeoceE=@lists.ozlabs.org
X-Received: by 2002:a05:6402:13cb:b0:600:1167:7333 with SMTP id
 4fb4d7f45d1cf-60a1ccb4175mr8817971a12.10.1750614017461; Sun, 22 Jun 2025
 10:40:17 -0700 (PDT)
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
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>
 <20250622181351.08141b50@pumpkin>
In-Reply-To: <20250622181351.08141b50@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jun 2025 10:40:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgvyNdkYHWfL5NxK=k1DCdtyuHCMFZsbQ5FyP3KNvDNPw@mail.gmail.com>
X-Gm-Features: AX0GCFvQX_rPJUp_TeA-MaZrJuZOHr7f0zzM4dAjSAouwLFkdoxMjL44_Wohcms
Message-ID: <CAHk-=wgvyNdkYHWfL5NxK=k1DCdtyuHCMFZsbQ5FyP3KNvDNPw@mail.gmail.com>
Subject: Re: [PATCH 5/5] powerpc: Implement masked user access
To: David Laight <david.laight.linux@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Andre Almeida <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 22 Jun 2025 at 10:13, David Laight <david.laight.linux@gmail.com> wrote:
>
> Not checking the size is slightly orthogonal.
> It really just depends on the accesses being 'reasonably sequential'.
> That is probably always true since access_ok() covers a single copy.

It is probably true in practice, but yeah, it's worth thinking about.
Particularly for various user level structure accesses, we do end up
often accessing the members individually and thus potentially out of
order, but as you say "reasonable sequential" is still true: the
accesses are within a reasonably small offset of each other.

And when we have potentially very big accesses with large offsets from
the beginning (ie things like read/write() calls), we do them
sequentially.

There *might* be odd ioctls and such that get offsets from user space,
though. So any conversion to using 'masked_user_access_begin()' needs
to have at least *some* thought and not be just a mindless conversion
from access_ok().

We have this same issue in access_ok() itself, and on x86-64 that does

  static inline bool __access_ok(const void __user *ptr, unsigned long size)
  {
        if (__builtin_constant_p(size <= PAGE_SIZE) && size <= PAGE_SIZE) {
                return valid_user_address(ptr);
        .. do the more careful one that actually uses the 'size' ...

so it turns access_ok() itself into just a simple single-ended
comparison with the starting address for small sizes, because we know
it's ok to overflow by a bit (because of how valid_user_address()
works on x86).

           Linus

