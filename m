Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE46B9FE7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 11:30:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JL7h1cSvzDr1b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:30:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Ul/44ofX"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JL5f0z1QzDr1G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 19:28:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46JL5X2c16z9v031;
 Wed, 28 Aug 2019 11:28:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ul/44ofX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ls7tMgLEHoMY; Wed, 28 Aug 2019 11:28:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46JL5X1T8Xz9v030;
 Wed, 28 Aug 2019 11:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566984512; bh=3hfjeQ0iHm/0/GKl3TzSdJ5YO+4hBp1jT9/FRCQ9WKE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Ul/44ofXp6FQAtmujmWBww76qFFB1uuPFSbdJox3zYv2ngn2JJXuOF8QlMKSBA9Ao
 oCHfhOSyVpyUESlUnIJSOOJsvshqCpVIz1zpNBgr3caDPuRES1Qco92T2sOBvf6XqK
 SQjrdYznO0owpeorww4QTbC5+6HtOWWx4v7YI0iA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A9238B87B;
 Wed, 28 Aug 2019 11:28:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PHPBVcJno5ce; Wed, 28 Aug 2019 11:28:33 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CB748B856;
 Wed, 28 Aug 2019 11:28:33 +0200 (CEST)
Subject: Re: [PATCH] powerpc/64: interrupt return in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190828090606.5028-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <33052597-ce23-780d-bb38-f50ecd78ff3a@c-s.fr>
Date: Wed, 28 Aug 2019 11:28:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828090606.5028-1-npiggin@gmail.com>
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



Le 28/08/2019 à 11:06, Nicholas Piggin a écrit :
> This is a work in progress that goes on top of the syscalls in C patch.
> It's not quite complete, 64e low level exit is not taken care of, and
> the new return is hacked into the existing interrupt handlers pretty
> quickly (e.g., full gprs handling is still ugly and could be cleaned),
> but that code touches exception-64s.S which is under heavy modification
> in parallel so I will rebase on top of that before polishing it properly.
> I will also try to convert to more IS_ENABLED() for Christophe.

I am flattered.

I guess at the end you are not doing it for me but because it is on 
purpose in your code improvement process.

See 
https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation

Christophe
