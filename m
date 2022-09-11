Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777C55B4E9C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 13:56:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQSrD3RHgz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 21:56:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=kRNRfHJl;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=Phn8NHzC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.wdc.com (client-ip=216.71.153.144; helo=esa5.hgst.iphmx.com; envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=kRNRfHJl;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=Phn8NHzC;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Sun, 11 Sep 2022 21:56:04 AEST
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQSqS2vThz2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 21:56:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1662897363; x=1694433363;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nEn8hKjiKoJTls+Eq+dMQFIVcEgOZT1PN3pCw0YzqBA=;
  b=kRNRfHJl01YUZ+QgVpgz9BXMMVGJmDq+R8Fjr4LJxDWCZtlbZuiT2o48
   uvWcbDvrQwnUb84ToXD8lFgs3YTSbf7UD966aDgjF41p8w+8mZtV/wCeJ
   Uo6QD5MsDbawsZWSme8LGv7BiQL/bq8UV3P1obxd7N+88DifyGRgBkBZQ
   0cN0TnKlfsDwkGJJ/jl/A6vOhNXRJppAoTQAq31LdChbAOPAJelHn2jck
   vUpnQIvO2/0BxAgsYj+lDbJJhWbJLRZUd06nvHmO2CKNvq5lp4cgF+jJr
   SJxQlqN5OeAKXlnZs1Yl+19+F4nhbVVoYE7QGVosylLHi9CkST6j68+ls
   w==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; 
   d="scan'208";a="211048245"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 19:54:52 +0800
IronPort-SDR: hA6L1UYDiS9a/vbK5MSnn2RfbqV41/eu0Kj5D+ZWul4lRuKHk1ptr/zf8hfxR09u9cMX+WovQF
 DgLoI7pXfczdcOwtpHLu5CHLrEhRonfeJfrUGKuds1FqAy3U/fJ4mCrkKxiTd6HqoGbQ6LpJHy
 9ze/VinoRztsIvPfiXql0VwqvAhTqMK9DpG0ufHDV1ngBdzXP42Ax+x8w7p9rDSU8LN22JBQEq
 e5oHX8yAvjzV8TdvwGyk4Ls/F+QxLWpv0li0deo06Dh3iQ8Qy4kouyS5jooUPQesPDE2SLM3Cm
 tdV4WJAFjH8eNq9baIR7Wmnl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2022 04:15:09 -0700
IronPort-SDR: PlTAipSITDAT4jx3iFLCFNsEiVqt3thcTjTF2HwP2PCOlXZDOvgGNOCJGvnetuG/IIfSwarn7K
 aUiuuRiqzVhX+CN7YiTnfzs3J63BnOG/V+aMhKeAofaQ/18bKwLMNJYmQDjfIWSO8goQR6uVbU
 pwjVANVgHQkX6hKqD7qpdKI3o4UsWtUGgbu5DavZ84tTN9K7zZ9J4EfOBSQx8G9fzr/OTrt1GI
 0ewBHV0+hA524munmvBHvCPyVpTBoJq6qBG7gIzSyXKwxL9q2tvN4Pf2RGJzxkW6Uoi5fgQQo0
 cI4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2022 04:54:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQSp44fpSz1RwtC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 04:54:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:content-language:references:to
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1662897292; x=1665489293; bh=nEn8hKjiKoJTls+Eq+dMQFIVcEgOZT1PN3p
	Cw0YzqBA=; b=Phn8NHzCVfC888VMss519H6IwE3DTWbgDyXVEF31yHEEC+V89Vy
	z81rsp9YwkUEa5nTv4Mh0d27glMQIOVnN+9pIo5D0YCgyGFZwtdpj+isyBnfm081
	oaElCELBKb4chgdmhSWuoN2/dg+0LNBpNywHx33jW9h5atJSRG4eZ8KezufVOx8B
	5XXWz/drbpS38IKLF1N9Ph5OnkdEBgu8oGkO91AI1rrJl2/8esRLchGdVrQ29/a7
	mgAH3eR33hd2LV6td64dH7bH13gzFrglpumHzrQ2i543naPiyabu+Fy2f/FQALn0
	r59rtgodlZ+nSD0+qPXadz0g8Y1XruC66qQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TvmlmVh4n0JU for <linuxppc-dev@lists.ozlabs.org>;
	Sun, 11 Sep 2022 04:54:52 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQSp04Wlsz1RvLy;
	Sun, 11 Sep 2022 04:54:48 -0700 (PDT)
Message-ID: <0ad5f339-de31-2849-34a1-928ae65cc696@opensource.wdc.com>
Date: Sun, 11 Sep 2022 20:54:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v2] powerpc: select HAVE_PATA_PLATFORM in PPC instead of
 creating a PPC dependency
To: Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>
References: <20220909090343.21886-1-lukas.bulwahn@gmail.com>
 <21359abe-c3c9-4aa8-8ebf-75ff64cb1935@www.fastmail.com>
 <2379456e-4f18-d619-10bf-022327de0463@csgroup.eu>
 <4b33bffc-2b6d-46b4-9f1d-d18e55975a5a@www.fastmail.com>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <4b33bffc-2b6d-46b4-9f1d-d18e55975a5a@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/09/09 20:31, Arnd Bergmann wrote:
> On Fri, Sep 9, 2022, at 1:19 PM, Christophe Leroy wrote:
>> Le 09/09/2022 =C3=A0 13:09, Arnd Bergmann a =C3=A9crit=C2=A0:
>>> On Fri, Sep 9, 2022, at 11:03 AM, Lukas Bulwahn wrote:
>>>
>>> I don't see a single powerpc machine that creates a
>>>   name=3D"pata_platform" platform_device. I suspect this was
>>> only needed bwfore 2007 commit 9cd55be4d223 ("[POWERPC] pasemi:
>>> Move electra-ide to pata_of_platform"), so the "|| PPC"
>>> bit should just get removed without adding the HAVE_PATA_PLATFORM
>>> bit.
>>
>> But that was added in 2008 by commit 61f7162117d4 ("libata:=20
>> pata_of_platform: OF-Platform PATA device driver")
>=20
> Ah, I see. In that case, I think we should probably just always
> allow PATA_OF_PLATFORM to be enabled regardless of
> HAVE_PATA_PLATFORM, something like
>=20
> diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
> index 1c9f4fb2595d..c93d97455744 100644
> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -1102,8 +1102,7 @@ config PATA_PCMCIA
>  	  If unsure, say N.
> =20
>  config PATA_PLATFORM
> -	tristate "Generic platform device PATA support"
> -	depends on EXPERT || PPC || HAVE_PATA_PLATFORM
> +	tristate "Generic platform device PATA support" if EXPERT || HAVE_PAT=
A_PLATFORM

Shouldn't this be:

	tristate "Generic platform device PATA support" if EXPERT || PPC

?

And while at it, it would be nice to add "|| COMPILE_TEST" too.

>  	help
>  	  This option enables support for generic directly connected ATA
>  	  devices commonly found on embedded systems.
> @@ -1112,7 +1111,8 @@ config PATA_PLATFORM
> =20
>  config PATA_OF_PLATFORM
>  	tristate "OpenFirmware platform device PATA support"
> -	depends on PATA_PLATFORM && OF
> +	depends on OF
> +	select PATA_PLATFORM
>  	help
>  	  This option enables support for generic directly connected ATA
>  	  devices commonly found on embedded systems with OpenFirmware
>=20
> and then also drop the "select HAVE_PATA_PLATFORM" from
> arm64 and arm/versatile.
>=20
> Or we can go one step further, and either split out the
> 'pata_platform_driver' into a separate file from
> '__pata_platform_probe', or merge pata_of_platform.c
> back into pata_platform.c.
>=20
>       Arnd

--=20
Damien Le Moal
Western Digital Research

