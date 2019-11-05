Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E0F0AEF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 01:14:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4776V40JfNzF3cM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:14:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="R8Alj67i"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4775pQ3YQ7zF0mJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 10:43:42 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id r24so2959009otk.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 15:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqF5WeWUkV8OSvmMn1NqVj3O1bVUGhAU7UxRwoOyQkQ=;
 b=R8Alj67iPtwWeE3roElZW+pYOh4ky6ik6lq6w2YDqxXxftHuL4xvlbGp/AuCb0KSF4
 fF4h2qKN/xAR7aB4QOjGG/Km9vamjGEGd5EWQf2UCkUQ7094fLn60YrhxpB59rWSuuj7
 7nYcFIzc4zA9efWctufgYQhIDnEfkoqphQsH8BEqo2jLW6Hzf3tWn5AOfjrJFaUwi37b
 mD+ZMfV0bhs0NXJ88Ult28HQhN/DXV2PO1Ue8zzlYMbfoUo9D38/0PdeApkFIZBhNMdh
 OAPGecXpyJFc4c5KNcOLo/Tij1p7AqQxiKKMhOsGDsUROf+iLWTtTImhk4GgDWDE2fAg
 1QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqF5WeWUkV8OSvmMn1NqVj3O1bVUGhAU7UxRwoOyQkQ=;
 b=YEzJOQcxitCvuY7b54xxLpaRx06YfPDADv1Bw0Fc6kJXNs4ttcwrNrDUIrl/lRL7sp
 b+sWU1ox6fxOtRCOmC0y1y2kFknKBMU/nQKcx0VTAsA7HWZVwkRcunumhEMfrj2WT+xB
 SQN7Mkdyk06RZtrXTDKw8/NUxkBmC78+Nxa5v1pth/gSFUNjP2P/wnzCS8uUy9lAa2U3
 3xEXGeb/FGAhgVIYQiszFuooaC+jajrXPX+AHQGrp1NxJ504H1YuNHG8HFXhaieAbQYh
 C9SzeMk/CxCHHtUGICe2M0qoRvq6sv2EnSeJhbc8qcVuW7DyeMFRefkZrU+w908nALdg
 0dvw==
X-Gm-Message-State: APjAAAXNaly5K+bw8TpbcaR/nULLON904NMiqnaLg3OkoY2U1NcphPM4
 x3t9qXryD1/ZTQKB6JxtEPXQdd/wUsXafqsjjVY3jw==
X-Google-Smtp-Source: APXvYqyIc0AZHvfDAJRxs8BSUdGdJvbmvdIf2oP2r6ZSIdEGqlYbdICndzlbJrs4CN9R6UBYQWP9X3frciT2ip5IH08=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr24190398oti.207.1572997420669; 
 Tue, 05 Nov 2019 15:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
 <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
 <20191105231316.GE23297@linux.intel.com>
 <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
In-Reply-To: <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 15:43:29 -0800
Message-ID: <CAPcyv4i7tnjyghYhSjK8fxUu8Qkdc2RuD9kUwJcKEMDzOf51ng@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
To: Sean Christopherson <sean.j.christopherson@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 Nov 2019 11:05:37 +1100
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Adam Borowski <kilobyte@angband.pl>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 5, 2019 at 3:30 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Tue, Nov 5, 2019 at 3:13 PM Sean Christopherson
> <sean.j.christopherson@intel.com> wrote:
> >
> > On Tue, Nov 05, 2019 at 03:02:40PM -0800, Dan Williams wrote:
> > > On Tue, Nov 5, 2019 at 12:31 PM David Hildenbrand <david@redhat.com> wrote:
> > > > > The scarier code (for me) is transparent_hugepage_adjust() and
> > > > > kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
> > > > > interaction between THP and _PAGE_DEVMAP.
> > > >
> > > > The x86 KVM MMU code is one of the ugliest code I know (sorry, but it
> > > > had to be said :/ ). Luckily, this should be independent of the
> > > > PG_reserved thingy AFAIKs.
> > >
> > > Both transparent_hugepage_adjust() and kvm_mmu_zap_collapsible_spte()
> > > are honoring kvm_is_reserved_pfn(), so again I'm missing where the
> > > page count gets mismanaged and leads to the reported hang.
> >
> > When mapping pages into the guest, KVM gets the page via gup(), which
> > increments the page count for ZONE_DEVICE pages.  But KVM puts the page
> > using kvm_release_pfn_clean(), which skips put_page() if PageReserved()
> > and so never puts its reference to ZONE_DEVICE pages.
>
> Oh, yeah, that's busted.

Ugh, it's extra busted because every other gup user in the kernel
tracks the pages resulting from gup and puts them (put_page()) when
they are done. KVM wants to forget about whether it did a gup to get
the page and optionally trigger put_page() based purely on the pfn.
Outside of VFIO device assignment that needs pages pinned for DMA, why
does KVM itself need to pin pages? If pages are pinned over a return
to userspace that needs to be a FOLL_LONGTERM gup.
