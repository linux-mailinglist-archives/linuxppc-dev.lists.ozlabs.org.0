Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEB74BEF5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:24:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=D3RX6rp3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0Z22RJ7z3bV3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:24:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=D3RX6rp3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz0Xz4qflz3c3q
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:23:15 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so33792825e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688844191; x=1691436191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=joV2BdE7YOFZ22mdVaTCQPGn7sLlO9d89m2/O8Ni8nw=;
        b=D3RX6rp3lCrrjPF+L3zCXesnJw5RyO+lgEbv0AAhuEyHVkjaQbhHCI3DJSL+JV1UdL
         FT8zki389vPUBvZczSd6HJ3nLMNQELFbQV4ZWqlDXDk5sgK6AKcyc1251+rXw9DHWw9+
         XZZ3PBzwHrnsMFfW4ooU7vEIixQouCLoustDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688844191; x=1691436191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joV2BdE7YOFZ22mdVaTCQPGn7sLlO9d89m2/O8Ni8nw=;
        b=QKkjUcdX0I999NFwvUSelc3qybyjjDhe2WHYLdazfHVryGFKU5yCueEaAWtZIaoLBp
         I4j4O0vyrbuqCZtt3VMVQILnQdivJsFgk9Lbf69M6KFVVZ9jfPMpq13yOn1jQgWyUFQT
         hQULVz0D+0tXYygPt7jUEKpVTIR9bgfH7MjExSBvWNvxkvY/H/ANlnSmanhF5O3wJCG6
         8JSeAIJmQBYXKkyTyci83+TlpYtGG13Aaamhn4quCdQ/yjbMbRaeH/AoUE0mm6Njnt9N
         nozSulT/zF5cSBSe41S6QLbuULY9lKovP9clIt58xJHolmufyV3Ay+vJoA5EOf6VVzul
         0JCQ==
X-Gm-Message-State: ABy/qLaWTxAUSbpTi2V0D8HrbrwEiZa3KudXfTdrsVy7CCa1WIp6WQ8c
	KOqXkgxv3QCzRDjujDEFp7kzitXekwVC0BapadJ4p6er
X-Google-Smtp-Source: APBJJlFoYSA3FmH8jVSgpxaCuHVPYquBQV+TlddCoC7IPNPxDAYHq7yRoLUgdotOoRcRrNJ0NJ/gOA==
X-Received: by 2002:a5d:6b0b:0:b0:313:e5f2:7cbf with SMTP id v11-20020a5d6b0b000000b00313e5f27cbfmr6680551wrw.58.1688844191111;
        Sat, 08 Jul 2023 12:23:11 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id g24-20020aa7d1d8000000b0051e281a5ecesm3606126edp.58.2023.07.08.12.23.10
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 12:23:10 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so33868205e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:23:10 -0700 (PDT)
X-Received: by 2002:a5d:684c:0:b0:314:4915:689 with SMTP id
 o12-20020a5d684c000000b0031449150689mr7611320wrw.34.1688844189725; Sat, 08
 Jul 2023 12:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
 <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info> <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
 <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
 <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
 <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com> <CAJuCfpHszCAc5hDdsxry+1xh3kz+=jsYdBCXKQez-Th9LESSZA@mail.gmail.com>
In-Reply-To: <CAJuCfpHszCAc5hDdsxry+1xh3kz+=jsYdBCXKQez-Th9LESSZA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 12:22:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
Message-ID: <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Jul 2023 at 12:17, Suren Baghdasaryan <surenb@google.com> wrote:
>
> Do you want me to disable per-VMA locks by default as well?

No. I seriously believe that if the per-vma locking is so broken that
it needs to be disabled in a development kernel, we should just admit
failure, and revert it all.

And not in a "revert it for a later attempt" kind of way.

So it would be a "revert it because it added insurmountable problems
that we couldn't figure out" thing that implies *not* trying it again
in that form at all, and much soul-searching before somebody decides
that they have a more maintainable model for it all.

If stable decides that the fixes are not back-portable, and the whole
thing needs to be disabled for stable, that's one thing. But if we
decide that in mainline, it's a "this was a failure" thing.

           Linus
