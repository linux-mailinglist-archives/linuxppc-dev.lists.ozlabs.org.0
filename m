Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821B1603AE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 11:47:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48L3jM3QHZzDqfc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 21:47:35 +1100 (AEDT)
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
 header.s=mail header.b=RMQrDTHX; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48L3gq3JRGzDqdt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 21:46:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48L3gh69Lpz9tyMB;
 Sun, 16 Feb 2020 11:46:08 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RMQrDTHX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0F5rpVhkSbpS; Sun, 16 Feb 2020 11:46:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48L3gh3dBjz9tyM9;
 Sun, 16 Feb 2020 11:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581849968; bh=puEVphfmlLbrWTO3mdDB17WkluHf49q+nkCLHU1WEPk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RMQrDTHXiSIvSNdSJIUAuTLTwTBfKbldAHrwtZjJ0BW+ZG7c0EUq537f7BNPK+LIN
 e+qzSqPhQUdW5m9f0ovUN5sc2R9fpgjJRx6JMSfOyIGDK3OikFgbqf4WNmfnjBWb14
 Yj8xq1+79SXISvpVp+Jg6Y8NZ4c+QrYGyIAwuT0U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63ADD8B784;
 Sun, 16 Feb 2020 11:46:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GYiIMEW0V5j7; Sun, 16 Feb 2020 11:46:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 992958B755;
 Sun, 16 Feb 2020 11:45:59 +0100 (CET)
Subject: Re: [PATCH v2 00/13] mm: remove __ARCH_HAS_5LEVEL_HACK
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@kernel.org>
References: <20200216081843.28670-1-rppt@kernel.org>
 <20200216082230.GV25745@shell.armlinux.org.uk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d6691709-30ce-4d28-0b7b-34f1fa3b4e6f@c-s.fr>
Date: Sun, 16 Feb 2020 11:45:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200216082230.GV25745@shell.armlinux.org.uk>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 linux-arch@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Marc Zyngier <maz@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/02/2020 à 09:22, Russell King - ARM Linux admin a écrit :
> On Sun, Feb 16, 2020 at 10:18:30AM +0200, Mike Rapoport wrote:
>> From: Mike Rapoport <rppt@linux.ibm.com>
>>
>> Hi,
>>
>> These patches convert several architectures to use page table folding and
>> remove __ARCH_HAS_5LEVEL_HACK along with include/asm-generic/5level-fixup.h.
>>
>> The changes are mostly about mechanical replacement of pgd accessors with p4d
>> ones and the addition of higher levels to page table traversals.
>>
>> All the patches were sent separately to the respective arch lists and
>> maintainers hence the "v2" prefix.
> 
> You fail to explain why this change which adds 488 additional lines of
> code is desirable.
> 

The purpose of the series, ie droping a HACK, is worth it.

However looking at the powerpc patch I have the feeling that this series 
goes behind its purpose.

The number additional lines could be deeply reduced I think if we limit 
the patches to the strict minimum, ie just do things like below instead 
of adding lots of handling of useless levels.

Instead of doing things like:

-	pud = NULL;
+	p4d = NULL;
  	if (pgd_present(*pgd))
-		pud = pud_offset(pgd, gpa);
+		p4d = p4d_offset(pgd, gpa);
+	else
+		new_p4d = p4d_alloc_one(kvm->mm, gpa);
+
+	pud = NULL;
+	if (p4d_present(*p4d))
+		pud = pud_offset(p4d, gpa);
  	else
  		new_pud = pud_alloc_one(kvm->mm, gpa);

It could be limited to:

  	if (pgd_present(*pgd))
-		pud = pud_offset(pgd, gpa);
+		pud = pud_offset(p4d_offset(pgd, gpa), gpa);
  	else
  		new_pud = pud_alloc_one(kvm->mm, gpa);


Christophe
