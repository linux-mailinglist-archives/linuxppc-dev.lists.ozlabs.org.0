Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B71099E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 09:03:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mbxv2SjPzDqgB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 19:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eiNhmX/3"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MbvQ58T0zDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 19:01:19 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47MbvF4RBrz9txbj;
 Tue, 26 Nov 2019 09:01:13 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eiNhmX/3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KmC-aZ693UsB; Tue, 26 Nov 2019 09:01:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47MbvF2TGnz9txbg;
 Tue, 26 Nov 2019 09:01:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574755273; bh=Yl4+kZ1p5Cyb6s3+0jQVbC3UJyF9FtAmAp/UXPPoPNo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eiNhmX/3p1JSMZxMYYU53b3Uvj/rLBVVA1ZgG4CV7ArQenXRfe5Mjcmpel0LxhRo9
 PBCT/b4XU75Inbcs/D4NpzEKL6FDQFfbtBjKScGeZtPHcfq3AC+OCTURoNKjyVVviS
 BZNDVGsocwry4drv/vSThNE9hEkl9aWVnaJNzShI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4CBC28B7D8;
 Tue, 26 Nov 2019 09:01:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VvPLu6ECgQep; Tue, 26 Nov 2019 09:01:14 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EAFB88B771;
 Tue, 26 Nov 2019 09:01:13 +0100 (CET)
Subject: Re: [PATCH] powerpc/8xx: Fix permanently mapped IMMR region.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <ad9d45119a48a92bf122781d0c79c9407baa12d7.1566554026.git.christophe.leroy@c-s.fr>
 <87sgmlcu1x.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d22ac38c-0b03-fbc0-88d1-899e356fa487@c-s.fr>
Date: Tue, 26 Nov 2019 08:01:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87sgmlcu1x.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/18/2019 11:17 AM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> When not using large TLBs, the IMMR region is still
>> mapped as a whole block in the FIXMAP area.
>>
>> Do not remove pages mapped in the FIXMAP region when
>> initialising paging.
>>
>> Properly report that the IMMR region is block-mapped even
>> when not using large TLBs.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/mm/mem.c        |  8 --------
>>   arch/powerpc/mm/nohash/8xx.c | 13 +++++++------
>>   2 files changed, 7 insertions(+), 14 deletions(-)
> 
> This blows up pmac32_defconfig + qemu mac99 for me with:
> 
>    NET: Registered protocol family 1
>    RPC: Registered named UNIX socket transport module.
>    RPC: Registered udp transport module.
>    RPC: Registered tcp transport module.
>    RPC: Registered tcp NFSv4.1 backchannel transport module.
>    PCI: CLS 0 bytes, default 32
>    Trying to unpack rootfs image as initramfs...
>    BUG: Unable to handle kernel data access on write at 0xfffdf000

I tested it with pmac32_defconfig and qemu mac99 and don't get the problem:

NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 32
Initialise system trusted keyrings
workingset: timestamp_bits=30 max_order=15 bucket_order=0
NFS: Registering the id_resolver key type
Key type id_resolver registered
...

Looks like I don't get that 'Trying to unpack rootfs image as 
initramfs...', do you change anything to pmac32_defconfig ?

Anyway, when rebasing this patch on next branch, only the 
arch/powerpc/mm/nohash/8xx.c change remains. The other part is already 
applied through another patch.

So I believe the remaining part is safe to apply

Christophe

