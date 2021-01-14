Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC60E2F601C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 12:32:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGhxC40B7zDrdV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 22:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGhrH0pQrzDrcY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 22:27:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4DGhrG247zz9sVm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 22:27:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DGhrG0FXBz9sVt; Thu, 14 Jan 2021 22:27:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DGhrD5hyKz9sVm
 for <linuxppc-dev@ozlabs.org>; Thu, 14 Jan 2021 22:27:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DGhr15N7dz9v19B;
 Thu, 14 Jan 2021 12:27:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I8b1oyYPNNXT; Thu, 14 Jan 2021 12:27:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DGhr142PFz9v18k;
 Thu, 14 Jan 2021 12:27:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DE07F8B801;
 Thu, 14 Jan 2021 12:27:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eJEDNHFrKG5m; Thu, 14 Jan 2021 12:27:46 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C4D68B800;
 Thu, 14 Jan 2021 12:27:46 +0100 (CET)
Subject: Re: SPI not working on 5.10 and 5.11, bisected to 766c6b63aa04 ("spi:
 fix client driver breakages when using GPIO descriptors")
To: Mark Brown <broonie@kernel.org>
References: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
 <20210113123345.GD4641@sirena.org.uk>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9400d900-f315-815f-a358-16ed4963da6c@csgroup.eu>
Date: Thu, 14 Jan 2021 12:27:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113123345.GD4641@sirena.org.uk>
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



Le 13/01/2021 à 13:33, Mark Brown a écrit :
> On Wed, Jan 13, 2021 at 09:49:12AM +0100, Christophe Leroy wrote:
> 
>> With commit 766c6b63aa04 ("spi: fix client driver breakages when using GPIO
>> descriptors") reverted, it is back to work:
> 
> ...
> 
>> What shall I do ?
> 
> I would guess that there's an error with the chip select polarity
> configuration on your system that just happened to work previously, I'd
> suggest fixing this in the board configuration to bring it in line with
> everything else.
> 

Not that easy.

Today I have in the DTS the CS GPIOs declared as ACTIVE_LOW.

If I declare them as ACTIVE_HIGH instead, then I also have to set spi-cs-high property, otherwise 
of_gpio_flags_quirks() is not happy and forces the GPIO ACTIVE LOW.

When I set spi-cs-high property, it sets the SPI_CS_HIGH bit in spi->mode.

In fsl_spi_chipselect(), we have

	bool pol = spi->mode & SPI_CS_HIGH

Then
	pdata->cs_control(spi, pol);

So changing the board config is compensated by the above, and at the end it still doesn't work.


Whereas reverting the above mentionned commit sets back SPI_CS_HIGH into spi->mode without changing 
the ACTIVE level of the GPIO, resulting in the correct polarity.


So, I'm a bit lost, where is the problem exactly ?

Thanks
Christophe
