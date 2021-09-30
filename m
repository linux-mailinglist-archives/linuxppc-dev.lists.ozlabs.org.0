Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61E41DDEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 17:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKyKR3hT7z305j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 01:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iR/rfVgi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=glider@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=iR/rfVgi; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKyJm6yJnz2xWl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 01:46:16 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id c20so6108704qtb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8d6xo5L9QevHc/0Sduv9NQkae1fLgboqRLN/cOlHL94=;
 b=iR/rfVgiWHq5rw4NLK5OT9v5lYhcLGBGwNqvqBTHa8uM0K3LSI6Qds40sZdhqy343D
 nKF1AalapkTkhy/ypRBVypdug7o8/xaqtmHaWv9UPFEGjb1UhHpm/4rTjAiBbtASwfKx
 3JH/kVbQPqPEjk5/0bNv7k1/Y2BIonRHJ0vWOSQM3zvPY70Uxrv2rSgTrqGgUv6GDu7E
 chrKKhinXiSRYk/xsds2GtV3wz6HxpGI4jq2FDoKpBIlG6t+6bi34LoQK0m5uh10NjJQ
 5mDPrpUbvxQNLMegc4nJJFYKUu1kf5g3ZYgnxHtFO6ahoMuizo6fqj2+osS40oUSZmZK
 mhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8d6xo5L9QevHc/0Sduv9NQkae1fLgboqRLN/cOlHL94=;
 b=0uAwcMBkLdQ0f2pIbmpp2nDHp7ULad2BcnSZR+tyv/3/qs+4SzV7zAq2GFvTiis2rO
 owZEnaI+5GlCOKzw6p2M/zCXxnOS30edt+tt/PV6sB3BVfB46UWbfl6LmBEICMWCkvpg
 sew8bKbCQq2IJuaKT/MY3Pnsw1tJTp3ToHpp8HPhR0WCvVNPCqhRZW0+g/d/OsriuBqo
 C1xnXKN8GTcRhC5xxiJzBw5h/oG+IT8jdlOs0Q0l7rNgnln57qgP6kw0E3et5MfERS5d
 1ZZR2hs2ck08MpwKaj+O6RnDsUVqqG9+ZKi7vbT7AvZxFNhPR4goGO8NY1QldU71jAHf
 mIRg==
X-Gm-Message-State: AOAM533SO9MAlJ4eAuSmW7zs4riQILUHIaNpWWHsm8aWWjTcMtuieta8
 QVxVzXv1+rTdSDNL18iZ0ECnSplRehw8No0Oy81hcA==
X-Google-Smtp-Source: ABdhPJwZ3uxL8AigS1SCTssbBbBxtSyTYvRLlSFXF7X1iRF0BIcI7ZsH6TQi0ZjmX4wm1iehH5EIvAVb3aaD1X5z2aM=
X-Received: by 2002:ac8:5ed1:: with SMTP id s17mr7389237qtx.196.1633016771378; 
 Thu, 30 Sep 2021 08:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
 <20210930071143.63410-8-wangkefeng.wang@huawei.com>
In-Reply-To: <20210930071143.63410-8-wangkefeng.wang@huawei.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 30 Sep 2021 17:45:35 +0200
Message-ID: <CAG_fn=XD+nVgVRgj7KFsPWSuia+gZzpA3KAdqucjKodOvxSF6w@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] mm: kasan: Use is_kernel() helper
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, bpf@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Alexei Starovoitov <ast@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, David Miller <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 30, 2021 at 9:09 AM Kefeng Wang <wangkefeng.wang@huawei.com> wr=
ote:
>
> Directly use is_kernel() helper in kernel_or_module_addr().
>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

> ---
>  mm/kasan/report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 3239fd8f8747..1c955e1c98d5 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -226,7 +226,7 @@ static void describe_object(struct kmem_cache *cache,=
 void *object,
>
>  static inline bool kernel_or_module_addr(const void *addr)
>  {
> -       if (addr >=3D (void *)_stext && addr < (void *)_end)
> +       if (is_kernel((unsigned long)addr))
>                 return true;
>         if (is_module_address((unsigned long)addr))
>                 return true;
> --
> 2.26.2
>


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
