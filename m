Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DE1A2755
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 18:41:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y95T10m9zDr6B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 02:41:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p00-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5300::7;
 helo=mo6-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=O046vivU; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y8vw0VzVzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 02:32:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586363566;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:Cc:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=jeQA5zRoSHjSmIydcZDoJ2pwYT6VPRUSEw9Wpv90TAQ=;
 b=O046vivUhknu8dE7pNru/TjhkEeykGurtxSc9EwR6VFTrYZfrReAG7+OU3VxUz3Mas
 8qULEnIhAoh5MS576NXZWuUeYj5i43WRzQeElh4fAv71o4OE3o+y5Ppx0dqXFOFgfcXj
 65QSNm6Pkfmq3T1YEPxbvhkWaeGa+MTCKaimZKxb+FLX9/x7n56C7jAgBgZ09U4yqYfB
 T0s1YxVVjVyUVv3l2t9IzPYtC6CVc074bh+/UXcAT3CWWGQ53PrHv0FRr70Ou/UZ5LQE
 4YP1C7Us6T2MMir8PDDS+m4grA352oTWI/xwhW4HiGFbHVQIVnHgwO0cKSPUJVnaPbMk
 V6MA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhUIo30cgcuxcrbxGRkj0JVBRh+ag=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:7433:4e09:8585:d468]
 by smtp.strato.de (RZmta 46.2.1 AUTH) with ESMTPSA id e097dbw38GWh9pp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 8 Apr 2020 18:32:43 +0200 (CEST)
Subject: Section mismatch in reference from the function .early_init_mmu() to
 the function .init.text:.radix__early_init_mmu() after PowerPC
 updates 5.7-1
To: linuxppc-dev@lists.ozlabs.org
References: <mailman.127.1586355379.11283.linuxppc-dev@lists.ozlabs.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <fa2aba7e-ef63-da43-8348-314bf8525161@xenosoft.de>
Date: Wed, 8 Apr 2020 18:32:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <mailman.127.1586355379.11283.linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 "contact@a-eon.com" <contact@a-eon.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Since the PowerPC updates 5.7-1 we have the following issue during the 
linking of vmlinux:

MODPOST vmlinux.o
WARNING: modpost: vmlinux.o(.text.unlikely+0x1a0): Section mismatch in 
reference from the function .early_init_mmu() to the function 
.init.text:.radix__early_init_mmu()
The function .early_init_mmu() references
the function __init .radix__early_init_mmu().
This is often because .early_init_mmu lacks a __init
annotation or the annotation of .radix__early_init_mmu is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x1ac): Section mismatch in 
reference from the function .early_init_mmu() to the function 
.init.text:.hash__early_init_mmu()
The function .early_init_mmu() references
the function __init .hash__early_init_mmu().
This is often because .early_init_mmu lacks a __init
annotation or the annotation of .hash__early_init_mmu is wrong.

---

But the kernel works without any problems after the linking.

I reverted the following commits:

70fbdfef4ba63eeef83b2c94eac9a5a9f913e442 -- sysfs: remove redundant 
__compat_only_sysfs_link_entry_to_kobj fn

d38c07afc356ddebaa3ed8ecb3f553340e05c969 -- Merge tag 'powerpc-5.7-1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux

And after that the linking of vmlinux works again.

Please check the PowerPC updates 5.7-1.

Thanks,
Christian
