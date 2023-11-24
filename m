Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E72E7F6E77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 09:41:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OfACZo0b;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OfACZo0b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc7kP489xz3vcT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 19:41:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OfACZo0b;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OfACZo0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc7jZ12Y7z3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 19:40:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700815243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TtiruDUnh8gIdyydjQh1DSHosPodlSxaPwJiylzKhys=;
	b=OfACZo0b2QLBLUSypv1M82X7y2lrzoohdIRr7Do3ofg6qv7brvFynd3C8NggSIdGHxCR/F
	M/sliqTjUq8dm+kGFoOo2EAZCKbWKgbTIWS6x93bQYjfQw2NhGjuaZAaYSKShrRy3AUEGl
	178/olOnrn5xkkPgDDdk3CAKX7xj4iw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700815243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TtiruDUnh8gIdyydjQh1DSHosPodlSxaPwJiylzKhys=;
	b=OfACZo0b2QLBLUSypv1M82X7y2lrzoohdIRr7Do3ofg6qv7brvFynd3C8NggSIdGHxCR/F
	M/sliqTjUq8dm+kGFoOo2EAZCKbWKgbTIWS6x93bQYjfQw2NhGjuaZAaYSKShrRy3AUEGl
	178/olOnrn5xkkPgDDdk3CAKX7xj4iw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-QXyK2TnoOxKNhbHg3BDyOw-1; Fri, 24 Nov 2023 03:40:39 -0500
X-MC-Unique: QXyK2TnoOxKNhbHg3BDyOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98B7D828CEA;
	Fri, 24 Nov 2023 08:40:38 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D59C0112130A;
	Fri, 24 Nov 2023 08:40:36 +0000 (UTC)
Date: Fri, 24 Nov 2023 16:40:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/7] kexec_file: print out debugging message if
 required
Message-ID: <ZWBhgfhFONEYcJZf@MiWiFi-R3L-srv>
References: <20231124033642.520686-1-bhe@redhat.com>
 <20231124033642.520686-3-bhe@redhat.com>
 <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: yujie.liu@intel.com, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/23/23 at 11:16pm, Joe Perches wrote:
> On Fri, 2023-11-24 at 11:36 +0800, Baoquan He wrote:
> > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> 
> trivia for pr_debug -> kexec_dprintk conversions for
> the entire patch set:

OK, will check all patchset and adjust the indendation, thanks.

> 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> []
> > @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
> >  		phdr->p_align = 0;
> >  		ehdr->e_phnum++;
> > -		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > +#ifdef CONFIG_KEXEC_FILE
> > +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, "
> > +			"sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> >  			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> >  			ehdr->e_phnum, phdr->p_offset);
> 
> It's good form to rewrap continuation lines to the open parenthesis
> 
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> []
> > @@ -389,11 +391,12 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
> >  	if (ret)
> >  		goto out;
> >  
> > +	kexec_dprintk("nr_segments = %lu\n", image->nr_segments);
> >  	for (i = 0; i < image->nr_segments; i++) {
> >  		struct kexec_segment *ksegment;
> >  
> >  		ksegment = &image->segment[i];
> > -		pr_debug("Loading segment %d: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
> > +		kexec_dprintk("segment[%d]: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
> >  			 i, ksegment->buf, ksegment->bufsz, ksegment->mem,
> >  			 ksegment->memsz);
> 
> here too etc...
> 

