Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB29E79B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:19:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t8y02KzmzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 02:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BjQx+kaE"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t8wY372FzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 02:18:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44t8wN2pCvz9vDbs;
 Mon, 29 Apr 2019 18:18:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BjQx+kaE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aXsRFK1QTZr9; Mon, 29 Apr 2019 18:18:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44t8wN1Rbrz9vDbr;
 Mon, 29 Apr 2019 18:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556554708; bh=FmG0gTYs5oq5h81q7jEyc4Wov/smm6KptMn1bWZZ6UY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BjQx+kaEHgEJb9T/61rt3diCsJNYkiNHUhfzgr+mvjN4Pnywq5MbgYBcqpdIQz91l
 MOoWYXEzdn4IgWuIaWT6IQgLGYQmiTbu4vZxYLhMqB1ljWxO3BTYx68HtfYfrLa2pJ
 DnY47LpRSIwR+sTZMzdaApWHw4o+sdP3BfWcan1g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 671608B8B4;
 Mon, 29 Apr 2019 18:18:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J9zNcQs8Cgt1; Mon, 29 Apr 2019 18:18:33 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 094208B8B3;
 Mon, 29 Apr 2019 18:18:33 +0200 (CEST)
Subject: Re: serial drivers polishing
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7471c418-4058-db7b-b2ed-af9a67fff201@c-s.fr>
Date: Mon, 29 Apr 2019 16:16:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 04/27/2019 12:51 PM, Enrico Weigelt, metux IT consult wrote:
> Hello folks,
> 
> 
> here's another attempt of polishing the serial drivers:
> 
> * lots of minor cleanups to make checkpatch happier
>    (eg. formatting, includes, inttypes, ...)
> 
> * use appropriate logging helpers instead of printk()
> 
> * consequent use of mapsize/mapbase fields:
>    the basic idea is, all drivers should fill mapbase/mapbase fields at
>    init time and later only use those fields, instead of hardcoded values
>    (later on, we can add generic helpers for the map/unmap stuff, etc)
> 
> * untwisting serial8250_port_size() at all:
>    move the iomem size probing to initialization time, move out some
>    platform specific magic to corresponding platform code, etc.
> 
> 
> Unfortunately, I don't have the actual hardware to really test all
> the code, so please let me know if there's something broken in here.
> 
> 
> have fun,
> 
> --mtx
> 


Got the following build  error while compiling for my powerpc board with 
your full series applied. No time to investigate though.

   CC      arch/powerpc/kernel/setup-common.o
In file included from ./include/linux/serial_8250.h:14:0,
                  from arch/powerpc/kernel/setup-common.c:33:
./include/linux/serial_core.h: In function ‘uart_memres_set_res’:
./include/linux/serial_core.h:446:18: error: ‘resource’ undeclared 
(first use in this function)
    port->iobase = resource->start;
                   ^
./include/linux/serial_core.h:446:18: note: each undeclared identifier 
is reported only once for each function it appears in
./include/linux/serial_core.h:450:2: error: ‘uart’ undeclared (first use 
in this function)
   uart->mapbase = res->start;
   ^
./include/linux/serial_core.h: In function ‘uart_memres_set_start_len’:
./include/linux/serial_core.h:464:6: error: ‘struct uart_driver’ has no 
member named ‘mapbase’
   uart->mapbase = start;
       ^
./include/linux/serial_core.h:465:6: error: ‘struct uart_driver’ has no 
member named ‘mapsize’
   uart->mapsize = len;
       ^
./include/linux/serial_core.h:466:6: error: ‘struct uart_driver’ has no 
member named ‘iotype’
   uart->iotype  = UPIO_MEM;
       ^
make[3]: *** [arch/powerpc/kernel/setup-common.o] Error 1


Christophe
