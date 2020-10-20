Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B529360C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 09:47:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFm1P2DYkzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 18:47:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFlyM5PdBzDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 18:44:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CFlyG5qpvz9tydG;
 Tue, 20 Oct 2020 09:44:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3IHYRQHHVAoQ; Tue, 20 Oct 2020 09:44:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CFlyG4bXJz9tydK;
 Tue, 20 Oct 2020 09:44:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F4BB8B7CB;
 Tue, 20 Oct 2020 09:44:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WzI1CAHp3OTQ; Tue, 20 Oct 2020 09:44:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B868F8B767;
 Tue, 20 Oct 2020 09:44:38 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc: Fix pre-update addressing in inline assembly
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <5ffcb064f695d5285bf1faab91bffa3f9245fc26.1603109522.git.christophe.leroy@csgroup.eu>
 <fbcdb173cc42da62f00285dfef8c2f7d4960b5c7.1603109522.git.christophe.leroy@csgroup.eu>
 <20201019202441.GU2672@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ff158583-4e25-a5e6-5131-359423037e4f@csgroup.eu>
Date: Tue, 20 Oct 2020 09:44:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201019202441.GU2672@gate.crashing.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/10/2020 à 22:24, Segher Boessenkool a écrit :
> On Mon, Oct 19, 2020 at 12:12:48PM +0000, Christophe Leroy wrote:
>> In several places, inline assembly uses the "%Un" modifier
>> to enable the use of instruction with pre-update addressing,
> 
> Calling this "pre-update" is misleading: the register is not updated
> before the address is generated (or the memory access done!), and the
> addressing is exactly the same as the "non-u" insn would use.  It is
> called an "update form" instruction, because (at the same time as doing
> the memory access, logically anyway) it writes back the address used to
> the base register.
> 
>> but the associated "<>" constraint is missing.
> 
> But that is just fine.  Pointless, sure, but not a bug.

Most of those are from prehistoric code. So at some point in time it was effective. Then one day GCC 
changed it's way and they became pointless. So, not a software bug, but still a regression at some 
point.

> 
>> Use UPD_CONSTR macro everywhere %Un modifier is used.
> 
> Eww.  My poor stomach.

There are not that many :)

> 
> Have you verified that update form is *correct* in all these, and that
> we even *want* this there?

I can't see anything that would militate against it, do you ?

I guess if the elders have put %Us there, it was wanted.

Christophe
