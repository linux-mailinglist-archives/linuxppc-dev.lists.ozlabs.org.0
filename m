Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01F2A500F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 20:24:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQfqJ3V3JzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 06:24:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQfnQ5PMTzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 06:22:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CQfnQ4HxLz8tVV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 06:22:50 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CQfnQ3gYwz9sTL; Wed,  4 Nov 2020 06:22:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CQfnN57msz9sT6
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 06:22:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQfnB6jf2z9v1x2;
 Tue,  3 Nov 2020 20:22:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aXaB3QGDvAPG; Tue,  3 Nov 2020 20:22:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQfnB5hq2z9v1x1;
 Tue,  3 Nov 2020 20:22:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CF268B7DC;
 Tue,  3 Nov 2020 20:22:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yeXrxSvxsMzB; Tue,  3 Nov 2020 20:22:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BF998B7DB;
 Tue,  3 Nov 2020 20:22:37 +0100 (CET)
Subject: Re: [PATCH] powerpc: Don't use asm goto for put_user() with GCC 4.9
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20201103132915.529337-1-mpe@ellerman.id.au>
 <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
 <20201103185829.GM2672@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <04ba7852-be06-dcda-3f91-7739025035e2@csgroup.eu>
Date: Tue, 3 Nov 2020 20:22:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201103185829.GM2672@gate.crashing.org>
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
Cc: schwab@linux-m68k.org, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/11/2020 à 19:58, Segher Boessenkool a écrit :
> On Tue, Nov 03, 2020 at 03:43:55PM +0100, Christophe Leroy wrote:
>> Le 03/11/2020 à 14:29, Michael Ellerman a écrit :
>>> For now though let's just not use asm goto with GCC 4.9, to avoid this
>>> bug and any other issues we haven't noticed yet. Possibly in future we
>>> can find a smaller workaround.
>>
>> Is that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670 ?
> 
> That was fixed in 4.8.1 (and all 4.9), so probably not.
> 

Ok.

Regardless, using "asm_volatile_goto()" instead of "asm volatile goto()" fixes the issue it seems.

Christophe
