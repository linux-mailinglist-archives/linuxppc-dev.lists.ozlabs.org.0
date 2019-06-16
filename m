Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4DF473C7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 10:24:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RS7H3QJdzDr8m
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 18:24:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="I/eon35b"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RS3b46XBzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 18:21:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45RS3Q4XrGz9v19r;
 Sun, 16 Jun 2019 10:21:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=I/eon35b; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IVYRmuuTueHB; Sun, 16 Jun 2019 10:21:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45RS3Q3VBdz9v19n;
 Sun, 16 Jun 2019 10:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560673266; bh=nDddjU62SJMnatBSBKFnzXb/nxJGkqucoMGf//3m8xY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I/eon35beLILDeNdqn5+T0Mrn9iajXcmzRWKFgcL1xtoTPsLiJsM9Zt+pv/RHb8/2
 pPBbZNB2LIMIo40jsiyfjTtYbOoYFFAnptyjTWGI9tYdUG0D5NAPnEDLa+TOIoueM3
 gXYPJ6VA1t384O8OCP7MeYf9egBEM3qNkEKrGJCg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 551628B7D1;
 Sun, 16 Jun 2019 10:21:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j5p44WTEn-_X; Sun, 16 Jun 2019 10:21:09 +0200 (CEST)
Received: from [192.168.232.53] (unknown [192.168.232.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCED38B7CD;
 Sun, 16 Jun 2019 10:21:08 +0200 (CEST)
Subject: Re: [PATCH v5 13/16] powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX
To: Andreas Schwab <schwab@linux-m68k.org>
References: <cover.1550775950.git.christophe.leroy@c-s.fr>
 <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
 <87blyz9jor.fsf@igel.home>
From: christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <a76f7759-a407-3d9a-0f43-654fd7ea0b1e@c-s.fr>
Date: Sun, 16 Jun 2019 10:20:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <87blyz9jor.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 190616-0, 16/06/2019), Outbound message
X-Antivirus-Status: Clean
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
Cc: j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/06/2019 à 13:23, Andreas Schwab a écrit :
> This breaks suspend (or resume) on the iBook G4.  no_console_suspend
> doesn't give any clues, the display just stays dark.
> 

After a quick look at the suspend functions, I have the feeling that 
those functions only store and restore BATs 0 to 3.

Could you build your kernel with CONFIG_PPC_PTDUMP and see in file 
/sys/kernel/debug/powerpc/segment_registers how many IBATs registers are 
used.
If any of registers IBATs 4 to 7 are used, could you adjust 
CONFIG_ETEXT_SHIFT so that only IBATs 0 to 3 be used, and check if 
suspend/resume works when IBATs 4 to 7 are not used ?

Thanks
Christophe

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

