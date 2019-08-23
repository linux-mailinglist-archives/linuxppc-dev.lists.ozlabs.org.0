Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F09AE94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 13:59:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FKhR1475zDrqQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 21:59:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FKdt6d1WzDrNN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 21:57:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46FKds2Qn9z9s00;
 Fri, 23 Aug 2019 21:57:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Mackerras <paulus@ozlabs.org>, Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 0/7] KVMPPC driver to manage secure guest pages
In-Reply-To: <20190823041747.ctquda5uwvy2eiqz@oak.ozlabs.ibm.com>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190823041747.ctquda5uwvy2eiqz@oak.ozlabs.ibm.com>
Date: Fri, 23 Aug 2019 21:57:32 +1000
Message-ID: <87wof43xhv.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Mackerras <paulus@ozlabs.org> writes:
> On Thu, Aug 22, 2019 at 03:56:13PM +0530, Bharata B Rao wrote:
>> A pseries guest can be run as a secure guest on Ultravisor-enabled
>> POWER platforms. On such platforms, this driver will be used to manage
>> the movement of guest pages between the normal memory managed by
>> hypervisor(HV) and secure memory managed by Ultravisor(UV).
>> 
>> Private ZONE_DEVICE memory equal to the amount of secure memory
>> available in the platform for running secure guests is created.
>> Whenever a page belonging to the guest becomes secure, a page from
>> this private device memory is used to represent and track that secure
>> page on the HV side. The movement of pages between normal and secure
>> memory is done via migrate_vma_pages(). The reverse movement is driven
>> via pagemap_ops.migrate_to_ram().
>> 
>> The page-in or page-out requests from UV will come to HV as hcalls and
>> HV will call back into UV via uvcalls to satisfy these page requests.
>> 
>> These patches are against hmm.git
>> (https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=hmm)
>> 
>> plus
>> 
>> Claudio Carvalho's base ultravisor enablement patchset v6
>> (https://lore.kernel.org/linuxppc-dev/20190822034838.27876-1-cclaudio@linux.ibm.com/T/#t)
>
> How are you thinking these patches will go upstream?  Are you going to
> send them via the hmm tree?
>
> I assume you need Claudio's patchset as a prerequisite for your series
> to compile, which means the hmm maintainers would need to pull in a
> topic branch from Michael Ellerman's powerpc tree, or something like
> that.

I think more workable would be for me to make a topic branch based on
the hmm tree (or some commit from the hmm tree), which I then apply the
patches on top of, and merge any required powerpc changes into that. I
can then ask Linus to merge that branch late in the merge window once
the hmm changes have gone in.

The bigger problem at the moment is the lack of reviews or acks on the
bulk of the series.

cheers
