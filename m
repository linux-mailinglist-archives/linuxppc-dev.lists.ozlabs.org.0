Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 272308C86E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 15:03:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CF5YEVK1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgnFx4c7Mz3cRY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 23:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CF5YEVK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgnF94FtDz30TW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 23:02:52 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-420180b58c5so728555e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715950960; x=1716555760; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrQk/zOuwoZ/gTNLgUZwce7uWfKFbQWp+MK1UVbA3u4=;
        b=CF5YEVK1nR1bq0A4VmGBgS6bEaELT27Z6akBMlNg9cqLJTAh1DKwp1XClr9IqV9mDF
         Rt2iiPr+WJm7UhSELlJLRWIOQlPStXr8DCQSW8JBXQwFBxBseW+RvBqSXBtddiO8je3A
         q7Y0j52uTtyv7y4jIwWvU8fJZLyIO2sx7yqx90Kj4EGMhQ1QOhHwq5DD0fvtmm0ZvIWZ
         gYn12eHqrzGfH+GUFWZRWtAUYuL8Wxx3owWCE6ugV7pt5H7hCTiTFFJDA1LxTprkTG5k
         UBrb3upFW3wvHnJQSn9r1WHRYVPdOpKa6EETQsvTE30BsIEUzkyjKKHxaNPpi88bOtlb
         0xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715950960; x=1716555760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrQk/zOuwoZ/gTNLgUZwce7uWfKFbQWp+MK1UVbA3u4=;
        b=jZGqqDlb9Oepd41o+Fxqwcve8EkiOtdwdkFUil/G4g4YiQI6XcVvfP05gBdGNUNKe1
         tfiihLwXG6x0ezmVz+C0pndc8Qz4Uu0JiCj9PoivTgDCaY2hmhu8S2DpFjheX4BvPcWe
         l79GWNo/U7IOi6lZ9B0KK0228fO7ZX0WDl0w5iNcbFCELh8H6Yae9Dg7NRaul0c7wYkw
         lvLC4dR6xbWi2qscDIgZ53z+qUtusw3pwVPO2pKPCNcWVTqXT6/Adaswz5GE3dtQ8Sgo
         dENKPeHjN3NKaDVn0M/zdYJRghtaYGmaOraHv/W81xEOsq0A+amaS0kDtRdpjTqi4UnK
         CXOw==
X-Forwarded-Encrypted: i=1; AJvYcCW159L/yiT3Dj0amUt64GwRsXNol8jD3VZnuxf1bxOMtgq88OOZYB602ocdXaY0E4CMbNgjCYrwbioLoXTl8UaOSLzLrNvT3RCXDwipvA==
X-Gm-Message-State: AOJu0Yxywl9wBxA0rAnac+W5XtATUEMr7fsz9+SmOvYJBfG960xLGK3V
	J4pUQbmN852qrJlfzcJjpsebLwHQxPCu4Avd0pSspjmXS7hkOc+J0jKYKXKTrjUq632Y+a6v5oO
	Jhju6Qs6ZbCKUtYWd2UGD544gNTs=
X-Google-Smtp-Source: AGHT+IHX94cPFrvL5t8yUA0EZIaiHQgX1Gs+ZQsluKSuj6RLMC47d3ViG5IjIZio8T5UO+CHiINEcWLKeJcnz4a/eAg=
X-Received: by 2002:a7b:c40a:0:b0:41b:d4a3:ad6a with SMTP id
 5b1f17b1804b1-41feaa42ce1mr205732115e9.17.1715950959914; Fri, 17 May 2024
 06:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240427205020.3ecf3895@yea> <20240501144156.17e65021@outsider.home>
In-Reply-To: <20240501144156.17e65021@outsider.home>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 17 May 2024 15:02:28 +0200
Message-ID: <CA+fCnZdNBEekgcfaGafJKmpb-A7R6rBuL5QojOhpqkHZvz1nKg@mail.gmail.com>
Subject: Re: Machine freezes after running KASAN KUnit test 21 with a GCC 13.2
 built kernel but runs tests fine with a CLANG 18 build kernel (v6.9-rc5,
 32bit ppc, PowerMac G4 DP)
To: Erhard Furtner <erhard_f@mailbox.org>, Nico Pache <npache@redhat.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 1, 2024 at 2:42=E2=80=AFPM 'Erhard Furtner' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Sat, 27 Apr 2024 20:50:20 +0200
> Erhard Furtner <erhard_f@mailbox.org> wrote:
>
> > Greetings!
> >
> > Building kernel v6.9-rc5 with GCC 13.2 + binutils 2.42 and running KASA=
N KUnit tests (CONFIG_KASAN_INLINE=3Dy, CONFIG_KASAN_KUNIT_TEST=3Dy) on my =
Dual CPU PowerMac G4 DP always freezes the machine after test 21 (see attac=
hed dmesg gcc_v02). Sometimes the G4 is able to reboot, most of the time it=
 just freezes:
>
> Turns out this is not a ppc specific issue at all, happens also on my AMD=
 FX 8370, tested on kernel v6.9-rc6. clang18 built kernel runs and passes K=
ASAN KUnit tests fine whereas a gcc13 built kernel freezes or reboots after=
 test 20 (ppc after test 21):
>
> [...]
>     ok 16 kmalloc_uaf_16
>     # kmalloc_oob_in_memset: EXPECTATION FAILED at mm/kasan/kasan_test.c:=
566
>     KASAN failure expected in "memset(ptr, 0, size + KASAN_GRANULE_SIZE)"=
, but none occurred
>     not ok 17 kmalloc_oob_in_memset
>     # kmalloc_oob_memset_2: EXPECTATION FAILED at mm/kasan/kasan_test.c:4=
96
>     KASAN failure expected in "memset(ptr + size - 1, 0, memset_size)", b=
ut none occurred
>     not ok 18 kmalloc_oob_memset_2
>     # kmalloc_oob_memset_4: EXPECTATION FAILED at mm/kasan/kasan_test.c:5=
14
>     KASAN failure expected in "memset(ptr + size - 3, 0, memset_size)", b=
ut none occurred
>     not ok 19 kmalloc_oob_memset_4
>     # kmalloc_oob_memset_8: EXPECTATION FAILED at mm/kasan/kasan_test.c:5=
32
>     KASAN failure expected in "memset(ptr + size - 7, 0, memset_size)", b=
ut none occurred
>     not ok 20 kmalloc_oob_memset_8
>     # kmalloc_oob_memset_16: EXPECTATION FAILED at mm/kasan/kasan_test.c:=
550
>     KASAN failure expected in "memset(ptr + size - 15, 0, memset_size)", =
but none occurred

+Nico, who also encountered this issue.

Mailed a patch that should fix this:
https://lore.kernel.org/linux-mm/20240517130118.759301-1-andrey.konovalov@l=
inux.dev/T/#u

You can consider disabling CONFIG_FORTIFY_SOURCE for now as a workaround.

Thank you!
