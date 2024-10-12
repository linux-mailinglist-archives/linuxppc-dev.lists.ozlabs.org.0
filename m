Return-Path: <linuxppc-dev+bounces-2157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75F99B5E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 17:44:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQnqN5DXZz2yV3;
	Sun, 13 Oct 2024 02:44:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728747872;
	cv=none; b=Q+igMEmqoR9O/BI48LuIejTSpVS9IvYrWPU6FJDYIYG3cYIp+BN+dw3XeJJpPSCZCTkjxA1cYKjqSZcz7ESOOC4SWpayCx9gIrQuC9H2mqePaweeLttZoPy0vw1igNtQ3xm1ijfT0qXL8n9IisTcaDnbJAQ+v20o3Br+FEXrgMIAxgNNVm9A6DwXPly+titmaRYdQ/3QRD+0T5ikJrXevgbDpnfstvsy3XA0wwjG7mxQ5GHhVC0OPaKeIXELNvOe8ze8+RGoAMkb7Tdh4TujUd1k2vLDxUNgjTIM9yt6uNHMXhM/sgQ9yp9+hXYdRdSSOvnHMQXMMaKGORKXMt9Jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728747872; c=relaxed/relaxed;
	bh=lYsvRdbiK1Fgpy/a4U8EKE9Z+f9ES1xNnSEqwgc2jxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdGKTXDk++5QrWOPTDk/bgsQhHM/2ktO42M+f8Qb/tVs1jflJgg1MvpBFj3DN5RJwSzRCpCOpXeY4mf9R5ZTSi8ufDdY1hiUw5r2oTGp6OBZYNjj9nwfbmoBWEstlV4PwRMw0qeKJTnEY+d4nbXwbb7w+ped+nmmROEcdU4Q815lgVl+9YbhAtOYNbcVQ6NfOP/5LfW1KmSYthw5vryTut4fT0lATQzDzhCFuoYtPfRZ9iUnsqi5692vBIMBig+hEVjrdmZeKfjnjDlIvasy1kQxVh3VQnadbHZm+/hX7/nBMwKj/m53JhhaByKCZmRg0DQDIckcKBx4bJOo1yvbZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GXP7ECWr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GXP7ECWr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQnqL2tzyz2yTH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 02:44:29 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c9625cfe4dso630011a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728747862; x=1729352662; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lYsvRdbiK1Fgpy/a4U8EKE9Z+f9ES1xNnSEqwgc2jxU=;
        b=GXP7ECWrATC28wnnajLpVvOTUxdWD2j9ZzWAndeKXUYVMJJ/fYWybEN2s40gYxEyOv
         +JAraRdRhU+ZcxiYAHb6F7MkEtZebpBzVVh2go3eOu3ZihnTduOC0AGrU0nowJLBlOTp
         0k6tZQExb/05nahoK1wejB4N+P7BZMwjOa5Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728747862; x=1729352662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYsvRdbiK1Fgpy/a4U8EKE9Z+f9ES1xNnSEqwgc2jxU=;
        b=tHh+oOxJUWv5zrkL9QaFl+t+tade3+3Zy+ZGXuA+oNKl3vIvWKNtiL/KxyKTD3jH8I
         1aQBlMLUzETAbH1SFMjxa79dtPGc1IF1uPeb+upKOKbkgSAWotsB+2T9Zs5pCZ6NQoOw
         jOgnF1EcyrKHfntIAiAndnFVkhXpx2OKVXVNCNjAUraOr/lnfxT2m3ZbygRntl5K9+96
         OP0WEO1hcmBzO15LTi9BCTXZCg8RwxlpbYvnOUAgqQ3XTf9pAjJF+LeJSMByqbIOBmXy
         DTatcGMvLm4DDA4T2AhZS34V/LS1TfE3XokwAVcp3eG82dbUmRN69HhDfTisWsCVS7AI
         tPLw==
X-Forwarded-Encrypted: i=1; AJvYcCXYipCYfFXsbQDQvHuyttq3nyznN5Ov9g3OAZOREZbHHaqyTIm12rsjUpl0mkIjORvZ5Q5d7U0limuyZLM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxAxGTXG528QgsX3J5dAO+2AROFECcgk+hqci5jBZ8RxxMUxWOi
	vSLXWP81OPoBMYjT+uiQysMDiNbswi0k7ZSJ3z99igKuviB3pWbneJqcaBENZ9Dl0FQvGgr1Y4Z
	okfY=
X-Google-Smtp-Source: AGHT+IEBp748aXg9EjTaBSCuejMWTomUbOZCDdmolu68RMLyRk68HZPEqQU/Zb9JkZcvxRLmLOUAAQ==
X-Received: by 2002:a05:6402:35d3:b0:5c8:bb09:b417 with SMTP id 4fb4d7f45d1cf-5c95aae07bdmr1791300a12.0.1728747862187;
        Sat, 12 Oct 2024 08:44:22 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937260c5esm2984599a12.76.2024.10.12.08.44.20
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 08:44:20 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a99650da839so500274366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 08:44:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoojgugD6sMozma4/IOStMQvTqj76R73H2p9b9hwUolYdh+DOyNJ2a/CPeVUw+WpZlAyg6KVg4dzYnVkI=@lists.ozlabs.org
X-Received: by 2002:a17:907:3e05:b0:a99:5773:3612 with SMTP id
 a640c23a62f3a-a99e3cb6675mr278287766b.36.1728747860332; Sat, 12 Oct 2024
 08:44:20 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
In-Reply-To: <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 12 Oct 2024 08:44:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
Message-ID: <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 12 Oct 2024 at 01:49, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> You do realise mask_user_address() is unsafe under speculation on AMD
> systems?

That had *better* not be true.

> Had the mask_user_address() patch been put for review, this feedback
> would have been given then.

That's BS.

Why? Look at commit b19b74bc99b1 ("x86/mm: Rework address range check
in get_user() and put_user()").

This mask_user_address() thing is how we've been doing a regular
get/put_user() for the last 18 months. It's *exactly* the same
pattern:

        mov %rax, %rdx
        sar $63, %rdx
        or %rdx, %rax

ie we saturate the sign bit.

> AMD needs to arrange for bit 47 (bit 58 with LA57) to be the one
> saturated by shifting, not bit 63.
>
> As it stands, you're reintroducing the very problem barrier_nospec() was
> introduced to mitigate.

If that's true, we have much bigger issues. And it has nothing to do
with the new address masking macro, that just exposed existing logic.

                  Linus

