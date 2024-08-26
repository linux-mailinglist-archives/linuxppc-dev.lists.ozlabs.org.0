Return-Path: <linuxppc-dev+bounces-489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6A95E693
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 04:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsYqD17B3z2xs7;
	Mon, 26 Aug 2024 12:03:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724637784;
	cv=none; b=cy17YeKTzVo8iUPhUvNwlMRBue2yFpbDPKo/BCqAmlyOmF2adQxlg0c4qO1J8TX7yEcc5VNvsR9RDNM53J8HpD/h+iJrsyFoEIyty2JfTRhyLiB8XM1x0P2UVHHnOKODSqT+QzdtXfke47/aW4dZlRgV2DkEWsQsk8i36e0Qv5J9RLzTfLSqMl322ZR5w1f4JHAYgHaxJpyQipGolqEn8RHDLo0w+s3FO3lm0cs4VcOcvuWcvGqS+z1Q000iMvImhJm5MnwM6RgSg6FG7m6RuQ6clF6F435UHDSQi00QKRmWdRPoB3O5Lcc1HkV4RRbOEW6h3r0QtTzQyubG+qV0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724637784; c=relaxed/relaxed;
	bh=dZljPhuAr0mbkeN13uZvN48XWKzlLsshYIWJUncVcO0=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=TxVgl7ZO4KBlrusu4rFJeqG41wDqqm8CnRrW/y+2XNx468frhA1ECb1x+xw8Hw5vRGkceXukn9MRVGH8mBHUhsEjpdywyE1Z63j4wKnom6ZLGhQwkZpgMhUwgIkQo2C4nVP0ac1UPCtYkX9GlTUXp0EypgudwHgqPMeoaL2T3d1DFz8hSbdbBzHx1K1FF78MXol9B6/95e341NxSsPc1T4MnWfTR3fqbqhZxkZWSMn4+XmM5MdDjp0P6POiL/qdppG9ZXTNO/GwAOPll27kmQZjpanZFi8PRmS8ZaakevnjFWaAjiFM/0nU9tKjOlD/3O99OEp52toBQRcE/Z09cZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHGPtgj3; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VHGPtgj3;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsYqB3QPwz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 12:03:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724637782;
	bh=dZljPhuAr0mbkeN13uZvN48XWKzlLsshYIWJUncVcO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VHGPtgj3ZZH12Ev7NLX3TF4pSlkYdY9+3Nos8qj7Ugrk3Qd7UBTWOtWCw67MgXYWv
	 Qf2bSQC2kE+6RnAmHrsiymxESd/vrerKgDKnxQbFnzMGj9QoZhKM4BG813fBkW7/oy
	 z6/RR90YfTlKCPEcpUglj1BtK76nlsKyI9rwR+9dNJFdSKB9WERcPawXYYaYWesu3G
	 qO2lMQfKPcsW0jJphnqBQ0sQ9kXdFOOxx2o6xJ+jdhIoe3PL2bPg8u7lSQ8ia2DLv4
	 1IKHQh9Xc0kwVaDtqJFt7AUOf/uVLWHWmUo277slyXLTsvcl221QRZpYtO03eTe8IU
	 rQ67+TcLWw9cw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsYq848z1z4wbR;
	Mon, 26 Aug 2024 12:02:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Vasilevsky
 <dave@vasilevsky.ca>
Cc: glaubitz@physik.fu-berlin.de, bhe@redhat.com,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Reimar
 =?utf-8?Q?D=C3=B6ffinger?=
 <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
In-Reply-To: <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
Date: Mon, 26 Aug 2024 12:02:59 +1000
Message-ID: <87frqsghws.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Hi Dave,
>
> On Fri, Aug 23, 2024 at 2:54=E2=80=AFPM Dave Vasilevsky <dave@vasilevsky.=
ca> wrote:
>> Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
>> Open Firmware. On these machines, the kernel refuses to boot
>> from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.
>>
>> Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
>> default to off for them. Users booting via some other mechanism
>> can still turn it on explicitly.
>>
>> Also defaults to CRASH_DUMP=3Dn on sh.
>>
>> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
>> Reported-by: Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
>> Closes: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
>> Fixes: 75bc255a7444 ("crash: clean up kdump related config items")
>
> Thanks for your patch!
>
>> --- a/kernel/Kconfig.kexec
>> +++ b/kernel/Kconfig.kexec
>> @@ -97,7 +97,7 @@ config KEXEC_JUMP
>>
>>  config CRASH_DUMP
>>         bool "kernel crash dumps"
>> -       default y
>> +       default ARCH_DEFAULT_CRASH_DUMP
>>         depends on ARCH_SUPPORTS_CRASH_DUMP
>>         depends on KEXEC_CORE
>>         select VMCORE_INFO
>
> IMHO CRASH_DUMP should just default to n, like most kernel options, as
> it enables non-trivial extra functionality: the kernel source tree has
> more than 100 locations that check if CONFIG_CRASH_DUMP is enabled.
>
> Letting it default to enabled also conflicts with the spirit of the
> help text for the symbol:
>
>           Generate crash dump after being started by kexec.
>           This should be normally only set in special crash dump kernels
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           which are loaded in the main kernel with kexec-tools into
>           a specially reserved region and then later executed after
>           a crash by kdump/kexec. The crash dump kernel must be compiled
>           to a memory address not used by the main kernel or BIOS using
>           PHYSICAL_START, or it must be built as a relocatable image
>           (CONFIG_RELOCATABLE=3Dy).
>           For more details see Documentation/admin-guide/kdump/kdump.rst
>
>           For s390, this option also enables zfcpdump.
>           See also <file:Documentation/arch/s390/zfcpdump.rst>
>
> What is so special about CRASH_DUMP, that it should be enabled by
> default?
=20
The reality is that essentially all distros enable it. Because they
don't want to manage separate kernel / crash-kernel packages.

So IMHO having it enabled by default in upstream does make sense,
because it more closely matches what distros/users actually run.

cheers

