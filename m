Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE6240836
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:13:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQKGQ2SCnzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 01:13:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQKCX4xY1zDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 01:10:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BQKCD51skz9v0GZ;
 Mon, 10 Aug 2020 17:10:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yI8csEgIiygU; Mon, 10 Aug 2020 17:10:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BQKCD3c98z9v0GT;
 Mon, 10 Aug 2020 17:10:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D8238B967;
 Mon, 10 Aug 2020 17:10:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WdhuVDZ3HBdc; Mon, 10 Aug 2020 17:10:22 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 53D328B965;
 Mon, 10 Aug 2020 17:10:22 +0200 (CEST)
Subject: Re: [PATCH] Documentation/features: refresh powerpc arch support files
To: Tobias Klauser <tklauser@distanz.ch>, Jonathan Corbet <corbet@lwn.net>
References: <20200810100906.3805-1-tklauser@distanz.ch>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4b6b65e8-ec79-ebf0-0ab5-7b48182584f1@csgroup.eu>
Date: Mon, 10 Aug 2020 17:09:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200810100906.3805-1-tklauser@distanz.ch>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/08/2020 à 12:09, Tobias Klauser a écrit :
> Support for these was added by commit aa65ff6b18e0 ("powerpc/64s:
> Implement queued spinlocks and rwlocks").
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>   Documentation/features/locking/queued-rwlocks/arch-support.txt  | 2 +-
>   .../features/locking/queued-spinlocks/arch-support.txt          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/features/locking/queued-rwlocks/arch-support.txt b/Documentation/features/locking/queued-rwlocks/arch-support.txt
> index 5c6bcfcf8e1f..4dd5e554873f 100644
> --- a/Documentation/features/locking/queued-rwlocks/arch-support.txt
> +++ b/Documentation/features/locking/queued-rwlocks/arch-support.txt
> @@ -22,7 +22,7 @@
>       |       nios2: | TODO |
>       |    openrisc: |  ok  |
>       |      parisc: | TODO |
> -    |     powerpc: | TODO |
> +    |     powerpc: |  ok  |

In your commit log you are refering to a commit titled "powerpc/64s:"

Are you sure it is now OK for all powerpc, not only for book3s/64 as 
suggested by yout text ?

Christophe

>       |       riscv: | TODO |
>       |        s390: | TODO |
>       |          sh: | TODO |
> diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
> index b55e420a34ea..b16d4f71e5ce 100644
> --- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
> +++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
> @@ -22,7 +22,7 @@
>       |       nios2: | TODO |
>       |    openrisc: |  ok  |
>       |      parisc: | TODO |
> -    |     powerpc: | TODO |
> +    |     powerpc: |  ok  |
>       |       riscv: | TODO |
>       |        s390: | TODO |
>       |          sh: | TODO |
> 
