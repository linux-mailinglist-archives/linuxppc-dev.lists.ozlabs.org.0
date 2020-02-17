Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCD160B06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 07:47:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LZKr6yY3zDqg9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 17:47:28 +1100 (AEDT)
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
 header.s=mail header.b=Jkfz6bJu; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LZHz0L6JzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 17:45:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48LZHp5ycKz9tyTQ;
 Mon, 17 Feb 2020 07:45:42 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Jkfz6bJu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2CQ5mQXasQID; Mon, 17 Feb 2020 07:45:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48LZHp4Ys7z9tyTL;
 Mon, 17 Feb 2020 07:45:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581921942; bh=EaltpDTgnTrDBrsgY6UJWwdsZ8tEVbQgtxpz7LvsQrs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Jkfz6bJu21tolva67YXh2dk19yfmBfDCJTRJwnnZdeKJSj2QkUXlcEAPDSQqDVduo
 PPmHS5kfH8tLAt5DnL9UwxC4nWXDOogfv4OMZXGRl9BNZ2g1VYBb+M5199VUcWsmbj
 1RZ2vD+qrTlc0QaZPEdth7m+baweLU1QKzSHI/cI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0942F8B79C;
 Mon, 17 Feb 2020 07:45:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zPiOIOz8XNJK; Mon, 17 Feb 2020 07:45:46 +0100 (CET)
Received: from [172.25.230.102] (unknown [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D32F58B755;
 Mon, 17 Feb 2020 07:45:46 +0100 (CET)
Subject: Re: [PATCH v7 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
To: Michael Neuling <mikey@neuling.org>, Daniel Axtens <dja@axtens.net>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20200213004752.11019-1-dja@axtens.net>
 <20200213004752.11019-5-dja@axtens.net>
 <66bd9d8eb682cda2d22bea0fd4035ea8e0a3c1fb.camel@neuling.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a060e08e-c119-0d37-d220-409b3d7539d3@c-s.fr>
Date: Mon, 17 Feb 2020 07:45:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <66bd9d8eb682cda2d22bea0fd4035ea8e0a3c1fb.camel@neuling.org>
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



Le 17/02/2020 à 00:08, Michael Neuling a écrit :
> Daniel.
> 
> Can you start this commit message with a simple description of what you are
> actually doing? This reads like you've been on a long journey to Mordor and
> back, which as a reader of this patch in the long distant future, I don't care
> about. I just want to know what you're implementing.
> 
> Also I'm struggling to review this as I don't know what software or hardware
> mechanisms you are using to perform sanitisation.

KASAN is standard, it's simply using GCC ASAN in kernel mode, ie kernel 
is built with -fsanitize=kernel-address 
(https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html)

You have more details there: 
https://www.kernel.org/doc/html/latest/dev-tools/kasan.html

Christophe
