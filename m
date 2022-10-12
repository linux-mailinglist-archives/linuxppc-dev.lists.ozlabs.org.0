Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B89785FC9DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 19:23:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mnfcn4scKz3drd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 04:23:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AE8z8KD6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AE8z8KD6;
	dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mnfbt1k1Gz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 04:22:33 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id y72so13069026oia.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRYFk+9yyHZHAcB/2rwgdrsgnigrvHFKirKgHeDmUno=;
        b=AE8z8KD6uwSVMiRp4ABm0Kn9UkMq8P+bk8+Y1ITmg3vl1hYmjp6k8LU6URk5HzGGQF
         2/fqw2HhcOa/gTcb1tS3SQgcP9XK2z4BjeVToHve1GXn4ay7pgmzQA+nKS017UcVgGKS
         Udydt9y4k+dIUSNMddvtmXX3tSMn7byJOqVUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRYFk+9yyHZHAcB/2rwgdrsgnigrvHFKirKgHeDmUno=;
        b=hSqLOIqIJDmdf+eAntCB2SJ9C1aPyRVJXPc0nzGvwYYiVZ8x933QmILKOHfosrXe16
         3lZTP2qHXfu6RFn4J6BIDU50A/FurpK6xTJ7nYdzHqJo7dPImSqqlMr2884k7nSysKJg
         jR9GxK7mG9JkS2eQ7MTz3s90EqTCZOuzvAiggYjOxKMbkGiWbWQb+8mIWUpn4xU/G3Y8
         aNmp08mYaTQqN5SOiQ9XCmPG5XCJ/j32E9bzX1SHOO9IOisn5Mi+1xGikZfRswSo8GC0
         ec3Q1sxxy3JkvCH0PtHhD15S7bGGlUxp9nZM/3mAUlXtTrcbVhItg+/p2fCuiOtdzrhT
         yL+g==
X-Gm-Message-State: ACrzQf3vAT5n5PSv7v0mlkFkzpZokdvYqx1F5ZemmguRGTLFYPGW3OGM
	r942+7cO+d3o4dWFk8VN1bkusSJDbuE6yw==
X-Google-Smtp-Source: AMsMyM7qmHYMoi8whZV7X8y+NXnM0e6CUUK17KSKC+huI9VVH1wkXOXthLIpIihal7JHV/pzf2iVvg==
X-Received: by 2002:a05:6808:8f4:b0:354:946e:8dc5 with SMTP id d20-20020a05680808f400b00354946e8dc5mr2635591oic.183.1665595347733;
        Wed, 12 Oct 2022 10:22:27 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id q125-20020aca4383000000b00353f41440dasm6782590oia.56.2022.10.12.10.22.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 10:22:24 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1321a1e94b3so20229036fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 10:22:24 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr3072194oad.126.1665595344160; Wed, 12
 Oct 2022 10:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221010132030-mutt-send-email-mst@kernel.org>
 <87r0zdmujf.fsf@mpe.ellerman.id.au> <20221012070532-mutt-send-email-mst@kernel.org>
 <87mta1marq.fsf@mpe.ellerman.id.au> <87edvdm7qg.fsf@mpe.ellerman.id.au> <20221012115023-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221012115023-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 12 Oct 2022 10:22:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2Pkb9kbfbstbB91AJA2SF6cySbsgHG-iQMq56j3VTcA@mail.gmail.com>
Message-ID: <CAHk-=wg2Pkb9kbfbstbB91AJA2SF6cySbsgHG-iQMq56j3VTcA@mail.gmail.com>
Subject: Re: [GIT PULL] virtio: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
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
Cc: xiujianfeng@huawei.com, kvm@vger.kernel.org, alvaro.karsz@solid-run.com, jasowang@redhat.com, angus.chen@jaguarmicro.com, wangdeming@inspur.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, lingshan.zhu@intel.com, linuxppc-dev@lists.ozlabs.org, gavinl@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 8:51 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Are you sure?

MichaelE is right.

This is just bogus historical garbage:

> arch/arm/include/asm/irq.h:#ifndef NO_IRQ
> arch/arm/include/asm/irq.h:#define NO_IRQ       ((unsigned int)(-1))

that I've tried to get rid of for years, but for some reason it just won't die.

NO_IRQ should be zero. Or rather, it shouldn't exist at all. It's a bogus thing.

You can see just how bogus it is from grepping for it - the users are
all completely and utterly confused, and all are entirely historical
brokenness.

The correct way to check for "no irq" doesn't use NO_IRQ at all, it just does

        if (dev->irq) ...

which is why you will only find a few instances of NO_IRQ in the tree
in the first place.

The NO_IRQ thing is mainly actually defined by a few drivers that just
never got converted to the proper world order, and even then you can
see the confusion (ie some drivers use "-1", others use "0", and yet
others use "((unsigned int)(-1)".

                   Linus
