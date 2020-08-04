Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C123B54E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 08:59:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLQc917PTzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 16:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cEpKAJv0; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLQZZ2wYpzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 16:58:30 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id l17so23065572ilq.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 23:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIh5KT4J3I0vWN5BTHSBXBuj/RvwuVvx1DEt8ERJDFE=;
 b=cEpKAJv0CNJmE18UXIFnjn59SrpSMun3BbYDcdjNPS+mASWTKVOiS/YFrWt8Lmdree
 +jpG6RynI1vL7LOggcJYv0YI4LNdUED3qQECaBl9lifd7pRXQVy1xrK/n8xlsfaUE6WL
 zXPIlI9btxWrMZaw5nA5RNrSYUrz0IOLmfYLmU5KxiVzAWeTL1JuBOTB3AfsjK8aGzYC
 TogNVHLb5DebKrp87hG28mU24XImRUVNyIDOYMOiTcMHWe/wMbhPGI96537Cx79gtZkM
 6eZADf9L4+dqnAQhcCSZ1MSH9JUcVdHlcmWJWaWVwbT43NpRP5N3ouGND3ChznOSmEDW
 5XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIh5KT4J3I0vWN5BTHSBXBuj/RvwuVvx1DEt8ERJDFE=;
 b=nwGG2KMAl9U9fCCcE1s0UlMVoBva8Cc2SJt2r8yhlYoLl/Pyv7yKnQrdjL0v/dLrN7
 a8XXLNQ7eB4Ya5V1M3WTR9o8DN7GZP4rykb8mhCrdmvL25W/mqZV0irY16XDh1WdK0Z0
 5f3d6uSW8xjPpsF7nscLLWxQ9alCrpsWEbK69PMm0TYNjEifuJYslJeZ66XdkSTjPLHI
 d9Pss1tDmWMSRwBJ/yOtNJrM7QBbHS7EmstcWz1EILp2ihb4bWYdkSmdruqtiptjdG+D
 dBr2IUvCYtuA/q+r2BZgZ/aaVN3nHeKAt/DNu620CHEICYC0u4NXIDqJn3wu0abiFQsp
 w+8w==
X-Gm-Message-State: AOAM5317/PT0GFYpRiHNv/GpSvuqTBj9LhVcF3A7PwzhNBt0hGd9h3pU
 KEUqAVbg9YHyF93vJj8scgdwNpD3tpcL+6T4Ur6XIQ==
X-Google-Smtp-Source: ABdhPJwY7PWG6QkBQ8n2pXSVnAfn22MZWg0foUZC3Lg9RjJZIgHkx3aNieTsxEDakSxAk2fhUiEpNB7ZnSaKtMbxXaA=
X-Received: by 2002:a05:6e02:148:: with SMTP id
 j8mr3130405ilr.186.1596524306179; 
 Mon, 03 Aug 2020 23:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200804005410.146094-1-oohall@gmail.com>
 <20200804005410.146094-2-oohall@gmail.com>
 <CACPK8XfoZ8+SUG6cuWuEJqdTfmxePsBGFGgqyrPvmn1WyRVyjA@mail.gmail.com>
In-Reply-To: <CACPK8XfoZ8+SUG6cuWuEJqdTfmxePsBGFGgqyrPvmn1WyRVyjA@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 4 Aug 2020 16:58:14 +1000
Message-ID: <CAOSf1CFr8_X62mFDGNXNao0xdt_+44i+MOYe3NWgSf_1yYuWHQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] powerpc/powernv/smp: Fix spurious DBG() warning
To: Joel Stanley <joel@jms.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 4, 2020 at 12:07 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Messy:
>
> $ git grep "define DBG(" arch/powerpc/ |grep -v print
> arch/powerpc/kernel/crash_dump.c:#define DBG(fmt...)
> arch/powerpc/kernel/iommu.c:#define DBG(...)
> arch/powerpc/kernel/legacy_serial.c:#define DBG(fmt...) do { } while(0)
> arch/powerpc/kernel/prom.c:#define DBG(fmt...)
> arch/powerpc/kernel/setup-common.c:#define DBG(fmt...)
> arch/powerpc/kernel/setup_32.c:#define DBG(fmt...)
> arch/powerpc/kernel/smp.c:#define DBG(fmt...)
> arch/powerpc/kernel/vdso.c:#define DBG(fmt...)
> arch/powerpc/kvm/book3s_hv_rm_xive.c:#define DBG(fmt...) do { } while(0)
> arch/powerpc/mm/book3s64/hash_utils.c:#define DBG(fmt...)
> arch/powerpc/platforms/83xx/mpc832x_mds.c:#define DBG(fmt...)
> arch/powerpc/platforms/83xx/mpc832x_rdb.c:#define DBG(fmt...)
> arch/powerpc/platforms/83xx/mpc836x_mds.c:#define DBG(fmt...)
> arch/powerpc/platforms/85xx/mpc85xx_ds.c:#define DBG(fmt, args...)
> arch/powerpc/platforms/85xx/mpc85xx_mds.c:#define DBG(fmt...)
> arch/powerpc/platforms/85xx/mpc85xx_rdb.c:#define DBG(fmt, args...)
> arch/powerpc/platforms/86xx/mpc86xx_hpcn.c:#define DBG(fmt...) do { } while(0)
> arch/powerpc/platforms/cell/setup.c:#define DBG(fmt...)
> arch/powerpc/platforms/cell/smp.c:#define DBG(fmt...)
> arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c:#define DBG(fmt...)
> do { } while(0)
> arch/powerpc/platforms/maple/pci.c:#define DBG(x...)
> arch/powerpc/platforms/maple/setup.c:#define DBG(fmt...)
> arch/powerpc/platforms/maple/time.c:#define DBG(x...)
> arch/powerpc/platforms/powermac/bootx_init.c:#define DBG(fmt...) do { } while(0)
> arch/powerpc/platforms/powermac/feature.c:#define DBG(fmt...)
> arch/powerpc/platforms/powermac/low_i2c.c:#define DBG(x...) do {\
> arch/powerpc/platforms/powermac/low_i2c.c:#define DBG(x...)
> arch/powerpc/platforms/powermac/nvram.c:#define DBG(x...)
> arch/powerpc/platforms/powermac/pci.c:#define DBG(x...)
> arch/powerpc/platforms/powermac/pfunc_base.c:#define DBG(fmt...)
> arch/powerpc/platforms/powermac/pfunc_core.c:#define DBG(fmt...)
> arch/powerpc/platforms/powermac/smp.c:#define DBG(fmt...)
> arch/powerpc/platforms/powermac/time.c:#define DBG(x...)
> arch/powerpc/platforms/powernv/smp.c:#define DBG(fmt...)
> arch/powerpc/sysdev/dart_iommu.c:#define DBG(...)
> arch/powerpc/sysdev/ge/ge_pic.c:#define DBG(fmt...) do { } while (0)
> arch/powerpc/sysdev/mpic.c:#define DBG(fmt...)
> arch/powerpc/sysdev/tsi108_dev.c:#define DBG(fmt...) do { } while(0)
> arch/powerpc/sysdev/tsi108_pci.c:#define DBG(x...)

I started off writing a patch that fixed all these too. When I went to
test it I discovered there's a giant pile of other W=1 warnings from
other parts of arch/powerpc/ so I figured I'd start with something
less ambitious.
