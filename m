Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC942A80B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 15:19:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRlyg4xDLzDqyp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 01:19:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRltp4VMLzDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:16:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CRlsz5Xy2z9ttBm;
 Thu,  5 Nov 2020 15:15:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7_RlKbejR6Xt; Thu,  5 Nov 2020 15:15:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CRlsF3K3Hz9ttC4;
 Thu,  5 Nov 2020 15:14:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8C8A8B873;
 Thu,  5 Nov 2020 15:14:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p4cJo1u5y1FO; Thu,  5 Nov 2020 15:14:46 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C41918B863;
 Thu,  5 Nov 2020 15:14:45 +0100 (CET)
Subject: Re: [PATCH 0/2] tty: Remove obsolete drivers
To: Lee Jones <lee.jones@linaro.org>
References: <20201105123357.708813-1-lee.jones@linaro.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <aa82ff49-8090-dcb8-7e96-6a92b189d302@csgroup.eu>
Date: Thu, 5 Nov 2020 15:14:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201105123357.708813-1-lee.jones@linaro.org>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 05/11/2020 à 13:33, Lee Jones a écrit :
> As per the vendor's request.

Is the vendor in copy of the patch ?

What about the other synclink adapters, namely the synclink_gt ? And the synclink_cs in the 
drivers/char/pcmcia/ ?

Christophe

> 
> Lee Jones (2):
>    tty: Remove redundant synclink driver
>    tty: Remove redundant synclinkmp driver
> 
>   arch/powerpc/configs/ppc6xx_defconfig |    2 -
>   drivers/tty/Kconfig                   |   27 -
>   drivers/tty/Makefile                  |    2 -
>   drivers/tty/synclink.c                | 7899 -------------------------
>   drivers/tty/synclinkmp.c              | 5580 -----------------
>   5 files changed, 13510 deletions(-)
>   delete mode 100644 drivers/tty/synclink.c
>   delete mode 100644 drivers/tty/synclinkmp.c
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> 
