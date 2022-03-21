Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E254E2B37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 15:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMcvV5W06z3bTs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 01:49:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.173;
 helo=mail-qk1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMcv35P8nz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 01:48:45 +1100 (AEDT)
Received: by mail-qk1-f173.google.com with SMTP id h196so11761350qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 07:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5DZRqsc/WV1yIwtHhKy6Su/O4u6fIrVwk8MROJjz5EA=;
 b=Vn8clctHIKHwBitEZFzoG5M6eXpvogSa8uoNdC6bv+mTFv6iXE/C4e+zLtMgJ78EjX
 SqyQC4c4A8/SMqt5h0OVx0rbSrdFg0XOPL8qA+olmjNMEU09bKnt6QIyUROi1wIDeQoV
 rfFf0kUpcopO7eZYY943s8RsE1azsMy0ooHKHREE0AqAPQxVm/jUQbSagOQ5PVdoUEYR
 MfFkouTsC1CkOmvyqxxKxH88aYkPcyXjdBiUqRV1ONQ2x0rC8bDKKyZpqksHPYOO1dx+
 385j1w73OOtQrtO/k0lBscZfXJXgoLmA/q4hlgf9uvMQXA5TgNcd8xj9XfGZzks7E8ZW
 FKNg==
X-Gm-Message-State: AOAM532Fq9AVD5BzzLcRUBYb6PAhtE6tc1biujv3Q6Z8ixjQe0Iq8yNw
 kOv/3dZCQp/4l/Jeg606porpTHk5eUNPdA==
X-Google-Smtp-Source: ABdhPJysHWOk7zMfCl9vMuNjTXOfQUiChphMJxawRHUyKeXjXE2dN2m3EJXKAnIbqoQIRPg/u+7ZRA==
X-Received: by 2002:a05:620a:2708:b0:67e:9b07:69bf with SMTP id
 b8-20020a05620a270800b0067e9b0769bfmr2908915qkp.274.1647874121982; 
 Mon, 21 Mar 2022 07:48:41 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm7703567qkk.52.2022.03.21.07.48.41
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 07:48:41 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id l2so28461002ybe.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 07:48:41 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr23066319yba.393.1647874121306; 
 Mon, 21 Mar 2022 07:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wj4fFjx2pgbGNBM4wJs3=eReZ05EQyprzgT2Jv8qJ2vJg@mail.gmail.com>
 <20220321101654.3570822-1-geert@linux-m68k.org>
In-Reply-To: <20220321101654.3570822-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Mar 2022 15:48:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsrW0WFB+B6wGg2k4wo1qk1xi2s2sbaw44=uVvVpopHw@mail.gmail.com>
Message-ID: <CAMuHMdWsrW0WFB+B6wGg2k4wo1qk1xi2s2sbaw44=uVvVpopHw@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.17
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Cc: sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 3:00 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.17[1] to v5.17-rc8[3], the summaries are:
>   - build errors: +5/-0

  + /kisskb/src/crypto/blake2b_generic.c: error: the frame size of
2288 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  =>
109:1

sparc64-gcc11/sparc-allmodconfig

  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: assignment
makes pointer from integer without a cast [-Werror=int-conversion]:
=> 324:9, 317:9
  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit
declaration of function 'ioport_map'
[-Werror=implicit-function-declaration]:  => 317:11
  + /kisskb/src/drivers/vfio/pci/vfio_pci_rdwr.c: error: implicit
declaration of function 'ioport_unmap'
[-Werror=implicit-function-declaration]:  => 338:15

um-x86_64/um-all{mod,yes}config

  + error: arch/powerpc/kvm/book3s_64_entry.o: relocation truncated to
fit: R_PPC64_REL14 (stub) against symbol `machine_check_common'
defined in .text section in arch/powerpc/kernel/head_64.o:  =>
(.text+0x3e4)

powerpc-gcc5/powerpc-allyesconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/f443e374ae131c168a065ea1748feac6b2e76613/ (96 out of 98 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/09688c0166e76ce2fb85e86b9d99be8b0084cdf9/ (96 out of 98 configs)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
