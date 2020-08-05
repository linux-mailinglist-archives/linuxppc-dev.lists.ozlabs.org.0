Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC98723CCF2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 19:12:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMJ8m2x39zDqfk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 03:12:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RdzmbMML; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMJ685M6zzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 03:10:20 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id b11so24668647lfe.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+69HNPUBLn+0j8xa7ztNqSpAC3bH5kdSFM7se7mw/Y=;
 b=RdzmbMMLETEqNtoVgyRCKj1pU2wD/0M8qEqvRXNRRNY+b914UvXZkxoVgayVQubBPC
 CE/souAwCoROj7cmbTcH2Md3LKEYbq7hyPYtIYReTO92nMUXfSeWszPI988KPS2REOZ/
 x8Lg5axuTOlNvJMwV7URNblxu16MjbinauMnuxvVDwlqKDPHVH06HlMC2htBpXCjb11y
 71kjYcUyosO0NzQGNjoXOZVONMcKv4BHAUmemA/OfyAvVhCb2Eag/fpp10a8cB3ymmQm
 ukYz/pLgzNQdHe5F/wMNFpu3aiLl6i8gq8ye/o/O6zNgd9JR7Oi+/mkdZRJPFt4uOCZ/
 Wj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+69HNPUBLn+0j8xa7ztNqSpAC3bH5kdSFM7se7mw/Y=;
 b=UHH2NN3dvQO9xnBqkWXSmCL8cJA1vW1cqDDQTUKY5PSxAQc+2RD9jCnWpsfaQ+wJGX
 l5k4HooTyWb3zmIT0hvCuHdBErMDAEMVw1rIJ51QmdZLWFXDXTj6XrZyLpt2D+lA1Bf1
 kQdrv1jJ/OnQ8LE1fdPpmxjEwFGDv4tDJ43qAZ9ytWcCDuNMXRVQqgBIpfMC92w66XGn
 FSo76awdOukkVG/VlEuQw8/4itUrt3xUG8UDNjfCj5IeuKYot/oC2Q9Wy75KehF1mAnv
 UCBhmlewZZHvNNzCMUWpN6ODr+BZD0gnICuRdBG9B1GSlhcN+R/5qp8hq8I3DdDAfQKs
 Q6WA==
X-Gm-Message-State: AOAM530RwaLEFNszDVgcIv/bHzskdBW1L8D9B33VO2wN9EP9HZbJ+39r
 BlWr7Pt2a3vtjRw5FnW+4smriHMaVZt+2ZPBM24=
X-Google-Smtp-Source: ABdhPJwrfD4lQmBmRhZhj4oSbWRKgm3lTiWKFBcnnoErai4/oJd38wR2GismiRK0iE3hYzt+6N6iDQ3Zkito0n/twrM=
X-Received: by 2002:a05:6512:3b7:: with SMTP id
 v23mr2064439lfp.10.1596647415748; 
 Wed, 05 Aug 2020 10:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-18-rppt@kernel.org>
In-Reply-To: <20200802163601.8189-18-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2020 19:10:04 +0200
Message-ID: <CANiq72kaw7EMePMbgYyKMCkBC+7CgERq4FV2Lp-fH+ea3H12vg@mail.gmail.com>
Subject: Re: [PATCH v2 17/17] memblock: use separate iterators for memory and
 reserved regions
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-MM <linux-mm@kvack.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 2, 2020 at 6:41 PM Mike Rapoport <rppt@kernel.org> wrote:
>
>  .clang-format                  |  3 ++-

The .clang-format bit:

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
