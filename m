Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A897433A9FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:27:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzMKc3Tg7z3cms
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:27:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BvHC6wmn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BvHC6wmn; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzMKB2d2lz30LR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:26:37 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id x10so30408080qkm.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uUydBSlgVr1bgB3fgHkH0tdR13fMyNSnZM4O4Ua8siU=;
 b=BvHC6wmn8Od8FYfb70CSfrzWzH9+g60gVg6T8xdEtN0OpsZEysXuJRPnbhm6muZc1+
 jU7ittciq2njAMXAJgIYtI7xw24t6PJXYUe2lD/AsI5lPNjzAUnjJnomlMPuyVyTLEPa
 ap5tcjyZOp0GBlXo+55BmzJyqY7GEKT5RaN5oANyy54P676k0awclQ4zVp0G69aWJ/6B
 PZxx6bDNi5AdBTqNCJDMYIt7YTrrC/+9uK7PzsDJIVar6qph/1cln6BC+MZ872h6zaSP
 gQcBdvcaRMzTk+jILr/iUIJNfu2iDoQamyEXKJAOGsnCfE1dl6G+Q67KkNzFZZ6/ylfT
 T/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uUydBSlgVr1bgB3fgHkH0tdR13fMyNSnZM4O4Ua8siU=;
 b=JR52JG83YwTR6sv5uEflo8vlUuZgngVaupIZHZ/3SloxSG1hg6SnSkMIvWWFIhP0WU
 bDCNg+hAsbeVHu6NHXpxjqHwCbo+uh/xRT1wrHith70m1uRa1dhi3toJUt/aP3aCvG7X
 Zo/DwyQK+AMm9sR6A7FifSmb/L0tvl3/RdKAoFTC3bMViKbspeG71vCbVguw9HbgZ+dI
 Gun/vh8OmLZlwIBJdJ2xfjPYFGfB9LC7FaI0rZobqbdRhfCDDxMOhbR1ZFYbMhcGvSye
 UgZDF7t9roSEj64i/dh9vYaTfA96o1eSFcwAb2EJszJGukunSVSO+oHMabCiDjSLg+TL
 iq6A==
X-Gm-Message-State: AOAM531I7FNl0K7J1G3Bk9CklcSAsLmmVttL7UVa+5kQ6gExFIOeRViM
 qvYPBYvnc8NZell1R9l/MFI=
X-Google-Smtp-Source: ABdhPJwIQZPkmQnaF0KdIGFTrq0lUPYP1L8r1glWKTx+BK/GJN/htmXXPHS0UE3BVbWwJm3j4iQcrw==
X-Received: by 2002:a37:9d8b:: with SMTP id g133mr22898960qke.10.1615778793668; 
 Sun, 14 Mar 2021 20:26:33 -0700 (PDT)
Received: from ArchLinux ([156.146.55.217])
 by smtp.gmail.com with ESMTPSA id b2sm1533993qtb.54.2021.03.14.20.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:26:32 -0700 (PDT)
Date: Mon, 15 Mar 2021 08:56:19 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: kernel: Trivial spelling fixes throughout the
 file head_fsl_booke.S
Message-ID: <YE7T2+/6AjOxshUV@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, benh@kernel.crashing.org,
 paulus@samba.org, akpm@linux-foundation.org, rppt@kernel.org,
 oss@buserror.net, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20210314220436.3417083-1-unixbhaskar@gmail.com>
 <f8dc3cbe-54f4-1da1-b14f-4735d28aad13@infradead.org>
 <87r1kh3zeu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0h8yTNnxCDFgEAPZ"
Content-Disposition: inline
In-Reply-To: <87r1kh3zeu.fsf@mpe.ellerman.id.au>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 oss@buserror.net, paulus@samba.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0h8yTNnxCDFgEAPZ
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 13:48 Mon 15 Mar 2021, Michael Ellerman wrote:
>Randy Dunlap <rdunlap@infradead.org> writes:
>> On 3/14/21 3:04 PM, Bhaskar Chowdhury wrote:
>>>
>>> Trivial spelling fixes throughout the file.
>>>
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> ---
>>>  arch/powerpc/kernel/head_fsl_booke.S | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
>>> index fdd4d274c245..c6fcfca0b0d7 100644
>>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>>> @@ -403,7 +403,7 @@ interrupt_base:
>>>  	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, \
>>>  		  unknown_exception, EXC_XFER_STD)
>>>
>>> -	/* Decrementer Interrupt */
>>> +	/* Decremented Interrupt */
>>
>> No, the comment matches the macro (or whatever that is).
>
>Right. I dropped this hunk. Please update your script or whatever to not
>"correct" that spelling.
>
Hmmmm ...V2 on the way...

>cheers

--0h8yTNnxCDFgEAPZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBO09cACgkQsjqdtxFL
KRXnkAgAoQe+fjFbsaDe//4BHrcEkDyQcBya7D6Bbo40PXbWS19N4uxxcA7w87u7
KZkMnmnRzNR1Xyv1Eykde//1MmQBdGudjElLW51HqMi1G90a95I80GMjvNPEHhOw
+9Tnnh9zFGAueL3PzC7+V9jsFl3VbbCzEE0u7ppfvyNJ99FVTgtIcF0aBoZD6F49
R0UyqVD8LRCQAuvkYeSpbYiD3fVnllflfsnM/Q1a4b2q2xLZHc7b/hOqbJXbVzRQ
0K5pfHupQZDjrQJghr026ZcuZWP04RbZRQYW6Asn05iNsATlAaxBYdg7RoVRUANl
XWIOeH3De6RAp04QNqOarSIAbSco9Q==
=+yEE
-----END PGP SIGNATURE-----

--0h8yTNnxCDFgEAPZ--
