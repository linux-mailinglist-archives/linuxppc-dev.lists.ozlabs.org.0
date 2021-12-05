Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D4468C30
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 17:51:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6Xdl68yDz3c54
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 03:51:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=os5f8w=qw=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
X-Greylist: delayed 531 seconds by postgrey-1.36 at boromir;
 Mon, 06 Dec 2021 03:51:17 AEDT
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6XdK3cgfz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 03:51:17 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 97AB92018A;
 Sun,  5 Dec 2021 17:42:18 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ns.iliad.fr (Postfix) with ESMTPS id 898E62014F;
 Sun,  5 Dec 2021 17:42:18 +0100 (CET)
Date: Sun, 5 Dec 2021 17:42:17 +0100
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Message-ID: <20211205164217.GA29658@sakura>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Sun Dec  5 17:42:18 2021 +0100 (CET)
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



On Saturday 04 Dec 2021 à 17:42:44 (+0000), Christophe Leroy wrote:

> I guess all the guard is in the comment ...
> 
> /*
>   * Set up one of the I/D BAT (block address translation) register pairs.
>   * The parameters are not checked; in particular size must be a power
>   * of 2 between 128k and 256M.
>   */

It's missing the aligment rule you just taught me, but it's arguably
not the right place to teach ppc 101.

> Not sure it is that simple.
> 
> I'm cooking a patch reusing the block_size() function in mm/book3s32/mmu.c

Indeed it will handle cases that need more than 2 BATs.

Also when mem=2G, I have physical memory mapped twice:

CONFIG_PAGE_OFFSET=0x80000000
CONFIG_LOWMEM_SIZE=0x60000000

0: 0x80000000-0x8fffffff 0x00000000       256M Kernel rw      m   
1: 0x90000000-0x9fffffff 0x10000000       256M Kernel rw      m   
2: 0xa0000000-0xafffffff 0x20000000       256M Kernel rw      m   
3: 0xb0000000-0xbfffffff 0x30000000       256M Kernel rw      m   
4: 0xc0000000-0xcfffffff 0x40000000       256M Kernel rw      m   
5: 0xd0000000-0xdfffffff 0x50000000       256M Kernel rw      m   
6: 0xf0000000-0xf7ffffff 0x50000000       128M Kernel rw      m   

BAT5 comes from __mmu_mapin_ram(), BAT6 from kasan init

Is BAT5 needed here ?


Last one, with KASAN and the following layout, I have an non working
kernel with VMALLOC_START > VMALLOC_END:

mem=2G
CONFIG_PAGE_OFFSET=0x80000000
CONFIG_LOWMEM_SIZE=0x70000000

[    0.000000]   * 0xf0000000..0xfe000000  : kasan shadow mem
[    0.000000]   * 0xef7ff000..0xeffff000  : fixmap
[    0.000000]   * 0xf1000000..0xef7ff000  : vmalloc & ioremap


IIUC the safeguard is here:

arch/powerpc/mm/init_32.c:
/* The amount of lowmem must be within 0xF0000000 - KERNELBASE. */
#if (CONFIG_LOWMEM_SIZE > (0xF0000000 - PAGE_OFFSET))
#error "You must adjust CONFIG_LOWMEM_SIZE or CONFIG_KERNEL_START"


but the definition needs to be adapted for KASAN=y and require 256
more MB.


-- 
Maxime
