Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAF10E357
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2019 20:44:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47QzG36xRZzDqXB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 06:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=asml.silence@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lzYNtaj2"; 
 dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PjDT74GczDr5D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 05:08:19 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id t2so36195558wrr.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 10:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=clniEQS47FGgd7NfiLKoYACJnRe08zxZ0y8JHSOO35k=;
 b=lzYNtaj2KkWEw8fMfV5x3ouiKh0F7QUe/pAfiytYJjDtbiuxr2E/df1mRImTtl/WTy
 cLmVMKdM2jCOL2n67pzj+7J15bDdpcK0X3PUAxJqBacaS99QvFbHhdx+OW73uja0DlT1
 Rhk1DllHD255Wpmk8eeFDFe3PUUikG31vx9/MAEmfQBQHpLxTU55GJeWMuJj1h0d0DGk
 qL+VfjSMTfbA5uAAq6tstf9HUNZGYXJ0BF90D4vxvf8eqHFbkfHSxadMTLLqAH1aliEe
 Orl31o4NjkfNUWnzYwiXHlBA1rWOpD4BJA1BL91Y5jy946GvNB8ZKbWqmZotJVbZFTw3
 LNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=clniEQS47FGgd7NfiLKoYACJnRe08zxZ0y8JHSOO35k=;
 b=AXfK3D2nZ14mVAMiO0yVZ0EyyYw/XS4UHqMputiTof4QRLJuh8PQjHtHKkX71ox7pe
 kHLtdSj3O/jp00zmZcutqnMWLOFfPlt8uyjH/h1qz5ryuOeoXsITrCH0/mJU9jJqu7i1
 AClkfjIqghWeacVE9GAMh4+zv63oKpF6uu4x2FvkFmxONi86jqvPLg8YinB35gPB/F9t
 bMU8toDUzkmv4mNQTKL+V/vpH6hCvYKjEgCGP4Q0bqxftXBaxKHadEnfhwgPODxGGlWQ
 2YHxxd7PaTwdIoqsYba02HXow/7E78BQW/VkL2XOsJaB+DAFzwTsF+asaCmSnjgv8p7A
 1rjQ==
X-Gm-Message-State: APjAAAW2m1oWaWPbNnK3653RzZbn/dzaWkSW6f739G8yh7lgt70FItOM
 l2e+ln7GCiSadn+lxFTyXYY=
X-Google-Smtp-Source: APXvYqxhVPDcD/eraU8bit12aebDhkH0gXkz2I8GI1ngujbRENP7TJHJBHuSpfHBvMvATODdsFBkGw==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr23223185wrs.329.1575050890964; 
 Fri, 29 Nov 2019 10:08:10 -0800 (PST)
Received: from [192.168.43.161] ([109.126.143.74])
 by smtp.gmail.com with ESMTPSA id y2sm15141095wmy.2.2019.11.29.10.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 10:08:10 -0800 (PST)
To: Jens Axboe <axboe@kernel.dk>, Christophe Leroy <christophe.leroy@c-s.fr>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <71cf82d5-5986-43b7-cf1c-acba429a89d6@c-s.fr>
 <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
 <4ef71e74-848f-59d4-6b0b-d3a3c52095a0@c-s.fr>
 <5389b43a-259d-997c-41e6-5e84a91b012a@kernel.dk>
From: Pavel Begunkov <asml.silence@gmail.com>
Autocrypt: addr=asml.silence@gmail.com; prefer-encrypt=mutual; keydata=
 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 bA==
Subject: Re: Build failure on latest powerpc/merge (311ae9e159d8 io_uring: fix
 dead-hung for non-iter fixed rw)
Message-ID: <38cb2865-d887-d46d-94ef-4ebccff4dc60@gmail.com>
Date: Fri, 29 Nov 2019 21:07:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <5389b43a-259d-997c-41e6-5e84a91b012a@kernel.dk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9PFTxigMb0Dzg01fL4pO7DziHyOQQo2gf"
X-Mailman-Approved-At: Mon, 02 Dec 2019 06:42:38 +1100
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
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9PFTxigMb0Dzg01fL4pO7DziHyOQQo2gf
Content-Type: multipart/mixed; boundary="C9XQpoNGHYZUOjscc1yNOyFigP0yqGbZw";
 protected-headers="v1"
From: Pavel Begunkov <asml.silence@gmail.com>
To: Jens Axboe <axboe@kernel.dk>, Christophe Leroy <christophe.leroy@c-s.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Message-ID: <38cb2865-d887-d46d-94ef-4ebccff4dc60@gmail.com>
Subject: Re: Build failure on latest powerpc/merge (311ae9e159d8 io_uring: fix
 dead-hung for non-iter fixed rw)
References: <71cf82d5-5986-43b7-cf1c-acba429a89d6@c-s.fr>
 <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
 <4ef71e74-848f-59d4-6b0b-d3a3c52095a0@c-s.fr>
 <5389b43a-259d-997c-41e6-5e84a91b012a@kernel.dk>
In-Reply-To: <5389b43a-259d-997c-41e6-5e84a91b012a@kernel.dk>

--C9XQpoNGHYZUOjscc1yNOyFigP0yqGbZw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 29/11/2019 20:16, Jens Axboe wrote:
> On 11/29/19 8:14 AM, Christophe Leroy wrote:
>>>>
>>>> Reverting commit 311ae9e159d8 ("io_uring: fix dead-hung for non-iter=

>>>> fixed rw") clears the failure.
>>>>
>>>> Most likely an #include is missing.
>>>
>>> Huh weird how the build bots didn't catch that. Does the below work?
>>
>> Yes it works, thanks.
>=20
> Thanks for reporting and testing, I've queued it up with your reported
> and tested-by.
>=20
My bad, thanks for the report and fixing.

--=20
Pavel Begunkov


--C9XQpoNGHYZUOjscc1yNOyFigP0yqGbZw--

--9PFTxigMb0Dzg01fL4pO7DziHyOQQo2gf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+6JuPTjTbx479o3OWt5b1Glr+6UFAl3hXngACgkQWt5b1Glr
+6WZww//Xz8lsz3NVq/0HukBD+hfL/dmeHL1XlDu1WPpnO1tgUAm6gvGHYBxF7fL
50YY+cipbSKd2VHydGRjDnAlNxWa5bJu/vqsJSioSZnpEIMr03Hv0uLXYnFfxWW/
RY7/IaVNNljQchiBU8cA9y0TaRZdjQ15HuQcB6EQZeZi/2KKXSMHhlsrcGkJ//i6
aJTuAV3S+q24CbMLyq8Rlf82TPCxAsjkmiuI1MlD0o0/FHcwj9RRHJa53+lliFIJ
MikJUYiVjZINy63FRBW9EX+7Yul7nLcvBrJ8WbQj/naWBgfoxSLlwLnzVVk4Zsxf
RNigt4pah47x6yYXe/oPCJUT6ILlfzBr5/eH0k/8Aacyo6SAYeS3OH0wKFQGjqZj
mYkz8ye1sthtjSVZPT6WC+ELGjRa9eFTYJcNYtFcwGsoWaCd98+ubEUK/JUucPLA
DSr2CuHdNcyziW17kQ18+IUFHaRSsyft/04fiT/v23y82/S8jBmDnt7W7hi5BApS
8TcgXIn/8ClCPpmMrDfnGy8rPWqZaL0xnIFkNFxNGv+qmD8VlhLVaOB4LgXVDPMm
R/XGY8HX/7AXbJgla3hNGjo7+mFGo+y1UC+Ziu+m9DN06rfiD/D74S7cvltUWQuK
IHjK4snDRSIZX44IjtVgcOVOFqcOSVGxlyrzhe+F8BsRA2vSOFo=
=dTBF
-----END PGP SIGNATURE-----

--9PFTxigMb0Dzg01fL4pO7DziHyOQQo2gf--
