Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384F187E03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:18:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hTdX48wPzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:18:08 +1100 (AEDT)
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
 header.s=mail header.b=Y0+ClKkA; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hTbt2jlNzDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:16:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hTbn465tz9txmZ;
 Tue, 17 Mar 2020 11:16:37 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Y0+ClKkA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Aklas_zFK9XK; Tue, 17 Mar 2020 11:16:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hTbn2wrlz9txmY;
 Tue, 17 Mar 2020 11:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584440197; bh=gHfeGuNMX9DiSTA3t8ffi2E0nIxwRTV7SW2fZ5cXtlo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Y0+ClKkAHkAbXdn90tqR12mVHVp0XeMaovQfiDBqjooBwzvtHjR0rMk0mG+IzuOS0
 8bPRYV+6KK9qTLUHnyCKT+YERwRt3+TfAVBqEXOnsHFb7IIPuczSnCxRxINs9o51s9
 o/u94T8qb60NVbDyIXCJigBoqFkPXg06UqIDHD+E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48BD48B787;
 Tue, 17 Mar 2020 11:16:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ui0mrgBY-Bua; Tue, 17 Mar 2020 11:16:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F50A8B785;
 Tue, 17 Mar 2020 11:16:36 +0100 (CET)
Subject: Re: [PATCH 02/15] powerpc/watchpoint: Add SPRN macros for second DAWR
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-3-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0a45786d-f44b-8717-3aed-dfcfcb1856bb@c-s.fr>
Date: Tue, 17 Mar 2020 11:16:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309085806.155823-3-ravi.bangoria@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2020 à 09:57, Ravi Bangoria a écrit :
> Future Power architecture is introducing second DAWR. Add SPRN_ macros
> for the same.

I'm not sure this is called 'macros'. For me a macro is something more 
complex.

For me those are 'constants'.

Christophe

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/reg.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 156ee89fa9be..062e74cf41fd 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -284,6 +284,7 @@
>   #define   CTRL_TE	0x00c00000	/* thread enable */
>   #define   CTRL_RUNLATCH	0x1
>   #define SPRN_DAWR0	0xB4
> +#define SPRN_DAWR1	0xB5
>   #define SPRN_RPR	0xBA	/* Relative Priority Register */
>   #define SPRN_CIABR	0xBB
>   #define   CIABR_PRIV		0x3
> @@ -291,6 +292,7 @@
>   #define   CIABR_PRIV_SUPER	2
>   #define   CIABR_PRIV_HYPER	3
>   #define SPRN_DAWRX0	0xBC
> +#define SPRN_DAWRX1	0xBD
>   #define   DAWRX_USER	__MASK(0)
>   #define   DAWRX_KERNEL	__MASK(1)
>   #define   DAWRX_HYP	__MASK(2)
> 
