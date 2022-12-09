Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D2564887E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 19:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTKNY5TZGz3bgy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 05:31:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i0Nd3TZz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i0Nd3TZz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTKMf3C0zz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Dec 2022 05:30:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40FFF622E3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 18:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E4CC43398
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670610633;
	bh=n59+rwrV14qaGREnWR8vy2GKFiqV3xaP5tikD4JMYjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i0Nd3TZzxdRARCVlLiG959yi91ko/FNhKcl26WJMe3+j2st0m25mlZzdpDKISPKP1
	 vKxOGos7w7zNI2csDnxj2RpP+yl8E0XKACRzg8/QSo+CUSWu1AnaCMbbzht/W6ho4Y
	 VhPKeEKL6dMyBdVJR57Q8FhLjpemuyBdIptPB15x7km6IGbRzDmnov/JkXY9dFcNRE
	 /nkJrGi2KBecdIrokIK/OO9ZGLanuIDiN3UF6SMk65cHKqFIuSMQsl/76qWgNdYrxo
	 vo7FmAikFkUhiGCXSMMXmagXsl4zxo8mSY2ueAuR0VVYV3n65+fUxQoq3eWApvakDo
	 mU5IeUZ3dfBgg==
Received: by mail-ej1-f53.google.com with SMTP id qk9so13489657ejc.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Dec 2022 10:30:33 -0800 (PST)
X-Gm-Message-State: ANoB5pke/93glnRP3d81psoxADMHBLUKxQ37iN22QJWzZVf1XwB9coSi
	TwkD0qOE8YnD67Ulx+538OhcxAnrwZcAdhzHGTY=
X-Google-Smtp-Source: AA0mqf5x6dmwVfbgNUqNmm0w5I4bAZI9bfIhhNjdGaYOlBXEX/9mKEVR9x3/9ewIL6ctvmIVx+QC9BoJASzz7I5JPWY=
X-Received: by 2002:a17:906:2645:b0:781:d0c1:4434 with SMTP id
 i5-20020a170906264500b00781d0c14434mr78541258ejc.756.1670610631921; Fri, 09
 Dec 2022 10:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz>
In-Reply-To: <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz>
From: Song Liu <song@kernel.org>
Date: Fri, 9 Dec 2022 10:30:20 -0800
X-Gmail-Original-Message-ID: <CAPhsuW53njtTrL=w33QBY5AiSftNxZ=UOQ1_qZ+qsp5VL1vU0g@mail.gmail.com>
Message-ID: <CAPhsuW53njtTrL=w33QBY5AiSftNxZ=UOQ1_qZ+qsp5VL1vU0g@mail.gmail.com>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module removal
To: Miroslav Benes <mbenes@suse.cz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: pmladek@suse.com, jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 9, 2022 at 4:55 AM Miroslav Benes <mbenes@suse.cz> wrote:
>
> Hi,
>
> first thank you for taking over and I also appologize for not replying
> much sooner.
>
> On Thu, 1 Sep 2022, Song Liu wrote:
>
> > From: Miroslav Benes <mbenes@suse.cz>
> >
> > Josh reported a bug:
> >
> >   When the object to be patched is a module, and that module is
> >   rmmod'ed and reloaded, it fails to load with:
> >
> >   module: x86/modules: Skipping invalid relocation target, existing value is nonzero for type 2, loc 00000000ba0302e9, val ffffffffa03e293c
> >   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
> >   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> >
> >   The livepatch module has a relocation which references a symbol
> >   in the _previous_ loading of nfsd. When apply_relocate_add()
> >   tries to replace the old relocation with a new one, it sees that
> >   the previous one is nonzero and it errors out.
> >
> >   On ppc64le, we have a similar issue:
> >
> >   module_64: livepatch_nfsd: Expected nop after call, got e8410018 at e_show+0x60/0x548 [livepatch_nfsd]
> >   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
> >   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> >
> > He also proposed three different solutions. We could remove the error
> > check in apply_relocate_add() introduced by commit eda9cec4c9a1
> > ("x86/module: Detect and skip invalid relocations"). However the check
> > is useful for detecting corrupted modules.
> >
> > We could also deny the patched modules to be removed. If it proved to be
> > a major drawback for users, we could still implement a different
> > approach. The solution would also complicate the existing code a lot.
> >
> > We thus decided to reverse the relocation patching (clear all relocation
> > targets on x86_64). The solution is not
> > universal and is too much arch-specific, but it may prove to be simpler
> > in the end.
> >
> > Reported-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> > Signed-off-by: Song Liu <song@kernel.org>
>
> Petr has commented on the code aspects. I will just add that s390x was not
> dealt with at the time because there was no live patching support for
> s390x back then if I remember correctly and my notes do not lie. The same
> applies to powerpc32. I think that both should be fixed as well with this
> patch. It might also help to clean up the ifdeffery in the patch a bit.

I don't have test environments for s390 and powerpc, so I really don't know
whether I am doing something sane for them.

Would you have time to finish these parts? (Or maybe the whole patch..)

Thanks,
Song
