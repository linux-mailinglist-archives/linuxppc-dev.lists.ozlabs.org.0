Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC93376D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 16:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxCLX0Tmkz3dFX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 02:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CWAlQimV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CWAlQimV; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxCL26WQTz30Gk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 02:19:52 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id
 a10-20020a4aae4a0000b02901b5e4460160so758066oon.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 07:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=/piWRglIJAAaHxC5K9ZPKIvvXUDdsYSqAMgqNZKw/jQ=;
 b=CWAlQimVEi4aZHlMgv+kboxx4U4Qxd+3nLBLA7lVUTXXqbCXPv+2sTIpT7N+dbMm+c
 W1i3lSTVohCI5ds6emYnZqLa1nW3wvqGEAzTsRr3E9eHsh1egJkCKa3Sr/p8lnHyByYU
 VcCJHb1oQEAJh83uvzXc/KNkni0JdYdRkLSCHdlzzPLlvUuL+6GLq0Mk1KuY2Rhu1qrP
 9H26F0OPxNTreB5P7U80LmtnWuxbEHigQJoyq68jHjZ8AxE6H1odfeiDiVDuS/YogEhK
 CiylyMLrqOR9zZ/Yk1DooPNgB1tkRWB/AwLJJAT3Zm3d4Z60nFPU3WQcU8Dc2oZOiqt+
 GdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=/piWRglIJAAaHxC5K9ZPKIvvXUDdsYSqAMgqNZKw/jQ=;
 b=clt7VsYkvjRLBtqQNYPzeY2H2n+QukdEAn4YJb2mS3BXx9LUrL6zGYK5KxnLjOhAey
 ADRb5us4PBELwrPNv1+MuwfORv5asId6arXsWceYDZIeG07mAVWwkdmhQNrQ5d/2id84
 JISpDw1yS3Vat7FbNgefjXebuKIHfkb4N4rLx4rLK2c+lIXZ36WRxGiZ6jvSLWbFuNet
 Auvu3gbOfZ0qSDrsK1CnT402oBJCMPRhsY7GO1mLPPjMAFgEx5J8UhuoMPbIyJbdG0Aa
 Y6h6MVX565Q8NsfklJPe0btveUP1Q9jzuX4TKMnpICduOylUqAGbIDM6Qw71fLeeXJwx
 j3AA==
X-Gm-Message-State: AOAM530VLYozeshHa6ewHP8yjI7DOfrX3r64sHsgc+taDWu3qF/k8cqy
 JSuOvz0BfaWok1qzHpFKtKuL8zg4Ggc=
X-Google-Smtp-Source: ABdhPJyVwzcnA6Hzn62Jx7Yc1skAYwfZGFku3JK4XU94sP3VQm3rplxIZPSHN9EVtv/PB/dZkyeYYQ==
X-Received: by 2002:a4a:ea94:: with SMTP id r20mr7048645ooh.43.1615475988716; 
 Thu, 11 Mar 2021 07:19:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p3sm693944otk.9.2021.03.11.07.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:19:47 -0800 (PST)
Subject: Re: Errant readings on LM81 with T2080 SoC
To: Wolfram Sang <wsa@kernel.org>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
 <1aa0dc23-0706-5902-2f46-0767de0e3ad6@alliedtelesis.co.nz>
 <d5045879-45aa-db38-e6aa-4c8ea3e62f6c@roeck-us.net>
 <b41a802b-2833-13fb-58ad-1762a3507460@alliedtelesis.co.nz>
 <d37a114c-fa3f-40e8-4d85-52eb1ff03c37@roeck-us.net>
 <20210311081842.GA1070@ninjato>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <cafd05ea-088e-c7c8-41f6-beafaa943453@roeck-us.net>
Date: Thu, 11 Mar 2021 07:19:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210311081842.GA1070@ninjato>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="y5JVUJFBvApYWP5Nc2ztCVBdGvK5SakF4"
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--y5JVUJFBvApYWP5Nc2ztCVBdGvK5SakF4
Content-Type: multipart/mixed; boundary="92jJKb1m8tP1DTc8WK4dmwfKHDeWxK3MH"

--92jJKb1m8tP1DTc8WK4dmwfKHDeWxK3MH
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/11/21 12:18 AM, Wolfram Sang wrote:
>=20
>> Bummer. What is really weird is that you see clock stretching under
>> CPU load. Normally clock stretching is triggered by the device, not
>> by the host.
>=20
> One example: Some hosts need an interrupt per byte to know if they
> should send ACK or NACK. If that interrupt is delayed, they stretch the=

> clock.
>=20

Indeed, the i2c-mpc driver sends TXAK (only) after receiving
that interrupt. Since that is running in the context of the user
process, that may well be delayed substantially on a loaded system.

Maybe the interrupt handler will need to play a more active role
in the i2c-mpc driver. Alternatively, the transfer function could
be handled by a high priority kernel thread.

Guenter


--92jJKb1m8tP1DTc8WK4dmwfKHDeWxK3MH--

--y5JVUJFBvApYWP5Nc2ztCVBdGvK5SakF4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAmBKNREACgkQyx8mb86f
mYGvtA/9HeYGnwSG9taI4rA/EX8gnzN3Q5r6OiEWdBybij2Z0nqA6m5tcvRuTbN6
Df+9IT27KoQIVLV4iyenfJ0mNPvJiGBMrqdtXWOhhlh+lt4fVAB6RvGHohaYeLio
F/MXQjvDJczgBRnRpsgCL/Yn435n+D4gTP6bR/tql3eHr2Igcj+E3+KqtCFhsFMn
awLrAsJcKnpu2HEewb8ISoPwzhvLyg2Hk9NUnDVPguJuPNRYeh1j72avH4W5sAH0
Jvtudqh+ziZHOZNXzbeXQxij+4yz3jSWy9kjufd8cJYLbYdpI1q3q/+jHwqHx3z+
2jbAKz5fVFHAfuURVM0pdAj841Q+8W30jtnx6ugWa18wtVQTVLSE6dfNtj1ayqUM
3O3WLnnjlaBj/354c19ghEA09qc962b7LtptHTWybTqzpvnBUQ7kdMtGxR9B5L6n
zlY/pOVgYrfdD5rPOQ9j1dU/XpuQG+ApCE7o4fQg0EVLdZ+BCv2HmBWcMBFoXu+q
DUja07O/JQft1Ucx+yOgvupJWI1ix2X3dh3K+UY8y3vJSqDnPihO0DUEtPXga4WX
kOgnH7DO0vlJtlq5oVrepoUKt3epnh41FNBj05lRlv27HREH2h3+riUH+7eof++P
FWt3SE8oVxcJx3BfWaXL7Or5vZFHTH7b3N9NXgZYO1JQQ+hERhA=
=HdHX
-----END PGP SIGNATURE-----

--y5JVUJFBvApYWP5Nc2ztCVBdGvK5SakF4--
