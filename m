Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD225AC06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 15:27:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhPr22FFhzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 23:27:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhPn361YvzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 23:24:53 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhPmw3p97z9txT6;
 Wed,  2 Sep 2020 15:24:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2rn6LwTKxIyn; Wed,  2 Sep 2020 15:24:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhPmw30TRz9txT5;
 Wed,  2 Sep 2020 15:24:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D0A9A8B7E9;
 Wed,  2 Sep 2020 15:24:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mWFGbiENwioP; Wed,  2 Sep 2020 15:24:49 +0200 (CEST)
Received: from [10.25.210.31] (po15451.idsi0.si.c-s.fr [10.25.210.31])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A555F8B7E5;
 Wed,  2 Sep 2020 15:24:49 +0200 (CEST)
Subject: Re: [PATCH 10/10] powerpc: remove address space overrides using
 set_fs()
To: David Laight <David.Laight@ACULAB.COM>, 'Christoph Hellwig' <hch@lst.de>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-11-hch@lst.de>
 <8974838a-a0b1-1806-4a3a-e983deda67ca@csgroup.eu>
 <20200902123646.GA31184@lst.de>
 <61b9a880a6424a34b841cf3dddb463ad@AcuMS.aculab.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8de54fe0-4be9-5624-dd1d-d95d792e933d@csgroup.eu>
Date: Wed, 2 Sep 2020 15:24:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <61b9a880a6424a34b841cf3dddb463ad@AcuMS.aculab.com>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, "x86@kernel.org" <x86@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2020 à 15:13, David Laight a écrit :
> From: Christoph Hellwig
>> Sent: 02 September 2020 13:37
>>
>> On Wed, Sep 02, 2020 at 08:15:12AM +0200, Christophe Leroy wrote:
>>>> -		return 0;
>>>> -	return (size == 0 || size - 1 <= seg.seg - addr);
>>>> +	if (addr >= TASK_SIZE_MAX)
>>>> +		return false;
>>>> +	if (size == 0)
>>>> +		return false;
>>>
>>> __access_ok() was returning true when size == 0 up to now. Any reason to
>>> return false now ?
>>
>> No, this is accidental and broken.  Can you re-run your benchmark with
>> this fixed?
> 
> Is TASK_SIZE_MASK defined such that you can do:
> 
> 	return (addr | size) < TASK_SIZE_MAX) || !size;

TASK_SIZE_MAX will usually be 0xc0000000

With:
addr = 0x80000000;
size = 0x80000000;

I expect it to fail ....

With the formula you propose it will succeed, won't it ?

Christophe
