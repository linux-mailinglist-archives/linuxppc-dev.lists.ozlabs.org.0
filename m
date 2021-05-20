Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088B4389D20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 07:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flyyf4VCSz305r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:31:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlyyD3nGnz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 15:30:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Flyy20rlnz9sVL;
 Thu, 20 May 2021 07:30:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijUkvh1s94uX; Thu, 20 May 2021 07:30:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Flyy171F7z9sVK;
 Thu, 20 May 2021 07:30:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3FEF8B805;
 Thu, 20 May 2021 07:30:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5MQwqMwzIuDs; Thu, 20 May 2021 07:30:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 74B368B804;
 Thu, 20 May 2021 07:30:49 +0200 (CEST)
To: Larry Finger <Larry.Finger@lwfinger.net>, fabioaiuto83@gmail.com,
 Greg KH <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Conflict between arch/powerpc/include/asm/disassemble.h and
 drivers/staging/rtl8723bs/include/wifi.h
Message-ID: <6954e633-3908-d175-3030-3e913980af78@csgroup.eu>
Date: Thu, 20 May 2021 07:30:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 7bit
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

Hello,

I was trying to include powerpc asm/disassemble.h in some more widely used headers in order to 
reduce open coding, and I'm facing the following problem:

drivers/staging/rtl8723bs/include/wifi.h:237:30: error: conflicting types for 'get_ra'
drivers/staging/rtl8723bs/include/wifi.h:237:30: error: conflicting types for 'get_ra'
make[4]: *** [scripts/Makefile.build:272: drivers/staging/rtl8723bs/core/rtw_btcoex.o] Error 1
make[4]: *** [scripts/Makefile.build:272: drivers/staging/rtl8723bs/core/rtw_ap.o] Error 1
make[3]: *** [scripts/Makefile.build:515: drivers/staging/rtl8723bs] Error 2

(More details at http://kisskb.ellerman.id.au/kisskb/head/ee2dedcaaf3fe176e68498018632767d02639d03/)

Taking into account that asm/disassemble.h has been existing since 2008 while 
rtl8723bs/include/wifi.h was created in 2017, and that the get_ra() defined in the later is used at 
exactly one place only, would it be possible to change it there ? 
(https://elixir.bootlin.com/linux/v5.13-rc2/A/ident/get_ra)

Thanks
Christophe
