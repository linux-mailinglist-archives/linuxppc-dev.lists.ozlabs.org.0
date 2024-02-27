Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E93868B3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 09:51:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LCbsYtw3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LCbsYtw3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkWRd01wCz3dTw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LCbsYtw3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LCbsYtw3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkWQt3CXkz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 19:50:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709023826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fjwgf70eagfSqlkzj5EjwJ1uAR0zRc9Pw4NBDTDE8ZQ=;
	b=LCbsYtw3gy5lyN5KVf8xhCdeZflPt4F4KsDvXpi6A5iBliVIEwE0iTfcRQPtIGNT2k1IV1
	COSD+4RCyk9auTeiWOtjtppnmdhR9FO1s7DgDoXIgXZWgHmmEBCLLv/P/ZGvxFu4UZwH25
	KIMFRjKNATV8QTZjlt8IFM3CIQ2qOK4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709023826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fjwgf70eagfSqlkzj5EjwJ1uAR0zRc9Pw4NBDTDE8ZQ=;
	b=LCbsYtw3gy5lyN5KVf8xhCdeZflPt4F4KsDvXpi6A5iBliVIEwE0iTfcRQPtIGNT2k1IV1
	COSD+4RCyk9auTeiWOtjtppnmdhR9FO1s7DgDoXIgXZWgHmmEBCLLv/P/ZGvxFu4UZwH25
	KIMFRjKNATV8QTZjlt8IFM3CIQ2qOK4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-kwt75-UBNoyjBOCfKxuAPg-1; Tue, 27 Feb 2024 03:50:24 -0500
X-MC-Unique: kwt75-UBNoyjBOCfKxuAPg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a432106a59dso141617066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709023823; x=1709628623;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjwgf70eagfSqlkzj5EjwJ1uAR0zRc9Pw4NBDTDE8ZQ=;
        b=M/So1ZnMqUhqWkbBN6654KPQAGIgZTVmjX9mX8uppPKRaiu4QJHDAEL1f8842EEHlB
         3V2n+5ApPtQQ6Z7/wewHN13B7kVloXQ5uTvdwEk3tiXAPxgh4++T1v9yzQFlreLf4zrY
         au+5px67xBEcYj4Cr52HWKP1Ww+mTdah+Kkd6vM11/w3Vqj6lvIQNFBFJY62Kwko5xh0
         q3ZaqmoBODIfzvqjCl7Rg7K3sW5FG51S5CJbOdiS4trrwuWw3uBNDjx5I9kdxJT5l3Oo
         is+XDOmn7/n98GOwTs07C/DtDi3qMc/XvK1VvsHUWj2FFAXWz/atwtAeu1Ts8BmNo6qI
         3PWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrb7+HGIZtGsR2qbzQ7JXAF/UwD5WjJM0BPxK2TzeTCkIG2vQ2pV9jj34WrSz8v+V+P/9h5RCHZ/Xji2DXrvDqRT4uV/MJnPj0ipAFUA==
X-Gm-Message-State: AOJu0YxnscGHy7b+eqeHpGzuL2LhNYCaeLZHnYbt7Eyr9WNva0KaUR9H
	vkkI14Wyumf52n4KW0uruCE1KX3V33gJQJovf7qdOpybtbe8BJxQutOcnuCCFp2XjGgchWZAICY
	eJsrxRjg1IdGXjAz8CJcotSK8p1Zx9WqgkaOLHEjp3lrNQjVYd/JlWHC1jB53R10=
X-Received: by 2002:a05:6402:2059:b0:565:5de9:719b with SMTP id bc25-20020a056402205900b005655de9719bmr6626172edb.25.1709023823750;
        Tue, 27 Feb 2024 00:50:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvj/J7mrOUBP8NhuM/T98wRnes1Y0UfzNTWIgfMUAKK8NC1z6G/mukde1G9/WdcUrvxyg8eA==
X-Received: by 2002:a05:6402:2059:b0:565:5de9:719b with SMTP id bc25-20020a056402205900b005655de9719bmr6626152edb.25.1709023823318;
        Tue, 27 Feb 2024 00:50:23 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id n5-20020a056402434500b005644221a3desm549368edc.3.2024.02.27.00.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:50:22 -0800 (PST)
Message-ID: <94491aab-b252-4590-b2a7-7a581297606f@redhat.com>
Date: Tue, 27 Feb 2024 09:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 03/32] powerpc: Fix stack backtrace
 termination
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-4-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226101218.1472843-4-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/02/2024 11.11, Nicholas Piggin wrote:
> The backtrace handler terminates when it sees a NULL caller address,
> but the powerpc stack setup does not keep such a NULL caller frame
> at the start of the stack.
> 
> This happens to work on pseries because the memory at 0 is mapped and
> it contains 0 at the location of the return address pointer if it
> were a stack frame. But this is fragile, and does not work with powernv
> where address 0 contains firmware instructions.
> 
> Use the existing dummy frame on stack as the NULL caller, and create a
> new frame on stack for the entry code.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/cstart64.S | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Thanks for tackling this! ... however, not doing powerpc work since years 
anymore, I have some ignorant questions below...

> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> index e18ae9a22..14ab0c6c8 100644
> --- a/powerpc/cstart64.S
> +++ b/powerpc/cstart64.S
> @@ -46,8 +46,16 @@ start:
>   	add	r1, r1, r31
>   	add	r2, r2, r31
>   
> +	/* Zero backpointers in initial stack frame so backtrace() stops */
> +	li	r0,0
> +	std	r0,0(r1)

0(r1) is the back chain pointer ...

> +	std	r0,16(r1)

... but what is 16(r1) ? I suppose that should be the "LR save word" ? But 
isn't that at 8(r1) instead?? (not sure whether I'm looking at the right ELF 
abi spec right now...)

Anyway, a comment in the source would be helpful here.

> +
> +	/* Create entry frame */
> +	stdu	r1,-INT_FRAME_SIZE(r1)

Since we already create an initial frame via stackptr from powerpc/flat.lds, 
do we really need to create this additional one here? Or does the one from 
flat.lds have to be completely empty, i.e. also no DTB pointer in it?

>   	/* save DTB pointer */
> -	std	r3, 56(r1)
> +	SAVE_GPR(3,r1)

Isn't SAVE_GPR rather meant for the interrupt frame, not for the normal C 
calling convention frames?

Sorry for asking dumb questions ... I still have a hard time understanding 
the changes here... :-/

>   	/*
>   	 * Call relocate. relocate is C code, but careful to not use
> @@ -101,7 +109,7 @@ start:
>   	stw	r4, 0(r3)
>   
>   	/* complete setup */
> -1:	ld	r3, 56(r1)
> +1:	REST_GPR(3, r1)
>   	bl	setup
>   
>   	/* run the test */

  Thomas

