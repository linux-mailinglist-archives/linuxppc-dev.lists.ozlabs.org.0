Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B4564B125
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 09:29:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWWrN2KMRz3bgB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 19:29:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QrK3NREL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QrK3NREL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWWqT137Cz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 19:28:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F08F612EA
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 08:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B37C43392
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670920129;
	bh=biF+eTAkqIF3JO1B3nBjssgb0I7rUJZqnOdeA52gK48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QrK3NRELFIITs1X8Gw7MJg3X3dF0hB/xwQREu98b7mfLZPkM3w/fUW8HrhBM12OCI
	 GXkSMuybgH9ndTcCMbkOagzkLXcm68Utxdt8TSo8LK7L6ynXowVoOWC7sXlu0l2hQN
	 PmDCk2wFybWtlwlhiLu81x0unvD7yNaMPWyT/q1+dv1tN5vEf+O19ybixDuf03lel/
	 L0Fx7j+41aEDox76It7LB58bRCXSlUJKHu72Tr2wj4kTWm8EfDgOMdeo8NznA8yxZu
	 8rLhKvL9nsrks5imK16kbsGH6L+BtOPC0dIk8zeOctmy3wGffCt+4S6kBf5vC4d+D+
	 5fR++QaSixYiQ==
Received: by mail-ej1-f42.google.com with SMTP id u19so16182944ejm.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 00:28:49 -0800 (PST)
X-Gm-Message-State: ANoB5plCNbGqnOY1eJMBThOonj+zY7xmp/1BOnA8KiiiskqfxwJFidbI
	YxG/YwEoWYhNN23gkvVJFr8hdtEPxpWjfMlmNqc=
X-Google-Smtp-Source: AA0mqf4vJcEo1LSRY4RhLmFU2YbQkyl5LsUhYjyJyozawpCFk4qzUpBunnKcYc+d3Bkt4qORmVm+XeLuIBwoCK+0dLg=
X-Received: by 2002:a17:906:a198:b0:7b4:bc42:3b44 with SMTP id
 s24-20020a170906a19800b007b4bc423b44mr75084269ejy.101.1670920127837; Tue, 13
 Dec 2022 00:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz>
In-Reply-To: <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz>
From: Song Liu <song@kernel.org>
Date: Tue, 13 Dec 2022 00:28:34 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5xb2T5FBXUqG2S+AXBvDYSkLVVvUyDamjrbLQwe-3kVQ@mail.gmail.com>
Message-ID: <CAPhsuW5xb2T5FBXUqG2S+AXBvDYSkLVVvUyDamjrbLQwe-3kVQ@mail.gmail.com>
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

After reading the code (no testing), I think we don't need any logic for
ppc32 and s390.

We need clear_relocate_add() to handle module reload failure.
The failure happens when we

1) call apply_relocate_add() on klp load (or module first load,
   if klp was loaded first);
2) do nothing when the module is unloaded;
3) call apply_relocate_add() on module reload, which failed.

This failure happens in the sanity check in
apply_relocate_add().

For x86, the check is something like:
                                if (*(s32 *)loc != 0)
                                        goto invalid_relocation;

For ppc64, the check is in restore_r2():

        if (*instruction != PPC_RAW_NOP()) {
                pr_err("%s: Expected nop after call, got %08x at %pS\n",
                        me->name, *instruction, instruction);
                return 0;
        }

I don't think we have similar checks for ppc32 and s390, so
clear_relocate_add() is not needed for the two.

OTOH, we can argue that clear_relocate_add() should undo
everything apply_relocate_add() did. But I do think that
will be an overkill.

WDYT?

Thanks,
Song
