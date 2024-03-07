Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1F68747A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 06:32:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NEIIH9Nd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tqycn1TMtz3vXY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 16:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NEIIH9Nd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tqyc307FRz3d31
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 16:32:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709789538;
	bh=p5R9DhRvAgxe1zEMFKFtSo063Y5BY/C2y17qIlHEuU0=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=NEIIH9NdPNJnfOejgAKCxcNYF5QKA/NqgJixTZvldN3DAwGWGjN2J3OHCJG3aG4cd
	 sS6eIt41P4ZTsm0bz+lnyQXqZDNgQbsr+054wIKPMYqZw4bYmb4RVn7IAhFUI2hZaE
	 S8reg1I3qx3xY0U0ljIT5BgOtmz2UOIc3Wl63UKMUF/siatCinYcmyqsz+1kiDojPX
	 qTxdALS/3Mscv6fXT8BAqCykV1TJkO+7ozjiiWi4TROolIh4rWBgJdspDGGvwocifp
	 ueJUsLBruie/8zblFv0QBxTU9lDrPf4K5A1M8Vv/J0FIRlKZB9xy1NSg6P7AhX0Jcw
	 4pGCdQ6vD7u9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tqyc25v2cz4wcK;
	Thu,  7 Mar 2024 16:32:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 3/3] macintosh/ams: Fix unused variable warning
In-Reply-To: <210b7f0e-9f1c-4f8d-8248-3d906121333a@csgroup.eu>
References: <20240306125853.3714578-1-mpe@ellerman.id.au>
 <20240306125853.3714578-3-mpe@ellerman.id.au>
 <210b7f0e-9f1c-4f8d-8248-3d906121333a@csgroup.eu>
Date: Thu, 07 Mar 2024 16:32:17 +1100
Message-ID: <87plw6obdq.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 06/03/2024 =C3=A0 13:58, Michael Ellerman a =C3=A9crit=C2=A0:
>> If both CONFIG_SENSORS_AMS_PMU and CONFIG_SENSORS_AMS_I2C are unset,
>> there is an unused variable warning in the ams driver:
>>=20
>>    drivers/macintosh/ams/ams-core.c: In function 'ams_init':
>>    drivers/macintosh/ams/ams-core.c:181:29: warning: unused variable 'np'
>>      181 |         struct device_node *np;
>>=20
>> Fix it by using IS_ENABLED() to create a block for each case, and move
>> the variable declartion in there.
>>=20
>> Probably the dependencies should be changed so that the driver can't be
>> built with both variants disabled, but that would be a larger change.
>
> Can be done easily that way I think:
>
> diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> index a0e717a986dc..fb38f684444f 100644
> --- a/drivers/macintosh/Kconfig
> +++ b/drivers/macintosh/Kconfig
> @@ -262,7 +262,7 @@ config SENSORS_AMS
>   	  will be called ams.
>
>   config SENSORS_AMS_PMU
> -	bool "PMU variant"
> +	bool "PMU variant" if SENSORS_AMS_I2C
>   	depends on SENSORS_AMS && ADB_PMU
>   	default y
>   	help

Thanks. It's a little clunky. For example if you answer no to both
prompts, it still selects SENSORS_AMS_PMU, but I guess it doesn't really
matter.

  $ make oldconfig
  ...
    Apple Motion Sensor driver (SENSORS_AMS) [N/m/y/?] (NEW) y
      PMU variant (SENSORS_AMS_PMU) [Y/n/?] (NEW) n
      I2C variant (SENSORS_AMS_I2C) [Y/n/?] (NEW) n
  #
  # configuration written to .config
  #
  make[1]: Leaving directory '/home/michael/linux/.build'
=20=20
  $ grep SENSORS_AMS .build/.config
  CONFIG_SENSORS_AMS=3Dy
  CONFIG_SENSORS_AMS_PMU=3Dy
  # CONFIG_SENSORS_AMS_I2C is not set


I'll turn to this into a patch and add your SoB?

cheers
