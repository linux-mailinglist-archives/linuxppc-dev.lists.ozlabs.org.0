Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA6FD2A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 03:01:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DhQs5M9nzF870
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 13:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=takahiro.akashi@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ksvnu7eS"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DhNc5Yp0zF7s7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 12:59:09 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id z24so4975219pgu.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 17:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UWeLycX3A0XaEIn+C9Dl7zk7yTPULHadgCfDLM9l7TE=;
 b=ksvnu7eSOO4terAkNlaOfyb15/oDqNrOy0ORpo0bHBI2rhd9yD5pOsdT6WUKTLlDTv
 J3JM4RVHvP1LJP0mmL5H2hRq7oVoun79yD7ZM4D3ylcuToJckasjdaZzwaLyznvO1xGX
 wWplbFAv1VywWbeyraIAphIp4UTV+24rqlE/SPn9mI2gTrXkZd1AGTREWWhZ5k7/IvWr
 E+8slo2iwqf+Q3vUc2O/7jO5L09+LMQfXHB6zZi0ziq+EGgeuIm6prEdgznpSwxbTuqO
 AALvwT9E10R6YtyJ/ZMXbbxs5wHUuvk7o7Fc+eJ7FDvcLZkmZhAYVnqslFS8A99XyfHH
 V4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=UWeLycX3A0XaEIn+C9Dl7zk7yTPULHadgCfDLM9l7TE=;
 b=tZJyW3pSSdUGDhufufVmfG8MEmXl1rTcAppT40AO4eab1CDi4sRU4AjydRGDH3fGlG
 129gRV+e8oBHgRFgzFFgVhKMrmMdpZEzTmE+9FZSi3xb/eZi6PpAHI1Xm7ly+MQ9aIvl
 wMMOc8onasKi0OxP5ENyhMRQ7O3OtsBAe4ZjMJP+xZbPE/M9VCIaTWInRXEH8XZ5RRd1
 vm6slE+vrjBVV2HsoeAyPYo6igJFZRmll9iV73sP2vseLWdVPKoG6AV4mlIUTDsh5SIy
 gz9SfQBwgGXgkCt+hqS34TZbnNIMZcOdDJmYx1AmGXfMf1fFjouxtgqShC03Xde63I6K
 rSOw==
X-Gm-Message-State: APjAAAXIeXkVYfj6O1JOmuj4v8IXDgCXjEiHkHL5OIHlFzUMBEVf4Dmb
 8ByQ1wh6gdIx3aP5HfS+F8F0lw==
X-Google-Smtp-Source: APXvYqwwRjwshy7pinCg9/dmaFEcUvuH69/xmFxI9FD5260D/dHSoq8L8gvQV0tVbWbwCJmg9b2XGA==
X-Received: by 2002:a17:90a:d102:: with SMTP id
 l2mr16852070pju.132.1573783146553; 
 Thu, 14 Nov 2019 17:59:06 -0800 (PST)
Received: from linaro.org ([121.95.100.191])
 by smtp.googlemail.com with ESMTPSA id v15sm8132141pfe.44.2019.11.14.17.59.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Nov 2019 17:59:05 -0800 (PST)
Date: Fri, 15 Nov 2019 11:00:00 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Bhupesh Sharma <bhsharma@redhat.com>
Subject: Re: [PATCH v4 0/3] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
Message-ID: <20191115015959.GI22427@linaro.org>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Bhupesh Sharma <bhsharma@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 Boris Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, James Morse <james.morse@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Steve Capper <steve.capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Anderson <anderson@redhat.com>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 kexec mailing list <kexec@lists.infradead.org>
References: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
 <20191113063858.GE22427@linaro.org>
 <CACi5LpP54d9DKW63G5W6X4euBjAm2NwkHOiM01dB7g8d60s=4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACi5LpP54d9DKW63G5W6X4euBjAm2NwkHOiM01dB7g8d60s=4w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Boris Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
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

Bhupesh,

On Fri, Nov 15, 2019 at 01:24:17AM +0530, Bhupesh Sharma wrote:
> Hi Akashi,
> 
> On Wed, Nov 13, 2019 at 12:11 PM AKASHI Takahiro
> <takahiro.akashi@linaro.org> wrote:
> >
> > Hi Bhupesh,
> >
> > Do you have a corresponding patch for userspace tools,
> > including crash util and/or makedumpfile?
> > Otherwise, we can't verify that a generated core file is
> > correctly handled.
> 
> Sure. I am still working on the crash-utility related changes, but you
> can find the makedumpfile changes I posted a couple of days ago here
> (see [0]) and the github link for the makedumpfile changes can be seen
> via [1].
> 
> I will post the crash-util changes shortly as well.
> Thanks for having a look at the same.

Thank you.
I have tested my kdump patch with a hacked version of crash
where VA_BITS_ACTUAL is calculated from tcr_el1_t1sz in vmcoreinfo.

-Takahiro Akashi


> [0]. http://lists.infradead.org/pipermail/kexec/2019-November/023963.html
> [1]. https://github.com/bhupesh-sharma/makedumpfile/tree/52-bit-va-support-via-vmcore-upstream-v4
> 
> Regards,
> Bhupesh
> 
> >
> > Thanks,
> > -Takahiro Akashi
> >
> > On Mon, Nov 11, 2019 at 01:31:19PM +0530, Bhupesh Sharma wrote:
> > > Changes since v3:
> > > ----------------
> > > - v3 can be seen here:
> > >   http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
> > > - Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
> > >   instead of PTRS_PER_PGD.
> > > - Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
> > >   'Documentation/arm64/memory.rst'
> > >
> > > Changes since v2:
> > > ----------------
> > > - v2 can be seen here:
> > >   http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
> > > - Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
> > >   ifdef sections, as suggested by Kazu.
> > > - Updated vmcoreinfo documentation to add description about
> > >   'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).
> > >
> > > Changes since v1:
> > > ----------------
> > > - v1 was sent out as a single patch which can be seen here:
> > >   http://lists.infradead.org/pipermail/kexec/2019-February/022411.html
> > >
> > > - v2 breaks the single patch into two independent patches:
> > >   [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
> > >   [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code (all archs)
> > >
> > > This patchset primarily fixes the regression reported in user-space
> > > utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
> > > with the availability of 52-bit address space feature in underlying
> > > kernel. These regressions have been reported both on CPUs which don't
> > > support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
> > > and also on prototype platforms (like ARMv8 FVP simulator model) which
> > > support ARMv8.2 extensions and are running newer kernels.
> > >
> > > The reason for these regressions is that right now user-space tools
> > > have no direct access to these values (since these are not exported
> > > from the kernel) and hence need to rely on a best-guess method of
> > > determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
> > > by underlying kernel.
> > >
> > > Exporting these values via vmcoreinfo will help user-land in such cases.
> > > In addition, as per suggestion from makedumpfile maintainer (Kazu),
> > > it makes more sense to append 'MAX_PHYSMEM_BITS' to
> > > vmcoreinfo in the core code itself rather than in arm64 arch-specific
> > > code, so that the user-space code for other archs can also benefit from
> > > this addition to the vmcoreinfo and use it as a standard way of
> > > determining 'SECTIONS_SHIFT' value in user-land.
> > >
> > > Cc: Boris Petkov <bp@alien8.de>
> > > Cc: Ingo Molnar <mingo@kernel.org>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > Cc: James Morse <james.morse@arm.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Steve Capper <steve.capper@arm.com>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Dave Anderson <anderson@redhat.com>
> > > Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
> > > Cc: x86@kernel.org
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-doc@vger.kernel.org
> > > Cc: kexec@lists.infradead.org
> > >
> > > Bhupesh Sharma (3):
> > >   crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
> > >   arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
> > >   Documentation/arm64: Fix a simple typo in memory.rst
> > >
> > >  Documentation/arm64/memory.rst         | 2 +-
> > >  arch/arm64/include/asm/pgtable-hwdef.h | 1 +
> > >  arch/arm64/kernel/crash_core.c         | 9 +++++++++
> > >  kernel/crash_core.c                    | 1 +
> > >  4 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > --
> > > 2.7.4
> > >
> >
> 
