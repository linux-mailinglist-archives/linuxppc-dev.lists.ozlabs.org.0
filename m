Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E792B1F743
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 17:17:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453yq2099BzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 01:17:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Sf73y8Lm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453ykJ6TwZzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 01:13:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453yk13Xhzz9vDbB;
 Wed, 15 May 2019 17:13:29 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Sf73y8Lm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CikjuasB-hgj; Wed, 15 May 2019 17:13:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453yk129r3z9vDb9;
 Wed, 15 May 2019 17:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557933209; bh=8iTa3IpLydkSGSYJ2itC/iY2m/dhrdNW4sw4GlWLtK0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Sf73y8LmP5FzG7Tn+Wa0fCiJduG0hyivjPVEuk57af6dRBXii0gQ2jX7MjlzfCmhp
 idx3UbBKZ7WFOEs5ui3jkM4SrxNazaLYvtWfD+PRHcvF49xixZhq5FhA0rKwZv5ZQb
 8FsCMU3EFU1NP6F+caVYIdmIAQqNL1fuV+ihXA6A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D2D158B914;
 Wed, 15 May 2019 17:13:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ny-Ko3o9ioyg; Wed, 15 May 2019 17:13:30 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [10.25.209.142])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A00CE8B90F;
 Wed, 15 May 2019 17:13:30 +0200 (CEST)
Subject: Re: [PATCH stable 4.4] powerpc/lib: fix book3s/32 boot failure due to
 code patching
To: Greg KH <gregkh@linuxfoundation.org>
References: <71dbc8bdad5da9f6cb0446535fb2a29c68fccf80.1557926850.git.christophe.leroy@c-s.fr>
 <20190515141604.GB8999@kroah.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f9ca9827-6394-0904-2559-9da18171fb32@c-s.fr>
Date: Wed, 15 May 2019 17:13:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515141604.GB8999@kroah.com>
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
Cc: erhard_f@mailbox.org, Michael Neuling <mikey@neuling.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/05/2019 à 16:16, Greg KH a écrit :
> On Wed, May 15, 2019 at 01:30:42PM +0000, Christophe Leroy wrote:
>> [Backport of upstream commit b45ba4a51cde29b2939365ef0c07ad34c8321789]
>>
>> On powerpc32, patch_instruction() is called by apply_feature_fixups()
>> which is called from early_init()
>>
>> There is the following note in front of early_init():
>>   * Note that the kernel may be running at an address which is different
>>   * from the address that it was linked at, so we must use RELOC/PTRRELOC
>>   * to access static data (including strings).  -- paulus
>>
>> Therefore init_mem_is_free must be accessed with PTRRELOC()
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203597
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>> ---
>> Can't apply the upstream commit as such due to several other unrelated stuff
>> like for instance STRICT_KERNEL_RWX which are missing.
>> So instead, using same approach as for commit 252eb55816a6f69ef9464cad303cdb3326cdc61d
>>
>> Removed the Fixes: tag as I don't know yet the commit Id of the fixed commit on 4.4 branch.
>> ---
>>   arch/powerpc/lib/code-patching.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Now added, thanks.
> 

Thanks,

However you took the commit log from the upstream commit, which doesn't 
corresponds exactly to the change being done here and described in the 
backport patch

Christophe
