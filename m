Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC93FC77D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 14:43:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzRh953w1z2yPd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 22:43:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=nfZ6GVy6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=nfZ6GVy6; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzRgT0G4Sz2yHl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 22:43:14 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so2300643pjs.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1T9uonz6ZV23kuXHurfGRVVB5lj7jIMJH16i3NUSCRI=;
 b=nfZ6GVy6XIZpVYmM2uOlyVC1X/U0qS3IIyNg9Nzojxlxxo1q4qjqwJkv99OFwFFelU
 /TI02CsSbxj5tiUl8aw/d+B2sy7z/krc9mKngFTEwZ6nuyaf9z3dT9Dt4efJcgshuF27
 /tFGNWA7GjwDT+fPl83WNTH1BxiKsufoewBTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=1T9uonz6ZV23kuXHurfGRVVB5lj7jIMJH16i3NUSCRI=;
 b=HIH6xhg1vFJGiiZzL/YKwQEr2/FRQhQmFolrrlzzisHc+q7A38UI8fW63i5wx+RFOv
 f58owTxbZh60g7xxeBKPb3GY0ejN1wFO+L+NkWtCVE6BT5yAFooE/4Pp7Nkzt8fnbtMC
 5ocnL2I8TRxr4UxfB7UWATBEd5gipxl1u7WSQpDbXbZI71opXWD7TrLvbdZyHqyzo2+J
 De4K+nKtVJctPqCyfR4SBK3uPPlLkUvFHoL8xj8HtvaEVsM76oDpZtALBHJp+6ZhTYTC
 8WKDspPkn+t3NEJ3cYmJi5rErqKnduJErIs6+vlkDOtzIwBCuWejMjOl0I1no6t3KGVb
 x6oQ==
X-Gm-Message-State: AOAM531WexX32ZlTINv17ek3NUJZeA7XcE7bBNqo+dIN7IRvaX868G5Q
 qg6wQmVaxkd2gLO7E/xEOzVuzg==
X-Google-Smtp-Source: ABdhPJy8ox3UGj+wMMB7zStDq/2+tdrLtd+0Un35XhLM9MdTTTqfb0lFaJjKx8bldixJYj9H8JfvFw==
X-Received: by 2002:a17:902:7c93:b029:12c:b603:150d with SMTP id
 y19-20020a1709027c93b029012cb603150dmr4544469pll.5.1630413787686; 
 Tue, 31 Aug 2021 05:43:07 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:a664:ffe7:ee94:4600])
 by smtp.gmail.com with ESMTPSA id t38sm17484590pfg.207.2021.08.31.05.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 05:43:07 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Avoid link stack corruption in kexec_wait()
In-Reply-To: <9f43118b-ef81-9a80-0e0b-5e74433e0b8c@csgroup.eu>
References: <3ffe7775f3fcda8e5fca6a7bc7db0b8251153c67.1629705147.git.christophe.leroy@csgroup.eu>
 <87ilzm6str.fsf@dja-thinkpad.axtens.net>
 <9f43118b-ef81-9a80-0e0b-5e74433e0b8c@csgroup.eu>
Date: Tue, 31 Aug 2021 22:43:04 +1000
Message-ID: <87fsup7pk7.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 31/08/2021 =C3=A0 08:17, Daniel Axtens a =C3=A9crit=C2=A0:
>> Hi Christophe,
>>=20
>>> Use bcl 20,31,+4 instead of bl in order to preserve link stack.
>>>
>>> See commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption
>>> in __get_datapage()") for details.
>>=20
>>  From my understanding of that commit message, the change helps to keep
>> the link stack correctly balanced which is helpful for performance,
>> rather than for correctness. If I understand correctly, kexec_wait is
>> not in a hot path - rather it is where CPUs spin while waiting for
>> kexec. Is there any benefit in using the more complicated opcode in this
>> situation?
>
> AFAICS the main benefit is to keep things consistent over the kernel and =
not have to wonder "is it a=20
> hot path or not ? If it is I use bcl 20,31, if it is not I use bl". The b=
est way to keep things in=20
> order is to always use the right instruction.

Yeah, Nick Piggin convinced me of this offline as well.

>
>>=20
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/kernel/misc_64.S | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_6=
4.S
>>> index 4b761a18a74d..613509907166 100644
>>> --- a/arch/powerpc/kernel/misc_64.S
>>> +++ b/arch/powerpc/kernel/misc_64.S
>>> @@ -255,7 +255,7 @@ _GLOBAL(scom970_write)
>>>    * Physical (hardware) cpu id should be in r3.
>>>    */
>>>   _GLOBAL(kexec_wait)
>>> -	bl	1f
>>> +	bcl	20,31,1f
>>>   1:	mflr	r5
>>=20
>> Would it be better to create a macro of some sort to wrap this unusual
>> special form so that the meaning is more clear?
>
> Not sure, I think people working with assembly will easily recognise that=
 form whereas an obscure=20
> macro is always puzzling.
>
> I like macros when they allow you to not repeat again and again the same =
sequence of several=20
> instructions, but here it is a single quite simple instruction which is n=
ot worth a macro in my mind.
>


Sure - I was mostly thinking specifically of the bcl; mflr situation but
I agree that for the single instruction it's not needed.

In short, I am convinced, and so:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Christophe
