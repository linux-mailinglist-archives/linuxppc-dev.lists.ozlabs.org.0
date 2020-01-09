Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A884135FE2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 18:54:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ttz63tBRzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 04:54:10 +1100 (AEDT)
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
 header.s=mail header.b=F2yrOYUt; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ttxP0sfgzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 04:52:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47ttxG2WM3z9txHp;
 Thu,  9 Jan 2020 18:52:34 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=F2yrOYUt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id D9ctLdBUZqbw; Thu,  9 Jan 2020 18:52:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47ttxG1NMwz9txHl;
 Thu,  9 Jan 2020 18:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578592354; bh=FYx4kyu0guKehGok9fASqGVuxxVoy/XJcQO7YPTYaQc=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=F2yrOYUt44TvH+5O/nMl5vMshj2XKIRHohr5s+oeadn2dM2WIQzI2nCl/M7lAIkXW
 JxBLJ5s3We6Cyg3fWHtSz+ys/3or+bNkpzqXxrzX1drGWe8AHYgvp4LxAr7x2nNkum
 EEx91AF9jbgNwX3yge3UCqm+YIsT3UIhyIUywk4Y=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E09AE8B82E;
 Thu,  9 Jan 2020 18:52:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id za-1hAB_sfui; Thu,  9 Jan 2020 18:52:35 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F7B48B82D;
 Thu,  9 Jan 2020 18:52:35 +0100 (CET)
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Surprising code generated for vdso_read_begin()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
 luto@kernel.org, Segher Boessenkool <segher@kernel.crashing.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
Message-ID: <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
Date: Thu, 9 Jan 2020 17:52:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1577111363.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wondering why we get something so complicated/redundant for 
vdso_read_begin() <include/vdso/helpers.h>

static __always_inline u32 vdso_read_begin(const struct vdso_data *vd)
{
	u32 seq;

	while ((seq = READ_ONCE(vd->seq)) & 1)
		cpu_relax();

	smp_rmb();
	return seq;
}


  6e0:   81 05 00 f0     lwz     r8,240(r5)
  6e4:   71 09 00 01     andi.   r9,r8,1
  6e8:   41 82 00 10     beq     6f8 <__c_kernel_clock_gettime+0x158>
  6ec:   81 05 00 f0     lwz     r8,240(r5)
  6f0:   71 0a 00 01     andi.   r10,r8,1
  6f4:   40 82 ff f8     bne     6ec <__c_kernel_clock_gettime+0x14c>
  6f8:

r5 being vd pointer

Why the first triplet, not only the second triplet ? Something wrong 
with using READ_ONCE() for that ?

Christophe
