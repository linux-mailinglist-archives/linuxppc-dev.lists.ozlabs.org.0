Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C82C302B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 19:47:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgY0w6B46zDqdd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 05:47:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgXz12QWBzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 05:45:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgXyl4Vmkz9v0cg;
 Tue, 24 Nov 2020 19:45:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Vcy8JMl4wVTb; Tue, 24 Nov 2020 19:45:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgXyl31sBz9v0cY;
 Tue, 24 Nov 2020 19:45:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C1B48B7B7;
 Tue, 24 Nov 2020 19:45:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6aKrn2LfXqNO; Tue, 24 Nov 2020 19:45:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E0EBB8B7AF;
 Tue, 24 Nov 2020 19:45:36 +0100 (CET)
Subject: Re: eBPF on powerpc
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <d69650b0-4024-5759-3ccb-ede5c0394500@csgroup.eu>
 <1606234192.xvkulhfr3y.naveen@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4d588481-0c8d-6adf-53f5-e7332ddca7c4@csgroup.eu>
Date: Tue, 24 Nov 2020 19:45:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606234192.xvkulhfr3y.naveen@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/11/2020 à 17:35, Naveen N. Rao a écrit :
> Hi Christophe,
> 
> Christophe Leroy wrote:
>> Hi Naveen,
>>
>> Few years ago, you implemented eBPF on PPC64.
>>
>> Is there any reason for implementing it for PPC64 only ?
> 
> I focused on ppc64 since eBPF is a 64-bit VM and it was more straight-forward to target.
> 
>> Is there something that makes it impossible to have eBPF for PPC32 as well ?
> 
> No, I just wasn't sure if it would be performant enough to warrant it. Since then however, there 
> have been arm32 and riscv 32-bit JIT implementations and atleast the arm32 JIT seems to be showing 
> ~50% better performance compared to the interpreter (*). So, it would be worthwhile to add support 
> for ppc32.

That's great.

I know close to nothing about eBPF. Is there any interesting documentation on it somewhere that 
would allow me to easily understand how it works and allow me to extend the 64 bit powerpc to 32 bits ?

> 
> Note that there might be a few instructions which would be difficult to support on 32-bit, but those 
> can fallback to the interpreter, while allowing other programs to be JIT'ed.
> 
> 
> - Naveen
> 
> (*) http://lkml.kernel.org/r/CAGXu5jLYunVCJGCfHPebKDaoQ71hdMGq4HhdDxTYpBQw_HXUYQ@mail.gmail.com
> (*) http://lkml.kernel.org/r/b63fae4b-cb74-1928-b210-80914f3c8995@fb.com
> (*) http://lkml.kernel.org/r/20200305050207.4159-1-luke.r.nels@gmail.com

Christophe
