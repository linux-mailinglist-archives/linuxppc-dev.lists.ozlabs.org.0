Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132E3A7BF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 12:31:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G44PG52ggz3bvP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 20:31:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=YHM+AxYL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=YHM+AxYL; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G44Nm1N5Qz307m
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 20:31:18 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso13765135oto.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 03:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QY2/939t5WrgTBjBlWlTUN2kXiGUMSX5srdzV+Tkpzg=;
 b=YHM+AxYLU1vo0wyn+Xcdbnd4wDcDCXRBgefB95WMmxeVpB3BvW4yvfwfwVluV1Uzct
 6K0x9n3XOqRv8uQH8AEMEuII+L+xTyvkNwtmz4LEduSbH1p++oLjK3B5ahJY0azvywOM
 T31KEOBH92t02N1PEbDaLty+7/fh5xSj5xUDRQatrCmFDyNj2RrjeuLyF00I3rcEzBT5
 y4copCCRCT3PrDQibV1nipJBlHCII3CNu463NSgQeBzirVTKyhueU8FaItBT3K9Jt5Tu
 gXYPLJbUVtIOL6dEEh/yYa6kKqJpNoQ4et+caeyUly9uTAL32yzZbThnjCQGUCk32+3P
 6DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QY2/939t5WrgTBjBlWlTUN2kXiGUMSX5srdzV+Tkpzg=;
 b=K7UF1bFgn4jI9eM/iw+TU2kLrDlLTj2T9dhw2uYdpoAW5fp8ZaXIxS1IWfRtFhdWhi
 3hDnxx3EdpuIrSqtOyIgmyDn4/J0AYw5lDOSZteuZUrfezom1CCkyDDkg/vkdQOS3Qoh
 Jv0q9ZVcFZvwg4Ecqv6fxAkSlHMJZY+bJGoLjUhllt+7/nXKnGT0l7xWuCS/r+Tpuafh
 h5GC0JILoSH7Re8P/P5FV7CrhjNGilzDOl0NRaG1Vm5EOFwthMe7LCAEOohXr1/+aalA
 5zxFswbF2JEMgFvMzFWVMfTpVxl+WyydRN0AypRRlwtA0H9QEV6yJ26IFSXkt0whpIpY
 hm1A==
X-Gm-Message-State: AOAM530/pQdZr6azCHzqfOmBAKAy0zQO+BT4RxCpV3t5GqyRVuB6hFFc
 jIqQ920XIorRfdTaF8r/0MYIJEKxuX01KwG5/HaXvg==
X-Google-Smtp-Source: ABdhPJy0fOalbu0NNzzqQsmoqmUKuJjfDqFf3ggFxXrfL2cRyMZXd7VINleb2XaFbl/rrryoGYhGPaIVwz4Mi8joh90=
X-Received: by 2002:a05:6830:93:: with SMTP id
 a19mr17226203oto.17.1623753073778; 
 Tue, 15 Jun 2021 03:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210615014705.2234866-1-dja@axtens.net>
In-Reply-To: <20210615014705.2234866-1-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Tue, 15 Jun 2021 12:31:02 +0200
Message-ID: <CANpmjNO9EdwPEiNPu630a2kgsxMXYiNU_phKH2=7Z5YFRCSR1A@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] KASAN core changes for ppc64 radix KASAN
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
Cc: aneesh.kumar@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kasan-dev <kasan-dev@googlegroups.com>, linuxppc-dev@lists.ozlabs.org,
 Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+Cc Andrey]

On Tue, 15 Jun 2021 at 03:47, Daniel Axtens <dja@axtens.net> wrote:
>
> Building on the work of Christophe, Aneesh and Balbir, I've ported
> KASAN to 64-bit Book3S kernels running on the Radix MMU.
>
> I've been trying this for a while, but we keep having collisions
> between the kasan code in the mm tree and the code I want to put in to
> the ppc tree. So my aim here is for patches 1 through 4 or 1 through 5
> to go in via the mm tree.

I think this is reasonable. I'd suggest just sending non-ppc patches
separately (i.e. split the series explicitly) to KASAN maintainers,
and ensure to Cc Andrew, too. Just point at this series to illustrate
how it'll be used.

I think the patches are fine, but I'm not entirely sure about the
current placements of kasan_arch_is_ready(), so hopefully Andrey can
also have a look.


> I will then propose the powerpc changes for
> a later cycle. (I have attached them to this series as an RFC, and
> there are still outstanding review comments I need to attend to.)
>
> v12 applies to next-20210611. There should be no noticable changes to
> other platforms.
>
> Kind regards,
> Daniel
>
> Daniel Axtens (6):
>   kasan: allow an architecture to disable inline instrumentation
>   kasan: allow architectures to provide an outline readiness check
>   kasan: define and use MAX_PTRS_PER_* for early shadow tables

^^ Up to here could be a separate series to go through -mm.

>   kasan: Document support on 32-bit powerpc

^^ The Documentation changes are minimal and not just confined to
kasan.rst it seems. In fact your "powerpc: Book3S .." patch changes
Documentation more. So you could just take "kasan: Document support on
32-bit powerpc" through ppc tree as well.

>   powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
>   [RFC] powerpc: Book3S 64-bit outline-only KASAN support
