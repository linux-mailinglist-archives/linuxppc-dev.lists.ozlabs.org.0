Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1B212C84
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:48:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yRtT6tCMzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:48:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KvJEHGNq; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KvJEHGNq; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRnj1JCFzDr30
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:43:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593715430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eBs9fJWNeYySdMcu8KtkWgGYnn/ATIhNzdp6AqWn/po=;
 b=KvJEHGNqgSd0ZCHqrF507F5dWp/fd07Uu13G7hdJ7gnuO+BoAx98DCsazHNcL6tSwZfRdl
 MfPo3mG55BWWCH1Te+H+T6Uhf11F6H5nFj2MrJpZN98XL/z7SYW6FJrh1PtZh5sy2jRt96
 MDkuULRPdGOI6SO06MyuxgzGGcwVLnw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593715430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eBs9fJWNeYySdMcu8KtkWgGYnn/ATIhNzdp6AqWn/po=;
 b=KvJEHGNqgSd0ZCHqrF507F5dWp/fd07Uu13G7hdJ7gnuO+BoAx98DCsazHNcL6tSwZfRdl
 MfPo3mG55BWWCH1Te+H+T6Uhf11F6H5nFj2MrJpZN98XL/z7SYW6FJrh1PtZh5sy2jRt96
 MDkuULRPdGOI6SO06MyuxgzGGcwVLnw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-nv0mnSAKOp-djYjFlDh8iQ-1; Thu, 02 Jul 2020 14:43:43 -0400
X-MC-Unique: nv0mnSAKOp-djYjFlDh8iQ-1
Received: by mail-qk1-f200.google.com with SMTP id f79so13972245qke.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eBs9fJWNeYySdMcu8KtkWgGYnn/ATIhNzdp6AqWn/po=;
 b=L56y0fnkip1SRUWZ/Bpg1iau+sRvFVxhwEKvg1LbV7ZAezfsKL2ox2rLI77g7e607l
 qvy4UQJdAZIXja3ua/Ylq8xykdGc61jD9SDjpIxxCh2Y6AhBWRNDrTjqF7PWOr8AWCZk
 ZzqkmxZ2JYzGGTvT6zQ5qqq3oFOcvnskyw+djHH0EdXc+sDJt2FhBFPM25139ej3ircI
 Ek1t1/ETl1ONOG9TWmQ8Ln+46NQgVi+dS1OejIWq/QLmW2mdc/FyH5K+8fttPLIGVAbh
 hlmpfE4A8Szkb/5HqQNy+1kCO857e89lnLhOItq+1dQfyhqjg3yL3Hc4Wt0r6XHP/9yL
 CPrQ==
X-Gm-Message-State: AOAM531In3ang4/iy926oKAku8IFTSTbRzlm3KijGfJliFic8X7jzKiy
 AZvJxvBtH8SMw295fyNjXYe74ot9U/kUIpqW7Fk9jrBLbUoIUMEBnXJFOxjCtcHbycqPG9//ZUK
 UjAlw7rh+02jOHUoqhUOgODMZ0T8p4hDyd9whVIjPFw==
X-Received: by 2002:ac8:429b:: with SMTP id o27mr21484406qtl.124.1593715423286; 
 Thu, 02 Jul 2020 11:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeunlLTSmJ7ldLPyyGx2hly92ochyhDWedphYsrnNnrZbxzUOcSEgJ30myWyCcqcZPawXx+2/U/YGBr1VRid4=
X-Received: by 2002:ac8:429b:: with SMTP id o27mr21484372qtl.124.1593715422996; 
 Thu, 02 Jul 2020 11:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
 <159370984726.27923.4874334372278158979.b4-ty@arm.com>
In-Reply-To: <159370984726.27923.4874334372278158979.b4-ty@arm.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Fri, 3 Jul 2020 00:13:31 +0530
Message-ID: <CACi5LpNUDmoMkEuHvw0Asg=OHJCB3SfZR7XmuyzpFdSkdb5vjw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To: Catalin Marinas <catalin.marinas@arm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bhsharma@redhat.com
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
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 John Donnelly <john.p.donnelly@oracle.com>,
 Scott Branden <scott.branden@broadcom.com>, Boris Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bhupesh SHARMA <bhupesh.linux@gmail.com>,
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

On Thu, Jul 2, 2020 at 10:45 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Thu, 14 May 2020 00:22:35 +0530, Bhupesh Sharma wrote:
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
> > [...]
>
> Applied to arm64 (for-next/vmcoreinfo), thanks!
>
> [1/2] crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
>       https://git.kernel.org/arm64/c/1d50e5d0c505
> [2/2] arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
>       https://git.kernel.org/arm64/c/bbdbc11804ff

Thanks Catalin for pulling in the changes.

Dave and James, many thanks for reviewing the same as well.

Regards,
Bhupesh

