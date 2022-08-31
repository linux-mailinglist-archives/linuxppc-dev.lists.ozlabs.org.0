Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCD5A8736
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 22:07:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHwFP3CmXz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 06:07:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8McsmIE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8McsmIE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8McsmIE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8McsmIE;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHwDl2Sznz308b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 06:06:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661976401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8Nlq9zif2fq3bbnp4BvyqOxlH6TzAD6XgndQmzpQAs=;
	b=c8McsmIEGC8v/2Pr1l2zWgaKSsi+CNTLD8mgQM4yH+d7Q+W+gslxRkY1rp3dELXZivnDDm
	gc6t5g1M1uber1LSGFgEkvD9UaHolCRIaRW9prxhnWIXzoBO1g/91XL8egr0wzBlwaFX7w
	1VGohntdJHFaeizZf//8Tc7gbF1gJCM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661976401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8Nlq9zif2fq3bbnp4BvyqOxlH6TzAD6XgndQmzpQAs=;
	b=c8McsmIEGC8v/2Pr1l2zWgaKSsi+CNTLD8mgQM4yH+d7Q+W+gslxRkY1rp3dELXZivnDDm
	gc6t5g1M1uber1LSGFgEkvD9UaHolCRIaRW9prxhnWIXzoBO1g/91XL8egr0wzBlwaFX7w
	1VGohntdJHFaeizZf//8Tc7gbF1gJCM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-qbPjvfqnMcab3ym6Nz1UkA-1; Wed, 31 Aug 2022 16:06:36 -0400
X-MC-Unique: qbPjvfqnMcab3ym6Nz1UkA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 363188037AF;
	Wed, 31 Aug 2022 20:06:36 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.220])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A4B2492C3B;
	Wed, 31 Aug 2022 20:06:35 +0000 (UTC)
Date: Wed, 31 Aug 2022 16:06:33 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v5] livepatch: Clear relocation targets on a module
 removal
Message-ID: <Yw+/SXhh5puipgmo@redhat.com>
References: <20220830185313.76402-1-song@kernel.org>
 <aee99fcf-9352-d2cd-5f67-fb9d4b9a15f4@csgroup.eu>
 <CAPhsuW6CwQoU0GsXj0YhxngFfNMgD1mu6AjwqiZumTyWL84i1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6CwQoU0GsXj0YhxngFfNMgD1mu6AjwqiZumTyWL84i1g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: "pmladek@suse.com" <pmladek@suse.com>, "jikos@kernel.org" <jikos@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 31, 2022 at 10:05:43AM -0700, Song Liu wrote:
> On Wed, Aug 31, 2022 at 1:01 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> >
> >
> > Le 30/08/2022 à 20:53, Song Liu a écrit :
> > > From: Miroslav Benes <mbenes@suse.cz>
> > >
> > > Josh reported a bug:
> > >
> > >    When the object to be patched is a module, and that module is
> > >    rmmod'ed and reloaded, it fails to load with:
> > >
> > >    module: x86/modules: Skipping invalid relocation target, existing value is nonzero for type 2, loc 00000000ba0302e9, val ffffffffa03e293c
> > >    livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
> > >    livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> > >
> > >    The livepatch module has a relocation which references a symbol
> > >    in the _previous_ loading of nfsd. When apply_relocate_add()
> > >    tries to replace the old relocation with a new one, it sees that
> > >    the previous one is nonzero and it errors out.
> > >
> > >    On ppc64le, we have a similar issue:
> > >
> > >    module_64: livepatch_nfsd: Expected nop after call, got e8410018 at e_show+0x60/0x548 [livepatch_nfsd]
> > >    livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
> > >    livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> > >
> > > He also proposed three different solutions. We could remove the error
> > > check in apply_relocate_add() introduced by commit eda9cec4c9a1
> > > ("x86/module: Detect and skip invalid relocations"). However the check
> > > is useful for detecting corrupted modules.
> > >
> > > We could also deny the patched modules to be removed. If it proved to be
> > > a major drawback for users, we could still implement a different
> > > approach. The solution would also complicate the existing code a lot.
> > >
> > > We thus decided to reverse the relocation patching (clear all relocation
> > > targets on x86_64). The solution is not
> > > universal and is too much arch-specific, but it may prove to be simpler
> > > in the end.
> > >
> > > Reported-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > > Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> > > Signed-off-by: Song Liu <song@kernel.org>
> > >
> > > ---
> > >
> > > NOTE: powerpc code has not be tested.
> > >
> > > Changes v4 = v5:
> > > 1. Fix compile with powerpc.
> >
> > Not completely it seems.
> >
> >    CC      kernel/livepatch/core.o
> > kernel/livepatch/core.c: In function 'klp_clear_object_relocations':
> > kernel/livepatch/core.c:352:50: error: passing argument 1 of
> > 'clear_relocate_add' from incompatible pointer type
> > [-Werror=incompatible-pointer-types]
> >    352 |                 clear_relocate_add(pmod->klp_info->sechdrs,
> >        |                                    ~~~~~~~~~~~~~~^~~~~~~~~
> >        |                                                  |
> >        |                                                  Elf32_Shdr *
> > {aka struct elf32_shdr *}
> > In file included from kernel/livepatch/core.c:19:
> > ./include/linux/moduleloader.h:76:37: note: expected 'Elf64_Shdr *' {aka
> > 'struct elf64_shdr *'} but argument is of type 'Elf32_Shdr *' {aka
> > 'struct elf32_shdr *'}
> >     76 | void clear_relocate_add(Elf64_Shdr *sechdrs,
> >        |                         ~~~~~~~~~~~~^~~~~~~
> > cc1: some warnings being treated as errors
> >
> >
> > Fixup:
> >
> > diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
> > index d22b36b84b4b..958e6da7f475 100644
> > --- a/include/linux/moduleloader.h
> > +++ b/include/linux/moduleloader.h
> > @@ -73,7 +73,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
> >                        unsigned int relsec,
> >                        struct module *mod);
> >   #ifdef CONFIG_LIVEPATCH
> > -void clear_relocate_add(Elf64_Shdr *sechdrs,
> > +void clear_relocate_add(Elf_Shdr *sechdrs,
> >                    const char *strtab,
> >                    unsigned int symindex,
> >                    unsigned int relsec,
> >
> >
> > But then the link fails.
> >
> >    LD      .tmp_vmlinux.kallsyms1
> > powerpc64-linux-ld: kernel/livepatch/core.o: in function
> > `klp_cleanup_module_patches_limited':
> > core.c:(.text+0xdb4): undefined reference to `clear_relocate_add'
> 
> Hmm.. I am not seeing either error. Could you please share your .config file?
> 
> Thanks,
> Song
> 

If it's any help, I see the same build error Christophe reported using
the 'cross-dev' script that's in my klp-convert-tree [1].

  $ BUILD_ARCHES="ppc32" ./cross-dev config
  $ BUILD_ARCHES="ppc32" ./cross-dev build -j$(nproc)

(The kernel will be built in /tmp/klp-convert-ppc32 btw.)

Applying the header file fix results in the same linker error, too.


[1] https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v7-devel+song

-- Joe

