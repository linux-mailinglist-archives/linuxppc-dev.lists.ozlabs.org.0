Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E43A7D70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:42:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G45ys1g5Lz3c1Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 21:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.45; helo=mail-vs1-f45.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G45yW1Nh1z308Y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 21:42:10 +1000 (AEST)
Received: by mail-vs1-f45.google.com with SMTP id f21so9617678vsl.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 04:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6cLFWPwpottSL5NyBrmyH12rIdn1diKeLgL8Kz1B3hs=;
 b=AEgGQusEL836PHFOkysHgd/evbscSB4VhkAF9kD73giwFGaLObxDtsQW3T5L42dqSv
 Pz5bSaA3Vz9ayo6mKOfoAg3r6LGq0NsHne8DoLK2WNfe+DVKL094UDq00nJnzw63AYWe
 ZYeGBq+xJr0zJYHrao6exsxJ33I1PjR9lD4ooUgtQ7kFCYtySt1bvpYIcPMGEYCdXMYy
 BOs5yGtH/hlg501YImtCGEZwhzCRFYNbjkAqknIIPwDSw8dfwBeQH8gr6KQmA3fCq4w9
 MESJzUhaZzSzybDnw3LnAjnPRihkZT45adLShZesIbS16/fQmf9N17BDOTJ0ovKaTCuG
 9PXg==
X-Gm-Message-State: AOAM533D6QlQ+FLyl8H3rhc/kdqVFxz1mJnA7v8awOKDEWdGUEH/WvFT
 rzQzGN6eoQVQlljugnF6IBu0aGYH4HzdSIkc0UU=
X-Google-Smtp-Source: ABdhPJznuEjA8rihIMbbzhrVXLV05AmmQE+goCl46rfP2wIOnP/fUciGjhBT/1Kzp4dchtm5tTMtBoSZNwhqYUvmAU8=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr4432436vsd.42.1623757324455;
 Tue, 15 Jun 2021 04:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210615110859.320299-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210615110859.320299-1-aneesh.kumar@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Jun 2021 13:41:53 +0200
Message-ID: <CAMuHMdVdG10w4mUP_nLpPkDCP-tb3waPg_AOSJPch9b7AsLGsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: rename pud_page_vaddr to pud_pgtable and make
 it return pmd_t *
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 alpha <linux-alpha@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 1:32 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
> No functional change in this patch.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

>  arch/m68k/include/asm/motorola_pgtable.h     | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
