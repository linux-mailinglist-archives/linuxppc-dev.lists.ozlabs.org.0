Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB0420318
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 19:20:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMrFd3fyrz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 04:20:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HPajL2gR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=andreyknvl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HPajL2gR; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMrDw44TJz2yK7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 04:19:27 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id i62so17646010ioa.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Oct 2021 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LtNAm7zzl2qrgZZh/QTIxNxuRAfc7I+2wFFQB9vnTF0=;
 b=HPajL2gRll5UGOWQudiLfEhv04bZJLEY04ZU7ZSRAIC019LPw99IB3jcVbN4EN+uaa
 xyKMFFwUWxMYSoP4ZBJywqtND/RYthdauADK8DHtR06cFEMk7vPzapNi8yp+/BQqu9DS
 XOr3DnKVtkoe0wPl/79bKfHiDibk91+zdv0sLCel9UFYLCb9bmD47OsCKSwE0mGDtw8/
 6gdgpENhRKndxirmzsgGPXX1upChcdibaOTNC3bq+DmwPpNVd9cFYYXmPAmiOvESIXbo
 CSbSXebOc4mMaPqb0Px805lEkzhdOgcnojNc1+KreKV66iyssiTwe6WqQz88OHS1mJw/
 GXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LtNAm7zzl2qrgZZh/QTIxNxuRAfc7I+2wFFQB9vnTF0=;
 b=VY5A8z35XDrm+ER0TvMZzt/JIQ02QedXnOAkxVJpgG7P6SMlls8YwS05iLUuJglV66
 0ez9rMTgh9Ykfkw2SsUdvACdomi2DoXBNK6I+qnMWX0FivDQi9jh520I7eD5nYmfXicK
 pO7MGDF+uVv8kskqM4+wX9OYukvXF22FNTovFarBTsYPU0+sar+4/LnOA2Tzl3LIii6X
 KwBdjUmCZHgGET1SOsYXzA40gJj85z0JQ46pYjpRgNy5bFhSz+i3m9Me/fjQpYED67LN
 DLJDkW3j+ZNoRg/3EeYQ1QSsZCM2uIZpn8dLrRBUyJ1KF95k9pylw15UXDmzL9i1g0oz
 8p6Q==
X-Gm-Message-State: AOAM531VVJDSu0BiUvjc5CDVohIzrd0lOzi6V0ZNAQK5s2S4XdG9zKAu
 EHzcqPw7iAoAHNvMIxyGfGcygHmLPBlApwhGMnw=
X-Google-Smtp-Source: ABdhPJzE8E4NG+zryoNkkGJT+VnCZOOENDmogYIeJjU1ZUgffAvfm3SvEG54YtnyET4C9tYQXAL12Yepc0ZqQhXt644=
X-Received: by 2002:a05:6602:214f:: with SMTP id
 y15mr6480548ioy.127.1633281563293; 
 Sun, 03 Oct 2021 10:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
 <20210930071143.63410-8-wangkefeng.wang@huawei.com>
In-Reply-To: <20210930071143.63410-8-wangkefeng.wang@huawei.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 3 Oct 2021 19:19:12 +0200
Message-ID: <CA+fCnZd6=sXgb-782KkijqJ7zgBj38oXLeLbi4HoUhm3MY4J8g@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] mm: kasan: Use is_kernel() helper
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: linux-arch@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 bpf <bpf@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Alexei Starovoitov <ast@kernel.org>,
 mingo@redhat.com, paulus@samba.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 30, 2021 at 9:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Directly use is_kernel() helper in kernel_or_module_addr().
>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  mm/kasan/report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 3239fd8f8747..1c955e1c98d5 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -226,7 +226,7 @@ static void describe_object(struct kmem_cache *cache, void *object,
>
>  static inline bool kernel_or_module_addr(const void *addr)
>  {
> -       if (addr >= (void *)_stext && addr < (void *)_end)
> +       if (is_kernel((unsigned long)addr))
>                 return true;
>         if (is_module_address((unsigned long)addr))
>                 return true;
> --
> 2.26.2
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
