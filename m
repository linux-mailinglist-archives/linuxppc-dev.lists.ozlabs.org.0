Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA07A0323
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:59:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O/h09s6G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmbT31snPz3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 21:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O/h09s6G;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmbS83pn7z2yVg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 21:58:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694692696;
	bh=aR6fTCLyqhpJ6CEcONiB2y5I3vOXAke0CMC6NhPXkeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O/h09s6GFF9nHczPeQ67AdtmqzBhU+frGsT0ouLjV8HfR/7xwhP+gO33oBha3L4bD
	 ADkt1g18WAvAAT0Y/SRsKL0A2rJy4bYb5cVpj14YsQbj47Yw/JBTB2k/9I9PL01Zxt
	 lo91vDlMc6mFV1+fT56vL+8d1RtGqYvUk2Bvf8Y919BaP/qFfwIGnLG+GywIr2zcC6
	 /+eg8+TXlgo8zli2OEpKdI9VRWW7RB5jWLT+aFdThrw88+JwYBKMXy1JWO3zVH/ldE
	 tKhS84aTCeeWOKPTcFk0rQF077KOfR9C/v3+LJZiRmetVr6id6SnTpmgEwDzPkWIml
	 h0jjnsLFVMscA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RmbS70gXPz4wxR;
	Thu, 14 Sep 2023 21:58:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
In-Reply-To: <20230914103400.GX8826@kitsune.suse.cz>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
 <20230913185951.GA3643621@dev-arch.thelio-3990X>
 <877cot8k9f.fsf@mail.lhotse> <20230914103400.GX8826@kitsune.suse.cz>
Date: Thu, 14 Sep 2023 21:58:09 +1000
Message-ID: <874jjx7yr2.fsf@mail.lhotse>
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, Nathan Chancellor <nathan@kernel.org>, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> On Thu, Sep 14, 2023 at 02:13:32PM +1000, Michael Ellerman wrote:
>> Nathan Chancellor <nathan@kernel.org> writes:
>> > Hi Greg,
>> >
>> > On Fri, Sep 08, 2023 at 10:30:56AM -0500, gjoyce@linux.vnet.ibm.com wr=
ote:
>> >> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>> >>
>> >> Define operations for SED Opal to read/write keys
>> >> from POWER LPAR Platform KeyStore(PLPKS). This allows
>> >> non-volatile storage of SED Opal keys.
>> >>
>> >> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>> >> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
>> >> Reviewed-by: Hannes Reinecke <hare@suse.de>
>> >
>> > After this change in -next as commit 9f2c7411ada9 ("powerpc/pseries:
>> > PLPKS SED Opal keystore support"), I see the following crash when
>> > booting some distribution configurations, such as OpenSUSE's [1] (the
>> > rootfs is available at [2] if necessary):
>>=20
>> Thanks for testing Nathan.
>>=20
>> The code needs to check plpks_is_available() somewhere, before calling
>> the plpks routines.
>
> would this fixup do it?
>
> I don't really see any other place to plug the check with the current
> code structure.
=20
I think the plpks_sed code should call plpks_is_available() once at init
time and cache the result.

Otherwise it's will be doing an extra hcall (in _plpks_get_config()) for
every call, which would be wasteful.=20

cheers

> diff --git a/arch/powerpc/platforms/pseries/plpks_sed_ops.c b/arch/powerp=
c/platforms/pseries/plpks_sed_ops.c
> index c1d08075e850..f8038d998eae 100644
> --- a/arch/powerpc/platforms/pseries/plpks_sed_ops.c
> +++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
> @@ -64,6 +64,9 @@ int sed_read_key(char *keyname, char *key, u_int *keyle=
n)
>  	int ret;
>  	u_int len;
>=20=20
> +	if (!plpks_is_available())
> +		return -ENODEV;
> +
>  	plpks_init_var(&var, keyname);
>  	var.data =3D (u8 *)&data;
>  	var.datalen =3D sizeof(data);
> @@ -89,6 +92,9 @@ int sed_write_key(char *keyname, char *key, u_int keyle=
n)
>  	struct plpks_sed_object_data data;
>  	struct plpks_var_name vname;
>=20=20
> +	if (!plpks_is_available())
> +		return -ENODEV;
> +
>  	plpks_init_var(&var, keyname);
>=20=20
>  	var.datalen =3D sizeof(struct plpks_sed_object_data);
> --=20
> 2.41.0
