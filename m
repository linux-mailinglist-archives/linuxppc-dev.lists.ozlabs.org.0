Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B57067CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 14:15:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLsWq13KTz3fCb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 22:15:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gNAni+ae;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=charlemagnelasse@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gNAni+ae;
	dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLlRm50LCz3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 17:41:55 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3f38711680dso3431651cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 00:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684309312; x=1686901312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt8vcqfcBcSzFv5CqI8kXtZUiisqmIiLAVfG/Z4B1wo=;
        b=gNAni+aefYGCbzXJZ1KCoFg8ZVjbrHwK7u+sKWIsmjjGqQJ2bWNPSg+WakHJQVS3ab
         Bp5bqMntw1uQkVw+IN1lOsU4BFRNTNuMiq9ef5c1RW9TLIi66HUQpNRoz99rtQztmRGD
         KYnmVtSd+sNgymFummMsYYEpskLLZBxJnmkacqEQxSIDH8jjQDIifWpfH9ktAgm+tMoA
         l5xZHrVJnxwv1lhnl/gXppJABX//LI0ugS4VIj2bunZX7U1ejXCSJwy/Tf02yZh0TYX/
         2qa/8Rhqzrv1gtxn/rhiuEfjmYRrH3Jk4TsxNllrNjP6UscF1wHGQheDYKzJXyF9J7W6
         2Wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684309312; x=1686901312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt8vcqfcBcSzFv5CqI8kXtZUiisqmIiLAVfG/Z4B1wo=;
        b=EM2nFWSs0C/Z0tQW7I/Qr5agic1bBImA6aURomSgmf12faHTuXeRA57AnTQ6ZQoCyd
         6rNwvStrweOsS+LpMElTOQ1KDIAoxYD4G9KeT6R0F3Um3iXVNchNYAvdCQRpgRID4KSY
         Hrf6mCFo+v9DwwRJjzHuTypeD79VrSBxA2CDTZcSsQEkFfPGGfe77FYaSL0CCWQQS/CO
         vOQdaix1a+hJCakwFaYEz3AzLta3F5WoSVtbOC7VwJq0KxrYh39YhnJhCwhaIQOsVE1y
         T9kXYTZdjt0ObA6mNXofH5y+dujF4syYUPFYf3tMJ7gB0r6LYFDoZXTLuCvwdpUOjAI8
         mA6A==
X-Gm-Message-State: AC+VfDyi6bbo4Uc31O4I9FHumjp25vNkPqmMwjo59nkrIaCF/qOkn6fA
	JOIhPG16VH6NXxqEJlyv1SMF6SyM0emgkc7VIa0=
X-Google-Smtp-Source: ACHHUZ74fvUaQLS0H9Z1NeDqPl+csekVSshwiPDecXWRaUqETx8dIFlUfbpRHpQ/LDhjlhXM7ONSaWWLwZCTLV0Bubs=
X-Received: by 2002:ac8:580e:0:b0:3ef:52ac:10d2 with SMTP id
 g14-20020ac8580e000000b003ef52ac10d2mr66678755qtg.43.1684309312426; Wed, 17
 May 2023 00:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230405141710.3551-1-ubizjak@gmail.com> <20230405141710.3551-4-ubizjak@gmail.com>
In-Reply-To: <20230405141710.3551-4-ubizjak@gmail.com>
From: Charlemagne Lasse <charlemagnelasse@gmail.com>
Date: Wed, 17 May 2023 09:41:41 +0200
Message-ID: <CAFGhKbyxtuk=LoW-E3yLXgcmR93m+Dfo5-u9oQA_YC5Fcy_t9g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
To: Uros Bizjak <ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 17 May 2023 22:15:09 +1000
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
Cc: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
> +{
> +       typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
> +       return try_cmpxchg_local(&l->a.counter, __old, new);
> +}
> +

This patch then causes following sparse errors:

    ./arch/x86/include/asm/local.h:131:16: warning: symbol '__old'
shadows an earlier one
    ./arch/x86/include/asm/local.h:130:30: originally declared here

This is then visible in all kinds of builds - which makes it hard to
find out actual problems with sparse.
