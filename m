Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3A10D850
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 17:16:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PflF6S7wzDqjG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 03:16:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="MIp0XX8k"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Pfhw559DzDr9S
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 03:14:23 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Pfhn6hbbz9vBLm;
 Fri, 29 Nov 2019 17:14:17 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MIp0XX8k; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id czFo_DUix5Vc; Fri, 29 Nov 2019 17:14:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Pfhn4lwGz9vBLl;
 Fri, 29 Nov 2019 17:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575044057; bh=FovemUvA6qctABDabS0NtDnUTnpAPHjSV1V8/RSSR9g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MIp0XX8k/I4wsfEgOYSzCsDkEXhTrmYqxehmxuBCm6XkDFcJq3T0hGxEYQ1Kz6NIG
 M7TpVa13ygd3AwlIJXHrwq1iQnMaePGf8TUnA+J1BqgPr3u+6+v9CF3rnVnRUCz+98
 lseISBglyZJmBfRPyJbcLqVhWJ//g3rACrqlq9/Y=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 42FDF8B8DE;
 Fri, 29 Nov 2019 17:14:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0j_ez_gOcD8Z; Fri, 29 Nov 2019 17:14:19 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 215048B8DC;
 Fri, 29 Nov 2019 17:14:19 +0100 (CET)
Subject: Re: Build failure on latest powerpc/merge (311ae9e159d8 io_uring: fix
 dead-hung for non-iter fixed rw)
To: Jens Axboe <axboe@kernel.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <71cf82d5-5986-43b7-cf1c-acba429a89d6@c-s.fr>
 <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <4ef71e74-848f-59d4-6b0b-d3a3c52095a0@c-s.fr>
Date: Fri, 29 Nov 2019 17:14:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
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
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/11/2019 à 17:04, Jens Axboe a écrit :
> On 11/29/19 6:53 AM, Christophe Leroy wrote:
>>     CC      fs/io_uring.o
>> fs/io_uring.c: In function ‘loop_rw_iter’:
>> fs/io_uring.c:1628:21: error: implicit declaration of function ‘kmap’
>> [-Werror=implicit-function-declaration]
>>       iovec.iov_base = kmap(iter->bvec->bv_page)
>>                        ^
>> fs/io_uring.c:1628:19: warning: assignment makes pointer from integer
>> without a cast [-Wint-conversion]
>>       iovec.iov_base = kmap(iter->bvec->bv_page)
>>                      ^
>> fs/io_uring.c:1643:4: error: implicit declaration of function ‘kunmap’
>> [-Werror=implicit-function-declaration]
>>       kunmap(iter->bvec->bv_page);
>>       ^
>>
>>
>> Reverting commit 311ae9e159d8 ("io_uring: fix dead-hung for non-iter
>> fixed rw") clears the failure.
>>
>> Most likely an #include is missing.
> 
> Huh weird how the build bots didn't catch that. Does the below work?

Yes it works, thanks.

Christophe
