Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3C408B71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 14:59:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7RQ75Ylqz305K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 22:59:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7RPj2Qyzz2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 22:59:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H7RPd63znz9sXR;
 Mon, 13 Sep 2021 14:59:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLpZEGWF4n4X; Mon, 13 Sep 2021 14:59:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H7RPc3jNcz9sXP;
 Mon, 13 Sep 2021 14:59:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69FD78B767;
 Mon, 13 Sep 2021 14:59:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lqhF7-Io2zmO; Mon, 13 Sep 2021 14:59:00 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 459F88B763;
 Mon, 13 Sep 2021 14:59:00 +0200 (CEST)
Subject: Re: [PATCH v2 3/5] signal: Add unsafe_copy_siginfo_to_user()
To: Christoph Hellwig <hch@infradead.org>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
 <a94be61f008ab29c231b805e1a97e9dab35cb0cc.1629732940.git.christophe.leroy@csgroup.eu>
 <YTB1F7o15FrxmmP1@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a98f9e92-f304-9f69-c5b2-eed628846e4c@csgroup.eu>
Date: Mon, 13 Sep 2021 14:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTB1F7o15FrxmmP1@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2021 à 08:54, Christoph Hellwig a écrit :
> On Mon, Aug 23, 2021 at 03:35:53PM +0000, Christophe Leroy wrote:
>> In the same spirit as commit fb05121fd6a2 ("signal: Add
>> unsafe_get_compat_sigset()"), implement an 'unsafe' version of
>> copy_siginfo_to_user() in order to use it within user access blocks.
>>
>> For that, also add an 'unsafe' version of clear_user().
> 
> I'm a little worried about all these unsafe helper in powerpc and the
> ever increasing scope of the unsafe sections.  Can you at least at
> powerpc support to objtool to verify them?  objtool verifications has
> helped to find quite a few bugs in unsafe sections on x86.

Ok, I've started looking at it, I have not found any work at all on 
objtool for powerpc. I'll see if I can draft something from the ARM64 
tentatives.

Christophe
