Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA20D896F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 07:43:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Prh2whrzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 15:43:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tXM4FaMZ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Ppx4qhczDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 15:41:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 466Ppn2qyjzB09bJ;
 Mon, 12 Aug 2019 07:41:21 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tXM4FaMZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AL-sfYbjepFg; Mon, 12 Aug 2019 07:41:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 466Ppn1fyPzB09bG;
 Mon, 12 Aug 2019 07:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565588481; bh=aSvscXTe0OBobtl058VSABuVDDxAT9o0ET91HCafAZA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tXM4FaMZLqgfa4UR8st58PV1szduvw8v5jkRKMjbScOYDFsi4YNXO0oKicwpOmSqz
 W0zVjFAoBzwPimyH5wKH18OkZFcMly4tE5ma3IQW9gs5GoppZEaa7lmdtJyrnu5vgi
 oAav5yZjevb1WD9dxYLY9XsxX/Y1sHQhaAawM2+s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 249CB8B791;
 Mon, 12 Aug 2019 07:41:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id isJuowyE8M47; Mon, 12 Aug 2019 07:41:26 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA6148B752;
 Mon, 12 Aug 2019 07:41:25 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc: Allow flush_icache_range to work across
 ranges >4GB
To: Alastair D'Silva <alastair@au1.ibm.com>
References: <20190809004548.22445-1-alastair@au1.ibm.com>
 <a9bcc457-9f9b-7010-6796-fb263135f8bc@c-s.fr>
 <72a3fca157a508a9f1bc6ea20801b9227d788f1d.camel@au1.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d481e068-5688-d507-b78c-c927ce7a70d3@c-s.fr>
Date: Mon, 12 Aug 2019 07:41:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72a3fca157a508a9f1bc6ea20801b9227d788f1d.camel@au1.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/08/2019 à 03:19, Alastair D'Silva a écrit :
> On Fri, 2019-08-09 at 10:59 +0200, Christophe Leroy wrote:
>>
>> Le 09/08/2019 à 02:45, Alastair D'Silva a écrit :
>>> From: Alastair D'Silva <alastair@d-silva.org>
>>>
>>> When calling flush_icache_range with a size >4GB, we were masking
>>> off the upper 32 bits, so we would incorrectly flush a range
>>> smaller
>>> than intended.
>>>
>>> This patch replaces the 32 bit shifts with 64 bit ones, so that
>>> the full size is accounted for.
>>>
>>> Heads-up for backporters: the old version of flush_dcache_range is
>>> subject to a similar bug (this has since been replaced with a C
>>> implementation).
>>
>> Can you submit a patch to stable, explaining this ?
>>
> 
> This patch was sent to stable too - or did you mean send another patch
> for the stable asm version of flush_dcache_range?
> 

Yes I meant a patch for your 'heads-up', in extenso a patch for fixing 
flush_dcache_range().

And for this patch, you put stable is copy of the mail, but for it to be 
taken into account it needs to also explicitely include a Cc: 
stable@vger.kernel.org in the commit message. I guess Michael will add 
it for this time.

Christophe
