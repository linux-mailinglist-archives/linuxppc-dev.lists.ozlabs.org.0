Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FFA52B3DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 09:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L34s62QXQz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 17:50:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MzpqMG5v;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MzpqMG5v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MzpqMG5v; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MzpqMG5v; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L34rT1qQzz3bZB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 17:49:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652860163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9KbdBagwz7kDxwouZHcG+NJq65qAT71CiKpPT8LRhE=;
 b=MzpqMG5vZC4ubBtHiaCO53nSNLtudWkHTTnEsnZI5G32UcA+5Ap+7SuFSjnid3T+h4HgVT
 tXEIF2NJpUKmV85Ygb8BPSKat97Bg1DDnpgkPcWomBiUAoTIZIVyiAuP8ZeLbXXaOVMJo3
 ez9KUnUFEZ3JgNve23CjnC+Wu0KSNeQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652860163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9KbdBagwz7kDxwouZHcG+NJq65qAT71CiKpPT8LRhE=;
 b=MzpqMG5vZC4ubBtHiaCO53nSNLtudWkHTTnEsnZI5G32UcA+5Ap+7SuFSjnid3T+h4HgVT
 tXEIF2NJpUKmV85Ygb8BPSKat97Bg1DDnpgkPcWomBiUAoTIZIVyiAuP8ZeLbXXaOVMJo3
 ez9KUnUFEZ3JgNve23CjnC+Wu0KSNeQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-2UAAZv01PmaGHv2Mle1Twg-1; Wed, 18 May 2022 03:49:19 -0400
X-MC-Unique: 2UAAZv01PmaGHv2Mle1Twg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 366B029DD9A5;
 Wed, 18 May 2022 07:49:19 +0000 (UTC)
Received: from localhost (ovpn-13-59.pek2.redhat.com [10.72.13.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7672D1410DD5;
 Wed, 18 May 2022 07:49:18 +0000 (UTC)
Date: Wed, 18 May 2022 15:49:14 +0800
From: Baoquan He <bhe@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
Message-ID: <YoSk+jRjNQtUL50d@MiWiFi-R3L-srv>
References: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
 <YoNqJ/MOSIVwKP/o@MiWiFi-R3L-srv>
 <1652782155.56t7mah8ib.naveen@linux.ibm.com>
 <8735h8b2f1.fsf@email.froward.int.ebiederm.org>
 <87v8u3o9tk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8u3o9tk.fsf@mpe.ellerman.id.au>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, kexec@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/18/22 at 12:26pm, Michael Ellerman wrote:
> "Eric W. Biederman" <ebiederm@xmission.com> writes:
> > Looking at this the pr_err is absolutely needed.  If an unsupported case
> > winds up in the purgatory blob and the code can't handle it things
> > will fail silently much worse later.
> 
> It won't fail later, it will fail the syscall.
> 
> sys_kexec_file_load()
>   kimage_file_alloc_init()
>     kimage_file_prepare_segments()
>       arch_kexec_kernel_image_load()
>         kexec_image_load_default()
>           image->fops->load()
>             elf64_load()        # powerpc
>             bzImage64_load()    # x86
>               kexec_load_purgatory()
>                 kexec_apply_relocations()
> 
> Which does:
> 
> 	if (relsec->sh_type == SHT_RELA)
> 		ret = arch_kexec_apply_relocations_add(pi, section,
> 						       relsec, symtab);
> 	else if (relsec->sh_type == SHT_REL)
> 		ret = arch_kexec_apply_relocations(pi, section,
> 						   relsec, symtab);
> 	if (ret)
> 		return ret;
> 
> And that error is bubbled all the way back up. So as long as
> arch_kexec_apply_relocations() returns an error the syscall will fail
> back to userspace and there'll be an error message at that level.
> 
> It's true that having nothing printed in dmesg makes it harder to work
> out why the syscall failed. But it's a kernel bug if there are unhandled
> relocations in the kernel-supplied purgatory code, so a user really has
> no way to do anything about the error even if it is printed.
> 
> > "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> >
> >> Baoquan He wrote:
> >>> On 04/25/22 at 11:11pm, Naveen N. Rao wrote:
> >>>> kexec_load_purgatory() can fail for many reasons - there is no need to
> >>>> print an error when encountering unsupported relocations.
> >>>> This solves a build issue on powerpc with binutils v2.36 and newer [1].
> >>>> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> >>>> symbols") [2], binutils started dropping section symbols that it thought
> >>> I am not familiar with binutils, while wondering if this exists in other
> >>> ARCHes except of ppc. Arm64 doesn't have the ARCH override either, do we
> >>> have problem with it?
> >>
> >> I'm not aware of this specific file causing a problem on other architectures -
> >> perhaps the config options differ enough. There are however more reports of
> >> similar issues affecting other architectures with the llvm integrated assembler:
> >> https://github.com/ClangBuiltLinux/linux/issues/981
> >>
> >>>
> >>>> were unused.  This isn't an issue in general, but with kexec_file.c, gcc
> >>>> is placing kexec_arch_apply_relocations[_add] into a separate
> >>>> .text.unlikely section and the section symbol ".text.unlikely" is being
> >>>> dropped. Due to this, recordmcount is unable to find a non-weak symbol
> >>> But arch_kexec_apply_relocations_add is weak symbol on ppc.
> >>
> >> Yes. Note that it is just the section symbol that gets dropped. The section is
> >> still present and will continue to hold the symbols for the functions
> >> themselves.
> >
> > So we have a case where binutils thinks it is doing something useful
> > and our kernel specific tool gets tripped up by it.
> 
> It's not just binutils, the LLVM assembler has the same behavior.
> 
> > Reading the recordmcount code it looks like it is finding any symbol
> > within a section but ignoring weak symbols.  So I suspect the only
> > remaining symbol in the section is __weak and that confuses
> > recordmcount.
> >
> > Does removing the __weak annotation on those functions fix the build
> > error?  If so we can restructure the kexec code to simply not use __weak
> > symbols.
> >
> > Otherwise the fix needs to be in recordmcount or binutils, and we should
> > loop whoever maintains recordmcount in to see what they can do.
> 
> It seems that recordmcount is not really maintained anymore now that x86
> uses objtool?
> 
> There've been several threads about fixing recordmcount, but none of
> them seem to have lead to a solution.
> 
> These weak symbol vs recordmcount problems have been worked around going
> back as far as 2020:

It gives me feeling that llvm or recordmcount should make adjustment,
but not innocent kernel code, if there are a lot of places reported.
I am curious how llvm or recordmcount dev respond to this.

> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/elfcore.h?id=6e7b64b9dd6d96537d816ea07ec26b7dedd397b9
> 
> cheers
> 

