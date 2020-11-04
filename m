Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B22A5AE9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 01:13:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQnF05DpszDqSY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 11:13:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=mPTbV2Uh; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQnBx4Mf9zDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 11:11:46 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id z24so15033473pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 16:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NFjsAF4kgpQCHVIlKmgYN6bEVL36r1XibqsUv152D08=;
 b=mPTbV2UhVfnJP2OoJL4D5QLosesGivMu0Yj5j7pkCrVtHA6dueaCzR1JSWWklnSxS2
 Wgzos2joCi+Wlp8KUeVXQhCOJbK/Z4g4eTF82BJYkvr8uaU2CIt3++/EZgLF7nCLiPmR
 RFfDgHAz/9hjV1ZrPMZTrZyKkXhcZM/AoX3+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NFjsAF4kgpQCHVIlKmgYN6bEVL36r1XibqsUv152D08=;
 b=N/ViB20SDSfBSfASGhKCkRKTJF4sam/nwsIiERCPbiT2/tWytKViU+HR+9iLTDJwT3
 mYyZoSCsZJDHz2H9PbZS3B1LKzdFMqFxC61zcE7FKNa0QhhvmEoaySdgMF6zKWb7stVj
 +cmOYCN9ZqnDwc/PDKnoB5MXnTqeEy5uHdZKS7Q+DPVINEipPLu3UPpXBzerKsb9rxOH
 OXrGjsxEJpOo/Fv4i0tvKnkjrypS7wLlnyW+y+yqGAp6vkodqqFCFTbVuNMlrh3ktUVM
 DzihacnkQlw6wTtzXG/I0SscDbgmmFFRLCeq1pQpRUiSY15i8fcdCWmjuN/eZ1k0X6Nl
 1S2g==
X-Gm-Message-State: AOAM530ePOyoADp/m+5yHOOC+qLwTT1U2UCeTbBRsHFIYNmOODJlhb6P
 RV7bigMrxeK/7IJNMFjeBN4a0w==
X-Google-Smtp-Source: ABdhPJybME+aS3qtjx8JuwpcYMqCGEp0y1Q8idII2QCmSunt2ifzlNcehSCk1E6c+iZLzWwdlgTh0g==
X-Received: by 2002:a17:90a:5285:: with SMTP id
 w5mr1762165pjh.50.1604448702345; 
 Tue, 03 Nov 2020 16:11:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j20sm118311pgl.40.2020.11.03.16.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 16:11:41 -0800 (PST)
Date: Tue, 3 Nov 2020 16:11:40 -0800
From: Kees Cook <keescook@chromium.org>
To: YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [PATCH seccomp 0/8] seccomp: add bitmap cache support on
 remaining arches and report cache in procfs
Message-ID: <202011031606.423EC9E@keescook>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Jann Horn <jannh@google.com>,
 Valentin Rothberg <vrothber@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Josep Torrellas <torrella@illinois.edu>, Will Drewry <wad@chromium.org>,
 linux-parisc@vger.kernel.org, containers@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 03, 2020 at 07:42:56AM -0600, YiFei Zhu wrote:
> From: YiFei Zhu <yifeifz2@illinois.edu>
> 
> This patch series enables bitmap cache for the remaining arches with
> SECCOMP_FILTER, other than MIPS.
> 
> I was unable to find any of the arches having subarch-specific NR_syscalls
> macros, so generic NR_syscalls is used. SH's syscall_get_arch seems to
> only have the 32-bit subarch implementation. I'm not sure if this is
> expected.
> 
> This series has not been tested; I have not built all the cross compilers
> necessary to build test, let alone run the kernel or benchmark the
> performance, so help on making sure the bitmap cache works as expected
> would be appreciated. The series applies on top of Kees's for-next/seccomp
> branch.

Thank you! This looks good. I wonder if the different handling of little
endian is worth solving -- I'm suspicious about powerpc's use of
__LITTLE_ENDIAN__ vs a CONFIG, but I guess the compiler would match the
target endian-ness. Regardless, it captures what the architectures are
doing, and gets things standardized.

> 
> YiFei Zhu (8):
>   csky: Enable seccomp architecture tracking
>   parisc: Enable seccomp architecture tracking

I don't have compilers for these.

>   powerpc: Enable seccomp architecture tracking
>   riscv: Enable seccomp architecture tracking
>   s390: Enable seccomp architecture tracking

These I can build-test immediately.

>   sh: Enable seccomp architecture tracking
>   xtensa: Enable seccomp architecture tracking

These two are available in Ubuntu's cross compiler set, so I'll get them
added to my cross-builders.

>   seccomp/cache: Report cache data through /proc/pid/seccomp_cache

In the meantime, I'll wait a bit to see if we can get some Acks/Reviews
from arch maintainers. :)

-Kees

> 
>  arch/Kconfig                       | 15 ++++++++
>  arch/csky/include/asm/Kbuild       |  1 -
>  arch/csky/include/asm/seccomp.h    | 11 ++++++
>  arch/parisc/include/asm/Kbuild     |  1 -
>  arch/parisc/include/asm/seccomp.h  | 22 +++++++++++
>  arch/powerpc/include/asm/seccomp.h | 21 +++++++++++
>  arch/riscv/include/asm/seccomp.h   | 10 +++++
>  arch/s390/include/asm/seccomp.h    |  9 +++++
>  arch/sh/include/asm/seccomp.h      | 10 +++++
>  arch/xtensa/include/asm/Kbuild     |  1 -
>  arch/xtensa/include/asm/seccomp.h  | 11 ++++++
>  fs/proc/base.c                     |  6 +++
>  include/linux/seccomp.h            |  7 ++++
>  kernel/seccomp.c                   | 59 ++++++++++++++++++++++++++++++
>  14 files changed, 181 insertions(+), 3 deletions(-)
>  create mode 100644 arch/csky/include/asm/seccomp.h
>  create mode 100644 arch/parisc/include/asm/seccomp.h
>  create mode 100644 arch/xtensa/include/asm/seccomp.h
> 
> 
> base-commit: 38c37e8fd3d2590c4234d8cfbc22158362f0eb04
> --
> 2.29.2

-- 
Kees Cook
