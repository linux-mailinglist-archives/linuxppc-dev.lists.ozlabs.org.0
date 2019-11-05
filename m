Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFAAF0AEA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 01:10:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4776Pm3j55zF5Fb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:10:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ax5HR98W"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4775Vz1NkQzF56F
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 10:30:12 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id z6so19243161otb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 15:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3DmgtbuDvl/nfkrniY8Ba73gr9pACG77rpNCqLOyTA=;
 b=ax5HR98WH4xqZvWHcyzuHRNGmZvT7I9m7xhGJ1uY8PDybcgBe1VmfyCLXrE48zy0BX
 vWcIHu6UYoH8HknqTIdU6Y+LYlECfapFpwLBsIAucTcvwTRYHtKiZpX6HfdTzXXEPEnk
 HWjqS+gQejFktk2XITcuM0n+yeF5sQPBkc+kK/6meBz8x9VvLBJ24hrRrJof+Z2QZCIS
 ZvRSXKB24+uJoWcJtAJmQHL6SW1XP2EN8QixZwZsl13dmEYE2GJMvXzgHqy355aGvDQ3
 F0zrp/0LqNIWlZiKW6TlpU1rB2bmBt1brju1GqeiJ5NinFlVYYEE2UC84COw1zeJ61L+
 MXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3DmgtbuDvl/nfkrniY8Ba73gr9pACG77rpNCqLOyTA=;
 b=oJB89Xw8CcnADPo+JS4umSloM/ttoVXWS3Kc+hQie3Wf3sSoz14lPnu1deq7yPuybO
 76vmftS97lEl8E9hW75sS440MnmKfMRiDxdAU0DyuyTLYwsrcTdoc+bcbiWhyLF90Zlj
 Zowe0zClDl+LvPnS+AkjukYFkSg1pN3deAJLi3PkCIAOx3rEbI9eCtjlN4e7n4MyShIx
 GPpGfB/fxC07NeAvrfkJjLQcXjzZlhL0tmu9EhKsUAafCwp0ftI0PU9K9eVMTbv1UCla
 xht5AvDDVT5spdpNkbKoqQi+9RRYR1kHBDQZtfUryJ0BxnhhCVcUfcFnOMabC5hiTzxq
 RqHg==
X-Gm-Message-State: APjAAAWAMrzo7JuLEXNckpJK6J42qzDv7IekB43tnf4OuTwAkAeF88hN
 75+Z/yTaE5rGRiQi9CjTYlRxmMVMyGBjVYAXcTkXHw==
X-Google-Smtp-Source: APXvYqyxc+DmPQQN5aSk0dtRzKoWLg9GygXu/1AciWksnhJhFNdAydFP0T3vz9JQ5vwewxa4ElAmJqPI0FG8eQ5kblQ=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr24157383oti.207.1572996611041; 
 Tue, 05 Nov 2019 15:30:11 -0800 (PST)
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
In-Reply-To: <20191105231316.GE23297@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 15:30:00 -0800
Message-ID: <CAPcyv4iRP0Sz=mcT+iuoVaD4-o2q1nCH2Hixc5OkfWu+SBQmkg@mail.gmail.com>
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

On Tue, Nov 5, 2019 at 3:13 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Tue, Nov 05, 2019 at 03:02:40PM -0800, Dan Williams wrote:
> > On Tue, Nov 5, 2019 at 12:31 PM David Hildenbrand <david@redhat.com> wrote:
> > > > The scarier code (for me) is transparent_hugepage_adjust() and
> > > > kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
> > > > interaction between THP and _PAGE_DEVMAP.
> > >
> > > The x86 KVM MMU code is one of the ugliest code I know (sorry, but it
> > > had to be said :/ ). Luckily, this should be independent of the
> > > PG_reserved thingy AFAIKs.
> >
> > Both transparent_hugepage_adjust() and kvm_mmu_zap_collapsible_spte()
> > are honoring kvm_is_reserved_pfn(), so again I'm missing where the
> > page count gets mismanaged and leads to the reported hang.
>
> When mapping pages into the guest, KVM gets the page via gup(), which
> increments the page count for ZONE_DEVICE pages.  But KVM puts the page
> using kvm_release_pfn_clean(), which skips put_page() if PageReserved()
> and so never puts its reference to ZONE_DEVICE pages.

Oh, yeah, that's busted.

> My transparent_hugepage_adjust() and kvm_mmu_zap_collapsible_spte()
> comments were for a post-patch/series scenario wheren PageReserved() is
> no longer true for ZONE_DEVICE pages.

Ah, ok, for that David is preserving kvm_is_reserved_pfn() returning
true for ZONE_DEVICE because pfn_to_online_page() will fail for
ZONE_DEVICE.
