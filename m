Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA43227854
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 07:47:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9ngR4j38zDqgq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 15:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9ndd4jPnzDqbF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 15:46:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=bsdq3RgU; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4B9ndd2kFkz9sRW; Tue, 21 Jul 2020 15:46:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1595310373; bh=h5v/z0N4MGFxoJg1GsHzJ0zVrgcj/eMAzSW3netP+R4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bsdq3RgUQRm3imvD5OnpTg6IhTu+jJ3xjYGQIl1HU9x1bXRs1vF0znu25iSME054t
 kgBNrbyAJd80vhvitaJIyJo082/z0WyZXg3ug8ICzN+m5wlJD9AgGO2uC3STqZfsw3
 vlSPwiGL1mXsSEhB6mFQefmbrZEwzF2kF8SvjxsSJecY9SpZo87vJDZ/kQ9lwyZU4+
 pgu/igX098brmF/Dv7vpkeJ/Hl3Y3RST9TybB2Ds2Tqu4YSQyZRnxNfnBhP2ro2Pai
 NAXJRgsFjD36F8rKRfwJUxkaoWOaINJMey7cIFpL7jmKHVj7x9mx6FJ4pxE1OOjVAY
 MMZJMdokBBUiw==
Date: Tue, 21 Jul 2020 15:46:09 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH 2/2] KVM: PPC: Book3S HV: rework secure mem slot dropping
Message-ID: <20200721054609.GB3878639@thinks.paulus.ozlabs.org>
References: <20200703155914.40262-1-ldufour@linux.ibm.com>
 <20200703155914.40262-3-ldufour@linux.ibm.com>
 <20200708112531.GA7902@in.ibm.com>
 <0588d16a-8548-0f55-1132-400807a390a1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0588d16a-8548-0f55-1132-400807a390a1@linux.ibm.com>
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
 kvm-ppc@vger.kernel.org, bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 08, 2020 at 02:16:36PM +0200, Laurent Dufour wrote:
> Le 08/07/2020 à 13:25, Bharata B Rao a écrit :
> > On Fri, Jul 03, 2020 at 05:59:14PM +0200, Laurent Dufour wrote:
> > > When a secure memslot is dropped, all the pages backed in the secure device
> > > (aka really backed by secure memory by the Ultravisor) should be paged out
> > > to a normal page. Previously, this was achieved by triggering the page
> > > fault mechanism which is calling kvmppc_svm_page_out() on each pages.
> > > 
> > > This can't work when hot unplugging a memory slot because the memory slot
> > > is flagged as invalid and gfn_to_pfn() is then not trying to access the
> > > page, so the page fault mechanism is not triggered.
> > > 
> > > Since the final goal is to make a call to kvmppc_svm_page_out() it seems
> > > simpler to directly calling it instead of triggering such a mechanism. This
> > > way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
> > > memslot.
> > 
> > Yes, this appears much simpler.
> 
> Thanks Bharata for reviewing this.
> 
> > 
> > > 
> > > Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
> > > the call to __kvmppc_svm_page_out() is made.
> > > As __kvmppc_svm_page_out needs the vma pointer to migrate the pages, the
> > > VMA is fetched in a lazy way, to not trigger find_vma() all the time. In
> > > addition, the mmap_sem is help in read mode during that time, not in write
> > > mode since the virual memory layout is not impacted, and
> > > kvm->arch.uvmem_lock prevents concurrent operation on the secure device.
> > > 
> > > Cc: Ram Pai <linuxram@us.ibm.com>
> > > Cc: Bharata B Rao <bharata@linux.ibm.com>
> > > Cc: Paul Mackerras <paulus@ozlabs.org>
> > > Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> > > ---
> > >   arch/powerpc/kvm/book3s_hv_uvmem.c | 54 ++++++++++++++++++++----------
> > >   1 file changed, 37 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > index 852cc9ae6a0b..479ddf16d18c 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > @@ -533,35 +533,55 @@ static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
> > >    * fault on them, do fault time migration to replace the device PTEs in
> > >    * QEMU page table with normal PTEs from newly allocated pages.
> > >    */
> > > -void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
> > > +void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
> > >   			     struct kvm *kvm, bool skip_page_out)
> > >   {
> > >   	int i;
> > >   	struct kvmppc_uvmem_page_pvt *pvt;
> > > -	unsigned long pfn, uvmem_pfn;
> > > -	unsigned long gfn = free->base_gfn;
> > > +	struct page *uvmem_page;
> > > +	struct vm_area_struct *vma = NULL;
> > > +	unsigned long uvmem_pfn, gfn;
> > > +	unsigned long addr, end;
> > > +
> > > +	down_read(&kvm->mm->mmap_sem);
> > 
> > You should be using mmap_read_lock(kvm->mm) with recent kernels.
> 
> Absolutely, shame on me, I reviewed Michel's series about that!
> 
> Paul, Michael, could you fix that when pulling this patch or should I sent a
> whole new series?

Given that Ram has reworked his series, I think it would be best if
you rebase on top of his new series and re-send your series.

Thanks,
Paul.
