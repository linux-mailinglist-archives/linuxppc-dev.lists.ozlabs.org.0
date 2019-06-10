Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F03C091
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 02:29:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N9qq14P6zDqQk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 10:29:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ah.jp.nec.com
 (client-ip=114.179.232.185; helo=tyo185.gate.nec.co.jp;
 envelope-from=n-horiguchi@ah.jp.nec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ah.jp.nec.com
X-Greylist: delayed 2172 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Jun 2019 10:28:22 AEST
Received: from tyo185.gate.nec.co.jp (tyo185.gate.nec.co.jp [114.179.232.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N9pG3CkSzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 10:28:21 +1000 (AEST)
Received: from tyo161.gate.nec.co.jp (tyo161.gate.nec.co.jp [114.179.232.161])
 by tyo185.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id
 x5ANq73O003405
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 08:52:07 +0900
Received: from mailgate02.nec.co.jp ([114.179.233.122])
 by tyo161.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id x5ANpjra015106
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 11 Jun 2019 08:51:45 +0900
Received: from mailsv02.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
 by mailgate02.nec.co.jp (8.15.1/8.15.1) with ESMTP id x5ANpj1a007816;
 Tue, 11 Jun 2019 08:51:45 +0900
Received: from mail02.kamome.nec.co.jp (mail02.kamome.nec.co.jp [10.25.43.5])
 by mailsv02.nec.co.jp (8.15.1/8.15.1) with ESMTP id x5ANpDXZ009406; 
 Tue, 11 Jun 2019 08:51:45 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.148] [10.38.151.148]) by
 mail02.kamome.nec.co.jp with ESMTP id BT-MMP-5840663;
 Tue, 11 Jun 2019 08:50:39 +0900
Received: from BPXM23GP.gisp.nec.co.jp ([10.38.151.215]) by
 BPXC20GP.gisp.nec.co.jp ([10.38.151.148]) with mapi id 14.03.0319.002; Tue,
 11 Jun 2019 08:50:39 +0900
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v2] mm: hwpoison: disable memory error handling on 1GB
 hugepage
Thread-Topic: [PATCH v2] mm: hwpoison: disable memory error handling on 1GB
 hugepage
Thread-Index: AQHVFnaoUuMkT7+k5kKGu78GtXiXKKaVCtaA
Date: Mon, 10 Jun 2019 23:50:38 +0000
Message-ID: <20190610235045.GB30991@hori.linux.bs1.fc.nec.co.jp>
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
In-Reply-To: <f79d828c-b0b4-8a20-c316-a13430cfb13c@oracle.com>
Accept-Language: en-US, ja-JP
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.34.125.96]
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <D93DB5550526EC4A8EA7D6EFB4444954@gisp.nec.co.jp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TM-AS-MML: disable
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
Cc: Wanpeng Li <kernellwp@gmail.com>, kvm <kvm@vger.kernel.org>,
 Punit Agrawal <punit.agrawal@arm.com>,
 Xiao Guangrong <xiaoguangrong@tencent.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "yongkaiwu@tencent.com" <yongkaiwu@tencent.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "lidongchen@tencent.com" <lidongchen@tencent.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2019 at 04:31:01PM -0700, Mike Kravetz wrote:
> On 5/28/19 2:49 AM, Wanpeng Li wrote:
> > Cc Paolo,
> > Hi all,
> > On Wed, 14 Feb 2018 at 06:34, Mike Kravetz <mike.kravetz@oracle.com> wr=
ote:
> >>
> >> On 02/12/2018 06:48 PM, Michael Ellerman wrote:
> >>> Andrew Morton <akpm@linux-foundation.org> writes:
> >>>
> >>>> On Thu, 08 Feb 2018 12:30:45 +0000 Punit Agrawal <punit.agrawal@arm.=
com> wrote:
> >>>>
> >>>>>>
> >>>>>> So I don't think that the above test result means that errors are =
properly
> >>>>>> handled, and the proposed patch should help for arm64.
> >>>>>
> >>>>> Although, the deviation of pud_huge() avoids a kernel crash the cod=
e
> >>>>> would be easier to maintain and reason about if arm64 helpers are
> >>>>> consistent with expectations by core code.
> >>>>>
> >>>>> I'll look to update the arm64 helpers once this patch gets merged. =
But
> >>>>> it would be helpful if there was a clear expression of semantics fo=
r
> >>>>> pud_huge() for various cases. Is there any version that can be used=
 as
> >>>>> reference?
> >>>>
> >>>> Is that an ack or tested-by?
> >>>>
> >>>> Mike keeps plaintively asking the powerpc developers to take a look,
> >>>> but they remain steadfastly in hiding.
> >>>
> >>> Cc'ing linuxppc-dev is always a good idea :)
> >>>
> >>
> >> Thanks Michael,
> >>
> >> I was mostly concerned about use cases for soft/hard offline of huge p=
ages
> >> larger than PMD_SIZE on powerpc.  I know that powerpc supports PGD_SIZ=
E
> >> huge pages, and soft/hard offline support was specifically added for t=
his.
> >> See, 94310cbcaa3c "mm/madvise: enable (soft|hard) offline of HugeTLB p=
ages
> >> at PGD level"
> >>
> >> This patch will disable that functionality.  So, at a minimum this is =
a
> >> 'heads up'.  If there are actual use cases that depend on this, then m=
ore
> >> work/discussions will need to happen.  From the e-mail thread on PGD_S=
IZE
> >> support, I can not tell if there is a real use case or this is just a
> >> 'nice to have'.
> >=20
> > 1GB hugetlbfs pages are used by DPDK and VMs in cloud deployment, we
> > encounter gup_pud_range() panic several times in product environment.
> > Is there any plan to reenable and fix arch codes?
>=20
> I too am aware of slightly more interest in 1G huge pages.  Suspect that =
as
> Intel MMU capacity increases to handle more TLB entries there will be mor=
e
> and more interest.
>=20
> Personally, I am not looking at this issue.  Perhaps Naoya will comment a=
s
> he know most about this code.

Thanks for forwarding this to me, I'm feeling that memory error handling
on 1GB hugepage is demanded as real use case.

>=20
> > In addition, https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/arch/x86/kvm/mmu.c#n3213
> > The memory in guest can be 1GB/2MB/4K, though the host-backed memory
> > are 1GB hugetlbfs pages, after above PUD panic is fixed,
> > try_to_unmap() which is called in MCA recovery path will mark the PUD
> > hwpoison entry. The guest will vmexit and retry endlessly when
> > accessing any memory in the guest which is backed by this 1GB poisoned
> > hugetlbfs page. We have a plan to split this 1GB hugetblfs page by 2MB
> > hugetlbfs pages/4KB pages, maybe file remap to a virtual address range
> > which is 2MB/4KB page granularity, also split the KVM MMU 1GB SPTE
> > into 2MB/4KB and mark the offensive SPTE w/ a hwpoison flag, a sigbus
> > will be delivered to VM at page fault next time for the offensive
> > SPTE. Is this proposal acceptable?
>=20
> I am not sure of the error handling design, but this does sound reasonabl=
e.

I agree that that's better.

> That block of code which potentially dissolves a huge page on memory erro=
r
> is hard to understand and I'm not sure if that is even the 'normal'
> functionality.  Certainly, we would hate to waste/poison an entire 1G pag=
e
> for an error on a small subsection.

Yes, that's not practical, so we need at first establish the code base for
2GB hugetlb splitting and then extending it to 1GB next.

Thanks,
Naoya Horiguchi=

