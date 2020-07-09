Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E4219EEC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:12:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2YRm6cHlzDrCH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 21:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2YPs5YdtzDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 21:10:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IpJ79hMF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2YPq736cz9s1x;
 Thu,  9 Jul 2020 21:10:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594293057;
 bh=yRALeo2WWMNouhtOFfAIYKeRGEF0Y6ZN/Bx9xWP4D0s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IpJ79hMFe2+vLLkINDkeDK6RAYv0cR8pmYUBehmlLjb0YjfdaR9UMjoaWFGMJlHHz
 BSioaudAKP6kT+WYJ4q5vXVQtL+U2YbAECpRW6Uw9GJIyg3nRBS7tPB99N0P4MEYz5
 wqfm5NDYtXUOPayA7mINIrHbSBUJnsShXqlVo5iJyr/hEupBG7DJe84TV9nYf5PsNW
 F40SWNb1OhAkm5bwg31/w+CyLrrl8zWZ5X8X0+TB8Ch/0roxk+TBs9fXjUoqv4wGej
 pibM/9dfF/PldVkrus4p5YFKXIEwqT6WCyogX/+WSpQVJKMQAQjMT6A4QK4SOgfpip
 jqpWxxHSE3cTw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, bharata@linux.ibm.com
Subject: Re: [PATCH 2/2] KVM: PPC: Book3S HV: rework secure mem slot dropping
In-Reply-To: <0588d16a-8548-0f55-1132-400807a390a1@linux.ibm.com>
References: <20200703155914.40262-1-ldufour@linux.ibm.com>
 <20200703155914.40262-3-ldufour@linux.ibm.com>
 <20200708112531.GA7902@in.ibm.com>
 <0588d16a-8548-0f55-1132-400807a390a1@linux.ibm.com>
Date: Thu, 09 Jul 2020 21:13:11 +1000
Message-ID: <871rllvt4o.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, paulus@samba.org, sathnaga@linux.vnet.ibm.com,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Le 08/07/2020 =C3=A0 13:25, Bharata B Rao a =C3=A9crit=C2=A0:
>> On Fri, Jul 03, 2020 at 05:59:14PM +0200, Laurent Dufour wrote:
>>> When a secure memslot is dropped, all the pages backed in the secure de=
vice
>>> (aka really backed by secure memory by the Ultravisor) should be paged =
out
>>> to a normal page. Previously, this was achieved by triggering the page
>>> fault mechanism which is calling kvmppc_svm_page_out() on each pages.
>>>
>>> This can't work when hot unplugging a memory slot because the memory sl=
ot
>>> is flagged as invalid and gfn_to_pfn() is then not trying to access the
>>> page, so the page fault mechanism is not triggered.
>>>
>>> Since the final goal is to make a call to kvmppc_svm_page_out() it seems
>>> simpler to directly calling it instead of triggering such a mechanism. =
This
>>> way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
>>> memslot.
>>=20
>> Yes, this appears much simpler.
>
> Thanks Bharata for reviewing this.
>
>>=20
>>>
>>> Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
>>> the call to __kvmppc_svm_page_out() is made.
>>> As __kvmppc_svm_page_out needs the vma pointer to migrate the pages, the
>>> VMA is fetched in a lazy way, to not trigger find_vma() all the time. In
>>> addition, the mmap_sem is help in read mode during that time, not in wr=
ite
>>> mode since the virual memory layout is not impacted, and
>>> kvm->arch.uvmem_lock prevents concurrent operation on the secure device.
>>>
>>> Cc: Ram Pai <linuxram@us.ibm.com>
>>> Cc: Bharata B Rao <bharata@linux.ibm.com>
>>> Cc: Paul Mackerras <paulus@ozlabs.org>
>>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>>> ---
>>>   arch/powerpc/kvm/book3s_hv_uvmem.c | 54 ++++++++++++++++++++----------
>>>   1 file changed, 37 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book=
3s_hv_uvmem.c
>>> index 852cc9ae6a0b..479ddf16d18c 100644
>>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> @@ -533,35 +533,55 @@ static inline int kvmppc_svm_page_out(struct vm_a=
rea_struct *vma,
>>>    * fault on them, do fault time migration to replace the device PTEs =
in
>>>    * QEMU page table with normal PTEs from newly allocated pages.
>>>    */
>>> -void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>>> +void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
>>>   			     struct kvm *kvm, bool skip_page_out)
>>>   {
>>>   	int i;
>>>   	struct kvmppc_uvmem_page_pvt *pvt;
>>> -	unsigned long pfn, uvmem_pfn;
>>> -	unsigned long gfn =3D free->base_gfn;
>>> +	struct page *uvmem_page;
>>> +	struct vm_area_struct *vma =3D NULL;
>>> +	unsigned long uvmem_pfn, gfn;
>>> +	unsigned long addr, end;
>>> +
>>> +	down_read(&kvm->mm->mmap_sem);
>>=20
>> You should be using mmap_read_lock(kvm->mm) with recent kernels.
>
> Absolutely, shame on me, I reviewed Michel's series about that!
>
> Paul, Michael, could you fix that when pulling this patch or should I sen=
t a=20
> whole new series?

Paul will take this series, so up to him.

cheers
