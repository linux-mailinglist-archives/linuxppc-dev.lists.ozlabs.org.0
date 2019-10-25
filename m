Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D50CBE442E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 09:13:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zwLR6lR1zDqgq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 18:13:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="JS6Rw9Wo"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zwJV5hfhzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 18:11:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46zwJL1km6z9txyl;
 Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=JS6Rw9Wo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IEyuu55Vu2Vj; Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46zwJL044Jz9txyd;
 Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571987474; bh=sSY9vZFiyvVRvxrTbg3cBY9vh4bHCPcOU8OggoNJn50=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JS6Rw9Woz5UGQqHdTS6uzWgmc4CU/P/yOx+M2iQQgUsIUyeQU6CEy1rN1WbGM/gMX
 jg5kH3n063w2jEkgx41+z8O5phWdZyM3jwWcRyaHHpi22TkWJphSF18ZBHt9X26ALg
 0sa7mSxQ44NMG02wKJaVu3L7vo7n7mt0UVXaQK8I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF5238B7C7;
 Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NUWV8rK7Wu_n; Fri, 25 Oct 2019 09:11:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5FF28B7BE;
 Fri, 25 Oct 2019 09:11:12 +0200 (CEST)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
 helpers
To: Qian Cai <cai@lca.pw>, Anshuman Khandual <Anshuman.Khandual@arm.com>
References: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
 <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3cfec421-4006-4159-ca32-313ff5196ff9@c-s.fr>
Date: Fri, 25 Oct 2019 09:11:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/10/2019 à 07:52, Qian Cai a écrit :
> 
> 
>> On Oct 24, 2019, at 11:45 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>
>> Nothing specific. But just tested this with x86 defconfig with relevant configs
>> which are required for this test. Not sure if it involved W=1.
> 
> No, it will not. It needs to run like,
> 
> make W=1 -j 64 2>/tmp/warns
> 

Are we talking about this peace of code ?

+static unsigned long __init get_random_vaddr(void)
+{
+	unsigned long random_vaddr, random_pages, total_user_pages;
+
+	total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
+
+	random_pages = get_random_long() % total_user_pages;
+	random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
+
+	WARN_ON((random_vaddr > TASK_SIZE) ||
+		(random_vaddr < FIRST_USER_ADDRESS));
+	return random_vaddr;
+}
+

ramdom_vaddr is unsigned,
random_pages is unsigned and lower than total_user_pages

So the max value random_vaddr can get is FIRST_USER_ADDRESS + 
((TASK_SIZE - FIRST_USER_ADDRESS - 1) / PAGE_SIZE) * PAGE_SIZE = 
TASK_SIZE - 1
And the min value random_vaddr can get is FIRST_USER_ADDRESS (that's 
when random_pages = 0)

So the WARN_ON() is just unneeded, isn't it ?

Christophe
