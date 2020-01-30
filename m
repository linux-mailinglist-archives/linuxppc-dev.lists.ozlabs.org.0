Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF9714DF27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 17:31:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487m7s2g0rzDqbY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 03:31:21 +1100 (AEDT)
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
 header.s=mail header.b=Liz4R0iH; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487m5p32zYzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 03:29:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 487m5h5xpkz9v6KS;
 Thu, 30 Jan 2020 17:29:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Liz4R0iH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id m69Y92rUnvTs; Thu, 30 Jan 2020 17:29:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 487m5h4mmLz9v6KR;
 Thu, 30 Jan 2020 17:29:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580401768; bh=W8jL2Par4jnbI0Tf4JW4WO5iw00cnbkSmhWP6Powlsk=;
 h=To:From:Subject:Date:From;
 b=Liz4R0iHW/TsIch0+2KiOn8AhPIauSEleGy3zuib8S/4Uc96zY4Iz3ntYQwow0JW1
 9uvAwlRZD3gVqwovuBOT5rQBHmDeFcRK40RNL4YrpxSqJzrs8OYENInnLYAIT/f32d
 a+KaX6i0Wz3qSPqNvYpj6VXeqxsl9B6syLv7cKn8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4322D8B87B;
 Thu, 30 Jan 2020 17:29:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rfmjOrxH3VRU; Thu, 30 Jan 2020 17:29:30 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF9588B877;
 Thu, 30 Jan 2020 17:29:29 +0100 (CET)
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Segher Boessenkool <segher@kernel.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Looking for history of tlbia macro
Message-ID: <5401eff3-e129-9430-e4d8-d8e4b692160b@c-s.fr>
Date: Thu, 30 Jan 2020 16:29:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi,

I'm looking for the history of the tlbia macro. At the time being, the 
tlbia macro performs 1024 tlbie, increasing the address by 0x1000 
between each tlbie.

I looked into the fullhistory linux repository it was changed from 128 
to 1024 at some point in time, but this was done in commit c57a0d4efdc8 
("Import 2.4.0-test2pre2") which is a huge commit without the details 
explaining the reason for this change.

In the e300 core manual, and in the ppc603e User manual, it is said to 
perform 32 tlbie for flushing the entire TLB tables.

In the ppc604, it is said to perform 64 tlbie.


1024 is huge and tlbia takes a lot more time than it should. Does 
anybody know which it was increased to 1024 ?


Christophe

