Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA6118C2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 14:13:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vvKj6Y4NzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 22:12:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="bIqFgS6W"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vvHs6wypzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 22:11:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vvHm3PrRz9txbD;
 Thu,  2 May 2019 14:11:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bIqFgS6W; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 85-dP5nXS5-Y; Thu,  2 May 2019 14:11:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vvHm1bbTz9txbC;
 Thu,  2 May 2019 14:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556799076; bh=K+3HbF0k8U9kzLuov5Fm/KEAbxDnzuIT8BsXj82K3n8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bIqFgS6WgXUsxNL6vv3SX/LN3c0X1vwPk2YfK20MalsA70YYDx4SE9JvUdgivEa1p
 GpuxI+tAFWbvNmf1Hhvmx3XcaHATRVF38iJw8Gd6oR2UwBZnSI5CDdThr6XVbMUDzi
 6bp48ajjxDcJ0SuNhQs1yjLcp7BUlpti0tEWEv+k=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E77A8B8F7;
 Thu,  2 May 2019 14:11:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WNNQZJ3gXNeX; Thu,  2 May 2019 14:11:17 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E90D8B899;
 Thu,  2 May 2019 14:11:17 +0200 (CEST)
Subject: Re: [PATCH v2 01/17] powerpc/mm: Don't BUG() in hugepd_page()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com
References: <cover.1556258134.git.christophe.leroy@c-s.fr>
 <ff4366d14b3ef4de6af835a880a772477577139f.1556258135.git.christophe.leroy@c-s.fr>
 <87o94lxdxe.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d8e3c5e3-553b-da0a-46d9-b3f555c767d0@c-s.fr>
Date: Thu, 2 May 2019 14:11:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87o94lxdxe.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/05/2019 à 14:02, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Use VM_BUG_ON() instead of BUG_ON(), as those BUG_ON()
>> are not there to catch runtime errors but to catch errors
>> during development cycle only.
> 
> I've dropped this one and the next, because I don't like VM_BUG_ON().
> 
> Why not? Because it's contradictory. It's a condition that's so
> important that we should BUG, but only if the kernel has been built
> specially for debugging.
> 
> I don't really buy the development cycle distinction, it's not like we
> have a rigorous test suite that we run and then we declare everything's
> gold and ship a product. We often don't find bugs until they're hit in
> the wild.
> 
> For example the recent corruption Joel discovered with STRICT_KERNEL_RWX
> could have been caught by a BUG_ON() to check we weren't patching kernel
> text in radix__change_memory_range(), but he wouldn't have been using
> CONFIG_DEBUG_VM. (See 8adddf349fda)
> 
> I know Aneesh disagrees with me on this, so maybe you two can convince
> me otherwise.
> 

I have no strong oppinion about this. In v1, I replaced them with a 
WARN_ON(), and Aneesh suggested to go with VM_BUG_ON() instead.

My main purpose was to reduce the amount of BUG/BUG_ON and I thought 
those were good candidates, but if you prefer keeping the BUG(), that's 
ok for me. Or maybe you prefered v1 alternatives (series at 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=98170) ?

Christophe
