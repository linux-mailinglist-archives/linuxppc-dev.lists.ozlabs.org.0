Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9683D7DFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 20:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ5TP1C5Gz3bZK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 04:50:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wk8r1n/m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wk8r1n/m; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ5Sz3Z3jz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 04:50:11 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B82960FC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627411808;
 bh=FEnwgSbKVXqz/f02D+yC03c3XbgdHc6UQnZBnRvCJ/M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wk8r1n/mSx+0i6AQUY//rrzvo7u0iykvI3DdMwAU6Fm/5wRnd0aHGo1bytx3xXu7k
 V3PJdlxpsKgFsAEaS7uZWfUIfFWVaBrx69vXh2hfyWYRH5NQn1716X5tqJilSuZ/e/
 tk9muKXJu5/49yxCwj4RAo/tsrlbDsU3fovK01uescBB4yrZKqeKS15WHtt2DGx9Oj
 iF4Q3naxYhPj2AJoJR+3fqqmyczVP5rEm8K8D5fNCTblk5yGa//Rl7ecC05qjuI/co
 nrA0rgBAydBUwU9/kObE3BP78Eet9E5cwms/Ir0jmCUxjomE9KSZ5F3f5kYLyoIl/1
 zl2MNoEU9+ykQ==
Received: by mail-wr1-f48.google.com with SMTP id b7so16349960wri.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 11:50:08 -0700 (PDT)
X-Gm-Message-State: AOAM533XttryzAfOypxKmfpK1SjqczmHSlxHMU3f+Cwvf1yhQJRwksmq
 6FpxYUIdf8fYWMnXoaoYnDMfiX4f6GNuc6XsLxY=
X-Google-Smtp-Source: ABdhPJyJoGfE0vjMAu17Dx3oLfkZN1O26Yflb54n4xga3o5XuLKsejT/cbFSiPGK2CJQqQHqBmqSL7vlY8Dk6BlYaZM=
X-Received: by 2002:adf:e107:: with SMTP id t7mr26004543wrz.165.1627411796641; 
 Tue, 27 Jul 2021 11:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144859.4150043-1-arnd@kernel.org>
 <20210727144859.4150043-5-arnd@kernel.org>
 <YQBB9yteAwtG2xyp@osiris>
 <CAK8P3a3itgCyc4jDBodTOcwG+XXsDYspZqQVBmy88cGXevY5Yw@mail.gmail.com>
 <YQBSpxZR4P/Phpf1@osiris>
In-Reply-To: <YQBSpxZR4P/Phpf1@osiris>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 27 Jul 2021 20:49:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0WT36Lg4nRBWx_kqb9yKj0mHx8gTdzCsDfrx1tQSEqbA@mail.gmail.com>
Message-ID: <CAK8P3a0WT36Lg4nRBWx_kqb9yKj0mHx8gTdzCsDfrx1tQSEqbA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm: simplify compat numa syscalls
To: Heiko Carstens <hca@linux.ibm.com>
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
Cc: Feng Tang <feng.tang@intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 27, 2021 at 8:38 PM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> -268  common    mbind                   sys_mbind                       compat_sys_mbind
> -269  common    get_mempolicy           sys_get_mempolicy               compat_sys_get_mempolicy
> -270  common    set_mempolicy           sys_set_mempolicy               compat_sys_set_mempolicy
> +268  common    mbind                   sys_mbind                       sys_mbind
> +269  common    get_mempolicy           sys_get_mempolicy               sys_get_mempolicy
> +270  common    set_mempolicy           sys_set_mempolicy               sys_set_mempolicy
>
> would remove compat_ptr() conversion from nmask above if I'm not mistaken.

Maybe I'm misremembering how compat syscalls work on s390. Doesn't
SYSCALL_DEFINEx(sys_mbind) still create two entry points __s390x_sys_mbind()
and __s390_sys_mbind() with different argument conversion (__SC_CAST vs
__SC_COMPAT_CAST)? I thought that was the whole point of the macros.

        Arnd
