Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56367802D78
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 09:44:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5YwPX+O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5YwPX+O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkHJw5xZ9z3cVn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 19:44:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5YwPX+O;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5YwPX+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkHJ225w8z2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 19:43:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701679403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNLdrMB2tgHHf0igk8Wyh8lratwDZ12KyFRCSXbkkjQ=;
	b=T5YwPX+OLcSB2IpzA+4MnitNUrYuaWr3ZceYyyfdGyUTj9rR5Oa5rXCFg04SURjd21SJEl
	LSeo0w/PnRfKAAb7sqYLt/ZQi28S8BAmsfit/BsrwO3pvAyOXAkKaIUJ3SQ4+zdla7k4vJ
	hoHHM8aDTsQK2YWecer8MWe6cUvfTXE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701679403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNLdrMB2tgHHf0igk8Wyh8lratwDZ12KyFRCSXbkkjQ=;
	b=T5YwPX+OLcSB2IpzA+4MnitNUrYuaWr3ZceYyyfdGyUTj9rR5Oa5rXCFg04SURjd21SJEl
	LSeo0w/PnRfKAAb7sqYLt/ZQi28S8BAmsfit/BsrwO3pvAyOXAkKaIUJ3SQ4+zdla7k4vJ
	hoHHM8aDTsQK2YWecer8MWe6cUvfTXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-S3KQUAwxNAKg8YP9LTNJfQ-1; Mon, 04 Dec 2023 03:43:18 -0500
X-MC-Unique: S3KQUAwxNAKg8YP9LTNJfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC51685A5B5;
	Mon,  4 Dec 2023 08:43:17 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF09C36E2;
	Mon,  4 Dec 2023 08:43:08 +0000 (UTC)
Date: Mon, 4 Dec 2023 16:43:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 2/7] kexec_file: print out debugging message if
 required
Message-ID: <ZW2RGdFFsO1yIaZm@MiWiFi-R3L-srv>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-3-bhe@redhat.com>
 <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/29/23 at 06:52pm, Joe Perches wrote:
> On Thu, 2023-11-30 at 10:39 +0800, Baoquan He wrote:
> > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> 
> trivia:
> 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> []
> > @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
> >  		phdr->p_align = 0;
> >  		ehdr->e_phnum++;
> > -		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > -			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> > -			ehdr->e_phnum, phdr->p_offset);
> > +#ifdef CONFIG_KEXEC_FILE
> > +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, "
> > +			      "sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > +			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> > +			      ehdr->e_phnum, phdr->p_offset);
> > +#endif
> 
> Perhaps run checkpatch and coalesce the format string.

Sorry for being late to reply, this comment was missed.

I broke it into two because it's a too long line and not friendly for
reading. I did notice there's such line breaking code. I can change it
if it's not suggested. Thanks for careful checking.

