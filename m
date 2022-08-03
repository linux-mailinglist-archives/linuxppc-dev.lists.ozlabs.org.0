Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D45885EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 04:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyGgY5VFFz30D0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 12:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SVU2ZWTy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyGft2jHxz2xG7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 12:54:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SVU2ZWTy;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyGfq1TsNz4wgp;
	Wed,  3 Aug 2022 12:54:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659495283;
	bh=tMZnMESRk/a2y206bL3iZwFiTNfsMKG0TWY7C8ijgnc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=SVU2ZWTydxQfWdeG59ZDuiI50WjC7LeGR15ZPk+WaEeY6P9Ldwk8pezyALTuAl5Pq
	 PptFX43wkKiw8E60vYSpxEV7EldJvzwjPIgk+7mGE2ChdrAHQE/n1zZ6EOkYwuYYX2
	 3WFHEerUpywAWprhGpKa30hKyQ3496STs5Vxg0RftHzEmmwljHAxLXHLl7U6rkEkQJ
	 8HPFt+HgpBfO/CDZFbVibgXrqIYJNQ9vF/TONwZYd+q6q1hCJZPOxHhXVFuAhTHAuS
	 4vaeOxyZwB/XlQd3HfdF8heww1FsHBB0cbpxqfzRisRyiSGhLPxgAL2GYhn2+aIs7G
	 64G3cY7zsUlVg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, shaom Deng
 <dengshaomin@cdjrlc.com>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "inux-kernel@vger.kernel.org" <inux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kvm:remove the unexpected word "that" in comments
In-Reply-To: <ea0432e4-6cd8-decc-ab65-c611f3aca7f6@csgroup.eu>
References: <20220716165028.17693-1-dengshaomin@cdjrlc.com>
 <ea0432e4-6cd8-decc-ab65-c611f3aca7f6@csgroup.eu>
Date: Wed, 03 Aug 2022 12:54:41 +1000
Message-ID: <87wnbq9gum.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 16/07/2022 =C3=A0 18:50, shaom Deng a =C3=A9crit=C2=A0:
>> [Vous ne recevez pas souvent de courriers de dengshaomin@cdjrlc.com. D=
=C3=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutS=
enderIdentification ]
>>=20
>> delete the repeated word "that" in comments
>>=20
>> Signed-off-by: shaom Deng <dengshaomin@cdjrlc.com>
>> ---
>>   arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book=
3s_64_mmu_hv.c
>> index 514fd45c1994..73c6db20cd8a 100644
>> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> @@ -1601,7 +1601,7 @@ long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kv=
m,
>>    * is valid, it is written to the HPT as if an H_ENTER with the
>>    * exact flag set was done.  When the invalid count is non-zero
>>    * in the header written to the stream, the kernel will make
>> - * sure that that many HPTEs are invalid, and invalidate them
>> + * sure that many HPTEs are invalid, and invalidate them
>
> You are changing the meaning here.
>
> The sentence is:
>
> ... make sure that: that many HPTEs are invalid.
>
> You changed the meaning to:
>
> ... make sure that: many HPTEs are invalid.
>
>
>
> It doesn't mean the same.

Correct.

This was also discussed on an identical patch:

  https://lore.kernel.org/linuxppc-dev/87bktdd6s8.fsf@mpe.ellerman.id.au/

In next I have fixed all genuine occurences of repeated words that I
could find, so hopefully we will have fewer of these patches to process
from now on.

cheers
