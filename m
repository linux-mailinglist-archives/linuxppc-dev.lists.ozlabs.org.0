Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377428AAD78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 13:12:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DncG6Q2k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RqqzoGeP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FoUS6qoj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ulcpXqNQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLX6R06SJz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 21:12:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DncG6Q2k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RqqzoGeP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FoUS6qoj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ulcpXqNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLX5j6SDTz3cB2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 21:11:37 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1665D347F9;
	Fri, 19 Apr 2024 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713525090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEXNpzdafepoBGQ38HGCmuB1jsLf+WECPl2eT5WCL3M=;
	b=DncG6Q2kbdVUkbNkmqZQCcuVY6FgM6wzAEnr5tLTPo9WSvTU5Orh8w2P18YWlxXgFUxOtw
	VZVe8BaowCr+IwGi6UC+cc7F2n2QVJlaMhkWFoLA5VxYkCxImvCCbgFLQr0Vab2QFqGqfz
	y0EHpRvf7K20wuhxdAV4CvB22e1zsKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713525090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEXNpzdafepoBGQ38HGCmuB1jsLf+WECPl2eT5WCL3M=;
	b=RqqzoGeP9gYb3KfwPOfNlkMKKIU4geFna9GLUerSmnQfkpoFcjfu4lpr7/TEuAhhqGwNaM
	n9795YAsWG8bgIAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713525089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEXNpzdafepoBGQ38HGCmuB1jsLf+WECPl2eT5WCL3M=;
	b=FoUS6qojxySapd8h0wOOQ2Js07zu+Km7gMgARC5xQv1jwuPqPXdjylgSG7D2rabDTZMmUv
	eiDprOL07ezk6pTPlW3ED0tDieP7Tirkfl/hy05TwyLpCe9loiauGe216RMNUwBs59cgus
	8xML4O/Vn1UHutHybrbQYZ03qV4Exfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713525089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEXNpzdafepoBGQ38HGCmuB1jsLf+WECPl2eT5WCL3M=;
	b=ulcpXqNQb9CkG6eUhmA5tvuIhtBI057+8M+PQBHjKzOskE2nHeIu/dx2S4bcSS9yfzRZv7
	HzEgPr/UrDbbThBQ==
Date: Fri, 19 Apr 2024 13:11:28 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries/iommu: LPAR panics when rebooted with a
 frozen PE
Message-ID: <20240419111127.GZ20665@kitsune.suse.cz>
References: <20240416205810.28754-1-gbatra@linux.ibm.com>
 <87ttjxanj5.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttjxanj5.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kitsune.suse.cz:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, Apr 19, 2024 at 04:12:46PM +1000, Michael Ellerman wrote:
> Gaurav Batra <gbatra@linux.ibm.com> writes:
> > At the time of LPAR reboot, partition firmware provides Open Firmware
> > property ibm,dma-window for the PE. This property is provided on the PCI
> > bus the PE is attached to.
> 
> AFAICS you're actually describing a bug that happens during boot *up*?
> 
> Describing it as "reboot" makes me think you're talking about the
> shutdown path. I think that will confuse people, me at least :)

there is probably an assumption that it must have been running
previously for the errors to happen in the first place but given the
error state persists for a day it may be a very long 'reboot'.

Thanks

Michal
> 
> cheers
> 
> > There are execptions where the partition firmware might not provide this
> > property for the PE at the time of LPAR reboot. One of the scenario is
> > where the firmware has frozen the PE due to some error conditions. This
> > PE is frozen for 24 hours or unless the whole system is reinitialized.
> >
> > Within this time frame, if the LPAR is rebooted, the frozen PE will be
> > presented to the LPAR but ibm,dma-window property could be missing.
> >
> > Today, under these circumstances, the LPAR oopses with NULL pointer
> > dereference, when configuring the PCI bus the PE is attached to.
> >
> > BUG: Kernel NULL pointer dereference on read at 0x000000c8
> > Faulting instruction address: 0xc0000000001024c0
> > Oops: Kernel access of bad area, sig: 7 [#1]
> > LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> > Modules linked in:
> > Supported: Yes
> > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.4.0-150600.9-default #1
> > Hardware name: IBM,9043-MRX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NM1060_023) hv:phyp pSeries
> > NIP:  c0000000001024c0 LR: c0000000001024b0 CTR: c000000000102450
> > REGS: c0000000037db5c0 TRAP: 0300   Not tainted  (6.4.0-150600.9-default)
> > MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000822  XER: 00000000
> > CFAR: c00000000010254c DAR: 00000000000000c8 DSISR: 00080000 IRQMASK: 0
> > ...
> > NIP [c0000000001024c0] pci_dma_bus_setup_pSeriesLP+0x70/0x2a0
> > LR [c0000000001024b0] pci_dma_bus_setup_pSeriesLP+0x60/0x2a0
> > Call Trace:
> > 	pci_dma_bus_setup_pSeriesLP+0x60/0x2a0 (unreliable)
> > 	pcibios_setup_bus_self+0x1c0/0x370
> > 	__of_scan_bus+0x2f8/0x330
> > 	pcibios_scan_phb+0x280/0x3d0
> > 	pcibios_init+0x88/0x12c
> > 	do_one_initcall+0x60/0x320
> > 	kernel_init_freeable+0x344/0x3e4
> > 	kernel_init+0x34/0x1d0
> > 	ret_from_kernel_user_thread+0x14/0x1c
> >
> > Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
> > Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index e8c4129697b1..e808d5b1fa49 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -786,8 +786,16 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
> >  	 * parent bus. During reboot, there will be ibm,dma-window property to
> >  	 * define DMA window. For kdump, there will at least be default window or DDW
> >  	 * or both.
> > +	 * There is an exception to the above. In case the PE goes into frozen
> > +	 * state, firmware may not provide ibm,dma-window property at the time
> > +	 * of LPAR reboot.
> >  	 */
> >  
> > +	if (!pdn) {
> > +		pr_debug("  no ibm,dma-window property !\n");
> > +		return;
> > +	}
> > +
> >  	ppci = PCI_DN(pdn);
> >  
> >  	pr_debug("  parent is %pOF, iommu_table: 0x%p\n",
> >
> > base-commit: 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
> > -- 
> > 2.39.3 (Apple Git-146)
