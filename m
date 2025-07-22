Return-Path: <linuxppc-dev+bounces-10366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D5BB0E72E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 01:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmthr522rz30Vf;
	Wed, 23 Jul 2025 09:27:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753226844;
	cv=none; b=YDZd9wRf9niYmr3BVVCwvEt1NZbcgkthK5uN3NSK4Bzlc2zxYG2yjBV+3FPPNEAG6kEM88UW+y43D8wpUc7KmPZzIB55vqn7P1ciTwimXnsB+TRl6mcbXU8I4Qb1r0nmVaOC9liqarCXX4ifbasFXqAyOXGBN8xGo/jBICDDM2tr6C1CyBgAjX5RzB2Tg1aK7iSLBppfk+j4XTEiodIykHypvXZd+HsF3ZARQ6pCN4vY1S+eTNIoBRnJIpWpEnIv/5rOg/SMoYdFF0I4GZzHrdHfXyO6z49DPdeSdpnBhVSuFrvwHAI0SaDTlkNi8ZDs6c2oFP0GSRoAPXPjLRQyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753226844; c=relaxed/relaxed;
	bh=iwc3Fror8L4wHpcfLKE8iXNePDDpmn63CWUej31GmfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmA7BnQR6oGuVwf5+7vcLG7Yo0k8vHciPovKkgJnZcIXtno97Dni7xw9EFPtvvCtrpjCSR4EPyQulVCIAkSZasVS7YmsyHLuzoEafAhBjA/E2f4bAdX4tBnk5SY+Azg+5Od5hF9rOREzpRtqQ5YBcRTj0FXDz09y7XiU33rZcjZDUx9U8zMIdpySXSWTR4hZTek8kqb6hs2o6woN4WzoqMAc6shRyZleWTYId3cEjLqpEJmPu3wRwOunzuhTmjGZpsU2Dt6+mU/Rbgo23z1B1LW8tIvsPbTTbnstnKAfZcja1cQ4l/it03T7Y+5Mou2V/RXGqo4zlmsrpg4Oy2jC2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vd501dAm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=unixbhaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vd501dAm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=unixbhaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmthq3qZZz306d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 09:27:23 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-7050bc6bea9so48560606d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 16:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753226841; x=1753831641; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwc3Fror8L4wHpcfLKE8iXNePDDpmn63CWUej31GmfU=;
        b=Vd501dAmiuz4zjfVE+eDfF5gdYXm1TOEWY4ZdjBNbVTSBBUyzPbOWVfalsFIecKqVx
         ECDV1Zj5tFsLCa+ztjiESSmfNvH7L8jWDzSiEjRMIYw3BOv8zq+9pC08RFXWSlDXht2t
         1Zy3taGqNaaRieQExsVjAkpLDDcv6JYKHjYW1OdLtP2uSqDV+vNlP90ZmalpmXe65dLT
         +YzrKsu5HxQrgdtzr6cfsgtnPLYdGZK4uzcGdCed8ez06I2KMHub7rpWnPzPDfMmI0Bj
         f3iqTyeOVmM5dVxXiAe7iZ6jNb4xInj8yNFyuDGqJ4zp3Ds4Q6+hwtLy+5mMVH6BlI9/
         U3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753226841; x=1753831641;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwc3Fror8L4wHpcfLKE8iXNePDDpmn63CWUej31GmfU=;
        b=h9BIZ9mnps80IrVQ8bgJC6sjTRW+jVAB44t8kQdVPa9n/ruUeShe6PjDu/Qix0HsWy
         uTpreP/f0qy4wEOyqm5j/MMZqOUcIAg6IqNeGTtJKJ+g+CNz3XdgBbeycCTgfSNnOQ7v
         vsXDG2ldYATdCZYwk/5VJT1nSemAnf0ySrheXwACwdg7qMF+KeoQN0JMAXseggUfYyMc
         Lt32j/sKT6FhiigvU1MRP9oJjjgq17fIvEE2R2ureV1mIhiGm6wnrmGPuKczVCOrBdvf
         V9Zf6grF9LEnaF0uUVUr5yJ8GzrdrF/OkjjEuNypigr9y6Ukijyb5NB1itoNv+oH0w8p
         u5rw==
X-Forwarded-Encrypted: i=1; AJvYcCWqX0bKMXeYvs0EXjP/kM8h9WF9qqzuGPzRdESdNZVKS8IX54ddSZbpsKz+SdluvQV4nqzFi6P7PR65ggk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzhX8vjngIhmt0v501Cu6dAK+kHSzQ6ydYQOCprjENxZTLYM8c
	XM6fwXHStoFwZwpusOylrT1EWo2S5vbfNEPaM0z2VXRqZcChEWyUFQNU
X-Gm-Gg: ASbGnctBYp6aiCa6Ln6MlX8RLGn/AkvvQxYYt/Mg+UpkkuXRxy/i0l+2VTv55qJC9Iz
	2qx9ekG/+zB0/6876NRZ8kpG4ckpz8/j6C2/HtgwL5vCSkewIcLCLa1zbgZNgKU2THdE/Upvc/C
	Gz8AgePQs7w/OdHu8lh3BObbTCbXN9gHPVrvn4ou3/IvGklTpeRYEnsDjxbR3dOCH8H8ngJwpe/
	IaRUlVYNzxBpc9PqabVj7LR811CPa1k/u0j+2/70llW9VRzrAF/bNKrPW4p1g52BiNoMPe6ws0V
	lnmR+gux8H/CJBH9CVXj4v16Exq9wyW7+nHezK/v0FiZa05PIk5mYuIiiFPB++CI6GO1E5U3RdM
	qxwC2IG1jcYnYxEQ=
X-Google-Smtp-Source: AGHT+IGe1ljipZjsZbw3dRvkwQE0O5+2HUwSu8xq2HYAnP4Hbng2NYuLyW6FuyfDw5tRqvNufERT9g==
X-Received: by 2002:a05:6214:5004:b0:702:d6e2:5bbe with SMTP id 6a1803df08f44-70700489ffamr11704486d6.4.1753226840794;
        Tue, 22 Jul 2025 16:27:20 -0700 (PDT)
Received: from Gentoo ([37.19.198.68])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70692e593f2sm46013746d6.21.2025.07.22.16.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 16:27:20 -0700 (PDT)
Date: Wed, 23 Jul 2025 04:57:01 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch:powerpc:tools This file was missing shebang line,
 so added it
Message-ID: <aIAeRXI0k3FAjXJR_Gentoo@unixbhaskar-laptop>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250722220043.14862-1-unixbhaskar@gmail.com>
 <20250723092243.7056fda4@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cSD96wCacS3lJ7MH"
Content-Disposition: inline
In-Reply-To: <20250723092243.7056fda4@canb.auug.org.au>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--cSD96wCacS3lJ7MH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09:22 Wed 23 Jul 2025, Stephen Rothwell wrote:
>Hi Bhaskar,
>
>On Wed, 23 Jul 2025 03:29:36 +0530 Bhaskar Chowdhury <unixbhaskar@gmail.co=
m> wrote:
>>
>> This file was missing the shebang line, so added it.
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  arch/powerpc/tools/head_check.sh | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/tools/head_check.sh b/arch/powerpc/tools/head_=
check.sh
>> index 689907cda996..a9cd06958921 100644
>> --- a/arch/powerpc/tools/head_check.sh
>> +++ b/arch/powerpc/tools/head_check.sh
>> @@ -1,3 +1,4 @@
>> +#!/bin/sh
>>  # Copyright =C2=A9 2016 IBM Corporation
>>
>>  # This program is free software; you can redistribute it and/or
>
>Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
>I used "shellcheck -s sh" to double check that it is in fact a bourne
>shell script and it is invoked with $(CONFIG_SHELL), so it had better
>be :-)
>
Hi Stephen,

I will make sure to check like that, next time onwards. Thanks for the
headsup. :)
>--
>Cheers,
>Stephen Rothwell



--
Thanks,
Bhaskar

"Here's looking at you kid"-- Casablanca
https://about.me/unixbhaskar

--cSD96wCacS3lJ7MH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmiAHkUACgkQsjqdtxFL
KRW35Qf+JObm2jY/zwSzo96r/QcyoJaXzVNVQkoM8tk6J2ooPFAgkNFDbt8Xn7K/
Ttel6IJ70yRkxV9mTl0eJzWM/IQ1tZlos2g0bFVvyTwfnzA2IxeeLUkk7X0+mpNp
Side4uWG/8YNvIFbRhWwGNG/+yrcOrZEbsYI4d/hSELyPGtTMQ+yb4B8tvbOgn8Y
sT5PXU//F+ysEcxblBKgJjd672OyNxeaLACXduXZ7MNUlR/SEKDxkWCePpsLvei6
xniaaMr31+TzpdYKnIHqE1zljrpUP903Au6Nu+yDKYvreIjH0lDl5DNEmAjz8M2Q
TOA8GkG9g25uZ/72B3M49y8fZR6ycw==
=L+e7
-----END PGP SIGNATURE-----

--cSD96wCacS3lJ7MH--

