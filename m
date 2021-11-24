Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 979F945C94B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 16:57:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzlxs250Pz3c5h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 02:57:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=E/pte9+S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=andrealmeid@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=E/pte9+S; 
 dkim-atps=neutral
X-Greylist: delayed 9294 seconds by postgrey-1.36 at boromir;
 Thu, 25 Nov 2021 02:56:27 AEDT
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzlx73jRmz2ymc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 02:56:25 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 57F7C1F45BC8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637769382; bh=zz/xw7PsWQON9rmJZojHTBxXbF24yxYHqhaUVP88TKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E/pte9+S/xU8DdTZ/vKpNhA3ylTQYBGSinvyN6mt+xZdQFKKHEb6Mmt84KbEzM5mZ
 OSPyhJ6sCmssRkBBHimK6onWi+F/fiAA5Ypad79m+N+kkn6BrMI3wqjRnjC5w47i2Q
 aPNdfcTSLCdquNNhzIMYwK9OlGuMqJafLR38PMnBjrRL+zm9bD++8vMrP9KIyqazlB
 tbunQevunpoo7PovcVIzyk1G/rHktU5H9JEaZdZEpb0Db+mq5nCjz2SQfKauqW6Gl0
 yoYNuJa5aw5Hl9JNwgtzD1fRyYNxpu0YlbF5Voaz4iL2LRbsvhzZ/6BwDUd1b2lpYs
 25pmRI9iK1Hpw==
Message-ID: <91a64059-f301-4812-56ea-38755ccae5d7@collabora.com>
Date: Wed, 24 Nov 2021 12:56:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
 <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 lkft-triage@lists.linaro.org, Max Filippov <jcmvbkbc@gmail.com>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 sparclinux <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Waiman Long <longman@redhat.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Rob Landley <rob@landley.net>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Às 11:29 de 24/11/21, Arnd Bergmann escreveu:
> On Wed, Nov 24, 2021 at 2:21 PM André Almeida <andrealmeid@collabora.com> wrote:
>>
>> Wireup futex_waitv syscall for all remaining archs.
>>
>> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> I double-checked that futex_waitv() doesn't need any architecture specific
> hacks, and that the list above is complete.

Thanks!

> 
> Should I take this through the asm-generic tree, or would you send it
> through the
> tip tree?
> 
I think that adding it to asm-generic tree make sense to me.
