Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB278D4C0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 14:52:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V+X/jXKu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqmPF2NlKz3cZq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 22:52:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V+X/jXKu;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqmNY1q8Lz3cVt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 22:51:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717073517;
	bh=nbpfdIkBoH4ag3VRmmnhOBkhh97JDa0cmnf8dyt1Ebc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=V+X/jXKuNB5khu+w3zhoYa9uXNCiwVZ1oGrrcsrrbLlpQD9n2ANEevqE20KmFCvRa
	 t3pQXrBr9MvM8TmVYPzgbY9boaQ6zH9kmlgJFEEYFsw7HRYKzTS/Smz3wJ4KHVysBk
	 oZB/NT2M2lyvS4Zcs3o+m0KJchtY3tJSMlIq5lWBaIZAO2iP+Ledss9r+/czolf2HI
	 w/EnoRkDboJc8noG6FjE6RoyOyVbgcEfqleglP2WRi6+f6eUix2bdeDNB2XrkIKVsA
	 /e2MaMnfIyZw/cxm9NAhafSDBO/SSFKf1hWcQekSyiMUe4qi/lJn/JPAyaptQOmIzk
	 CKyqKxvWIUlFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VqmNY21yWz4x1C;
	Thu, 30 May 2024 22:51:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
In-Reply-To: <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
Date: Thu, 30 May 2024 22:51:56 +1000
Message-ID: <87zfs731jn.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> On 28.05.24 22:00, Christian Zigotzky wrote:
>> Hi All,
>>
>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
>> with the VirtIO GPU and with some Radeon cards.
>>
>> Another error message: Failed to start Setup Virtual Console.
>>
>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>
>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>>
>> Could you please test Xorg on your PowerPC machines?
>>
>> Thanks,
>> Christian
> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
>
> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
> Inappropriate ioctl for device.

That is presumably because of this:
  https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/

cheers
