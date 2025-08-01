Return-Path: <linuxppc-dev+bounces-10497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B76B17C39
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 06:47:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btYNT2NfZz2y82;
	Fri,  1 Aug 2025 14:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754023673;
	cv=none; b=CC54gk9ChZ8uNKk4apSL8qoGS/F5HjcifWg1J76A7udb3nuO1NP9fcCLlyToU7H4ZkZDL4ne6CS+kUIre0cTf0a8LwntYuTkjCweDqIUMFcVMXpFWuogsZi0FAsVSdFu4CLs/tghm+bDg2835hPnYY1o+7G+IUOP4vuK3ctnebhzQs1PsZfFKqMf3h5TrdmUPlXb0wqvFEDHwX0vKxluWmlZvyUvcj3yJ8Sbs62+AWjGPYjmUY91AnzJIUpcAOgl8XDu5gCTgQDTrVuLO/r4PtkvbG1MCe3vFcLVaTVG7ECE55OgpV4TWhk2qI7da7GmLqodh9ZaIrZkI/q8Gnv7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754023673; c=relaxed/relaxed;
	bh=Oakc8RjBnSb2ZFTfLguqQX0dhF0bdPjzhlkFrUgTBVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L225lCyFjQXcBkjhsQR8DReyvy4/aPBL1PtK2rPy0AenTQvu8203nexlzn8NuChTXc0W3awNRpfuGtc4+e5WCR7qUWGuTZUtByq8Y+ytPOVWI+ZPPtjMGMWevK8MnEZSVSNqDy4/NyHbPFwn242edgQ6LIj2grI9k56vTbWQtBbgfLuK4DvXtRJ4Dv51Zssp0gna3dv5fPNu8ojoPtXZGZ37g7MeDow+K7FN9zzLj30Ld4VeKNDwIUo0t21/ZqknAiqg0mGa+4aL8up+i6L4p3xv+udopcjdZ8A6vfiEaBWilzF+1k2aoExocI2HNalqlt9mzWhnOekS+xYjlLEcPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U3vTfSVf; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U3vTfSVf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btYNS16znz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 14:47:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6711845596;
	Fri,  1 Aug 2025 04:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAEAC4CEE7;
	Fri,  1 Aug 2025 04:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754023669;
	bh=Z6GuhGLpQlEJDbFdROmqYuJfyRyqqJhwKdI3KHUcOEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U3vTfSVfkvNFoP4SiyFFIhwhrGxu3g35ESb1EOxoAn42EqYCBuLyMCj0McN3sdJ0w
	 aE34QDYUDD2JOl+vpadEqhPELX+AiazQ1keGvpxugJQ6GlG5HPDFTvsT/fImtSpxDS
	 Cb1c40EDYl7vGbqmMjHbgiZjQ+5aUJhSH4zEz9cXaRU7YXbAhSzhyblv5gxlHIysRv
	 vpuOZ1VPxpcS+28EjzLIi6jKnMNbOXsYbYE2N72nQ9EDRXswzEngp51kL1TLrn+GuK
	 qsvzDGsivVjkN4RScJGvI6bKFlFILlOLNW8O73Lolxtbjb0DTlLpvIueQhe/BblodJ
	 RSWQU4mC4E+xg==
Message-ID: <9fffb5be-eced-4207-86fc-8939de1ab16e@kernel.org>
Date: Fri, 1 Aug 2025 06:47:46 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] tty: vt: use _IO() to define ioctl numbers
To: Nicolas Pitre <nico@fluxnic.net>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: gregkh@linuxfoundation.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-8-jirislaby@kernel.org>
 <97ec2636-915a-498c-903b-d66957420d21@csgroup.eu>
 <3ac7427b-4f17-480e-99ae-f00e5c00e678@csgroup.eu>
 <9811012p-4q9q-284q-n2qr-7597s16p8sq5@syhkavp.arg>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <9811012p-4q9q-284q-n2qr-7597s16p8sq5@syhkavp.arg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 31. 07. 25, 22:58, Nicolas Pitre wrote:
> On Thu, 31 Jul 2025, Christophe Leroy wrote:
> 
>>
>>
>> Le 31/07/2025 à 16:35, Christophe Leroy a écrit :
>>> Hi Jiri,
>>>
>>> Le 11/06/2025 à 12:02, Jiri Slaby (SUSE) a écrit :
>>>> _IO*() is the proper way of defining ioctl numbers. All these vt numbers
>>>> were synthetically built up the same way the _IO() macro does.
>>>>
>>>> So instead of implicit hex numbers, use _IO() properly.
>>>>
>>>> To not change the pre-existing numbers, use only _IO() (and not _IOR()
>>>> or _IOW()). The latter would change the numbers indeed.
>>>
>>> On powerpc your assumption is wrong, because _IOC_NONE is not 0:
>>>
>>> $ git grep _IOC_NONE arch/powerpc/
>>> arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE 1U
>>>
>>> Therefore the value changes even with _IO(), leading to failure of Xorg as
>>> reported by Christian.
>>>
>>
>> And is likely an issue on the 4 following architectures:
>>
>> $ git grep _IOC_NONE arch/ | grep 1U
>> arch/alpha/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
>> arch/mips/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
>> arch/powerpc/include/uapi/asm/ioctl.h:#define _IOC_NONE	1U
>> arch/sparc/include/uapi/asm/ioctl.h:#define _IOC_NONE        1U
> 
> IMHO this one patch could simply be reverted and the "old" code let be.

Oh, right -- it's easy to revert (no conflicts).

We could use _IOC(0, 'V', number, 0) directly, but I am not sure, that's 
worth it.

thanks,
-- 
js
suse labs

