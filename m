Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEB2F46D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:51:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG1Px51KJzDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:51:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG1Mv243vzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 19:49:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4DG1Mt56cwz9sVn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 19:49:30 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DG1Mt49ZWz9sWC; Wed, 13 Jan 2021 19:49:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DG1Mq1Sdwz9sVn
 for <linuxppc-dev@ozlabs.org>; Wed, 13 Jan 2021 19:49:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG1MZ02Qjz9ty2b;
 Wed, 13 Jan 2021 09:49:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id w2qC_Hl_dFfO; Wed, 13 Jan 2021 09:49:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG1MY67tTz9ty2Z;
 Wed, 13 Jan 2021 09:49:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE5818B7FC;
 Wed, 13 Jan 2021 09:49:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9x9Yr362zsLB; Wed, 13 Jan 2021 09:49:14 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A284A8B7FB;
 Wed, 13 Jan 2021 09:49:14 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: SPI not working on 5.10 and 5.11, bisected to 766c6b63aa04 ("spi: fix
 client driver breakages when using GPIO descriptors")
To: Sven Van Asbroeck <thesven73@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>
Message-ID: <dc5d8d35-31aa-b36d-72b0-17c8a7c13061@csgroup.eu>
Date: Wed, 13 Jan 2021 09:49:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

My board has powerpc 885 microcontroler. Temperature sensor is an LM74.

Kernel has CONFIG_SPI_FSL_SPI and CONFIG_SPI_FSL_CPM and CONFIG_SENSORS_LM70.

Since kernel 5.10, 'sensors' reports temperature 0°C on my board:

	root@vgoip:~# sensors

	lm74-spi-0-5
	Adapter: SPI adapter
	temp1:         +0.0 C

	lm74-spi-0-1
	Adapter: SPI adapter
	temp1:         +0.0 C

With commit 766c6b63aa04 ("spi: fix client driver breakages when using GPIO descriptors") reverted, 
it is back to work:

	root@vgoip:~# sensors

	lm74-spi-0-5
	Adapter: SPI adapter
	temp1:        +38.9 C

	lm74-spi-0-1
	Adapter: SPI adapter
	temp1:        +37.2 C


What shall I do ?

Thanks
Christophe
