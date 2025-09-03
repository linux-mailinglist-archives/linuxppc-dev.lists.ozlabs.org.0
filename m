Return-Path: <linuxppc-dev+bounces-11662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E26B42039
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH2nJ3VFqz2yrp;
	Wed,  3 Sep 2025 23:01:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756904516;
	cv=none; b=CoKuo3mpLsSAU44NzsSxxfJa957tFKF0F+b74fMnPt0cOqtodt8gg8edjRG9g7qax70f18ZrKM64eUqn86DLIUHmtLLh0SxljcRAcQ1gxgKb/rIFGeQ18FaaJyYkoq1nC5gIWeTuraT/oSwAkmvKW1foZkHUrOanu8TpfvLFqf3BhGpP0Da/CgXUk5vuuZhCZaHo1P7nOXCjHvZPO+rSjZeofZ5BwN39rVQ1RB9qTXu/NXk4Tlq4EtgwDxQ/50OZ+F8hyzBsr8iocTLWYRNlxQz+T0I8A6q5L1FG1MvAK7d5FvOmurfK/yCI0M7I+lGlLtkWPuAgJvqByL2UJ4afeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756904516; c=relaxed/relaxed;
	bh=rxOgjN7WdDoAv2rvG3Wc6cb+dOveWBvcqA5WgB2sqzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0BCTD2BH4rtqHkJC23eluzUPe0zFU3+hK1PPODMo4XPT5rxNrOHI7pOsimgE/8jb2Txbdg33hRmkgvY5OJU5u9I0i/2/qtvCLbryT923SyISEiW5UvJbqK0A869/fv2jxeGUMt7wCeNjvUcT80Q/fNpICncBmbJGm+tyxFqTK2e90LvW7Tcj/DcNzxOxvu08HWW20lVR3RUev3kS9cpm5Th5LmZJRqfsuRov7OFSMEjihE+2jFTxqOgRY6LQGCG/euQTpVP5WGkG3o9hjg//uo7KPBXfM9IKoAXr5HcDPwHijNBHR77H1Zhwdjv4GqU/wKR/fE3KaLJ6zmqbGN5xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S+5TUHf6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S+5TUHf6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH2nH3bfKz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:01:55 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3e014bf8ec1so13050f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756904512; x=1757509312; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxOgjN7WdDoAv2rvG3Wc6cb+dOveWBvcqA5WgB2sqzo=;
        b=S+5TUHf6304RM32Me/ajJWaq/DeRMevoMy9QdsmCgi2T0RXunyyvKo9fxpZkfwBEOG
         zV4QVNhiPNHvgMBgg246KKW1/hzauQzyLyaN09IHgm0AL00+RZctJ1+VYpgQUHTQDwJG
         ffeLIim1lNFgY8FIJg6w/uBwFZ7OIAENfe0fRBrQNY98U4UUEtWpO4pqwWCxuVQdJJM8
         pIEuZSxB+XaHbnp+YlzntPTWWZsuAhOm1T6kcuQlMYVO+KX2xqY+3RAHt9kyYe4fZ0il
         MTkUdk1bJxbFFsiq/k9G1/IK3uQUclKFGJXlsMo6Z86eYWbrkQdFGbZx+O+r2WuPb//9
         kfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904512; x=1757509312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxOgjN7WdDoAv2rvG3Wc6cb+dOveWBvcqA5WgB2sqzo=;
        b=B0L/qY0WAEI2kI7YUNfE9awjFb+eG7ivRWpzTR9Kf2iDxaJRElHsDpp8gOVQDgatWG
         XNceNK/0fIlr2NIj06NbXmzL9qlk3YP1FXargxL1bPoEosmvirnA6qyhJwJPIcRazJEY
         lliFkiBj/sna0zNWvP1/KMIXyGnzHFTmwr2jegChP1gjQl3TcMU4qTepTEzMwzdgLZtS
         D/sJig0/kN9Sim+qyGg6hQ8P1n3d2ij3KKyIxdxKK+NdRedrBepbrp2HS2n1h9XARk3X
         krAQGZBEDs+oQtvysLrF+HaJJPfWz3/EABlnRxAjf1YxPWzsoV9QHrn+mni5Z4/dMhWm
         wcpw==
X-Forwarded-Encrypted: i=1; AJvYcCWdgMmrd+ly/DCYkatkWJekJu4i2Yn+oBa37ss5ai20J9TbyPCwgk4Fo+U+w484aN8+JdxMz9et1ARaZuw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxC9BIJRdacUaY9SoftkU8Lsjo75SrQTBqP1jU+8Sb1BpQYb9fZ
	MnEkNczrdMzEnWg2BSC73Ro99IHllWWY34Y0qoHeJFSNpRCSl07WvdpvDPY3I2zOs/5m9tawplc
	N7rJCgZoKoElSkgxLZ2jtTCZehPV/NFA=
X-Gm-Gg: ASbGncsVChVj5VX4YQcdYJ2WC3Tz+oyDQVuQ5B9s+XjJQGSoKwsvlpMXxzENUusZchr
	sy1PROe7x3CCA+eFbRQBniLsz55EULddFpQcUQNlN9K8VcJl5TpYC1JTKsSxWUolo0XIp6cCGQA
	A7WmL6mAV+RYMOWNQulo9uptXC1Lr8/mj2Qg9EQbYWahmPBcCkpR2cRlI2mgmhZzosQ++XrkIXB
	8399+/z
X-Google-Smtp-Source: AGHT+IHaI9QHXphQW4NL4BWXS0uWqM/wJHgXqqOYeELhPBU/zEzYKTUTZN/+1NM3wCGA2AyzOKaLxaL5ucEtc3zspBA=
X-Received: by 2002:a5d:5d0a:0:b0:3dc:3b91:6231 with SMTP id
 ffacd0b85a97d-3dc3b916271mr3074458f8f.12.1756904512228; Wed, 03 Sep 2025
 06:01:52 -0700 (PDT)
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
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
In-Reply-To: <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 3 Sep 2025 15:01:40 +0200
X-Gm-Features: Ac12FXxqG38KSSLGvfY5HirQQyjqsvLS5blUVLw1nroWjuASE3O6kwm-RqaVNbQ
Message-ID: <CA+fCnZdkHATBYG4RJ8rR8MciKmeV4QGwVwoQjkhc-O_igpUBTQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, 
	dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 3, 2025 at 3:00=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>
> > +void __kasan_save_free_info(struct kmem_cache *cache, void *object);
> > +static inline void kasan_save_free_info(struct kmem_cache *cache, void=
 *object)
> > +{
> > +       if (kasan_enabled())
> > +               __kasan_save_free_info(cache, object);
> > +}
>
> What I meant with these __wrappers was that we should add them for the
> KASAN hooks that are called from non-KASAN code (i.e. for the hooks
> defined in include/linux/kasan.h). And then move all the
> kasan_enabled() checks from mm/kasan/* to where the wrappers are
> defined in include/linux/kasan.h (see kasan_unpoison_range() as an
> example).
>
> kasan_save_free_info is a KASAN internal function that should need
> such a wrapper.

... should _not_ need ...

>
> For now, to make these patches simpler, you can keep kasan_enabled()
> checks in mm/kasan/*, where they are now. Later we can move them to
> include/linux/kasan.h with a separate patch.

