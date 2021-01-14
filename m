Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C322F6118
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 13:37:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGkNj50RQzDrhc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGkJV2ccZzDqrs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 23:34:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4DGkJV0XvYz9sVX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 23:34:02 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DGkJT6SBfz9sVr; Thu, 14 Jan 2021 23:34:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DGkJT2l4Sz9sVX
 for <linuxppc-dev@ozlabs.org>; Thu, 14 Jan 2021 23:33:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DGkJJ3Lfgz9v18w;
 Thu, 14 Jan 2021 13:33:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id COdaRAD3npDY; Thu, 14 Jan 2021 13:33:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DGkJJ0k3nz9v18j;
 Thu, 14 Jan 2021 13:33:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 535568B803;
 Thu, 14 Jan 2021 13:33:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t241AWXWMGBq; Thu, 14 Jan 2021 13:33:53 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D1FA8B801;
 Thu, 14 Jan 2021 13:33:52 +0100 (CET)
Subject: Re: SPI not working on 5.10 and 5.11, bisected to 766c6b63aa04 ("spi:
 fix client driver breakages when using GPIO descriptors")
To: Mark Brown <broonie@kernel.org>
References: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
 <20210113123345.GD4641@sirena.org.uk>
 <9400d900-f315-815f-a358-16ed4963da6c@csgroup.eu>
 <20210114115958.GB4854@sirena.org.uk>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <006d1594-8eec-3aad-1651-919071e89f3b@csgroup.eu>
Date: Thu, 14 Jan 2021 13:33:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210114115958.GB4854@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Sven Van Asbroeck <thesven73@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/01/2021 à 12:59, Mark Brown a écrit :
> On Thu, Jan 14, 2021 at 12:27:42PM +0100, Christophe Leroy wrote:
> 
>> Today I have in the DTS the CS GPIOs declared as ACTIVE_LOW.
> 
>> If I declare them as ACTIVE_HIGH instead, then I also have to set
>> spi-cs-high property, otherwise of_gpio_flags_quirks() is not happy and
>> forces the GPIO ACTIVE LOW.
> 
>> When I set spi-cs-high property, it sets the SPI_CS_HIGH bit in spi->mode.
> 
> OK, so it sounds like you want SPI_CS_HIGH and that is being set
> correctly?
> 
>> In fsl_spi_chipselect(), we have
>>
>> 	bool pol = spi->mode & SPI_CS_HIGH
>>
>> Then
>> 	pdata->cs_control(spi, pol);
> 
>> So changing the board config is compensated by the above, and at the end it still doesn't work.
> 
> This is a driver bug, the driver set_cs() operation should not be
> modifying the value it is told to set.
> 

A driver bug ? Or maybe a change forgotten in commit  766c6b63aa04 ("spi: fix client driver 
breakages when using GPIO descriptors") ?

I'm almost sure it was not a bug, it is in line which what is said in the comment removed by the 
above mentionned commit.

I'll send a fix.

Christophe
