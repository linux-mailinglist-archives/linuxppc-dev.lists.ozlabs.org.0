Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A228F351
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 15:35:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBqz90jRGzDqND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 00:35:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBqvl4tT3zDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 00:32:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CBqvT6bzYzB09Zy;
 Thu, 15 Oct 2020 15:32:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id r2mIeKUWihmY; Thu, 15 Oct 2020 15:32:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CBqvT5QtWzB09b4;
 Thu, 15 Oct 2020 15:32:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56B408B811;
 Thu, 15 Oct 2020 15:32:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VjYZ00gG4QY9; Thu, 15 Oct 2020 15:32:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C58558B7FF;
 Thu, 15 Oct 2020 15:32:06 +0200 (CEST)
Subject: Re: [PATCH] powerpc: force inlining of csum_partial() to avoid
 multiple csum_partial() with GCC10
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <a1d31f84ddb0926813b17fcd5cc7f3fa7b4deac2.1602759123.git.christophe.leroy@csgroup.eu>
 <20201015132512.GG2672@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1f745f94-c819-b708-815e-24946621a29d@csgroup.eu>
Date: Thu, 15 Oct 2020 15:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015132512.GG2672@gate.crashing.org>
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



Le 15/10/2020 à 15:25, Segher Boessenkool a écrit :
> Hi!
> 
> On Thu, Oct 15, 2020 at 10:52:20AM +0000, Christophe Leroy wrote:
>> With gcc9 I get:
> 
> <snip>
> 
>> With gcc10 I get:
> 
> <snip>
> 
>> gcc10 defines multiple versions of csum_partial() which are just
>> an unconditionnal branch to __csum_partial().
> 
> It doesn't inline it, yes.
> 
> Could you open a GCC PR for this please?

Sure.

I also have get_order() 75 times in my vmlinux, all the same as the following:

c0016790 <get_order>:
c0016790:	38 63 ff ff 	addi    r3,r3,-1
c0016794:	54 63 a3 3e 	rlwinm  r3,r3,20,12,31
c0016798:	7c 63 00 34 	cntlzw  r3,r3
c001679c:	20 63 00 20 	subfic  r3,r3,32
c00167a0:	4e 80 00 20 	blr

Christophe
