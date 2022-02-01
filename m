Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD34A5C6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 13:40:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp4KX0J0lz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 23:40:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.132; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp4K53qpGz2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 23:40:25 +1100 (AEDT)
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id EsL6nNxOhIz5VEsL6nR6YE; Tue, 01 Feb 2022 13:32:53 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 01 Feb 2022 13:32:53 +0100
X-ME-IP: 90.126.236.122
Message-ID: <7c34009b-0d34-baa8-f4ff-68f2203422c5@wanadoo.fr>
Date: Tue, 1 Feb 2022 13:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/xive: Add some error handling code to
 'xive_spapr_init()'
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, benh@kernel.crashing.org, 
 paulus@samba.org, mpe@ellerman.id.au, allison@lohutok.net,
 tglx@linutronix.de, clg@kaod.org, groug@kaod.org
References: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
 <1ea13a2a-90fd-07d3-2031-19e81ea349b4@csgroup.eu>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1ea13a2a-90fd-07d3-2031-19e81ea349b4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 01/02/2022 à 12:31, Christophe Leroy a écrit :
> Hi,
> 
> Le 01/08/2019 à 13:09, Christophe JAILLET a écrit :
>> 'xive_irq_bitmap_add()' can return -ENOMEM.
>> In this case, we should free the memory already allocated and return
>> 'false' to the caller.
>>
>> Also add an error path which undoes the 'tima = ioremap(...)'
> 
> This old patch doesn't apply, if it is still relevant can you please 
> rebase ?
> 
> Thanks
> Christophe
> 

Hi, funny to see a 2 1/2 years old patch to pop-up like that :)
It still looks relevant to me.

V2 sent.
Still not compile tested.

CJ
