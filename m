Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C16689371F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 03:23:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MbfDLs2j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQBlP4Rpnz3dRr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 11:23:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MbfDLs2j;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQBkj31nkz3cZ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 11:23:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721352189;
	bh=kks5Td3BcJE2RSambxKy4mn/i2Umcsqm6PazM0dpxEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MbfDLs2jhrxzlosqAldNpwILIjvnNJGzd0tmsec4SXfEz1RrVrP/1XZs0EHnBBIhZ
	 vzCu7L59n4+mym/xYHGUjXIEfr+fftayKQJaCXLz1qYkv43pZh6+k1jctSjfB1c1J+
	 9OlzCjWqkniw7UJYTy/9QWPXsThK3M0OsxZTTnMzLPd/6a23yF1G+kxFaS5B86P0mN
	 6m0DBVRkmTthHkG8lbc9W2/VEeFZ9fGWcoo4E7zAUMgfXw8mYFqpH1GTONguI7po0W
	 Clji9mgEBRVUBGC83avR6OjFcsWPY/xWrLln/vTgdx+VvmtDkfaOs3m40H33UQnzfk
	 cH+ftEuIscXJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQBkj0Cgrz4wbr;
	Fri, 19 Jul 2024 11:23:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ma Ke <make24@iscas.ac.cn>
Subject: Re: [PATCH v4] cxl: Fix possible null pointer dereference in
 read_handle()
In-Reply-To: <20240716132737.1642226-1-make24@iscas.ac.cn>
References: <87y163w4n4.fsf@mail.lhotse>
 <20240716132737.1642226-1-make24@iscas.ac.cn>
Date: Fri, 19 Jul 2024 11:23:07 +1000
Message-ID: <87msmew4xw.fsf@mail.lhotse>
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
Cc: ajd@linux.ibm.com, arnd@arndb.de, make24@iscas.ac.cn, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, manoj@linux.vnet.ibm.com, imunsie@au1.ibm.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, dan.carpenter@linaro.org, clombard@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ma Ke <make24@iscas.ac.cn> writes:
>> Michael Ellerman<mpe@ellerman.id.au> wrote:
>> > In read_handle(), of_get_address() may return NULL if getting address =
and
>> > size of the node failed. When of_read_number() uses prop to handle
>> > conversions between different byte orders, it could lead to a null poi=
nter
>> > dereference. Add NULL check to fix potential issue.
>> >
>> > Found by static analysis.
>> >
>> > Cc: stable@vger.kernel.org
>> > Fixes: 14baf4d9c739 ("cxl: Add guest-specific code")
>> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>> > ---
>> > Changes in v4:
>> > - modified vulnerability description according to suggestions, making =
the=20
>> > process of static analysis of vulnerabilities clearer. No active resea=
rch=20
>> > on developer behavior.
>> > Changes in v3:
>> > - fixed up the changelog text as suggestions.
>> > Changes in v2:
>> > - added an explanation of how the potential vulnerability was discover=
ed,
>> > but not meet the description specification requirements.
>> > ---
>> >  drivers/misc/cxl/of.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
>> > index bcc005dff1c0..d8dbb3723951 100644
>> > --- a/drivers/misc/cxl/of.c
>> > +++ b/drivers/misc/cxl/of.c
>> > @@ -58,7 +58,7 @@ static int read_handle(struct device_node *np, u64 *=
handle)
>> >=20=20
>> >  	/* Get address and size of the node */
>> >  	prop =3D of_get_address(np, 0, &size, NULL);
>> > -	if (size)
>> > +	if (!prop || size)
>> >  		return -EINVAL;
>> >=20=20
>> >  	/* Helper to read a big number; size is in cells (not bytes) */
>>=20
>> If you expand the context this could just use of_property_read_reg(),
>> something like below.
>>=20
>> cheers
>>=20
>>=20
>> diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
>> index bcc005dff1c0..a184855b2a7b 100644
>> --- a/drivers/misc/cxl/of.c
>> +++ b/drivers/misc/cxl/of.c
>> @@ -53,16 +53,15 @@ static const __be64 *read_prop64_dword(const struct =
device_node *np,
>>=20=20
>>  static int read_handle(struct device_node *np, u64 *handle)
>>  {
>> -	const __be32 *prop;
>>  	u64 size;
>> +=09
>> +	if (of_property_read_reg(np, 0, handle, &size))
>> +		return -EINVAL;
>>=20=20
>> -	/* Get address and size of the node */
>> -	prop =3D of_get_address(np, 0, &size, NULL);
>> +	// Size must be zero per PAPR+ v2.13 =C2=A7 C.6.19
>>  	if (size)
>>  		return -EINVAL;
>>=20=20
>> -	/* Helper to read a big number; size is in cells (not bytes) */
>> -	*handle =3D of_read_number(prop, of_n_addr_cells(np));
>>  	return 0;
>>  }

> Thank you for discussing and guiding me on the vulnerability I submitted.=
=20
> I've carefully read through your conversation with Dan Carpenter. I'm=20
> uncertain whether to use my patch or the one you provided. Could you plea=
se
> advise on which patch would be more appropriate?=20
> Looking forward to your reply.

Your patch is OK, I'll send an ack.

If we want to refactor it to use of_property_read_reg() we can do that
in future - though this code will probably be removed in the not too
distant future anyway.

cheers
