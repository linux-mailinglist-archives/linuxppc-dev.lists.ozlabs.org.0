Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748FCE8C7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 17:12:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472c766NtRzF38R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 03:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="TpSeXOFU"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472c4q0LmqzF37L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 03:10:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 472c4g1g6lz9v10P;
 Tue, 29 Oct 2019 17:10:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TpSeXOFU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UpHV0XhQAQYQ; Tue, 29 Oct 2019 17:10:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 472c4g0Tzcz9v10L;
 Tue, 29 Oct 2019 17:10:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572365427; bh=tYE4s7/uuajXlCR0ChE0EZH9O5AUjNkXcOLUIcjs8NY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TpSeXOFUE6NM+JYOdlv64UW/+4WUPFrGoh6k/O+xW8QDuERdgv/D7VGAmufQO+FN1
 fIXCp5L6bMBYoYiAfV/u7tcK2KH038p2p1K3CJmCtNvTTH7ywxZIjUCdosgqOj4iTS
 MwKfe1IXwrU0ed97mqGh403IgJyyisv4QNCd1O+s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96B7E8B86F;
 Tue, 29 Oct 2019 17:10:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7udaYobtxUaO; Tue, 29 Oct 2019 17:10:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35F7F8B86A;
 Tue, 29 Oct 2019 17:10:28 +0100 (CET)
Subject: Re: [PATCH v2 1/8] powerpc/32: Add VDSO version of getcpu
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
 <27d699092118ee8d21741c08a6ff7e4c65effdf2.1566491310.git.christophe.leroy@c-s.fr>
 <87h85aw3r9.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5088c94c-3c80-0799-08a2-f1d53b95380b@c-s.fr>
Date: Tue, 29 Oct 2019 17:10:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87h85aw3r9.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/09/2019 à 07:51, Michael Ellerman a écrit :
> 
> We are still in the middle of the years long process of removing the
> "magic" syscall on 64-bit:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/kernel/exceptions-64s.S?commit=4d856f72c10ecb060868ed10ff1b1453943fc6c8#n1578
>   
> 
> Can we not add another one on 32-bit?
> 
> Is it really such a fast path that it's worth putting a wart in the
> syscall entry like that?
> 
> Is there some other method? On s390 they have a per-cpu VDSO page, that
> would be a nice option. How we do that would be specific to a particular
> MMU, and maybe not even possible with some MMUs. So maybe that's not
> feasible.

Ok, for now I remove the fast syscall and only keep the VDSO getcpu() 
for non SMP.

I think we may in the future implement a per-cpu VDSO page that will be 
mapped to the process based on the CPU it is running on. I need to look 
at that in more details.

Christophe

