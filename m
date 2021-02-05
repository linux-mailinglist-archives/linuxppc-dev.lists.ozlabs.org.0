Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A69D131018C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 01:24:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWx466TYszDsTW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 11:24:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWx2c1yqkzDq8g
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 11:22:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=E0jBT76a; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWx2Z2k2fz9sXV;
 Fri,  5 Feb 2021 11:22:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612484566;
 bh=FOfKqEKV9BNhV4TSEmqOlzekaXDrwS7PDbxUXWkrYfY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=E0jBT76akh7EAopKC+OmiLrGgonW9IO4lkq5us90an6BhcNgh0e6tovan29nznHVq
 L/zPhEvJWEVbes4KOcv4OWj8Ua0eodNEVDAL+4vg2Qa99fE/z1//MR4jl49ziWCrNn
 8zlnf6sy0dJq5iyExH5RLgrqRNINzDDnWR5QLlnP40qbiUpz87ViY4HzmqmXPfICO+
 F8YSKu6gH1jlQCF2bwF4cZPf70zAUeUQTOKrUZcmxkasyFzAxzWe9D/DR7AFfqcOGK
 A49LF3LSwKTh394JgTRnHVjz5WpF/QFebCIeBt77zmXmTkUo+P7pvZqPzqlCqhT6M7
 /RJBICXHa94XA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
In-Reply-To: <1612428699.u023r42mj3.astroid@bobo.none>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <37c2a8e1-2c4b-2e55-6753-0a804ce00cac@csgroup.eu>
 <1612409077.fadt3kvld9.astroid@bobo.none>
 <65686b53-feb4-2788-88e1-76c3714d3e97@csgroup.eu>
 <1612428699.u023r42mj3.astroid@bobo.none>
Date: Fri, 05 Feb 2021 11:22:44 +1100
Message-ID: <87blczpdm3.fsf@mpe.ellerman.id.au>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Christophe Leroy's message of February 4, 2021 6:03 pm:
>> Le 04/02/2021 =C3=A0 04:27, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Excerpts from Christophe Leroy's message of February 4, 2021 2:25 am:
>>>> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
...
>>>>> +
>>>>> +	/*
>>>>> +	 * We don't need to restore AMR on the way back to userspace for KU=
AP.
>>>>> +	 * The value of AMR only matters while we're in the kernel.
>>>>> +	 */
>>>>> +	kuap_restore_amr(regs);
>>>>
>>>> Is that correct to restore KUAP state here ? Shouldn't we have it at l=
ower level in assembly ?
>>>>
>>>> Isn't there a risk that someone manages to call interrupt_exit_kernel_=
prepare() or the end of it in
>>>> a way or another, and get the previous KUAP state restored by this way=
 ?
>>>=20
>>> I'm not sure if there much more risk if it's here rather than the
>>> instruction being in another place in the code.
>>>=20
>>> There's a lot of user access around the kernel too if you want to find a
>>> gadget to unlock KUAP then I suppose there is a pretty large attack
>>> surface.
>>=20
>> My understanding is that user access scope is strictly limited, for inst=
ance we enforce the=20
>> begin/end of user access to be in the same function, and we refrain from=
 calling any other function=20
>> inside the user access window. x86 even have 'objtool' to enforce it at =
build time. So in theory=20
>> there is no way to get out of the function while user access is open.
>>=20
>> Here with the interrupt exit function it is free beer. You have a place =
where you re-open user=20
>> access and return with a simple blr. So that's open bar. If someone mana=
ges to just call the=20
>> interrupt exit function, then user access remains open
>
> Hmm okay maybe that's a good point.

I don't think it's a very attractive gadget, it's not just a plain blr,
it does a full stack frame tear down before the return. And there's no
LR reloads anywhere very close.

Obviously it depends on what the compiler decides to do, it's possible
it could be a usable gadget. But there are other places that are more
attractive I think, eg:

c00000000061d768:	a6 03 3d 7d 	mtspr   29,r9
c00000000061d76c:	2c 01 00 4c 	isync
c00000000061d770:	00 00 00 60 	nop
c00000000061d774:	30 00 21 38 	addi    r1,r1,48
c00000000061d778:	20 00 80 4e 	blr


So I don't think we should redesign the code *purely* because we're
worried about interrupt_exit_kernel_prepare() being a useful gadget. If
we can come up with a way to restructure it that reads well and is
maintainable, and also reduces the chance of it being a good gadget then
sure.

cheers
