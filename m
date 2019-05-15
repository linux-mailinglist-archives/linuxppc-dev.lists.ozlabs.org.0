Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D931E8A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:54:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453lfH3xKNzDqQ5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="U7/Xnsfn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453lRG2wn4zDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:44:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453lR94ksXz9vDbb;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=U7/Xnsfn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cDrn7JUJAzaL; Wed, 15 May 2019 08:44:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453lR93ZqGz9vDbZ;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557902693; bh=grBuY5owxUGP4FNaEiDCJS+hfjwHv093FTB3bCsWADA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=U7/XnsfnUZL6wj//NWeenDQU2xzlndXW5H9rNSjYYIlXy4xUVi7uDGaoyxZRyZcMn
 +KoFChEUzjIWoGmWw5ggZglbMqsQEF5EAzKcslHXCNyYldZMvQIJJTxl6YFQdT3Cer
 buEuD0lVwX57p8FD0I5gyOIKH3hDAEwSBq9VMUjo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A42F8B7DF;
 Wed, 15 May 2019 08:44:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qxYpZ6wfXh55; Wed, 15 May 2019 08:44:54 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B4DE8B7DD;
 Wed, 15 May 2019 08:44:54 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc/mm: Implement STRICT_MODULE_RWX
To: Christoph Hellwig <hch@infradead.org>
References: <df502ffe07caa38c46b0144fc824fff447f4105b.1557901092.git.christophe.leroy@c-s.fr>
 <20190515064205.GB15778@infradead.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <04044ae8-1cd8-108b-f436-76c606cb3aea@c-s.fr>
Date: Wed, 15 May 2019 08:44:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515064205.GB15778@infradead.org>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/05/2019 à 08:42, Christoph Hellwig a écrit :
>> +static int change_page_ro(pte_t *ptep, pgtable_t token, unsigned long addr, void *data)
> 
> There are a couple way too long lines like this in the patch.
> 

powerpc arch accepts 90 chars per line, see arch/powerpc/tools/checkpatch.pl

Christophe
