Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB214788F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 07:27:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483q1r2y4VzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 17:27:28 +1100 (AEDT)
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
 header.s=mail header.b=IXHw71jg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483q034cjpzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 17:25:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483pzz5cLxz9tyNG;
 Fri, 24 Jan 2020 07:25:51 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IXHw71jg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yJpettp7HOEK; Fri, 24 Jan 2020 07:25:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483pzz41gtz9tyNF;
 Fri, 24 Jan 2020 07:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579847151; bh=lJ1+jMnixtf3rj4GZ+pA1zFszDpc7oCJGloWFuxNhN4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IXHw71jg1Kvlg/eqqyrBnKWG+MaRC13Mt5rjRMQ3mQmCtHMJx3jAh4bGMaOQylu3A
 WP2KFyB+HuW+7qYPUSjWsATH0jxRMraKrBsbJoz46gaRjQ2eAxuwQCLVa6LdtPTl6h
 +UP2PeHULABqUHHnYUUFnFbXSIIKbBJilxOE0OXE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 37B908B83D;
 Fri, 24 Jan 2020 07:25:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YWp1fOtM3W3N; Fri, 24 Jan 2020 07:25:52 +0100 (CET)
Received: from [172.25.230.111] (po15451.idsi0.si.c-s.fr [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F08338B768;
 Fri, 24 Jan 2020 07:25:51 +0100 (CET)
Subject: Re: [PATCH] lib: Reduce user_access_begin() boundaries in
 strncpy_from_user() and strnlen_user()
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
References: <70f99f7474826883877e84f93224e937d9c974de.1579767339.git.christophe.leroy@c-s.fr>
 <CAHk-=wgcm5JzyacekDGQ4Ocoe-F5it-7-sbgU8oPnhwnSH3KAA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8de7ba48-7bf4-8d43-5dfc-dacf34f80537@c-s.fr>
Date: Fri, 24 Jan 2020 07:25:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgcm5JzyacekDGQ4Ocoe-F5it-7-sbgU8oPnhwnSH3KAA@mail.gmail.com>
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/01/2020 à 19:47, Linus Torvalds a écrit :
> On Thu, Jan 23, 2020 at 12:34 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> The range passed to user_access_begin() by strncpy_from_user() and
>> strnlen_user() starts at 'src' and goes up to the limit of userspace
>> allthough reads will be limited by the 'count' param.
>>
>> On 32 bits powerpc (book3s/32) access has to be granted for each 256Mbytes
>> segment and the cost increases with the number of segments to unlock.
>>
>> Limit the range with 'count' param.
> 
> Ack. I'm tempted to take this for 5.5 too, just so that the
> unquestionably trivial fixes are in that baseline, and the
> infrastructure is ready for any architecture that has issues like
> this.

It would be nice, then the user_access_begin stuff for powerpc could go 
for 5.6 without worring about.

Thanks
Christophe
