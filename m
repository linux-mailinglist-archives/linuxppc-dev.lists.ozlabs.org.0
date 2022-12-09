Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C716488F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 20:25:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTLb34N7vz3bfY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 06:25:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o+uByTIM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o+uByTIM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTLZ6053Mz30Qy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Dec 2022 06:24:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC094622FA
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 19:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D93C433F1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670613883;
	bh=tOYtwqHozmknhMUKtwgTT6asrmy6Qi5D4CXEZwEJFvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o+uByTIMqF7RUXv3I6g1DZkmGKf30295zJ5Yy+usR/Yre92mgZ9FLZTDV0fUhIKRw
	 eZOEwGalOjtsJ8vriXEbEhULwugKKKTADBg5k2x6qjBaXyFQwZN60klJR+0Codn8x8
	 VrGp/+MG9rFXv2O2FpFty7lTeENJPwPN3cqCmPe5uc815/F60KYufIR03ol5ug1M17
	 R6hLK2rR4J7hsdGPmEr5p58Oip8nGVrZS2L7MCdAA7i9atz1+TwKgutTr+6p/EM2nO
	 22ps+mD4Gl5n5uB6TjmH4rH/wf6okQF14H0WBnaHvLSLbRR7ZFdc9VfbuCgpktcK8C
	 1/+8WgligIhiA==
Received: by mail-ej1-f46.google.com with SMTP id m18so13736620eji.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Dec 2022 11:24:42 -0800 (PST)
X-Gm-Message-State: ANoB5pkYgN1qkmdMx7mVIc4NAWx2kuOtixVnR10R27DahgMp/0szZpDz
	huZ72W2RWXLICAMgbg0OzNhDdSVseKMoR7mBvpI=
X-Google-Smtp-Source: AA0mqf7aAgHrQfEzZdzeILDHgJ9onlTpQ2Xs+zasDCpKDyDGwI5bKDRQye5Tl8FgSfid1YFAkOyyngd4VTMK1bAq2Fg=
X-Received: by 2002:a17:907:2c68:b0:7c0:999d:1767 with SMTP id
 ib8-20020a1709072c6800b007c0999d1767mr30991365ejc.301.1670613881161; Fri, 09
 Dec 2022 11:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz>
 <CAPhsuW53njtTrL=w33QBY5AiSftNxZ=UOQ1_qZ+qsp5VL1vU0g@mail.gmail.com> <7ddc326c-0c55-4901-16df-3e4e376e2570@csgroup.eu>
In-Reply-To: <7ddc326c-0c55-4901-16df-3e4e376e2570@csgroup.eu>
From: Song Liu <song@kernel.org>
Date: Fri, 9 Dec 2022 11:24:29 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5YXqYcerxeR+nkZ5DpgvDe8fQ1iZXFeq4DcfY1a4VmwQ@mail.gmail.com>
Message-ID: <CAPhsuW5YXqYcerxeR+nkZ5DpgvDe8fQ1iZXFeq4DcfY1a4VmwQ@mail.gmail.com>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module removal
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "pmladek@suse.com" <pmladek@suse.com>, "x86@kernel.org" <x86@kernel.org>, "jikos@kernel.org" <jikos@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joe.lawrence@redhat.com" <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, Miroslav Benes <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 9, 2022 at 10:52 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 09/12/2022 =C3=A0 19:30, Song Liu a =C3=A9crit :
> > On Fri, Dec 9, 2022 at 4:55 AM Miroslav Benes <mbenes@suse.cz> wrote:
> >>
> >> Hi,
> >>
> >> first thank you for taking over and I also appologize for not replying
> >> much sooner.
> >>
> >> On Thu, 1 Sep 2022, Song Liu wrote:
> >>
> >>> From: Miroslav Benes <mbenes@suse.cz>
> >>>
> >>> Josh reported a bug:
> >>>
> >>>    When the object to be patched is a module, and that module is
> >>>    rmmod'ed and reloaded, it fails to load with:
> >>>
> >>>    module: x86/modules: Skipping invalid relocation target, existing =
value is nonzero for type 2, loc 00000000ba0302e9, val ffffffffa03e293c
> >>>    livepatch: failed to initialize patch 'livepatch_nfsd' for module =
'nfsd' (-8)
> >>>    livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusi=
ng to load module 'nfsd'
> >>>
> >>>    The livepatch module has a relocation which references a symbol
> >>>    in the _previous_ loading of nfsd. When apply_relocate_add()
> >>>    tries to replace the old relocation with a new one, it sees that
> >>>    the previous one is nonzero and it errors out.
> >>>
> >>>    On ppc64le, we have a similar issue:
> >>>
> >>>    module_64: livepatch_nfsd: Expected nop after call, got e8410018 a=
t e_show+0x60/0x548 [livepatch_nfsd]
> >>>    livepatch: failed to initialize patch 'livepatch_nfsd' for module =
'nfsd' (-8)
> >>>    livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusi=
ng to load module 'nfsd'
> >>>
> >>> He also proposed three different solutions. We could remove the error
> >>> check in apply_relocate_add() introduced by commit eda9cec4c9a1
> >>> ("x86/module: Detect and skip invalid relocations"). However the chec=
k
> >>> is useful for detecting corrupted modules.
> >>>
> >>> We could also deny the patched modules to be removed. If it proved to=
 be
> >>> a major drawback for users, we could still implement a different
> >>> approach. The solution would also complicate the existing code a lot.
> >>>
> >>> We thus decided to reverse the relocation patching (clear all relocat=
ion
> >>> targets on x86_64). The solution is not
> >>> universal and is too much arch-specific, but it may prove to be simpl=
er
> >>> in the end.
> >>>
> >>> Reported-by: Josh Poimboeuf <jpoimboe@redhat.com>
> >>> Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> >>> Signed-off-by: Song Liu <song@kernel.org>
> >>
> >> Petr has commented on the code aspects. I will just add that s390x was=
 not
> >> dealt with at the time because there was no live patching support for
> >> s390x back then if I remember correctly and my notes do not lie. The s=
ame
> >> applies to powerpc32. I think that both should be fixed as well with t=
his
> >> patch. It might also help to clean up the ifdeffery in the patch a bit=
.
> >
> > I don't have test environments for s390 and powerpc, so I really don't =
know
> > whether I am doing something sane for them.
> >
> > Would you have time to finish these parts? (Or maybe the whole patch..)
>
> Setting up a powerpc test environment is fairly easy with QEMU.
>
> Some information below:
> - https://github.com/linuxppc/wiki/wiki
> - https://wiki.qemu.org/Documentation/Platforms/PowerPC

Thanks for these pointers! I will give it a try.

Song

PS: Sometimes I am just lazy, you know..
