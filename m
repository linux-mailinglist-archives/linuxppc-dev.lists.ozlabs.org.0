Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A56561E0C82
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 13:08:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VvTs4PLZzDqH4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 21:08:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VvRy2hXDzDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 21:06:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49VvRf46Bwz9v09n;
 Mon, 25 May 2020 13:06:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FYfwzWS7jhgs; Mon, 25 May 2020 13:06:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49VvRf348Qz9v09m;
 Mon, 25 May 2020 13:06:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED4B38B7C4;
 Mon, 25 May 2020 13:06:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id drtm2HkzvJ5l; Mon, 25 May 2020 13:06:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BE988B7C3;
 Mon, 25 May 2020 13:06:44 +0200 (CEST)
Subject: Re: [PATCH v4 07/45] powerpc/ptdump: Limit size of flags text to 1/2
 chars on PPC32
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
 <83a7a0cfca6198e63caf7a16839bd18454961f52.1589866984.git.christophe.leroy@csgroup.eu>
 <87h7w4fvcy.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e505c554-21b1-3d02-1ea5-c2a214b80ebb@csgroup.eu>
Date: Mon, 25 May 2020 13:06:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87h7w4fvcy.fsf@mpe.ellerman.id.au>
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



Le 25/05/2020 à 07:15, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> In order to have all flags fit on a 80 chars wide screen,
>> reduce the flags to 1 char (2 where ambiguous).
> 
> I don't love this, the output is less readable. Is fitting on an 80 char
> screen a real issue for you? I just make my terminal window bigger.

I don't have strong opinion about that, and the terminal can be made bigger.
I just don't like how messy it is, some flags are so big that they hide 
other ones and getting it more ordered and more compact helped me during 
all the verifications I did with this series, but we can leave it as is 
if you prefer.

Would you like a v5 without patches 7 and 8 ? Or I can just resend the 
patches that will be impacted, that is 9 and 38 ?

Without the changes I get:

---[ Start of kernel VM ]---
0xc0000000-0xc0ffffff  0x00000000        16M   huge  shared  r    X 
present                  accessed
0xc1000000-0xc7ffffff  0x01000000       112M   huge  shared  rw 
present           dirty  accessed
---[ vmalloc() Area ]---
0xc9000000-0xc9003fff  0x050e4000        16K         shared  rw 
present           dirty  accessed
0xc9008000-0xc900bfff  0x050ec000        16K         shared  rw 
present           dirty  accessed
0xc9010000-0xc9013fff  0xd0000000        16K         shared  rw 
present  guarded  dirty  accessed  no cache
0xc9018000-0xc901bfff  0x050f0000        16K         shared  rw 
present           dirty  accessed

---[ Fixmap start ]---
0xf7f00000-0xf7f7ffff  0xff000000       512K   huge  shared  rw 
present  guarded  dirty  accessed  no cache
---[ Fixmap end ]---
---[ kasan shadow mem start ]---
0xf8000000-0xf8ffffff  0x07000000        16M   huge  shared  rw 
present           dirty  accessed
0xf9000000-0xf91fffff [0x01288000]       16K         shared  r 
present                  accessed
0xf9200000-0xf9203fff  0x050e0000        16K         shared  rw 
present           dirty  accessed


With the change I get.

---[ Start of kernel VM ]---
0xc0000000-0xc0ffffff  0x00000000        16M   h  r   x  p        sh 
    a
0xc1000000-0xc7ffffff  0x01000000       112M   h  rw     p        sh 
d  a
---[ vmalloc() Area ]---
0xc9000000-0xc9003fff  0x050e4000        16K      rw     p        sh 
d  a
0xc9008000-0xc900bfff  0x050ec000        16K      rw     p        sh 
d  a
0xc9010000-0xc9013fff  0xd0000000        16K      rw     p  i  g  sh 
d  a
0xc9018000-0xc901bfff  0x050f0000        16K      rw     p        sh 
d  a

---[ Fixmap start ]---
0xf7f00000-0xf7f7ffff  0xff000000       512K   h  rw     p  i  g  sh 
d  a
---[ Fixmap end ]---
---[ kasan shadow mem start ]---
0xf8000000-0xf8ffffff  0x07000000        16M   h  rw     p        sh 
d  a
0xf9000000-0xf91fffff [0x01288000]       16K      r      p        sh 
    a
0xf9200000-0xf9203fff  0x050e0000        16K      rw     p        sh 
d  a


Christophe

> 
> cheers
> 
> 
>> No cache is 'i'
>> User is 'ur' (Supervisor would be sr)
>> Shared (for 8xx) becomes 'sh' (it was 'user' when not shared but
>> that was ambiguous because that's not entirely right)
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/mm/ptdump/8xx.c    | 33 ++++++++++++++++---------------
>>   arch/powerpc/mm/ptdump/shared.c | 35 +++++++++++++++++----------------
>>   2 files changed, 35 insertions(+), 33 deletions(-)
