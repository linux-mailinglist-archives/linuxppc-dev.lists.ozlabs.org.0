Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7E155254
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 07:15:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DQ5M5bftzDqbk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 17:15:19 +1100 (AEDT)
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
 header.s=mail header.b=VBI9HpSi; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DQ3W4GnDzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 17:13:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48DQ3P0lRqz9vCRd;
 Fri,  7 Feb 2020 07:13:37 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VBI9HpSi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gzVgY-i6r0ul; Fri,  7 Feb 2020 07:13:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48DQ3N6p6Nz9vCRc;
 Fri,  7 Feb 2020 07:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581056016; bh=bbu/3mso59R+gEjJVL9ywigwi8zK6YunGCEdD2uledg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VBI9HpSipL/hmjUvWCjqwBXcNu2OQ6sDKKNiyBCjPP2weW1+lAERYRTTL8epFki0u
 dezve6NbgxgTXvP+vTg2wohpL0lfpONr+lbced14i8eWELCMc1xmYkdVhSbk0bbhZN
 3uqg5zrxVlgYsbugBH4aziHQ1KZv8tx/m6i/AMCI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E80318B8AE;
 Fri,  7 Feb 2020 07:13:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cciXfyni8DUB; Fri,  7 Feb 2020 07:13:37 +0100 (CET)
Received: from [172.25.230.107] (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C04DA8B75B;
 Fri,  7 Feb 2020 07:13:37 +0100 (CET)
Subject: Re: [PATCH v5 17/17] powerpc/32s: Enable CONFIG_VMAP_STACK
To: Guenter Roeck <linux@roeck-us.net>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
 <2e2509a242fd5f3e23df4a06530c18060c4d321e.1576916812.git.christophe.leroy@c-s.fr>
 <20200206203146.GA23248@roeck-us.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c6285f2a-f8f5-0d97-2d80-061da1f1a7fc@c-s.fr>
Date: Fri, 7 Feb 2020 07:13:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206203146.GA23248@roeck-us.net>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/02/2020 à 21:31, Guenter Roeck a écrit :
> On Sat, Dec 21, 2019 at 08:32:38AM +0000, Christophe Leroy wrote:
>> A few changes to retrieve DAR and DSISR from struct regs
>> instead of retrieving them directly, as they may have
>> changed due to a TLB miss.
>>
>> Also modifies hash_page() and friends to work with virtual
>> data addresses instead of physical ones. Same on load_up_fpu()
>> and load_up_altivec().
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> This patch results in qemu boot failures (mac99 with pmac32_defconfig).
> Images fail silently; there is no console output. Reverting the patch
> fixes the problem. Bisect log is attached below.
> 
> Assuming this was tested on real hardware, am I correct to assume that qemu
> for ppc32 (more specifically, qemu's mac99 and g3beige machines) no longer
> works with the upstream kernel ?

Before submitting the series, I successfully tested:
- Real HW with powerpc 8xx
- Real HW with powerpc 832x
- Qemu's mac99

I'll re-check the upstream kernel.

In the mean time, you can still unselect CONFIG_VMAP_STACK in your config.

Christophe
