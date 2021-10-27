Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCD43C897
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 13:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfRLM1zcqz2yxW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 22:29:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o6u2CEpO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfRKj21tlz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 22:29:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o6u2CEpO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfRKb41TQz4xbP;
 Wed, 27 Oct 2021 22:29:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635334148;
 bh=MHq64eZS9Jri3BDBh8LS9jVHE07Z90nQn+T4OkS25Qg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o6u2CEpOxGBJvNemtoJ2GOBbPtwJQy/PgPE76ook/TmAX8J+i482whrIrJmiNgzsL
 pZcK4uTPRvoHWa1kBw9ER9Z5IvA5HEUmo4kaGmqWR3gcyPilWeR4Vnubb7mH0/dXo5
 MAD37mlLtxFGYW6MRFktS7hqlVO1vi4js4K2T7pC7KRygNrc/KIgxUu15IT57A+iqI
 1HDWdmAm03vjeQubfeoZZD2/AeFGiOsD2LdwvBAHhYqOjHCb5QTmb5R7WcbSeSTZAd
 BYrezRd5CfBV8G1tXX1ta70GfaBcwVPTbM8fG34tlfQidUtrBpyIws4JGqT6GE5PTt
 QEVWRkmaKiU8g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
In-Reply-To: <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
Date: Wed, 27 Oct 2021 22:29:06 +1100
Message-ID: <87tuh2aepp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Guy Briggs <rgb@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Moore <paul@paul-moore.com> writes:
> On Tue, Oct 26, 2021 at 6:55 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> > Hi all,
>> >
>> > Today's linux-next merge of the audit tree got conflicts in:
>> >
>> >   arch/powerpc/kernel/audit.c
>> >   arch/powerpc/kernel/compat_audit.c
>> >
>> > between commit:
>> >
>> >   566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC")
>> >
>> > from the powerpc tree and commits:
>> >
>> >   42f355ef59a2 ("audit: replace magic audit syscall class numbers with macros")
>> >   1c30e3af8a79 ("audit: add support for the openat2 syscall")
>> >
>> > from the audit tree.
>>
>> Thanks.
>>
>> I guess this is OK, unless the audit folks disagree. I could revert the
>> powerpc commit and try it again later.
>>
>> If I don't hear anything I'll leave it as-is.
>
> Hi Michael,
>
> Last I recall from the powerpc/audit thread there were still some
> issues with audit working properly in your testing, has that been
> resolved?

No.

There's one test failure both before and after the conversion to use the
generic code.

> If nothing else, -rc7 seems a bit late for this to hit -next for me to
> feel comfortable about this.

OK. I'll revert the patch in my tree.

cheers
