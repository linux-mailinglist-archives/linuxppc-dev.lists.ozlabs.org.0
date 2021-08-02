Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C13DDC3C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 17:19:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdhWQ5TZjz3cKq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 01:19:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdhW61m29z3060
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 01:19:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GdhW0386Pz9sVF;
 Mon,  2 Aug 2021 17:19:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QnmngloUx-q; Mon,  2 Aug 2021 17:19:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GdhW02BD3z9sV7;
 Mon,  2 Aug 2021 17:19:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 303AA8B776;
 Mon,  2 Aug 2021 17:19:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yCPwypI_1JZp; Mon,  2 Aug 2021 17:19:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 089A38B763;
 Mon,  2 Aug 2021 17:19:23 +0200 (CEST)
Subject: Re: [PATCH v3 31/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
To: Finn Thain <fthain@linux-m68k.org>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
 <ca5795d04a220586b7037dbbbe6951dfa9e768eb.1615552867.git.christophe.leroy@csgroup.eu>
 <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
 <20210731173954.Horde.fV2Xkw7-sxjG0DUcZ_JO_g3@messagerie.c-s.fr>
 <1d601b7c-1e39-e372-39a5-e1e98e56e2a5@linux-m68k.org>
From: LEROY Christophe <christophe.leroy@csgroup.eu>
Message-ID: <9b64dde3-6ebd-b446-41d9-61e8cb0d8c39@csgroup.eu>
Date: Mon, 2 Aug 2021 17:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1d601b7c-1e39-e372-39a5-e1e98e56e2a5@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr-FR
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
Cc: Stan Johnson <userm57@yahoo.com>, linux-kernel@vger.kernel.org,
 Nick Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/08/2021 à 03:21, Finn Thain a écrit :
> On Sat, 31 Jul 2021, Christophe Leroy wrote:
> 
>>>
>>> Stan Johnson contacted me about a regression in mainline that he
>>> observed on his G3 Powerbooks. Using 'git bisect' we determined that
>>> this patch was the cause of the regression, i.e. commit 4c0104a83fc3
>>> ("powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE").
>>>
>>> When testing 4c0104a83fc and all subsequent builds, various user
>>> processes were liable to segfault. Here is the console log that Stan
>>> provided:
>>
>> Hi, i will be able to look at that more in details next week, however I
>> have a few preliminary qurstions.
>>
>> Can you reliabily reproduce the problem with the said commit, and can
>> you reliabily run without problem with the parent commit ?
> 
> Yes and yes. (I already asked Stan to establish those things before I
> contacted the list.)

I think I found the problem with that commit. Can you retry with the 
following change:

diff --git a/arch/powerpc/kernel/head_book3s_32.S 
b/arch/powerpc/kernel/head_book3s_32.S
index 0a3d7d4a9ec4..a294103a91a1 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -299,7 +299,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
  	EXCEPTION_PROLOG_1
  	EXCEPTION_PROLOG_2 0x300 DataAccess handle_dar_dsisr=1
  	prepare_transfer_to_handler
-	lwz	r5, _DSISR(r11)
+	lwz	r5, _DSISR(r1)
  	andis.	r0, r5, DSISR_DABRMATCH@h
  	bne-	1f
  	bl	do_page_fault
---
Thanks
Christophe
