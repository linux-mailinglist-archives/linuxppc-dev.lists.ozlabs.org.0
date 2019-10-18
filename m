Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19227DBDDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 08:48:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vc7G09N4zDrPc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 17:48:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="DxDL2E1z"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vc5K0hHkzDqjR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 17:46:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46vc575gL6z9tx5X;
 Fri, 18 Oct 2019 08:46:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DxDL2E1z; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5bIBQRCKtIeI; Fri, 18 Oct 2019 08:46:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46vc573HzLz9tx5W;
 Fri, 18 Oct 2019 08:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571381195; bh=WX90bdaoMzCs8xgA6+HCzypTGmxEze3UiLIKlr3SbAk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DxDL2E1zMxM1TWOEpFPlwlooaWacpBagZemhaeBhio5n+GGv9qMDxq16uNOQE26PL
 k00ZABQ6t1TiRuJiRhsa7L7IE+eV7lgtxBHM9F6YiFJXEXvavOCVzL0sC3179JXwYh
 l6Sm893qB4b4UcnvtyU7FL31sfNHktTKQ3JuikHA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68C658B7E5;
 Fri, 18 Oct 2019 08:46:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hZxqJFrAxSt1; Fri, 18 Oct 2019 08:46:36 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A888B8B7DE;
 Fri, 18 Oct 2019 08:46:35 +0200 (CEST)
Subject: Re: [PATCH v3 06/15] powerpc/32: prepare for CONFIG_VMAP_STACK
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 npiggin@gmail.com, dja@axtens.net
References: <cover.1568106758.git.christophe.leroy@c-s.fr>
 <7e9771a56539c58dcd8a871c3dfbe7a932e427b0.1568106758.git.christophe.leroy@c-s.fr>
 <d181b762-3e7b-7a0a-2505-54ead241456d@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <baff8ef3-a3c6-c6e2-732f-4d521d92140b@c-s.fr>
Date: Fri, 18 Oct 2019 08:46:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d181b762-3e7b-7a0a-2505-54ead241456d@linux.ibm.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/10/2019 à 09:36, Andrew Donnellan a écrit :
> On 10/9/19 7:16 pm, Christophe Leroy wrote:
>> +#if defined(CONFIG_VMAP_STACK) && CONFIG_THREAD_SHIFT < PAGE_SHIFT
>> +#define THREAD_SHIFT        PAGE_SHIFT
>> +#else
>>   #define THREAD_SHIFT        CONFIG_THREAD_SHIFT
>> +#endif
>>
>>   #define THREAD_SIZE        (1 << THREAD_SHIFT)
>>
> 
> Looking at 64-bit book3s: with 64K pages, this results in a THREAD_SIZE 
> that's too large for immediate mode arithmetic operations, which is 
> annoying. Hmm.
> 

Which operation are you thinking about ?

For instance, 'addi' can't be used anymore, but 'addis' can.

Christophe
