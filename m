Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C07957D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 09:06:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CMK30DQJzDqwg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 17:06:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=kernellwp@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MSyMxEDm"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CMH45XgDzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 17:04:28 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id r20so4100037ota.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3Y+XVnvt7AU2ChE57m9qKA8qYR/u8KnDS7/D3UW/i8=;
 b=MSyMxEDmu1xQEQx3124prJwr4JdGq2H8W7B48jktxsNQnPT6bD8qXsv0Tok2UvLD1W
 Q42m23DCoxd51MypkIBVcTkxPZsW+g9LJpqN8x6rqV0SeAAaH0Jq6WP51nqP6nWb5rWS
 1raP2Rn0zpkErnXrGzOm9WeaLVmPkOKBuw8siG+MOS5yo91EJjSu8U0cStknC+mo2sAO
 rdKPGMqoR/wKV1QIwS/lDh17NZtrf9ZXT2M+HkIKqxZgRwE9DVsrCup+i2X8zXisA3xA
 A51aqdjRhxw7hUL2JTfrl12KF2cqDtfS6abm0uZMIfOSOaxDCagcU7JY1OUIzfzbEPrO
 AaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3Y+XVnvt7AU2ChE57m9qKA8qYR/u8KnDS7/D3UW/i8=;
 b=mlxNdelW8JWw5K03gkx1Pa2L/qMa4DQGpHyxL51aIRT09OoXbwdK0AiwXia2ppbDPT
 +nRHtrBtHLG4IsJdEwpZ941mOQz4RKOV1YFPU+0QGYbFO/UtA9ZDRx2JZMctay+K51EU
 EMDs9eV/jXp+dDlLoZ+Et9EOg7RPvjjSo6kAIQW5SQPynD/i+gf8RyJHUm5mBVCpYA8l
 Hb12nR/qQejhMVqjYcxcgWQVqpXnBpgWvHNX/Z41q/KjLj8Be6nNtPf9t/aBw7upW4M3
 Wi2UzRMF3jIVrh5OfBl+4r/HiIlsNMmRA0bh9xCUZU2n5d29jlpSeDXQHF0dAwRYz6ae
 1OOQ==
X-Gm-Message-State: APjAAAWVdetyj3JuFVeWMwRx3s1/YKwgUWdAf9kS4Sn9QTnBHzdsiszF
 OvOHIZ6NQ4tRQCB/iRU4em5m98HQX++xyVJqgmY=
X-Google-Smtp-Source: APXvYqwh2RLHYfC/r3CQ5ANL6XPMrctZkkd1kU4tgIF2w9uJaOw61hzE0NHEecCsclPkWpxjBr5OeSiWhK0KkpXOZa4=
X-Received: by 2002:a9d:674c:: with SMTP id w12mr17479137otm.118.1566284665544; 
 Tue, 20 Aug 2019 00:04:25 -0700 (PDT)
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
Date: Tue, 20 Aug 2019 15:03:55 +0800
Message-ID: <CANRm+CwwPv52k7pWiErYwFHV=_6kCdiyXZkT3QT6ef_UJagt9A@mail.gmail.com>
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
Cc: Mel Gorman <mgorman@techsingularity.net>, kvm <kvm@vger.kernel.org>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "lidongchen@tencent.com" <lidongchen@tencent.com>,
 Punit Agrawal <punit.agrawal@arm.com>,
 Xiao Guangrong <xiaoguangrong@tencent.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Hugh Dickins <hughd@google.com>,
 "yongkaiwu@tencent.com" <yongkaiwu@tencent.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc Mel Gorman, Kirill, Dave Hansen,
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

I found it is not easy to split. There is a unique hugetlb page size
that is associated with a mounted hugetlbfs filesystem, file remap to
2MB/4KB will break this. How about hard offline 1GB hugetlb page as
what has already done in soft offline, replace the corrupted 1GB page
by new 1GB page through page migration, the offending/corrupted area
in the original 1GB page doesn't need to be copied into the new page,
the offending/corrupted area in new page can keep full zero just as it
is clear during hugetlb page fault, other sub-pages of the original
1GB page can be freed to buddy system. The sigbus signal is sent to
userspace w/ offending/corrupted virtual address, and signal code,
userspace should take care this.

Regards,
Wanpeng Li
