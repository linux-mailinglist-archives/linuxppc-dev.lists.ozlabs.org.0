Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D651324A2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 12:16:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sVFb1QlkzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 22:16:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="rwK+j9I7"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sV8M42SdzDqKP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 22:12:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47sV8H0JFYz9txx7;
 Tue,  7 Jan 2020 12:12:15 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rwK+j9I7; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jCejGDAUkE0B; Tue,  7 Jan 2020 12:12:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47sV8G6Gjxz9txwm;
 Tue,  7 Jan 2020 12:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578395534; bh=la0IG0BtQexKSwezgArYwc5K8/b99Z1L+VnSv47ODLc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rwK+j9I7XkNWaOylEDE2KCxzXfqZgvT/A2AS/1e+wRBliIYY4p6PRjUta5+jxCPC2
 upYSQEeHEyqygFWNb0lC0WgWSgfdKBI+1y2NnIQQkE0wSwU/Dc6EdNZv2y78nVis4y
 4QTWTdh3H6XXi+0JW5kN3GtO0rVLYH9KkXykx6KE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 166578B7CF;
 Tue,  7 Jan 2020 12:12:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6iGsHtuS3ShE; Tue,  7 Jan 2020 12:12:16 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D9678B7BF;
 Tue,  7 Jan 2020 12:12:15 +0100 (CET)
Subject: Re: [PATCH] powerpc: add support for folded p4d page tables
To: Mike Rapoport <rppt@kernel.org>
References: <20191209150908.6207-1-rppt@kernel.org>
 <20200102081059.GA12063@rapoport-lnx>
 <20200102174231.Horde.vA_c3sSHB1vhx2H9Ce-i9Q1@messagerie.si.c-s.fr>
 <20200105070236.GA7261@rapoport-lnx>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <64856046-97d5-bb10-b5d1-e9fb857c6123@c-s.fr>
Date: Tue, 7 Jan 2020 12:12:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200105070236.GA7261@rapoport-lnx>
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/01/2020 à 08:02, Mike Rapoport a écrit :
> On Thu, Jan 02, 2020 at 05:42:31PM +0100, Christophe Leroy wrote:
>> Mike Rapoport <rppt@kernel.org> a écrit :
>>
>>> Any updates on this?
>>
>> Checkpatch reported several points, see
>> https://patchwork.ozlabs.org/patch/1206344/
> 
> Well, for the most part checkpatch is unhappy because I've tried to keep
> the changes consistent with the old code. And, there are some lines over 90
> characters that do no seem worth breaking.
> 

Yes I see, many places we have stuff like:

pmd = pmd_offset(pud_offset(pgd_offset(mm, start), start), start);

I sent a patch to refactor that. This should help fixing that long line 
issue and reducing the number of lines impacted by your patch.

Christophe
