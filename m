Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4816A33EFF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 13:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0pkS1VvJz30JK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 23:05:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m+BAfz4r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m+BAfz4r; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0pk15HXkz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 23:04:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0pjz6Gtpz9sWQ;
 Wed, 17 Mar 2021 23:04:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615982680;
 bh=rFxZxzMVL9CiaY3o0lToBCatccB71mOld3oUDIVn63M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m+BAfz4rlJoKcHvqabxUkl2pc7Ax1MYaP+GEkQl0gb9uBGEYtOUPzspIPKeBkj+1J
 ixmlJ+QuTPiHhIVz9BmY4y7e4HpJVjECo0zfYI7hd7z5vOjWjz8okHb098giY3g60U
 HqdkqSZZgXoejHDGyKz6/fde7fExaotKERFmfDgUO9ZCO2/Qxy9PVDu5yPfTQrQWM2
 kckmxEQSNlT+oa1UxahwOgFAg2WLv8OnpL5WkEU/XOwNv/ebUBJiiH9DNXAwa8lww/
 boXYsubKNCijIl/t5BW2wGFeYrvUsp/4XwtBNaAvwoaZ/TQwR67CPBp4WAvg0TNyE0
 lK3anAFczczvw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v9 2/8] powerpc/lib/code-patching: Set up Strict RWX
 patching earlier
In-Reply-To: <CACzsE9rbgjNtLOjCHL9+LN6_Xoo6mJ_D5pewuMg7ktqA_OnR0w@mail.gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-2-jniethe5@gmail.com>
 <bd0e37b6-22cb-6dbc-1ef8-b6eac4b4c6e6@csgroup.eu>
 <CACzsE9rbgjNtLOjCHL9+LN6_Xoo6mJ_D5pewuMg7ktqA_OnR0w@mail.gmail.com>
Date: Wed, 17 Mar 2021 23:04:38 +1100
Message-ID: <874khaoujt.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, ajd@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> On Tue, Mar 16, 2021 at 5:32 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Le 16/03/2021 =C3=A0 04:17, Jordan Niethe a =C3=A9crit :
>> > setup_text_poke_area() is a late init call so it runs before
>> > mark_rodata_ro() and after the init calls. This lets all the init code
>> > patching simply write to their locations. In the future, kprobes is
>> > going to allocate its instruction pages RO which means they will need
>> > setup_text__poke_area() to have been already called for their code
>> > patching. However, init_kprobes() (which allocates and patches some
>> > instruction pages) is an early init call so it happens before
>> > setup_text__poke_area().
>> >
>> > start_kernel() calls poking_init() before any of the init calls. On
>> > powerpc, poking_init() is currently a nop. setup_text_poke_area() reli=
es
>> > on kernel virtual memory, cpu hotplug and per_cpu_areas being setup.
>> > setup_per_cpu_areas(), boot_cpu_hotplug_init() and mm_init() are called
>> > before poking_init().
>> >
>> > Turn setup_text_poke_area() into poking_init().
>> >
>> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> > ---
>> > v9: New to series
>> > ---
>> >   arch/powerpc/lib/code-patching.c | 12 ++++--------
>> >   1 file changed, 4 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-=
patching.c
>> > index 2333625b5e31..b28afa1133db 100644
>> > --- a/arch/powerpc/lib/code-patching.c
>> > +++ b/arch/powerpc/lib/code-patching.c
>> > @@ -65,14 +65,11 @@ static int text_area_cpu_down(unsigned int cpu)
>> >   }
>> >
>> >   /*
>> > - * Run as a late init call. This allows all the boot time patching to=
 be done
>> > - * simply by patching the code, and then we're called here prior to
>> > - * mark_rodata_ro(), which happens after all init calls are run. Alth=
ough
>> > - * BUG_ON() is rude, in this case it should only happen if ENOMEM, an=
d we judge
>> > - * it as being preferable to a kernel that will crash later when some=
one tries
>> > - * to use patch_instruction().
>> > + * Although BUG_ON() is rude, in this case it should only happen if E=
NOMEM, and
>> > + * we judge it as being preferable to a kernel that will crash later =
when
>> > + * someone tries to use patch_instruction().
>>
>> Please use WARN_ON(), see why at https://www.kernel.org/doc/html/latest/=
process/deprecated.html

> Ok I can include a change to WARN_ON() as a separate patch.

I'm not convinced we should change this to a WARN_ON.

Being able to patch the kernel text is not optional.

Patching jump labels has no ability to return an error, and the code
that uses them has no concept of the jump label not taking the correct
polarity.

Silently failing the patch is like randomly flipping an if condition
somewhere in the kernel and hoping that everything will continue
working.

cheers
