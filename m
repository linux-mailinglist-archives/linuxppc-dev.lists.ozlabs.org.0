Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3894848AC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 20:36:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT2sk66jKz3bX0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 06:36:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0fdr4g5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CuEaH2WQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=a0fdr4g5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CuEaH2WQ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT2s11HjTz2xsj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 06:35:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641324925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M31283hPor/SMg1Hu2xm9ZT/xhUO7KMLt4Ra3PtJ46g=;
 b=a0fdr4g5fmZGIvdmI9LAfwHDa2+tPVp37rw+4vwJyAo9KaUfhzbU/LniyTBMpuQzmdSV8/
 CAQbIQyUG1x2V4lqIpXgAkd08KtC9iRBBv1e5L32QeRsiBMCaK37bI8Oe/3I4aIj5UzIeE
 Z6pl+PtFGoJwJK7wuDmBEFifTpavbfM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641324926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M31283hPor/SMg1Hu2xm9ZT/xhUO7KMLt4Ra3PtJ46g=;
 b=CuEaH2WQmlPivNYkoRlV3mFGTPwzsT2XxeDCcJkHsqTxJT43JnIwMcwMrM7xFYLmENfCko
 7l4lqfqZj/gpWyZO2OotnNu/WlEl65p3kRWiViWqg0wyT1V2f9ttUv9xrVJs5otM+F/qiM
 yv/Q6cYyFyapDGtOCVC6zsmW+O1lTmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-cGMCxWdAPTeBu14WgwCJ3g-1; Tue, 04 Jan 2022 14:35:22 -0500
X-MC-Unique: cGMCxWdAPTeBu14WgwCJ3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40F8181CCB4;
 Tue,  4 Jan 2022 19:35:20 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 911E95BE04;
 Tue,  4 Jan 2022 19:35:15 +0000 (UTC)
Date: Tue, 4 Jan 2022 14:35:13 -0500
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 01/13] livepatch: Fix build failure on 32 bits
 processors
Message-ID: <YdShcXQwOaQnylo6@redhat.com>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5288e11b018a762ea3351cc8fb2d4f15093a4457.1640017960.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5288e11b018a762ea3351cc8fb2d4f15093a4457.1640017960.git.christophe.leroy@csgroup.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 20, 2021 at 04:38:02PM +0000, Christophe Leroy wrote:
> Trying to build livepatch on powerpc/32 results in:
> 
> 	kernel/livepatch/core.c: In function 'klp_resolve_symbols':
> 	kernel/livepatch/core.c:221:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
> 	  221 |                 sym = (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
> 	      |                       ^
> 	kernel/livepatch/core.c:221:21: error: assignment to 'Elf32_Sym *' {aka 'struct elf32_sym *'} from incompatible pointer type 'Elf64_Sym *' {aka 'struct elf64_sym *'} [-Werror=incompatible-pointer-types]
> 	  221 |                 sym = (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
> 	      |                     ^
> 	kernel/livepatch/core.c: In function 'klp_apply_section_relocs':
> 	kernel/livepatch/core.c:312:35: error: passing argument 1 of 'klp_resolve_symbols' from incompatible pointer type [-Werror=incompatible-pointer-types]
> 	  312 |         ret = klp_resolve_symbols(sechdrs, strtab, symndx, sec, sec_objname);
> 	      |                                   ^~~~~~~
> 	      |                                   |
> 	      |                                   Elf32_Shdr * {aka struct elf32_shdr *}
> 	kernel/livepatch/core.c:193:44: note: expected 'Elf64_Shdr *' {aka 'struct elf64_shdr *'} but argument is of type 'Elf32_Shdr *' {aka 'struct elf32_shdr *'}
> 	  193 | static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
> 	      |                                ~~~~~~~~~~~~^~~~~~~
> 
> Fix it by using the right types instead of forcing 64 bits types.
> 
> Fixes: 7c8e2bdd5f0d ("livepatch: Apply vmlinux-specific KLP relocations early")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Acked-by: Petr Mladek <pmladek@suse.com>
> ---
>  kernel/livepatch/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index 335d988bd811..c0789383807b 100644
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -190,7 +190,7 @@ static int klp_find_object_symbol(const char *objname, const char *name,
>  	return -EINVAL;
>  }
>  
> -static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
> +static int klp_resolve_symbols(Elf_Shdr *sechdrs, const char *strtab,
>  			       unsigned int symndx, Elf_Shdr *relasec,
>  			       const char *sec_objname)
>  {
> @@ -218,7 +218,7 @@ static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
>  	relas = (Elf_Rela *) relasec->sh_addr;
>  	/* For each rela in this klp relocation section */
>  	for (i = 0; i < relasec->sh_size / sizeof(Elf_Rela); i++) {
> -		sym = (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
> +		sym = (Elf_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
>  		if (sym->st_shndx != SHN_LIVEPATCH) {
>  			pr_err("symbol %s is not marked as a livepatch symbol\n",
>  			       strtab + sym->st_name);
> -- 
> 2.33.1
> 

Thanks for finding and fixing, lgtm.

Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

-- Joe

