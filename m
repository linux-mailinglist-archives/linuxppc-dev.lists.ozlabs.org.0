Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1D4693FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 11:32:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J709t62n8z3bsp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 21:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=63cgvt=qx=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J709T2ZDKz2xXg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 21:32:09 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 88947200F0;
 Mon,  6 Dec 2021 11:32:06 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 868FC20FF9;
 Mon,  6 Dec 2021 11:32:06 +0100 (CET)
Message-ID: <b9a4afdc13d29100d562232b6376834782c02e92.camel@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 06 Dec 2021 11:32:06 +0100
In-Reply-To: <854e7a5f-2b1b-47de-51fb-6cd0f3c6ccd3@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
 <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
 <20211205214408.GC29658@sakura>
 <cea77e1e-9972-33cf-3ef8-e0be5ff26b63@csgroup.eu>
 <b39cea045b4317a83b4605f2aeb8a88bcc44b1d7.camel@freebox.fr>
 <854e7a5f-2b1b-47de-51fb-6cd0f3c6ccd3@csgroup.eu>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Mon Dec  6 11:32:06 2021 +0100 (CET)
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
Reply-To: mbizon@freebox.fr
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Mon, 2021-12-06 at 09:07 +0000, Christophe Leroy wrote:

Hello,

> Looks like you can win something if you take the patch I just sent
> and replace the memblock_phys_alloc(k_size, k_size) by 
> memblock_phys_alloc_range(k_size, k_size, 0, MEMBLOCK_ALLOC_ANYWHERE)

I tried your patch without your proposed modification and got something new:

[    0.000000] ==================================================================
[    0.000000] BUG: KASAN: unknown-crash in vprintk+0x30/0xe8
[    0.000000] Read of size 4 at addr 80ad0740 by task swapper/0
[    0.000000] 
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0+ #415
[    0.000000] Call Trace:
[    0.000000] [80cdfe50] [8017711c] print_address_description.constprop.0+0x78/0x338 (unreliable)
[    0.000000] [80cdfe80] [80176e48] kasan_report+0x1c0/0x1d4
[    0.000000] [80cdfec0] [80099a34] vprintk+0x30/0xe8
[    0.000000] [80cdfee0] [80099600] _printk+0x9c/0xbc
[    0.000000] [80cdff60] [80999628] kasan_init+0x14c/0x164
[    0.000000] [80cdff90] [80995440] setup_arch+0x18/0x1c4
[    0.000000] [80cdffc0] [809910c8] start_kernel+0x60/0x2fc
[    0.000000] [80cdfff0] [000033c0] 0x33c0
[    0.000000] 
[    0.000000] The buggy address belongs to the variable:
[    0.000000]  init_task+0x0/0xce0
[    0.000000] 
[    0.000000] Memory state around the buggy address:
[    0.000000]  80ad0600: de ad be ef de ad be ef de ad be ef de ad be ef
[    0.000000]  80ad0680: de ad be ef de ad be ef de ad be ef de ad be ef
[    0.000000] >80ad0700: de ad be ef de ad be ef de ad be ef de ad be ef
[    0.000000]                                    ^
[    0.000000]  80ad0780: de ad be ef de ad be ef de ad be ef de ad be ef
[    0.000000]  80ad0800: de ad be ef de ad be ef de ad be ef de ad be ef
[    0.000000] ==================================================================
[    0.000000] Disabling lock debugging due to kernel taint
[    0.000000] KASAN init done


Looking at the archive when you introduced KASAN, you had this kind of
bug, and the conclusion of the thread was:

> Indeed the problem is in kasan_init() : memblock_phys_alloc()
> doesn't zeroize the allocated memory. I changed it to
> memblock_alloc() and now it works.	

since your patch uses memblock_phys_alloc() again, maybe that's the
same issue

-- 
Maxime



