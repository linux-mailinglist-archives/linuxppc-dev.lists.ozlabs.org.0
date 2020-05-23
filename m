Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A41DF9A0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 19:32:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Tr5G5hvbzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 03:32:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Tr3Y1LxbzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 03:30:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49Tr3M1FsRz9v0rq;
 Sat, 23 May 2020 19:30:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6AYhYT_9Gpsv; Sat, 23 May 2020 19:30:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49Tr3M0TyQz9v0rp;
 Sat, 23 May 2020 19:30:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DCA18B876;
 Sat, 23 May 2020 19:30:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F9Ne9NoMRqYB; Sat, 23 May 2020 19:30:25 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1121E8B86D;
 Sat, 23 May 2020 19:30:25 +0200 (CEST)
Subject: Re: Kernel bug in 5.7 for PPC32 on PowerBook G4 - bisected to commit
 697ece7
To: Larry Finger <Larry.Finger@lwfinger.net>
References: <2c361d8e-5e2a-cdd9-da8e-aa49a4f93cfd@lwfinger.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3e3e2343-d674-02e0-7b23-81636b472641@csgroup.eu>
Date: Sat, 23 May 2020 19:30:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2c361d8e-5e2a-cdd9-da8e-aa49a4f93cfd@lwfinger.net>
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
Cc: Paul Mackerras <paulus@samba.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Larry,

Le 23/05/2020 à 19:24, Larry Finger a écrit :
> Hi Christophe,
> 
> Although kernel 5.7.0-rc2 appeared to boot cleanly, it failed on my G4 
> when I tried to generate a new kernel. The following BUG message is logged:
> 

[...]

> 
> This problem was bisected to commit 697ece7 ("powerpc/32s: reorder Linux 
> PTE bits to better match Hash PTE bits").

Being reversed in new -rc , see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/87sgfsf4hs.fsf@mpe.ellerman.id.au/

> 
> If I had done more rigorous tests earlier, I would have found the bug 
> with more time to fix it before release of 5.7, but every other problem 
> I have found happened at boot, not when the machine had to swap.
> 
> Thanks,
> 
> Larry

Christophe
