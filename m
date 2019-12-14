Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 429BA11F0BD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 08:32:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZfPL5JNczDr3Z
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 18:32:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QKTuuexY"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZfMK05pRzDr2j
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 18:30:18 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47ZfM828F5z9v4kg;
 Sat, 14 Dec 2019 08:30:12 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QKTuuexY; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rXUFt3zZMGyh; Sat, 14 Dec 2019 08:30:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47ZfM813fFz9v4kF;
 Sat, 14 Dec 2019 08:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576308612; bh=jJtG71JXNYzYDF4z7ntC3bwNQLarVarmUswHWhluOuQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QKTuuexYKKEPVIL8i2FVj9ntngPsKl2SiB7u/7pALV0PsyXDg/Aea96V+3KDifu1Y
 mslw9qUfpy3D4X6gNwmrP2n8zKN6Y2GPjsXcghjD65vUZkYbppmnD0JQKozphLtqSx
 LgOdj0j4PXqcDBaUN6qFU0nqsjPcXZIVjMUMutVo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C4908B788;
 Sat, 14 Dec 2019 08:30:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eEW_ZV8vhUP2; Sat, 14 Dec 2019 08:30:12 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 228048B755;
 Sat, 14 Dec 2019 08:30:12 +0100 (CET)
Subject: Re: [PATCH] powerpc/devicetrees: Change 'gpios' to 'cs-gpios' on
 fsl,spi nodes
To: Rob Herring <robh@kernel.org>
References: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
 <20191213213418.GA17361@bogus>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <678cdcce-9bad-519a-68a5-a43414c15f94@c-s.fr>
Date: Sat, 14 Dec 2019 08:30:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213213418.GA17361@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/12/2019 à 22:34, Rob Herring a écrit :
> On Thu, Nov 28, 2019 at 12:16:35PM +0000, Christophe Leroy wrote:
>> Since commit 0f0581b24bd0 ("spi: fsl: Convert to use CS GPIO
>> descriptors"), the prefered way to define chipselect GPIOs is using
>> 'cs-gpios' property instead of the legacy 'gpios' property.
> 
> This will break using a new dtb on a kernel without the above commit. Or
> with any OS that never made the change.

Why would anybody use a new dtb on an old kernel ? I have not tagged 
this change for stable, it will only apply to DTBs in new kernels, won't 
it ?

That's not the first time DTS have to change for new kernels. For 
instance, some time ago I had to replace all 'gpios' property by a set 
of 'rdy-gpio', 'nce-gpio', 'ale-gpio' and 'cle-gpio' properties to 
continue using 'gpio-control-nand' driver.

> 
> I'm fine with the doc change, but you should keep 'gpios' as deprecated.

Ok

Christophe
