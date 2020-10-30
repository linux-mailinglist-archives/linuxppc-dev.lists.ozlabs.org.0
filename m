Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CEF29FCFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 06:20:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMrHr37B5zDqtj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 16:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMrFs4KWQzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 16:19:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZWtYU3oS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMrFp2wQkz9sSn;
 Fri, 30 Oct 2020 16:19:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604035152;
 bh=g17NLadQlMNHRS3Ht5UYozcNciyiTHzLrix1dfy+teg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZWtYU3oSZTvC/DroUBsF45c5IzIXb9Ywz7/J0acvBPlTOIC27HaTAZBYB1mteG1AQ
 2945SGAhJd2MoV9nM98Q4otxrL2LRV4tWbDT0kphAbPQfHfGMJCCKR2/ra8WxRT/H4
 RCxDdE6kuqmmiO2sF56YnnRqVOhupzboRbIDFiVknOSEl2irTF6sYNo4gJG1NHmTPg
 JYFzBZDiFZxLFdciSH8jFET35mJv/DBAvReGwuzYQqBRlhDNfAiD7Md2MLlbHHUlTt
 9dm+DM5qKPb/27a4kgX/G8IfWfEbB+jtP5CYahjGPAGl0+SNCMcsStY+iEwrWUKdo/
 WdvWpTqgItTfw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andreas Schwab <schwab@linux-m68k.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Setup the early hash table at all time.
In-Reply-To: <87wnz8vizm.fsf@igel.home>
References: <b8f8101c368b8a6451844a58d7bd7d83c14cf2aa.1601566529.git.christophe.leroy@csgroup.eu>
 <87wnz8vizm.fsf@igel.home>
Date: Fri, 30 Oct 2020 16:19:07 +1100
Message-ID: <87y2jouw8k.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> writes:
> On Okt 01 2020, Christophe Leroy wrote:
>
>> At the time being, an early hash table is set up when
>> CONFIG_KASAN is selected.
>>
>> There is nothing wrong with setting such an early hash table
>> all the time, even if it is not used. This is a statically
>> allocated 256 kB table which lies in the init data section.
>>
>> This makes the code simpler and may in the future allow to
>> setup early IO mappings with fixmap instead of hard coding BATs.
>>
>> Put create_hpte() and flush_hash_pages() in the .ref.text section
>> in order to avoid warning for the reference to early_hash[]. This
>> reference is removed by MMU_init_hw_patch() before init memory is
>> freed.
>
> This breaks booting on the iBook G4.

Do you get an oops or anything?

cheers
