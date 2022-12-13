Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C211064B78E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 15:38:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWh1s47Rkz3bqw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 01:38:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eMnP3Idp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eMnP3Idp;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWh0x107xz3bgF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 01:37:36 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 8ADEE1FDB8;
	Tue, 13 Dec 2022 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670942252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yCoPhJw+GKmzrg8p4DH4Ya6d+PQIKemaInJPhpeXlHU=;
	b=eMnP3IdpmRft/ER7oin2HnZdMR5P7VHO5Sw/nEemsxB2Ij/yJwJfX7Qw5GQMBH5u6Fzp9j
	B/k+nQ8blMON5hd8beazuYDg55xA4qnleqSX2yPUaX1FJkK9+lFf9Ix1dIM9V3mpRRdKVk
	2q5tMlDY577z7rViBRwn73TM11qdHPY=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 6DB002C142;
	Tue, 13 Dec 2022 14:37:32 +0000 (UTC)
Date: Tue, 13 Dec 2022 15:37:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
Message-ID: <Y5iOLMTLaMyqsgbL@alley>
References: <20220901171252.2148348-1-song@kernel.org>
 <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz>
 <CAPhsuW5xb2T5FBXUqG2S+AXBvDYSkLVVvUyDamjrbLQwe-3kVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW5xb2T5FBXUqG2S+AXBvDYSkLVVvUyDamjrbLQwe-3kVQ@mail.gmail.com>
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
Cc: x86@kernel.org, jikos@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2022-12-13 00:28:34, Song Liu wrote:
> On Fri, Dec 9, 2022 at 4:55 AM Miroslav Benes <mbenes@suse.cz> wrote:
> >
> > Hi,
> >
> > first thank you for taking over and I also appologize for not replying
> > much sooner.
> >
> > On Thu, 1 Sep 2022, Song Liu wrote:
> >
> > > From: Miroslav Benes <mbenes@suse.cz>
> > >
> > > Josh reported a bug:
> > >
> > >   When the object to be patched is a module, and that module is
> > >   rmmod'ed and reloaded, it fails to load with:
> > >
> > >   module: x86/modules: Skipping invalid relocation target, existing value is nonzero for type 2, loc 00000000ba0302e9, val ffffffffa03e293c
> > >   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
> > >   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> > >
> > >   The livepatch module has a relocation which references a symbol
> > >   in the _previous_ loading of nfsd. When apply_relocate_add()
> > >   tries to replace the old relocation with a new one, it sees that
> > >   the previous one is nonzero and it errors out.
> > >
> > >   On ppc64le, we have a similar issue:
> > >
> > >   module_64: livepatch_nfsd: Expected nop after call, got e8410018 at e_show+0x60/0x548 [livepatch_nfsd]
> > >   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
> > >   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
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
> >
> > Petr has commented on the code aspects. I will just add that s390x was not
> > dealt with at the time because there was no live patching support for
> > s390x back then if I remember correctly and my notes do not lie. The same
> > applies to powerpc32. I think that both should be fixed as well with this
> > patch. It might also help to clean up the ifdeffery in the patch a bit.
> 
> After reading the code (no testing), I think we don't need any logic for
> ppc32 and s390.
> 
> We need clear_relocate_add() to handle module reload failure.
> 
> I don't think we have similar checks for ppc32 and s390, so
> clear_relocate_add() is not needed for the two.
> 
> OTOH, we can argue that clear_relocate_add() should undo
> everything apply_relocate_add() did. But I do think that
> will be an overkill.

It is true that we do not need to clear the relocations if the values
are not checked in apply_relocated_add().

I do not have strong opinion whether we should do it or not.

One one hand, the clearing code might introduce a bug if it modifies
some wrong location. So, it might do more harm then good.

One the other hand, it feels bad when a code is jumping to a
non-existing address. I know, nobody should call this code.
But it is still a kind of a security hole.

Well, I think that we could keep the clearing functions empty
on ppc32 and s390 in this patch(set). It won't be worse than
it is now. And perfection is the enemy of good.

Best Regards,
Petr
