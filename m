Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E14687AA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 22:41:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J636M4fXCz3cVj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 08:41:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=d/ltdb=qv=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
X-Greylist: delayed 301 seconds by postgrey-1.36 at boromir;
 Sun, 05 Dec 2021 01:15:42 AEDT
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5sDG5s01z2xsZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 01:15:42 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 12B2F2022B;
 Sat,  4 Dec 2021 15:10:33 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ns.iliad.fr (Postfix) with ESMTPS id 0592C20216;
 Sat,  4 Dec 2021 15:10:33 +0100 (CET)
Date: Sat, 4 Dec 2021 15:10:31 +0100
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Message-ID: <20211204141031.GA23757@sakura>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Sat Dec  4 15:10:33 2021 +0100 (CET)
X-Mailman-Approved-At: Sun, 05 Dec 2021 08:40:32 +1100
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


On Saturday 04 Dec 2021 à 10:01:07 (+0000), Christophe Leroy wrote:

> In fact BAT4 is wrong. Both virtual and physical address of a 64M BAT 
> must be 64M aligned. I think the display is wrong as well (You took it

oh so hardware does simple bitmask after all

I got fooled by the lack of guard in the bat setup code, so I assumed
magical hardware

> from ptdump ?), BEPI and BRPN must be anded with complement of BL.

yes that was ptdump code with seq_printf replaced by printk

ptdump code is correct but iif the bat addresses are correctly
aligned, maybe add a safeguard like this ?

index 85062ce2d849..f7c5cf62ef41 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -275,6 +279,10 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
                       (unsigned long long)phys);
                return;
        }
+
+       WARN_ON(!is_power_of_2(size));
+       WARN_ON((phys & (size - 1)));
+       WARN_ON((virt & (size - 1)));
        bat = BATS[index];


> So here your 64M BAT maps 0xf8000000-0xfbffffff, therefore the address 
> 0xfd3fce00 is not mapped by any BAT hence the OOPS.

ok I think I found the issue:

diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/book3s_32.c
index 35b287b0a8da..fcbb9a136c1a 100644
--- a/arch/powerpc/mm/kasan/book3s_32.c
+++ b/arch/powerpc/mm/kasan/book3s_32.c
@@ -12,14 +12,14 @@ int __init kasan_init_region(void *start, size_t size)
        unsigned long k_end = (unsigned long)kasan_mem_to_shadow(start + size);
        unsigned long k_cur = k_start;
        int k_size = k_end - k_start;
-       int k_size_base = 1 << (ffs(k_size) - 1);
+       int k_size_base = 1 << (fls(k_size) - 1);
        int ret;
        void *block;
 
        block = memblock_alloc(k_size, k_size_base);
 
        if (block && k_size_base >= SZ_128K && k_start == ALIGN(k_start, k_size_base)) {
-               int shift = ffs(k_size - k_size_base);
+               int shift = fls(k_size - k_size_base);
                int k_size_more = shift ? 1 << (shift - 1) : 0;
 
                setbat(-1, k_start, __pa(block), k_size_base, PAGE_KERNEL);



-- 
Maxime
