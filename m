Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87549443983
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 00:19:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkQpX3T2Lz2xsg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 10:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CPycaGj8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkQnt3Jd1z2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 10:18:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CPycaGj8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HkQnt2VGhz4xbC;
 Wed,  3 Nov 2021 10:18:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635895138;
 bh=YFiZDGWUC1/1vtgCtfKwz+BIRJgxcnCFDDMQt4TIZ2A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CPycaGj8D5pOC4yfecRW+Ke8e5re9XWdhjA65Qiq8chCXBm3ZYrhm93zLw7ZbC3zA
 QapfvYm0yp2EYcSi1/9oXEq+IvKwtW+G+X0nFTHE1jqIaIT9dlt3l8YcrdaEW2ZoPw
 EsUBNhd77eObxHsm3TUjXmADxgCSCwEs+uLekAX08vCAR0HEWsCs3wJrLiJL/F/28g
 UGeGrOz6nYuyjwlsSEy2o5iL8Sp+dcMy2i0r7swWhgKjjs7k8buxQK8YFpNhfsfYcE
 AHLnlV+df3R8pm0+Z45YaFRQWEaSrMNsH9plxeUD14bDkA9xVIrJYZcqwrgx0Q1Xw1
 n9lTkWgpbnz7w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Moore <paul@paul-moore.com>, patch-notifications@ellerman.id.au
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
In-Reply-To: <CAHC9VhROvSQHVQ6Wo8zHND1rGm+r6dGJur69B65sJ9JwNvMDpQ@mail.gmail.com>
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <163584790624.1845480.1785827913484538939.b4-ty@ellerman.id.au>
 <CAHC9VhROvSQHVQ6Wo8zHND1rGm+r6dGJur69B65sJ9JwNvMDpQ@mail.gmail.com>
Date: Wed, 03 Nov 2021 10:18:57 +1100
Message-ID: <87a6im87tq.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, linux-audit@redhat.com,
 Paul Mackerras <paulus@samba.org>, Eric Paris <eparis@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Moore <paul@paul-moore.com> writes:
> On Tue, Nov 2, 2021 at 7:38 AM Michael Ellerman
> <patch-notifications@ellerman.id.au> wrote:
>>
>> On Tue, 24 Aug 2021 13:36:13 +0000 (UTC), Christophe Leroy wrote:
>> > Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
>> > targets") added generic support for AUDIT but that didn't include
>> > support for bi-arch like powerpc.
>> >
>> > Commit 4b58841149dc ("audit: Add generic compat syscall support")
>> > added generic support for bi-arch.
>> >
>> > [...]
>>
>> Applied to powerpc/next.
>>
>> [1/1] powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC
>>       https://git.kernel.org/powerpc/c/566af8cda399c088763d07464463dc871c943b54
>
> Did the test failure discussed earlier in this thread ever get
> resolved?  If not, this really shouldn't be in linux-next IMO.

It's not in next, that notification is from the b4 thanks script, which
didn't notice that the commit has since been reverted.

cheers
