Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC0710E20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 16:19:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRqtC2yY9z3fGk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 00:18:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BF3NRz1W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRqsK4Q6Tz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 00:18:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BF3NRz1W;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRqsH484zz4wgq;
	Fri, 26 May 2023 00:18:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685024291;
	bh=eeBn6dIr+oE4gdD75FbHX3pTuqj/v0HbGPnYdSo0at8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BF3NRz1WqptcQrrXR570k8rdHphoD+BOJV2QCfNCi9smwNPj51FzlHeXvg3bmlHxS
	 TOIyXj3ajwShy+ME20au30sIYBnkZMao8lDP7e7vHG21+C2km3QvlWvmi7nl8hnPP2
	 GNKOWj2a3ZcVvexMtvpAPIe87bncrgGCmz7Pdl5L7PeMrBnT2YYlxtT+pQRCPHHqNY
	 DnENObEXw+qM3DWuF1p13IOCgTgSxPedMkbh+i9JnyLoXBayQKZVYT27YlQymjjBWe
	 z/KxDKsH60vbAVcz/ZVUXrYazBYzRBPDTZFSojWiJB5hr5bccUhBHhD/fjtIoBJkIG
	 WJNkBYMwQmitA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] powerpc/crypto: Fix aes-gcm-p10 build when VSX=n
In-Reply-To: <CACPK8XdNMBm6D-EQU0BGfxrtzbXLJaLeqzUXDMDb3eAe-T4Bxg@mail.gmail.com>
References: <20230515124731.122962-1-mpe@ellerman.id.au>
 <CACPK8XdNMBm6D-EQU0BGfxrtzbXLJaLeqzUXDMDb3eAe-T4Bxg@mail.gmail.com>
Date: Fri, 26 May 2023 00:18:07 +1000
Message-ID: <87cz2otrz4.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, dtsen@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> On Mon, 15 May 2023 at 12:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> When VSX is disabled, eg. microwatt_defconfig, the build fails with:
>>
>>   In function =E2=80=98enable_kernel_vsx=E2=80=99,
>>       inlined from =E2=80=98vsx_begin=E2=80=99 at arch/powerpc/crypto/ae=
s-gcm-p10-glue.c:68:2,
>>       inlined from =E2=80=98p10_aes_gcm_crypt.constprop=E2=80=99 at arch=
/powerpc/crypto/aes-gcm-p10-glue.c:244:2:
>>   ...
>>   arch/powerpc/include/asm/switch_to.h:86:9: note: in expansion of macro=
 =E2=80=98BUILD_BUG=E2=80=99
>>      86 |         BUILD_BUG();
>>         |         ^~~~~~~~~
>>
>> Fix it by making the p10-aes-gcm code depend on VSX.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>> ---
>>  arch/powerpc/crypto/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
>> index 7113f9355165..ad1872518992 100644
>> --- a/arch/powerpc/crypto/Kconfig
>> +++ b/arch/powerpc/crypto/Kconfig
>> @@ -96,7 +96,7 @@ config CRYPTO_AES_PPC_SPE
>>
>>  config CRYPTO_AES_GCM_P10
>>         tristate "Stitched AES/GCM acceleration support on P10 or later =
CPU (PPC)"
>> -       depends on PPC64 && CPU_LITTLE_ENDIAN
>> +       depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
>
> VSX depends on PPC_BOOK3S_64 but I guess there's no harm in keeping
> the PPC64 here?

I guess it's somewhat redundant. But also harmless, and possibly clearer
for folks who don't have the ingrained knowledge that VSX is 64-bit
Book3S only. So yeah I think I'll leave it as-is.

cheers
