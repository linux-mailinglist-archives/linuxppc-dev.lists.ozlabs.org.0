Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E41EB545
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 07:27:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bgXG69hgzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 15:27:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ykr7aZeX; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VkTO5Sde; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bgTy5N4QzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:25:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591075504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VehAfr1QcK1Dwcz7+ds+E0e6uhlAX/0K+5UtuSIJbmY=;
 b=Ykr7aZeXAj71puhTDzDkpDwNHgmlhc1TPiJ5hjsQ9I5x/mycROf37HS/8XmSJ6HWcXkvvq
 asdgoqZAQmTqGZmA6seJQXCzkZyq7I26HmJqwMtkJsapXHPZKT3QE5NYky/WojEJYt+DBb
 TlLVx/FJaQyRt1g6UEHD6vwQt8CxyvU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591075505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VehAfr1QcK1Dwcz7+ds+E0e6uhlAX/0K+5UtuSIJbmY=;
 b=VkTO5SdexX+m00Nw+m1iOm6O9KPh7nDZNT39hjLHb8AFxK/A5PqliMxVsVBvWbeWOlmXHU
 vKdj3J9J/UDTzeLsJdrUrEYGdLIf7re6IgCqyAK5VnpyC4eG3iVY+rMhb2kgd/660Y1OGw
 MK5vo/dtJtf3qTDFHzsvBuq5ROgmFPE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-t1MBvQOROiq74NUOlW2igg-1; Tue, 02 Jun 2020 01:24:59 -0400
X-MC-Unique: t1MBvQOROiq74NUOlW2igg-1
Received: by mail-qv1-f69.google.com with SMTP id a8so2458304qvt.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jun 2020 22:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VehAfr1QcK1Dwcz7+ds+E0e6uhlAX/0K+5UtuSIJbmY=;
 b=mJzbm1lvAuoUl04XevrbrEpDACSezIimzgpSewb8UZG2gIfyus0VTtD5q/JWy1vmde
 /uLD5v5x/EQokqbBdaSqSF25pTCC60MjeHz92BllJAlcwf/H/ItGVShtRHF6q2Zhn60h
 Yp8pq5x/pjBg38mRC4TyYteMCiI+fRbJMd/qDvYWzNrELz4g5U3+mwAmqpP4Z1GrwlZM
 c99Uf9AgE842OeOYxpzniO03TI7y1C8fwXZ7/fpKvDhXTXUOR11zYzyrtLAV3qRjlCF1
 REXHJj7330FmrApSV4p4t21AAgwh3ydbllblmr+oz4Wjo/O8fpo8vYm5nOernuh7T6YZ
 6Ngw==
X-Gm-Message-State: AOAM5314g2KTsHjGoON8mVJymNj+ZftJFdO6OuXVkQkRmIR7qBdN36a9
 F1/+m3iCXHwR/MG02JCIAi4bIjefzwHZr0el687bfvaEaR0VYyHozdBL38QSLd0XehpI5VrHAPX
 x8rXKxQirjzcfScSI27N4PfXjWWpPCZSzGjk5U5/ORg==
X-Received: by 2002:a37:b9c7:: with SMTP id
 j190mr18446741qkf.210.1591075498897; 
 Mon, 01 Jun 2020 22:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqSml3yIRLnTsy9Th/UnRcgf1YOKMax0M+KxC4ZQtHYQlBJISkBakBOY31tAwc7YBCMcTTQOYw3l/yGOmFjpg=
X-Received: by 2002:a37:b9c7:: with SMTP id
 j190mr18446721qkf.210.1591075498589; 
 Mon, 01 Jun 2020 22:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
In-Reply-To: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Tue, 2 Jun 2020 10:54:46 +0530
Message-ID: <CACi5LpMKSNz=_OQWmEQ2kaswbjAONjn2pXQiu=jCA=wMt3wGCQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, x86@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Amit Kachhap <amit.kachhap@arm.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 John Donnelly <john.p.donnelly@oracle.com>, scott.branden@broadcom.com,
 Boris Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Steve Capper <steve.capper@arm.com>,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Dave Anderson <anderson@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, May 14, 2020 at 12:22 AM Bhupesh Sharma <bhsharma@redhat.com> wrote:
>
> Apologies for the delayed update. Its been quite some time since I
> posted the last version (v5), but I have been really caught up in some
> other critical issues.
>
> Changes since v5:
> ----------------
> - v5 can be viewed here:
>   http://lists.infradead.org/pipermail/kexec/2019-November/024055.html
> - Addressed review comments from James Morse and Boris.
> - Added Tested-by received from John on v5 patchset.
> - Rebased against arm64 (for-next/ptr-auth) branch which has Amit's
>   patchset for ARMv8.3-A Pointer Authentication feature vmcoreinfo
>   applied.
>
> Changes since v4:
> ----------------
> - v4 can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-November/023961.html
> - Addressed comments from Dave and added patches for documenting
>   new variables appended to vmcoreinfo documentation.
> - Added testing report shared by Akashi for PATCH 2/5.
>
> Changes since v3:
> ----------------
> - v3 can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
> - Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
>   instead of PTRS_PER_PGD.
> - Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
>   'Documentation/arm64/memory.rst'
>
> Changes since v2:
> ----------------
> - v2 can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
> - Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
>   ifdef sections, as suggested by Kazu.
> - Updated vmcoreinfo documentation to add description about
>   'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).
>
> Changes since v1:
> ----------------
> - v1 was sent out as a single patch which can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-February/022411.html
>
> - v2 breaks the single patch into two independent patches:
>   [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
>   [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code (all archs)
>
> This patchset primarily fixes the regression reported in user-space
> utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
> with the availability of 52-bit address space feature in underlying
> kernel. These regressions have been reported both on CPUs which don't
> support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
> and also on prototype platforms (like ARMv8 FVP simulator model) which
> support ARMv8.2 extensions and are running newer kernels.
>
> The reason for these regressions is that right now user-space tools
> have no direct access to these values (since these are not exported
> from the kernel) and hence need to rely on a best-guess method of
> determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
> by underlying kernel.
>
> Exporting these values via vmcoreinfo will help user-land in such cases.
> In addition, as per suggestion from makedumpfile maintainer (Kazu),
> it makes more sense to append 'MAX_PHYSMEM_BITS' to
> vmcoreinfo in the core code itself rather than in arm64 arch-specific
> code, so that the user-space code for other archs can also benefit from
> this addition to the vmcoreinfo and use it as a standard way of
> determining 'SECTIONS_SHIFT' value in user-land.
>
> Cc: Boris Petkov <bp@alien8.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: James Morse <james.morse@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Steve Capper <steve.capper@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Dave Anderson <anderson@redhat.com>
> Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
> Cc: John Donnelly <john.p.donnelly@oracle.com>
> Cc: scott.branden@broadcom.com
> Cc: Amit Kachhap <amit.kachhap@arm.com>
> Cc: x86@kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: kexec@lists.infradead.org
>
> Bhupesh Sharma (2):
>   crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
>   arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
>
>  Documentation/admin-guide/kdump/vmcoreinfo.rst | 16 ++++++++++++++++
>  arch/arm64/include/asm/pgtable-hwdef.h         |  1 +
>  arch/arm64/kernel/crash_core.c                 | 10 ++++++++++
>  kernel/crash_core.c                            |  1 +
>  4 files changed, 28 insertions(+)

Ping. @James Morse , Others

Please share if you have some comments regarding this patchset.

Thanks,
Bhupesh

