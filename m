Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA06748211
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 12:25:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UdIY8cZI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwwlx6dDNz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 20:25:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UdIY8cZI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qwwkm5XZ4z3bnN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 20:24:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688552672;
	bh=bxv5RlBw6jHHPJ7/NqKkDq8EbXeFR8b7l8+ro4TxGJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UdIY8cZIOeoWNhvIOKtCcw77iFwNU4tPzQm83Pj5w4fs9L2qztMlbZeaC0W3xH9z2
	 aYvCBKhg6yATq0oziwTavYJvkzA3ZdxGIeTsaTxDFEosRq4Huh2m263mzx0RAquRbD
	 J6JevD0fqKmonOyUG8fI02vHJ4frfviAEdJNMWvVdw45rtbN0sSJsvG6ZkAtSAMC0l
	 CH2XBTFFVeYYkisWMAxt5VBLZBPRzfZ/7TZDknwnr206ujdM7bXG14tvLdTwSAaumH
	 JdoU+yHcFc0KkAlNf3nxK7ZyWW9kEzCqcC38SiQ06udfFY/IZm23i8+PdkxuEj55yv
	 Ya23lfLb6/yhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qwwkm0Cgmz4wqX;
	Wed,  5 Jul 2023 20:24:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Update MAINTAINERS
In-Reply-To: <ZJx0OVEphb/OqQ+t@google.com>
References: <20230608024504.58189-1-npiggin@gmail.com>
 <ZJx0OVEphb/OqQ+t@google.com>
Date: Wed, 05 Jul 2023 20:24:31 +1000
Message-ID: <87zg4aveow.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:
> On Thu, Jun 08, 2023, Nicholas Piggin wrote:
>> Michael is merging KVM PPC patches via the powerpc tree and KVM topic
>> branches. He doesn't necessarily have time to be across all of KVM so
>> is reluctant to call himself maintainer, but for the mechanics of how
>> patches flow upstream, it is maintained and does make sense to have
>> some contact people in MAINTAINERS.
>> 
>> So add Michael Ellerman as KVM PPC maintainer and myself as reviewer.
>> Split out the subarchs that don't get so much attention.
>> 
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>
> Thanks for documenting the reality of things, much appreciated!
>
> Acked-by: Sean Christopherson <seanjc@google.com>
>
>>  MAINTAINERS | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0dab9737ec16..44417acd2936 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11379,7 +11379,13 @@ F:	arch/mips/include/uapi/asm/kvm*
>>  F:	arch/mips/kvm/
>>  
>>  KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
>> +M:	Michael Ellerman <mpe@ellerman.id.au>
>> +R:	Nicholas Piggin <npiggin@gmail.com>
>>  L:	linuxppc-dev@lists.ozlabs.org
>> +L:	kvm@vger.kernel.org
>> +S:	Maintained (Book3S 64-bit HV)
>> +S:	Odd fixes (Book3S 64-bit PR)
>> +S:	Orphan (Book3E and 32-bit)
>
> Do you think there's any chance of dropping support for everything except Book3S
> 64-bit HV at some point soonish?

Nick proposed disabling BookE KVM, which prompted some users to report
they are still actively using it:

  https://lore.kernel.org/all/20221128043623.1745708-1-npiggin@gmail.com/

There are also still some KVM PR users.

In total I'd guess it's only some small 100s of users, but we don't
really know.

> There haven't been many generic KVM changes that touch PPC, but in my
> experience when such series do come along, the many flavors and layers
> of PPC incur quite a bit of development and testing cost, and have a
> high chance of being broken compared to other architectures.

Ack.

cheers
