Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ADE187968
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 06:57:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hMs45wwkzDqW8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 16:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=FOidQHyo; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hMqb1yl4zDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 16:56:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hMqS6pwZz9tyDw;
 Tue, 17 Mar 2020 06:56:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FOidQHyo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cPizxOgcNxsG; Tue, 17 Mar 2020 06:56:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hMqS5VtRz9tyDl;
 Tue, 17 Mar 2020 06:56:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584424580; bh=29Ro1sGHbS20qY55HkxOqhfus0j9f4fLJSkyAdiV1/4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FOidQHyopLQOscrsoLsYg4jHsoRiuJV5fsq3sx+BICCF3ZT60LoNqSsJxcCWwEwxP
 CMGi+Dk119bdW1M3W3teXcfHsAmn9A/c4hszai4thhYm52mT2c6kOhUDUw2c0RWShz
 vlKVuPflD+zUsf6I1jIW4r88BbQqMO6dlJCDul/k=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 659E18B785;
 Tue, 17 Mar 2020 06:56:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GF0S_tHCs4ek; Tue, 17 Mar 2020 06:56:21 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3A2B8B782;
 Tue, 17 Mar 2020 06:56:19 +0100 (CET)
Subject: Re: [PATCH 00/15] powerpc/watchpoint: Preparation for more than one
 watchpoint
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <b7148b91-e3db-d48a-7294-5c18fc801933@c-s.fr>
 <20200316184339.GB22482@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <16e4639a-eeb9-da39-9a17-3d30e16b180e@c-s.fr>
Date: Tue, 17 Mar 2020 06:56:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316184339.GB22482@gate.crashing.org>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/03/2020 à 19:43, Segher Boessenkool a écrit :
> On Mon, Mar 16, 2020 at 04:05:01PM +0100, Christophe Leroy wrote:
>> Some book3s (e300 family for instance, I think G2 as well) already have
>> a DABR2 in addition to DABR.
> 
> The original "G2" (meaning 603 and 604) do not have DABR2.  The newer
> "G2" (meaning e300) does have it.  e500 and e600 do not have it either.
> 
> Hope I got that right ;-)
> 
> 

G2 core reference manual says:

Features specific to the G2 core not present on the original MPC603e 
(PID6-603e) processors follow:
...
  Enhanced debug features
  — Addition of three breakpoint registers—IABR2, DABR, and DABR2
  — Two new breakpoint control registers—DBCR and IBCR


e500 has DAC1 and DAC2 instead for breakpoints iaw e500 core reference 
manual.

Christophe
