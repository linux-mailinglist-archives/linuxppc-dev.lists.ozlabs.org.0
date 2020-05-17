Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5091D6756
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 12:14:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Pyfd1M2vzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 20:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p00-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5300::3;
 helo=mo6-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=QOCg5ca9; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Pycy2M5fzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 20:12:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589710341;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ztd4jXWCWoi2F7GPrf4G1T8I0PshVIzQQuN09dW2kIo=;
 b=QOCg5ca95OEkDJbF7FJTZ10kv48DkDwJv+b6N1p86tYfpNYKXBUxzpC5vFa/EZ1eFl
 2gjyVXQeSkW9FnYJbIDk/Hsto+acjoq/RoJS5d4VQoPZFNYqaXzWXQT/b66XRIUe0V5s
 JFGpisMdOwhwvudk3TKiVD+VCUtOV6r7z14wgylsCrQ4W3nvw8cmFJ0EauIoQ+wKpWpX
 Foc9qEIDHWZDNxqtuU7qgMIMDPv4zxEWci52+sdZcqPVgsHqW3svJaibM2ExgEVdFPso
 WGfSsMDmyd/Ph7mtTzNx0GSnPPFZIkne7hxerfsszjLwCZLCDSCKm7vvMtymUkA3A6iR
 wdCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhVL4FLMe2AUi6Ju3crK5N6VyR5gA=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:6983:2201:31b4:7fb1]
 by smtp.strato.de (RZmta 46.6.2 AUTH) with ESMTPSA id I01247w4HACIG8s
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 17 May 2020 12:12:18 +0200 (CEST)
Subject: Re: [PATCH] powerpc/64s: Fix early_init_mmu section mismatch
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200429070247.1678172-1-npiggin@gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <0f2e656a-fcc4-588c-707d-f05bd8d889df@xenosoft.de>
Date: Sun, 17 May 2020 12:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429070247.1678172-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

This patch wasn't included in the PowerPC fixes 5.7-4. Please add it.

Thanks,
Christian


On 29 April 2020 at 09:02 am, Nicholas Piggin wrote:
> Christian reports:
>
>    MODPOST vmlinux.o
>    WARNING: modpost: vmlinux.o(.text.unlikely+0x1a0): Section mismatch in
>    reference from the function .early_init_mmu() to the function
>    .init.text:.radix__early_init_mmu()
>    The function .early_init_mmu() references
>    the function __init .radix__early_init_mmu().
>    This is often because .early_init_mmu lacks a __init
>    annotation or the annotation of .radix__early_init_mmu is wrong.
>
>    WARNING: modpost: vmlinux.o(.text.unlikely+0x1ac): Section mismatch in
>    reference from the function .early_init_mmu() to the function
>    .init.text:.hash__early_init_mmu()
>    The function .early_init_mmu() references
>    the function __init .hash__early_init_mmu().
>    This is often because .early_init_mmu lacks a __init
>    annotation or the annotation of .hash__early_init_mmu is wrong.
>
> The compiler is uninlining early_init_mmu and not putting it in an init
> section because there is no annotation. Add it.
>
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index bb3deb76c951..3ffe5f967483 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -208,7 +208,7 @@ void hash__early_init_devtree(void);
>   void radix__early_init_devtree(void);
>   extern void hash__early_init_mmu(void);
>   extern void radix__early_init_mmu(void);
> -static inline void early_init_mmu(void)
> +static inline void __init early_init_mmu(void)
>   {
>   	if (radix_enabled())
>   		return radix__early_init_mmu();

