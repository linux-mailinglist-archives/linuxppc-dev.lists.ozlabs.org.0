Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03CE529DF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 11:26:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2W3L67KTz3c9Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 19:26:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ee7l6jdn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ee7l6jdn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ee7l6jdn; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ee7l6jdn; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2W2k0KzXz3bc5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 19:26:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bK+s6fnFoumBldn8FT3W5sY0gFW246RSo3CcSBZreoU=;
 b=Ee7l6jdn1x3zxSka+uSgPCPiuy66uJg3i8hrLUOBvs+pInzZ+Cl6lLikEf97u0o8iEtcgD
 5dvNrhkpqql1xA2rkZhRWpvCFhNC0+vmJE8uI9GpbZE+SzDdTTENn+XUazmMBD4SJJYlG/
 rWpXFepWQcQXhyGr2b84ipI6Z0wrCyE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bK+s6fnFoumBldn8FT3W5sY0gFW246RSo3CcSBZreoU=;
 b=Ee7l6jdn1x3zxSka+uSgPCPiuy66uJg3i8hrLUOBvs+pInzZ+Cl6lLikEf97u0o8iEtcgD
 5dvNrhkpqql1xA2rkZhRWpvCFhNC0+vmJE8uI9GpbZE+SzDdTTENn+XUazmMBD4SJJYlG/
 rWpXFepWQcQXhyGr2b84ipI6Z0wrCyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-tieaqBz7OfeWMwCJZdjpRg-1; Tue, 17 May 2022 05:26:12 -0400
X-MC-Unique: tieaqBz7OfeWMwCJZdjpRg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E415811E78;
 Tue, 17 May 2022 09:26:11 +0000 (UTC)
Received: from localhost (ovpn-13-143.pek2.redhat.com [10.72.13.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ED3B492C14;
 Tue, 17 May 2022 09:26:10 +0000 (UTC)
Date: Tue, 17 May 2022 17:25:59 +0800
From: Baoquan He <bhe@redhat.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
Message-ID: <YoNqJ/MOSIVwKP/o@MiWiFi-R3L-srv>
References: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: linuxppc-dev@lists.ozlabs.org, Eric Biederman <ebiederm@xmission.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/25/22 at 11:11pm, Naveen N. Rao wrote:
> kexec_load_purgatory() can fail for many reasons - there is no need to
> print an error when encountering unsupported relocations.
> 
> This solves a build issue on powerpc with binutils v2.36 and newer [1].
> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> symbols") [2], binutils started dropping section symbols that it thought

I am not familiar with binutils, while wondering if this exists in other
ARCHes except of ppc. Arm64 doesn't have the ARCH override either, do we
have problem with it?

> were unused.  This isn't an issue in general, but with kexec_file.c, gcc
> is placing kexec_arch_apply_relocations[_add] into a separate
> .text.unlikely section and the section symbol ".text.unlikely" is being
> dropped. Due to this, recordmcount is unable to find a non-weak symbol

But arch_kexec_apply_relocations_add is weak symbol on ppc.

> in .text.unlikely to generate a relocation record against. Dropping
> pr_err() calls results in these functions being left in .text section,

Why dropping pr_err() can make arch_kexec_apply_relocations_add put in
.text?

> enabling recordmcount to emit a proper relocation record.
> 
> [1] https://github.com/linuxppc/issues/issues/388
> [2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/kexec_file.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 8347fc158d2b96..55d144c58b5278 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -121,7 +121,6 @@ int __weak
>  arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
>  				 const Elf_Shdr *relsec, const Elf_Shdr *symtab)
>  {
> -	pr_err("RELA relocation unsupported.\n");
>  	return -ENOEXEC;
>  }
>  
> @@ -138,7 +137,6 @@ int __weak
>  arch_kexec_apply_relocations(struct purgatory_info *pi, Elf_Shdr *section,
>  			     const Elf_Shdr *relsec, const Elf_Shdr *symtab)
>  {
> -	pr_err("REL relocation unsupported.\n");
>  	return -ENOEXEC;
>  }
>  
> 
> base-commit: 83d8a0d166119de813cad27ae7d61f54f9aea707
> -- 
> 2.35.1
> 

