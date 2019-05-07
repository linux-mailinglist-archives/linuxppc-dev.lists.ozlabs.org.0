Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A01686D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 18:54:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z5Lf1lDBzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 02:54:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="DaJtWWko"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z5KF1rfRzDqCK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 02:53:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44z5K61W3Cz9tyhg;
 Tue,  7 May 2019 18:53:30 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DaJtWWko; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OaKjzUDVVKym; Tue,  7 May 2019 18:53:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44z5K60SSPz9tycB;
 Tue,  7 May 2019 18:53:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557248010; bh=WprILXdm/abE/MEzyylSE7b5a084BNrypeqdWUqRY4c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DaJtWWkoS3t7AQul3FXtkjh6BnenaYM73Y6WLeliWA/9Qc/6HGyTYOGn3uiEqWgNU
 avZnC5MsawFt2k0j1cV+VNsf3QFyd0Mx1cV5TyD2kJ9JR9Ejkyk5MoTv0epBmxNXRW
 ARaY3YDe2G0lsBYelezWXO/ZeQZ605N8Rzanjoak=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA77E8B932;
 Tue,  7 May 2019 18:53:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FpuzyaJjCwg8; Tue,  7 May 2019 18:53:31 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B91D8B8CB;
 Tue,  7 May 2019 18:53:31 +0200 (CEST)
Subject: Re: [PATCH] powerpc: slightly improve cache helpers
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <0b460a85319fb89dab2c5d1200ac69a3e1b7c1ef.1557235807.git.christophe.leroy@c-s.fr>
 <20190507151030.GF8599@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <720e7c77-3f5c-83f3-6013-36b265c1ba73@c-s.fr>
Date: Tue, 7 May 2019 18:53:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507151030.GF8599@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/05/2019 à 17:10, Segher Boessenkool a écrit :
> Hi Christophe,
> 
> On Tue, May 07, 2019 at 01:31:39PM +0000, Christophe Leroy wrote:
>> Cache instructions (dcbz, dcbi, dcbf and dcbst) take two registers
>> that are summed to obtain the target address. Using '%y0' argument
>> gives GCC the opportunity to use both registers instead of only one
>> with the second being forced to 0.
> 
> That's not quite right.  Sorry if I didn't explain it properly.
> 
> "m" allows all memory.  But this instruction only allows reg,reg and
> 0,reg addressing.  For that you need to use constraint "Z".

But gcc help 
(https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html#Machine-Constraints) 
says it is better to use 'm':

Z

     Memory operand that is an indexed or indirect from a register (it 
is usually better to use ‘m’ or ‘es’ in asm statements)

That's the reason why I used 'm', I thought it was equivalent.

Christophe

> 
> The output modifier "%y0" just makes [reg] (i.e. simple indirect addressing)
> print as "0,reg" instead of "0(reg)" as it would by default (for just "%0").
> 
> 
> Segher
> 
