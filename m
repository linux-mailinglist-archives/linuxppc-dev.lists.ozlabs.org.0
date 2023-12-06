Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 189CE807C43
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 00:23:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bjE131Y2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bjE131Y2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sltk13d6Yz3cb4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 10:23:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bjE131Y2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bjE131Y2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sltj66NTpz3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 10:22:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701904934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zPCUsWG0BDGnbK296zNpXL4hsIM/iX88O2dTATbgstU=;
	b=bjE131Y2f+nOwmuPlAV77DJZNg3icfE7i4qNo318cBcM7sZ3lrAKHnFXBJO4E0qyti5jA0
	GrHI9J7E4hpYpXweuhFQfSWg9g1Te1gQe02R5FPwurWRioffMpRe4ChIRs6KeS4pyLNlxR
	pufqknGz1641+uI5RmQ5wLB+U2TIUvE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701904934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zPCUsWG0BDGnbK296zNpXL4hsIM/iX88O2dTATbgstU=;
	b=bjE131Y2f+nOwmuPlAV77DJZNg3icfE7i4qNo318cBcM7sZ3lrAKHnFXBJO4E0qyti5jA0
	GrHI9J7E4hpYpXweuhFQfSWg9g1Te1gQe02R5FPwurWRioffMpRe4ChIRs6KeS4pyLNlxR
	pufqknGz1641+uI5RmQ5wLB+U2TIUvE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-Ftl_v0_MOyKwGMvgDCVSqQ-1; Wed,
 06 Dec 2023 18:22:11 -0500
X-MC-Unique: Ftl_v0_MOyKwGMvgDCVSqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 776BE3806622;
	Wed,  6 Dec 2023 23:22:10 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3842C15A0C;
	Wed,  6 Dec 2023 23:22:09 +0000 (UTC)
Date: Thu, 7 Dec 2023 07:22:06 +0800
From: Baoquan He <bhe@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <ZXECHg37DRZ9BQsP@MiWiFi-R3L-srv>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-6-bhe@redhat.com>
 <20231201-blog-blasphemy-985d2665903c@wendy>
 <ZW3yXWJ7rTrtZzyg@MiWiFi-R3L-srv>
 <20231204-liftoff-enclosure-d3e3daf0ab6e@spud>
 <ZXCVUD9cCYEShrrj@MiWiFi-R3L-srv>
 <20231206-pasta-embassy-c7250740b16c@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206-pasta-embassy-c7250740b16c@spud>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/06/23 at 04:54pm, Conor Dooley wrote:
> On Wed, Dec 06, 2023 at 11:37:52PM +0800, Baoquan He wrote:
> > On 12/04/23 at 04:14pm, Conor Dooley wrote:
> > > On Mon, Dec 04, 2023 at 11:38:05PM +0800, Baoquan He wrote:
> > > > On 12/01/23 at 10:38am, Conor Dooley wrote:
> > > > > On Thu, Nov 30, 2023 at 10:39:53AM +0800, Baoquan He wrote:
> > > > > 
> > > > > $subject has a typo in the arch bit :)
> > > > 
> > > > Indeed, will fix if need report. Thanks for careful checking.
> > > > 
> > > > > 
> > > > > > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > > > > > loading related codes.
> > > > > 
> > > > > Commit messages should be understandable in isolation, but this only
> > > > > explains (part of) what is obvious in the diff. Why is this change
> > > > > being made?
> > > > 
> > > > The purpose has been detailedly described in cover letter and patch 1
> > > > log. Andrew has picked these patches into his tree and grabbed the cover
> > > > letter log into the relevant commit for people's later checking. All
> > > > these seven patches will be present in mainline together. This is common
> > > > way when posting patch series? Please let me know if I misunderstand
> > > > anything.
> > > 
> > > Each patch having a commit message that explains why a change is being
> > > made is the expectation. It is especially useful to explain the why
> > > here, since it is not just a mechanical conversion of pr_debug()s as the
> > > commit message suggests.
> > 
> > Sounds reasonable. I rephrase the patch 3 log as below, do you think
> > it's OK to you?
> 
> Yes, but with one comment.
> 
> > 
> > I will also adjust patch logs on other ARCH once this one is done.
> > Thanks.
> > 
> > =============================
> > Subject: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if required
> > 
> > Then when specifying '-d' for kexec_file_load interface, loaded
> > locations of kernel/initrd/cmdline etc can be printed out to help debug.
> > 
> > Here replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> > 
> 
> > And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> > because it's make sense to always print out loaded location of purgatory
              ~
> > and device tree even though users don't expect the message.

Fixed typo:
==========

And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
because it doesn't make sense to always print out loaded location of
purgatory and device tree even though users don't expect the message.

> 
> This seems to contradict what you said in your earlier mail, about
> moving these from notice to debug. I think you missed a negation in your
> new version of the commit message. What you said in response to me seems
> like a more complete explanation anyway:

Ah, I made mistake when typing, these printing is only for debugging,
so always printing out them is not suggested.

> 	always printing out the loaded location of purgatory and
> 	device tree doesn't make sense. It will be confusing when users
> 	see these even when they do normal kexec/kdump loading.
> 
> Thanks,
> Conor.
> 
> > And also remove kexec_image_info() because the content has been printed
> > out in generic code.
> > 
> > ============================
> > 
> > > 
> > > > > 
> > > > > > 
> > > > > > And also remove kexec_image_info() because the content has been printed
> > > > > > out in generic code.
> > > > > > 
> > > > > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > > > > ---
> > > > > >  arch/riscv/kernel/elf_kexec.c     | 11 ++++++-----
> > > > > >  arch/riscv/kernel/machine_kexec.c | 26 --------------------------
> > > > > >  2 files changed, 6 insertions(+), 31 deletions(-)
> > > > > > 
> > > > > > diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> > > > > > index e60fbd8660c4..5bd1ec3341fe 100644
> > > > > > --- a/arch/riscv/kernel/elf_kexec.c
> > > > > > +++ b/arch/riscv/kernel/elf_kexec.c
> > > > > > @@ -216,7 +216,6 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > >  	if (ret)
> > > > > >  		goto out;
> > > > > >  	kernel_start = image->start;
> > > > > > -	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> > > > > >  
> > > > > >  	/* Add the kernel binary to the image */
> > > > > >  	ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
> > > > > > @@ -252,8 +251,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > >  		image->elf_load_addr = kbuf.mem;
> > > > > >  		image->elf_headers_sz = headers_sz;
> > > > > >  
> > > > > > -		pr_debug("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
> > > > > > -			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > > > > +		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
> > > > > > +			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > > > >  
> > > > > >  		/* Setup cmdline for kdump kernel case */
> > > > > >  		modified_cmdline = setup_kdump_cmdline(image, cmdline,
> > > > > > @@ -275,6 +274,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > >  		pr_err("Error loading purgatory ret=%d\n", ret);
> > > > > >  		goto out;
> > > > > >  	}
> > > > > > +	kexec_dprintk("Loaded purgatory at 0x%lx\n", kbuf.mem);
> > > > > > +
> > > > > >  	ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
> > > > > >  					     &kernel_start,
> > > > > >  					     sizeof(kernel_start), 0);
> > > > > > @@ -293,7 +294,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > >  		if (ret)
> > > > > >  			goto out;
> > > > > >  		initrd_pbase = kbuf.mem;
> > > > > 
> > > > > > -		pr_notice("Loaded initrd at 0x%lx\n", initrd_pbase);
> > > > > > +		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);
> > > > > 
> > > > > This is not a pr_debug().
> > > > > 
> > > > > >  	}
> > > > > >  
> > > > > >  	/* Add the DTB to the image */
> > > > > > @@ -318,7 +319,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
> > > > > >  	}
> > > > > >  	/* Cache the fdt buffer address for memory cleanup */
> > > > > >  	image->arch.fdt = fdt;
> > > > > 
> > > > > > -	pr_notice("Loaded device tree at 0x%lx\n", kbuf.mem);
> > > > > > +	kexec_dprintk("Loaded device tree at 0x%lx\n", kbuf.mem);
> > > > > 
> > > > > Neither is this. Why are they being moved from pr_notice()?
> > > > 
> > > > You are right. 
> > > > 
> > > > While always printing out the loaded location of purgatory and
> > > > device tree doesn't make sense. It will be confusing when users
> > > > see these even when they do normal kexec/kdump loading. It should be
> > > > changed to pr_debug().
> > > > 
> > > > Which way do you suggest?
> > > > 1) change it back to pr_debug(), fix it in another patch;
> > > > 2) keep it as is in the patch;
> > > 
> > > Personally I think it is fine to change them all in one patch, but the
> > > rationale for converting pr_notice() to your new debug infrastructure
> > > needs to be in the commit message.
> > 
> > Sure, sounds good to me. I have changed the patch log to reflect this as
> > you suggested, please help check. Thanks again.
> > 


