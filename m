Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA1379ED6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 06:54:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfQZW04GRz3bTv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 14:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfQZ65BJ6z2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 14:54:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FfQYx566Pz9sdc;
 Tue, 11 May 2021 06:54:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHqyZRKRWhrq; Tue, 11 May 2021 06:54:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FfQYx48Qgz9sdb;
 Tue, 11 May 2021 06:54:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C0208B79E;
 Tue, 11 May 2021 06:54:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rTdXQYM9Q2Zd; Tue, 11 May 2021 06:54:13 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E958C8B766;
 Tue, 11 May 2021 06:54:12 +0200 (CEST)
Subject: Re: [PATCH] powerpc/legacy_serial: Fix UBSAN:
 array-index-out-of-bounds
To: Michael Ellerman <mpe@ellerman.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <d5e3c8e66bad3725d7d48d0e45c4b7eb7c02631d.1620455671.git.christophe.leroy@csgroup.eu>
 <20210510211444.GE10366@gate.crashing.org>
 <87sg2uxe7h.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c3d6c5c5-0eb8-bad5-91f9-fea01eaeef37@csgroup.eu>
Date: Tue, 11 May 2021 06:54:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87sg2uxe7h.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, pmenzel@molgen.mpg.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/05/2021 à 03:16, Michael Ellerman a écrit :
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> 
>> On Sat, May 08, 2021 at 06:36:21AM +0000, Christophe Leroy wrote:
>>> UBSAN complains when a pointer is calculated with invalid
>>> 'legacy_serial_console' index, allthough the index is verified
>>> before dereferencing the pointer.
>>
>> Addressing like this is UB already.
>>
>> You could just move this:
>>
>>> -	if (legacy_serial_console < 0)
>>> -		return 0;
>>
>> to before
>>
>>> -	struct legacy_serial_info *info = &legacy_serial_infos[legacy_serial_console];
>>> -	struct plat_serial8250_port *port = &legacy_serial_ports[legacy_serial_console];
>>
>> and no other change is necessary.
> 
> Yeah I sent a v2 doing that, thanks.
> 

I wanted something looking similar to setup_legacy_serial_console(), but of course this also works.

Christophe
