Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68088AAABE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 20:20:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PTWY1SCQzDqw3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 04:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="H61IsqVI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PTTN0TywzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 04:18:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46PTTH5WhYz9ttBw;
 Thu,  5 Sep 2019 20:18:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=H61IsqVI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0eqJL81EhGJz; Thu,  5 Sep 2019 20:18:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46PTTH4Hd3z9ttBv;
 Thu,  5 Sep 2019 20:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567707507; bh=LxUCcQNAMDbGlYr3w50Cjy09MUwHu6EvzSoCm0K0Uvk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H61IsqVIUSy8K1OjRXtoEnAccojFSB6+5qYXDozt137DZDdZmPUx6BTcqKSE3YNHO
 IbLX1prg6TJvcbehLtPcQchClWzTZZ+ehOOfpfrvoTldRm+Cyk693nhM1CNarDTFe8
 0h8mrEH0VIsJPyMBxPK2W1jNZ2YkE/6Rmxypg7+s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 904CF8B919;
 Thu,  5 Sep 2019 20:18:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Yncom_Kb2W_V; Thu,  5 Sep 2019 20:18:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A96088B911;
 Thu,  5 Sep 2019 20:18:26 +0200 (CEST)
Subject: Re: [PATCH v3] powerpc/64: system call implement the bulk of the
 logic in C
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20190905123512.24311-1-npiggin@gmail.com>
 <1b0c7814-786e-f453-a26b-9d1cf7df12ce@c-s.fr>
 <20190905194638.74ab317d@kitsune.suse.cz>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b5ffd204-4b1c-4ba6-ee56-00c6f51fbdb0@c-s.fr>
Date: Thu, 5 Sep 2019 20:18:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905194638.74ab317d@kitsune.suse.cz>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/09/2019 à 19:46, Michal Suchánek a écrit :
> On Thu, 5 Sep 2019 15:25:31 +0000
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>> On 09/05/2019 12:35 PM, Nicholas Piggin wrote:
>>> System call entry and particularly exit code is beyond the limit of what
>>> is reasonable to implement in asm.
>>>
>>> This conversion moves all conditional branches out of the asm code,
>>> except for the case that all GPRs should be restored at exit.
>>>
>>> Null syscall test is about 5% faster after this patch, because the exit
>>> work is handled under local_irq_disable, and the hard mask and pending
>>> interrupt replay is handled after that, which avoids games with MSR.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>
>> Cannot apply it on latest powerpc/merge. On what does that apply ?
> 
> The v2 series had 4 patches so presumably the previous 3 are missing
> here.
> 

Yes indeed, the first two patches are already merged, so applying patch 
3 of that series allows to apply this patch.

Christophe
