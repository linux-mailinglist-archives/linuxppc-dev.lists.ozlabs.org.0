Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0921FA007
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 21:13:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m1Fx09CHzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 05:13:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=UgISKDd4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VONtuFH4; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m1D80c11zDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 05:12:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592248324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBDypd72AayeylkkdmJfk3R+s+aCIKax33JorcXAteU=;
 b=UgISKDd48XzOfK5Na/MKWgFNfFPb2eDn2kZmSxkrJtg45CJTSfrSeXaEZdEK/z3ySvFXeT
 r4kjb7xQR0WV6MDcQhhhW+3u0uQpdsLq62d2oS81RiqukPVKZ32s5rMplmw7mssWwS8OY9
 dQPb8fICmUTVV0mVxRiFhrRH0ejsSpI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592248325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBDypd72AayeylkkdmJfk3R+s+aCIKax33JorcXAteU=;
 b=VONtuFH4RfmgrxMeOx2l7VD/jgW7eudwYsyEy/miLD0OAV07VyfZe4T5Bk8HOpgV40KJ1P
 l8a/y0YP8Q2eKQQ7OGqNT1ulU9lAap62Zjybx67CkWAoiBLmYZT84MHUr121RDBO7VIvZ3
 Mhi9EMIPTAGzzpL4cbX7OzmskB3jcFM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-U0bPLzZKP0iK0Xn4qH5vxA-1; Mon, 15 Jun 2020 15:11:51 -0400
X-MC-Unique: U0bPLzZKP0iK0Xn4qH5vxA-1
Received: by mail-qt1-f197.google.com with SMTP id o11so14755720qti.23
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 12:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBDypd72AayeylkkdmJfk3R+s+aCIKax33JorcXAteU=;
 b=QO3MPFsv6tvgEacX0dDrijExZO4OG0sLq5R0UFREIJFJAPJdWlsKmtew69DyuXRFbo
 d1iSJm18IfrtKYjcNHStwrl28p9exlChVMRt7L9bB5VdELHblMvXLPErGYU7yKB3nhgR
 rPB2fRCAnKUT0WvJccqtNJebtq2cgMmyFKChZEK/4Q3WfI8mMVc/G0dYqWzAQ1PLAI2M
 QffNEuh8Dd/Y4tjRYRq+s2Bvc1z4pXy4DwM41eDd0biYdtR5bxshzFSsMOJapcXpDbN8
 8tFwFXaO2Xv6BZ/Zxw0GVOBMZPo6ELynpn/CrTmxIIOrCiP3GkLDDVE7ip2lVvge3Rf/
 fung==
X-Gm-Message-State: AOAM532arrNPdNEhNUlj5nclRX0uJ5fR03dpbpA2BuPnnIvjGli/u0mQ
 AFIHRI0CEI1HiPJ6i0Yu1AwPD6L/LFMNohUHqL/AFdrNEvCHU2zdQ6O+B3r/J77SIuTdJ9lRxcy
 JxFgJlHNuXaRMtRigSpW3xEv2bIkIxyWp/Z6HNAkCTw==
X-Received: by 2002:a0c:e254:: with SMTP id x20mr25376402qvl.153.1592248310803; 
 Mon, 15 Jun 2020 12:11:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj+hvBQAKPt+byrNt/W/RfLxG8oA1B0DgJCFqfYRYBqVFrGbuH2lT9c3kQXLnUlruGJeek3QiU4rpm8VmJsTc=
X-Received: by 2002:a0c:e254:: with SMTP id x20mr25376377qvl.153.1592248310457; 
 Mon, 15 Jun 2020 12:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
 <CACi5LpMKSNz=_OQWmEQ2kaswbjAONjn2pXQiu=jCA=wMt3wGCQ@mail.gmail.com>
In-Reply-To: <CACi5LpMKSNz=_OQWmEQ2kaswbjAONjn2pXQiu=jCA=wMt3wGCQ@mail.gmail.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Tue, 16 Jun 2020 00:41:37 +0530
Message-ID: <CACi5LpNYtAFq6PYjsYArViz+gzuh5-_CKZLBqo826oWhERrx8A@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, x86@kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
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
 John Donnelly <john.p.donnelly@oracle.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Steve Capper <steve.capper@arm.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Scott Branden <scott.branden@broadcom.com>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, James Morse <james.morse@arm.com>,
 kexec mailing list <kexec@lists.infradead.org>,
 Amit Kachhap <amit.kachhap@arm.com>, Boris Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 Dave Anderson <anderson@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Catalin, Will,

On Tue, Jun 2, 2020 at 10:54 AM Bhupesh Sharma <bhsharma@redhat.com> wrote:
>
> Hello,
>
> On Thu, May 14, 2020 at 12:22 AM Bhupesh Sharma <bhsharma@redhat.com> wrote:
> >
> > Apologies for the delayed update. Its been quite some time since I
> > posted the last version (v5), but I have been really caught up in some
> > other critical issues.
> >
> > Changes since v5:
> > ----------------
> > - v5 can be viewed here:
> >   http://lists.infradead.org/pipermail/kexec/2019-November/024055.html
> > - Addressed review comments from James Morse and Boris.
> > - Added Tested-by received from John on v5 patchset.
> > - Rebased against arm64 (for-next/ptr-auth) branch which has Amit's
> >   patchset for ARMv8.3-A Pointer Authentication feature vmcoreinfo
> >   applied.
> >
> > Changes since v4:
> > ----------------
> > - v4 can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-November/023961.html
> > - Addressed comments from Dave and added patches for documenting
> >   new variables appended to vmcoreinfo documentation.
> > - Added testing report shared by Akashi for PATCH 2/5.
> >
> > Changes since v3:
> > ----------------
> > - v3 can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
> > - Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
> >   instead of PTRS_PER_PGD.
> > - Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
> >   'Documentation/arm64/memory.rst'
> >
> > Changes since v2:
> > ----------------
> > - v2 can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
> > - Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
> >   ifdef sections, as suggested by Kazu.
> > - Updated vmcoreinfo documentation to add description about
> >   'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).
> >
> > Changes since v1:
> > ----------------
> > - v1 was sent out as a single patch which can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-February/022411.html
> >
> > - v2 breaks the single patch into two independent patches:
> >   [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
> >   [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code (all archs)
> >
> > This patchset primarily fixes the regression reported in user-space
> > utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
> > with the availability of 52-bit address space feature in underlying
> > kernel. These regressions have been reported both on CPUs which don't
> > support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
> > and also on prototype platforms (like ARMv8 FVP simulator model) which
> > support ARMv8.2 extensions and are running newer kernels.
> >
> > The reason for these regressions is that right now user-space tools
> > have no direct access to these values (since these are not exported
> > from the kernel) and hence need to rely on a best-guess method of
> > determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
> > by underlying kernel.
> >
> > Exporting these values via vmcoreinfo will help user-land in such cases.
> > In addition, as per suggestion from makedumpfile maintainer (Kazu),
> > it makes more sense to append 'MAX_PHYSMEM_BITS' to
> > vmcoreinfo in the core code itself rather than in arm64 arch-specific
> > code, so that the user-space code for other archs can also benefit from
> > this addition to the vmcoreinfo and use it as a standard way of
> > determining 'SECTIONS_SHIFT' value in user-land.
> >
> > Cc: Boris Petkov <bp@alien8.de>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: James Morse <james.morse@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Steve Capper <steve.capper@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Dave Anderson <anderson@redhat.com>
> > Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
> > Cc: John Donnelly <john.p.donnelly@oracle.com>
> > Cc: scott.branden@broadcom.com
> > Cc: Amit Kachhap <amit.kachhap@arm.com>
> > Cc: x86@kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > Cc: kexec@lists.infradead.org
> >
> > Bhupesh Sharma (2):
> >   crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
> >   arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
> >
> >  Documentation/admin-guide/kdump/vmcoreinfo.rst | 16 ++++++++++++++++
> >  arch/arm64/include/asm/pgtable-hwdef.h         |  1 +
> >  arch/arm64/kernel/crash_core.c                 | 10 ++++++++++
> >  kernel/crash_core.c                            |  1 +
> >  4 files changed, 28 insertions(+)
>
> Ping. @James Morse , Others
>
> Please share if you have some comments regarding this patchset.

Ping. I think we have two Tested-by available from Oracle and Marvell
folks on this patchset and no further review-comments.
Can you please help review/pick this patchset via the arm64 tree?

User-space utilities like makedumpfile and crash have been broken
since 52-bit VA addressing was enabled on arm64 kernel, so distros are
obliged to carry downstream-only fixes for these user-space utilities
to make them work with the kernel which support 52-bit VA addressing
on arm64.

Thanks,
Bhupesh

