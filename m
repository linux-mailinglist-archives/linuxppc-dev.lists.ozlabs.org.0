Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7513D428
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 07:14:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yv5z1MwkzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 17:13:59 +1100 (AEDT)
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
 header.s=mail header.b=QK7HarN0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yv3P2D7xzDqVp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 17:11:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47yv3F2lWzz9tyxn;
 Thu, 16 Jan 2020 07:11:37 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QK7HarN0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Di-bkWe_9lWV; Thu, 16 Jan 2020 07:11:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47yv3F1PY3z9tyxm;
 Thu, 16 Jan 2020 07:11:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579155097; bh=xRqzpqYgklhUuAL7jp3bXp5dZ0Y/iYZXSREAFSZsbP4=;
 h=From:Subject:To:Cc:Date:From;
 b=QK7HarN033G72DnS7TdeAf+tS4p1tby30waWF/TzlAh2obL4xFIJc7yK0LCqw9Jqu
 kpvzhm4dsgWSQFXg0JRENsH32Ds2N38A8fSJ7CEV4YTIe1LDIHSUddh5YgE8pR6Ris
 hLzvxBKH5F0s+GlWWCnm/il9+fEJwzcx+6acGUfs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 09AD48B78F;
 Thu, 16 Jan 2020 07:11:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cBDJ981SBkaD; Thu, 16 Jan 2020 07:11:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C14B88B776;
 Thu, 16 Jan 2020 07:11:37 +0100 (CET)
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: z constraint in powerpc inline assembly ?
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
Date: Thu, 16 Jan 2020 07:11:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Segher,

I'm trying to see if we could enhance TCP checksum calculations by 
splitting inline assembly blocks to give GCC the opportunity to mix it 
with other stuff, but I'm getting difficulties with the carry.

As far as I can read in the documentation, the z constraint represents 
'‘XER[CA]’ carry bit (part of the XER register)'

I've tried the following, but I get errors. Can you help ?

unsigned long cksum(unsigned long a, unsigned long b, unsigned long c)
{
	unsigned long sum;
	unsigned long carry;

	asm("addc %0, %2, %3" : "=r"(sum), "=z"(carry) : "r"(a), "r"(b));
	asm("adde %0, %0, %2" : "+r"(sum), "+z"(carry) : "r"(c));
	asm("addze %0, %0" : "+r"(sum) : "z"(carry));

	return sum;
}



csum.c: In function 'cksum':
csum.c:6:2: error: inconsistent operand constraints in an 'asm'
   asm("addc %0, %2, %3" : "=r"(sum), "=z"(carry) : "r"(a), "r"(b));
   ^
csum.c:7:2: error: inconsistent operand constraints in an 'asm'
   asm("adde %0, %0, %2" : "+r"(sum), "+z"(carry) : "r"(c));
   ^
csum.c:8:2: error: inconsistent operand constraints in an 'asm'
   asm("addze %0, %0" : "+r"(sum) : "z"(carry));
   ^

Thanks
Christophe

