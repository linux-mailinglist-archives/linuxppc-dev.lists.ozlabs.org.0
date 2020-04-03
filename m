Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD8C19D516
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 12:33:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tx910r20zDrBG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 21:33:09 +1100 (AEDT)
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
 header.s=mail header.b=jMq3sDgX; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tx7N2d4lzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 21:31:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48tx7D2kWKzB09Zd;
 Fri,  3 Apr 2020 12:31:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jMq3sDgX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fxpLeDeeyK4w; Fri,  3 Apr 2020 12:31:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48tx7D0yTkzB09ZX;
 Fri,  3 Apr 2020 12:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585909896; bh=1g5oNHofjjfLW3HttKDXuIZ8MtNpuXtISYfJp6lVV1A=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=jMq3sDgXNpNY0NqV6duxrfnugyDSbqtO/VCd4hM9z8Bj8Q266R3Y1roKg0W+iL1nX
 SLGI05pqwzW1FC/RwVUyGCnc1pfOuzOtyWomabcpxpMfeLX2y+McKQj+TCBXL3ts9d
 mHFfpbemorK9x4D+H/rkKkjoXoof0CsoQ7oYJHcA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E0B38B94E;
 Fri,  3 Apr 2020 12:31:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id E41LG7ikl1US; Fri,  3 Apr 2020 12:31:37 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 87EA58B947;
 Fri,  3 Apr 2020 12:31:36 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] powerpc/64s: implement probe_kernel_read/write
 without touching AMR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200403093529.43587-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <558b6131-60b4-98b7-dc40-25d8dacea05a@c-s.fr>
Date: Fri, 3 Apr 2020 12:31:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403093529.43587-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/04/2020 à 11:35, Nicholas Piggin a écrit :
> There is no need to allow user accesses when probing kernel addresses.

I just discovered the following commit 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75a1a607bb7e6d918be3aca11ec2214a275392f4

This commit adds probe_kernel_read_strict() and probe_kernel_write_strict().

When reading the commit log, I understand that probe_kernel_read() may 
be used to access some user memory. Which will not work anymore with 
your patch.

Isn't it probe_kernel_read_strict() and probe_kernel_write_strict() that 
you want to add ?

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> v2:
> - Enable for all powerpc (suggested by Christophe)
> - Fold helper function together (Christophe)
> - Rename uaccess.c to maccess.c to match kernel/maccess.c.
> 
>   arch/powerpc/include/asm/uaccess.h | 25 +++++++++++++++-------
>   arch/powerpc/lib/Makefile          |  2 +-
>   arch/powerpc/lib/maccess.c         | 34 ++++++++++++++++++++++++++++++

x86 does it in mm/maccess.c

>   3 files changed, 52 insertions(+), 9 deletions(-)
>   create mode 100644 arch/powerpc/lib/maccess.c
> 

Christophe
