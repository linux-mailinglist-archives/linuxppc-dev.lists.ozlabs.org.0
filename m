Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC73C625
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 10:43:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NNnz4fdXzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:43:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=kernellwp@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kzGBZj5q"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NNlr4hKgzDqY2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 18:41:58 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id v186so8328743oie.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v59RXEncklQZD+fQgfPPSwKXWN+Shli8ceMKKuyEhf0=;
 b=kzGBZj5q2XeUUnNn+hZIDQ46zIbc4pi+XhZMT9xquzmAl0mAoe/hTW/h4vI3GliFyD
 mXnvOXJl3RpDm9VgZWAEm2w4h2wvu0g8FX8kQbFB14i2xbEtTzS3nJtZ+sTfGYQIY7+0
 fIiRu2bpFatZkFK7tl+5xmNIkNo/0+aWiQUyy2ZQR3G9TgPGLCkyGRfd2GVcmdAQbwoT
 dIDnLEETDOW7qbBihciICLYyBxd0Jaymx3fytdeRwx3hC4H742XJmZ0riceYpBoyKeEr
 FYpmZBWZz3MUPy3Acp87PhKrT92mbXGGfNVFAVpX35lGvFuc9uJG/ZKYUADeNkYNr+wB
 zEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v59RXEncklQZD+fQgfPPSwKXWN+Shli8ceMKKuyEhf0=;
 b=EVl8y0RgkXByQos4hoi/71UHMKCt9fCjSBghbUcLJsgC3Q0va074TFByFm6JKQ1ISY
 /M48GfE+o3CQ1PqNfm5dCP8FzCGrEx9OGc0OyNsmmbT+xbi46kls3L2SAcosCCJeEDHK
 okyYWQQ8cggUZcbhFH68FIufWXUeqi6YAveIvBLkBsZK1COecrih5y8qh+S5rzgU/W9e
 bxRx1RPdVA5E1u34JKl9497UAQdAal7qZ/9+p38anRZ4Br5B01/AU37/ppS8Z9wvBkOW
 amfj5vmCexdQyiy2yiP22Woe6z4y8ymdfFv8qSjp2zSPwkaKlKQDQygChNr8Q1FGt09G
 K5Rw==
X-Gm-Message-State: APjAAAU8odyuFwee0Nw1wyeCaO/MGJRdsE6enoBUD3VYXuLPLwsOXNLp
 IXB42p00FDm7nj4vTRSdWS4E1zdLuZF9stKHRrE=
X-Google-Smtp-Source: APXvYqzxaOZ9KUV/kRDM8l0u6+E8suUMaqGg0qPMAJRT6KRoeygwlTXcCyHIDf4inVwolTl02OcElY+Wfcd/PVxQ3Ig=
X-Received: by 2002:aca:3305:: with SMTP id z5mr12702145oiz.141.1560242515130; 
 Tue, 11 Jun 2019 01:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20180130013919.GA19959@hori1.linux.bs1.fc.nec.co.jp>
 <1517284444-18149-1-git-send-email-n-horiguchi@ah.jp.nec.com>
 <87inbbjx2w.fsf@e105922-lin.cambridge.arm.com>
 <20180207011455.GA15214@hori1.linux.bs1.fc.nec.co.jp>
 <87fu6bfytm.fsf@e105922-lin.cambridge.arm.com>
 <20180208121749.0ac09af2b5a143106f339f55@linux-foundation.org>
 <87wozhvc49.fsf@concordia.ellerman.id.au>
 <e673f38a-9e5f-21f6-421b-b3cb4ff02e91@oracle.com>
 <CANRm+CxAgWVv5aVzQ0wdP_A7QQgqfy7nN_SxyaactG7Mnqfr2A@mail.gmail.com>
 <f79d828c-b0b4-8a20-c316-a13430cfb13c@oracle.com>
 <20190610235045.GB30991@hori.linux.bs1.fc.nec.co.jp>
In-Reply-To: <20190610235045.GB30991@hori.linux.bs1.fc.nec.co.jp>
From: Wanpeng Li <kernellwp@gmail.com>
Date: Tue, 11 Jun 2019 16:42:39 +0800
Message-ID: <CANRm+Cy80ca6XC3c1CT0KzX=xi3g3nMEp5GxmhOH-CUZa-jM_g@mail.gmail.com>
Subject: Re: [PATCH v2] mm: hwpoison: disable memory error handling on 1GB
 hugepage
To: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
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
Cc: kvm <kvm@vger.kernel.org>,
 "lidongchen@tencent.com" <lidongchen@tencent.com>,
 Punit Agrawal <punit.agrawal@arm.com>,
 Xiao Guangrong <xiaoguangrong@tencent.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "yongkaiwu@tencent.com" <yongkaiwu@tencent.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Jun 2019 at 07:51, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com> wrote:
>
> On Wed, May 29, 2019 at 04:31:01PM -0700, Mike Kravetz wrote:
> > On 5/28/19 2:49 AM, Wanpeng Li wrote:
> > > Cc Paolo,
> > > Hi all,
> > > On Wed, 14 Feb 2018 at 06:34, Mike Kravetz <mike.kravetz@oracle.com> wrote:
> > >>
> > >> On 02/12/2018 06:48 PM, Michael Ellerman wrote:
> > >>> Andrew Morton <akpm@linux-foundation.org> writes:
> > >>>
> > >>>> On Thu, 08 Feb 2018 12:30:45 +0000 Punit Agrawal <punit.agrawal@arm.com> wrote:
> > >>>>
> > >>>>>>
> > >>>>>> So I don't think that the above test result means that errors are properly
> > >>>>>> handled, and the proposed patch should help for arm64.
> > >>>>>
> > >>>>> Although, the deviation of pud_huge() avoids a kernel crash the code
> > >>>>> would be easier to maintain and reason about if arm64 helpers are
> > >>>>> consistent with expectations by core code.
> > >>>>>
> > >>>>> I'll look to update the arm64 helpers once this patch gets merged. But
> > >>>>> it would be helpful if there was a clear expression of semantics for
> > >>>>> pud_huge() for various cases. Is there any version that can be used as
> > >>>>> reference?
> > >>>>
> > >>>> Is that an ack or tested-by?
> > >>>>
> > >>>> Mike keeps plaintively asking the powerpc developers to take a look,
> > >>>> but they remain steadfastly in hiding.
> > >>>
> > >>> Cc'ing linuxppc-dev is always a good idea :)
> > >>>
> > >>
> > >> Thanks Michael,
> > >>
> > >> I was mostly concerned about use cases for soft/hard offline of huge pages
> > >> larger than PMD_SIZE on powerpc.  I know that powerpc supports PGD_SIZE
> > >> huge pages, and soft/hard offline support was specifically added for this.
> > >> See, 94310cbcaa3c "mm/madvise: enable (soft|hard) offline of HugeTLB pages
> > >> at PGD level"
> > >>
> > >> This patch will disable that functionality.  So, at a minimum this is a
> > >> 'heads up'.  If there are actual use cases that depend on this, then more
> > >> work/discussions will need to happen.  From the e-mail thread on PGD_SIZE
> > >> support, I can not tell if there is a real use case or this is just a
> > >> 'nice to have'.
> > >
> > > 1GB hugetlbfs pages are used by DPDK and VMs in cloud deployment, we
> > > encounter gup_pud_range() panic several times in product environment.
> > > Is there any plan to reenable and fix arch codes?
> >
> > I too am aware of slightly more interest in 1G huge pages.  Suspect that as
> > Intel MMU capacity increases to handle more TLB entries there will be more
> > and more interest.
> >
> > Personally, I am not looking at this issue.  Perhaps Naoya will comment as
> > he know most about this code.
>
> Thanks for forwarding this to me, I'm feeling that memory error handling
> on 1GB hugepage is demanded as real use case.
>
> >
> > > In addition, https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kvm/mmu.c#n3213
> > > The memory in guest can be 1GB/2MB/4K, though the host-backed memory
> > > are 1GB hugetlbfs pages, after above PUD panic is fixed,
> > > try_to_unmap() which is called in MCA recovery path will mark the PUD
> > > hwpoison entry. The guest will vmexit and retry endlessly when
> > > accessing any memory in the guest which is backed by this 1GB poisoned
> > > hugetlbfs page. We have a plan to split this 1GB hugetblfs page by 2MB
> > > hugetlbfs pages/4KB pages, maybe file remap to a virtual address range
> > > which is 2MB/4KB page granularity, also split the KVM MMU 1GB SPTE
> > > into 2MB/4KB and mark the offensive SPTE w/ a hwpoison flag, a sigbus
> > > will be delivered to VM at page fault next time for the offensive
> > > SPTE. Is this proposal acceptable?
> >
> > I am not sure of the error handling design, but this does sound reasonable.
>
> I agree that that's better.
>
> > That block of code which potentially dissolves a huge page on memory error
> > is hard to understand and I'm not sure if that is even the 'normal'
> > functionality.  Certainly, we would hate to waste/poison an entire 1G page
> > for an error on a small subsection.
>
> Yes, that's not practical, so we need at first establish the code base for
> 2GB hugetlb splitting and then extending it to 1GB next.

I'm working on this, thanks for the inputs.

Regards,
Wanpeng Li
