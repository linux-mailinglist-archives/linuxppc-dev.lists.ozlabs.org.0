Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B229520CCA7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 08:05:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wH606KVTzDqg1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 16:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wH4Q02PhzDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 16:04:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AVLg3ibs; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wH4P2XnSz9sQt;
 Mon, 29 Jun 2020 16:04:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593410645;
 bh=rCQ9UWEaL81XNzFf+M1vO61UGj8xcpAMew6CAkzUbAk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AVLg3ibs8WXrZB52xgAmxhuUhTrrl91U87AEtJTXKj6vaOb8oXaq4spqIRIDf2J7H
 SljLkVTjrk/Du/nMPasTChhWfwrJCg0TPVJNlKe6H0b4Z6c5SAdnk1Cxf61RLO55CH
 b0omNwc8V1f5uZ5q9vawgcdtCcyWuO//8naB3E4/+UBcFrc/j988kDH3GZ2nxI8ZVs
 XP1bPqb1q84mE2omSa2SYatDH868N1hjI0VBKBJkyG4ntlLezVSB67jYpzxgH+ruYd
 reeEN21hJFfhjxwjqZXeaNqEPdhw23fqHesy+RG1WJqXBp8L0ixbjtKx2SK9eS1S5t
 jY1oOW42I/0Sw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bin Meng <bmeng.cn@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc: Drop CONFIG_MTD_M25P80 in 85xx-hw.config
In-Reply-To: <CAEUhbmUj4iC1+4Y=93zpj+aCBqU1ySOHXvQgJHmxNx__UWduCQ@mail.gmail.com>
References: <1588394694-517-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmUj4iC1+4Y=93zpj+aCBqU1ySOHXvQgJHmxNx__UWduCQ@mail.gmail.com>
Date: Mon, 29 Jun 2020 16:06:20 +1000
Message-ID: <87ftae8kyr.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bin Meng <bmeng.cn@gmail.com> writes:
> On Sat, May 2, 2020 at 12:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Drop CONFIG_MTD_M25P80 that was removed in
>> commit b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v2:
>> - correct the typo (5xx => 85xx) in the commit title
>>
>>  arch/powerpc/configs/85xx-hw.config | 1 -
>>  1 file changed, 1 deletion(-)
>>
>
> It seems this patch isn't applied anywhere. Ping?

I'll grab it.

cheers
