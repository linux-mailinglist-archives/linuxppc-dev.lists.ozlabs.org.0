Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C4913D5B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 09:09:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yxgQ5qLzzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 19:09:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=dvyukov@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qfoDxmeh; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yxdK0M7SzDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 19:07:46 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id 5so18199365qtz.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 00:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7IBdjvFRag9yZE/BKc5brHAQDARDtIXaGhkF8uJXRlQ=;
 b=qfoDxmehHt9zSJPjWabWfKApmNG47N0Q2/pjIts+XRh7UWc4ym2jspVC7dOFfypjnv
 qnIVrd6DHS4ExoKZLCfn7EiaWjc0VJ+thpAfGN13cJj50S+8ZZzG+BJuvVxj4+JMY4+Z
 R2R3sRy25/3S2Joee0sQyYVPnaXfnDYs0aGfjD1YGJjSt+TL0rdiQTLtodpF5kf/j6Pw
 othExYiiQoemDJnBkRX0X7T10o0baCnxfWlv3KwtSYdf0iHOwTBM8pggRIyGf5JBaiRK
 YBZSQa8lfcCAuhH2hwTvIHBU2LeyizZrqo97LUh1gq17vixbEJpIajFMOXrsvxxStmsS
 +BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7IBdjvFRag9yZE/BKc5brHAQDARDtIXaGhkF8uJXRlQ=;
 b=ubJLtgCk0YeQDX+nsyQhEtcXDIRR7aSIVUNrc4lNMUXFM9XxCShKOvVpW/bqCc28bz
 3/mwaSCuwTwC5EmmPgqA3ImjLr55u16EdcD7Vy2yGgPoBdP3ZUHiAHeZDaVzvZnz6D61
 yhoriJyL4FvIo/idnjRJWCJeDagrhk22bvioKL9ScgeMnICr2WC+erar/8WHbFXUmvaz
 iNuPyGGOujpnpEPXmqUN0S9E3tXkx8h/OKRVg3FGiNuPo62vbQK7sK8Dpom5fk6TAX/Q
 1OVPwQfT3PHK9CwWSVNuk4bPlIqXUyvTIEf4UTKlSNLZD6V+HyrCKcrsrIByHkl8jpAu
 ZCVg==
X-Gm-Message-State: APjAAAXupDtVUjNzp3pNVJeR6O8fnfdrZ69XGJv686uZPEsCPhIXpzly
 K6VvwCcAqIxUrkeJ/TtlGV6zBzdLTyvCYRD1kyuVIQ==
X-Google-Smtp-Source: APXvYqzAhF+/72Zrdu85/2jD42Zoi8Td02RrL0uBou/vlg73GMNKwc0ffgSpLNGBhaZsCL3tktCpzfELeo9cOZYU61U=
X-Received: by 2002:ac8:30f7:: with SMTP id w52mr1194993qta.380.1579162063680; 
 Thu, 16 Jan 2020 00:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20200116062625.32692-1-dja@axtens.net>
 <20200116062625.32692-4-dja@axtens.net>
In-Reply-To: <20200116062625.32692-4-dja@axtens.net>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 16 Jan 2020 09:07:32 +0100
Message-ID: <CACT4Y+YpOm9cDk5Hi62iAwMFgiotzWjfiK4i9-9jkha_ZNwuvw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kasan: initialise array in kasan_memcmp test
To: Daniel Axtens <dja@axtens.net>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 7:26 AM Daniel Axtens <dja@axtens.net> wrote:
>
> memcmp may bail out before accessing all the memory if the buffers
> contain differing bytes. kasan_memcmp calls memcmp with a stack array.
> Stack variables are not necessarily initialised (in the absence of a
> compiler plugin, at least). Sometimes this causes the memcpy to bail
> early thus fail to trigger kasan.
>
> Make sure the array initialised to zero in the code.
>
> No other test is dependent on the contents of an array on the stack.
>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  lib/test_kasan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> index a130d75b9385..519b0f259e97 100644
> --- a/lib/test_kasan.c
> +++ b/lib/test_kasan.c
> @@ -619,7 +619,7 @@ static noinline void __init kasan_memcmp(void)
>  {
>         char *ptr;
>         size_t size = 24;
> -       int arr[9];
> +       int arr[9] = {};
>
>         pr_info("out-of-bounds in memcmp\n");
>         ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
> --
> 2.20.1
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200116062625.32692-4-dja%40axtens.net.
