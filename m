Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E541AB687
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 06:13:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492m6k4vD0zDqyS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 14:13:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.18; helo=m17618.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492m512fsTzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 14:11:43 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 5B1A54E17F0;
 Thu, 16 Apr 2020 12:11:32 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: oss@buserror.net, Wang Wenhu <wenhu.wang@vivo.com>,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH v2,
 1/5] powerpc: 85xx: make FSL_85XX_CACHE_SRAM configurable
Date: Wed, 15 Apr 2020 21:11:13 -0700
Message-Id: <20200416041113.112735-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <36961f9d8c533d8b576043a2c6fc4859accfd9f1.camel@buserror.net>
References: <36961f9d8c533d8b576043a2c6fc4859accfd9f1.camel@buserror.net>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVJTkhLS0tJTkJIQkJPSllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MFE6NSo6LTg2PAg9MEIrTD0V
 NRAaFE9VSlVKTkNMS0pLSUJPTE9PVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUlNSEI3Bg++
X-HM-Tid: 0a71812f4ba89376kuws5b1a54e17f0
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
Cc: kernel@vivo.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Scott Wood <oss@buserror.net>

>> +	bool "32-bit kernel"
>
>Why make that user selectable ?
>
>Either a kernel is 64-bit or it is 32-bit. So having PPC64 user 
>selectable is all we need.
>
>And what is the link between this change and the description in the log ?
>
>>   	default y if !PPC64
>>   	select KASAN_VMALLOC if KASAN && MODULES
>>   
>> @@ -15,6 +15,7 @@ config PPC_BOOK3S_32
>>   	bool
>>   
>>   menu "Processor support"
>> +
>
>Why adding this space ?
>
>>   choice
>>   	prompt "Processor Type"
>>   	depends on PPC32
>> @@ -211,9 +212,9 @@ config PPC_BOOK3E
>>   	depends on PPC_BOOK3E_64
>>   
>>   config E500
>> +	bool "e500 Support"
>>   	select FSL_EMB_PERFMON
>>   	select PPC_FSL_BOOK3E
>> -	bool
>
>Why make this user-selectable ? This is already selected by the 
>processors requiring it, ie 8500, e5500 and e6500.
>
>Is there any other case where we need E500 ?
>
>And again, what's the link between this change and the description in 
>the log ?
>
>
>>   
>>   config PPC_E500MC
>>   	bool "e500mc Support"
>> 
>
>Christophe

Hi, Scott, Christophe!

I find that I did not get the point well of the defferences between
configurability and selectability(maybe words I created) of Kconfig items.

You are right that FSL_85XX_CACHE_SRAM should only be selected by a caller
but never enable it seperately.

Same answer for the comments from Christophe. I will drop this patch in v3.

Thanks,
Wenhu
