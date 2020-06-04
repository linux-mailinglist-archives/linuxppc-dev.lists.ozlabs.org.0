Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 336541EE6AF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 16:32:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d7X70b9bzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 00:32:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d7Sc5K73zDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 00:29:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49d7ST1V0dzB09b4;
 Thu,  4 Jun 2020 16:28:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iWgjyHDv6Rc2; Thu,  4 Jun 2020 16:28:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49d7ST0NPVzB09b2;
 Thu,  4 Jun 2020 16:28:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F05998B8C9;
 Thu,  4 Jun 2020 16:28:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id E3BUNq7OkORr; Thu,  4 Jun 2020 16:28:58 +0200 (CEST)
Received: from [10.25.210.22] (po15451.idsi0.si.c-s.fr [10.25.210.22])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96D8C8B8C5;
 Thu,  4 Jun 2020 16:28:58 +0200 (CEST)
Subject: Re: Boot issue with the latest Git kernel
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig
 <hch@lst.de>, Darren Stevens <darren@stevens-zone.net>
References: <cca69c35-899b-38d8-73ee-2d62997484e5@xenosoft.de>
 <16b46b7d-7bd0-83b8-307f-2b9be830b096@csgroup.eu>
Message-ID: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
Date: Thu, 4 Jun 2020 16:29:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <16b46b7d-7bd0-83b8-307f-2b9be830b096@csgroup.eu>
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
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/06/2020 à 16:26, Christophe Leroy a écrit :
> Hi,
> 
> 
> Le 04/06/2020 à 16:16, Christian Zigotzky a écrit :
>> Hi All,
>>
>> I tested the latest Git kernel today. [1]. Unfortunately it doesn't 
>> boot on my PowerPC machines.
>>
>> Could you please test the latest Git kernel with your PowerPC machine?
>>
>> BTW, it doesn't boot in a virtual QEMU PowerPC machine either.
>>
> 
> Which machine/platform ? Which defconfig are you using ?
> 


And are you able to perform a 'git bisect' to identify the guilty commit ?

Thanks
Christophe
