Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39047EF788
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 19:44:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=OIMKEa72;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SX5Qw1xnYz3dHf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 05:44:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=OIMKEa72;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=44.202.169.37; helo=omta038.useast.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 340 seconds by postgrey-1.37 at boromir; Sat, 18 Nov 2023 05:43:21 AEDT
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SX5Q174sFz3cPN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 05:43:21 +1100 (AEDT)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id 438Tra7bYWcCI43hErAdEU; Fri, 17 Nov 2023 18:36:04 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 43hCrFWlK11XZ43hDrDvOp; Fri, 17 Nov 2023 18:36:03 +0000
X-Authority-Analysis: v=2.4 cv=Z+v/oVdA c=1 sm=1 tr=0 ts=6557b293
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=_mNlVl-r0hj7kTaC:21 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=ye7ybKvv77Dy5FpuywAA:9 a=QEXdDO2ut3YA:10 a=N_l3Vs37sht3-TxgB6J7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:Subject
	:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wyRvuZSscLa9d9ntE2mT20eFXy9zwRsiWA6t6CJn0xs=; b=OIMKEa72PqP7gP4lkLwYmUi4UC
	HSNpj+iT+2bZhS2K76OodOwL7w6LdCOy+ANgbx0nuPsDfuH4WwcbWYOPcw+roscNNY+9kW1nwi8ib
	k/r8EED8THY6Ogqn5EumD/xCgB3B/9wl3PTBg/ZDoJNwh4anXs9c01jD79BfBTLQZ3SY8IMSXQjbc
	b6y71AfKoZe/BnuEqY7sqursBKPIYALJqYYnE2DjrXGydkSaDunUrdWayCNBrCLd7pQsWAo5GEcAL
	GSRrSKK7K+cqFbdhixm6aRbXu3vkaEL57sEffsJxVpX8z2gjHzBDAQE4QcbaAFArFjJMfwA3mIVZ6
	tCkCZ7ww==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:48062 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r43hC-001jUU-1e;
	Fri, 17 Nov 2023 12:36:02 -0600
Message-ID: <6a8bf78c-aedb-4d5a-b0aa-82a51a17b884@embeddedor.com>
Date: Fri, 17 Nov 2023 12:36:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [RFC - is this a bug?] powerpc/lib/sstep: Asking for some light on
 this, please. :)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1r43hC-001jUU-1e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:48062
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAID/BokcwEgj7aTjJ9+BsV4xVxSIcKs9URfYGq7RnQwj2i318H9oH79b9LqB+IGZn58lW2E+LnjzR3OyjleUyYwUxEaTZBi4nXqIxYlodLFeL/t1NAZ
 BElAX1xfQ3z6xLlVA0UwH/Bx0BctL+KHBY+uwkUte40N8ai0NHp8g0/QNQ77uYRMJp0UACe+BD2pArEtqOHy/tTL1FgZFur97IijHIe538JUt4ehjhqv0R5x
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

I'm trying to fix the following -Wstringop-overflow warnings, and I'd like
to get your feedback on this, please:

In function 'do_byte_reverse',
     inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
     inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
   287 |                 up[3] = tmp;
       |                 ~~~~~~^~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into destination object 'u' of size 16
   708 |         } u;
       |           ^
In function 'do_byte_reverse',
     inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
     inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
arch/powerpc/lib/sstep.c:289:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
   289 |                 up[2] = byterev_8(up[1]);
       |                 ~~~~~~^~~~~~~~~~~~~~~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into destination object 'u' of size 16
   708 |         } u;
       |           ^
In function 'do_byte_reverse',
     inlined from 'do_vec_load' at /home/gus/linux/arch/powerpc/lib/sstep.c:691:3,
     inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3439:9:
arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
   287 |                 up[3] = tmp;
       |                 ~~~~~~^~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
   681 |         } u = {};
       |           ^
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16

The origing of the issue seems to be the following calls to function `do_vec_store()`, when
`size > 16`, or more precisely when `size == 32`

arch/powerpc/lib/sstep.c:
3436         case LOAD_VMX:
3437                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
3438                         return 0;
3439                 err = do_vec_load(op->reg, ea, size, regs, cross_endian);
3440                 break;
...
3507         case STORE_VMX:
3508                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
3509                         return 0;
3510                 err = do_vec_store(op->reg, ea, size, regs, cross_endian);
3511                 break;

Inside `do_vec_store()`, we have that the size of `union u` is 16 bytes:

  702                                         int size, struct pt_regs *regs,
  703                                         bool cross_endian)
  704 {
  705         union {
  706                 __vector128 v;
  707                 u8 b[sizeof(__vector128)];
  708         } u;

and then function `do_byte_reverse()` is called

  721         if (unlikely(cross_endian))
  722                 do_byte_reverse(&u.b[ea & 0xf], size);

and if `size == 32`, the following piece of code tries to access
`ptr` outside of its boundaries:

  260 static nokprobe_inline void do_byte_reverse(void *ptr, int nb)
  261 {
  262         switch (nb) {
...
  281         case 32: {
  282                 unsigned long *up = (unsigned long *)ptr;
  283                 unsigned long tmp;
  284
  285                 tmp = byterev_8(up[0]);
  286                 up[0] = byterev_8(up[3]);
  287                 up[3] = tmp;
  288                 tmp = byterev_8(up[2]);
  289                 up[2] = byterev_8(up[1]);
  290                 up[1] = tmp;
  291                 break;
  292         }

The following patch is merely a test to illustrate how the value in `size` initially appears
to influence the warnings:

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a4ab8625061a..86786957b736 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3436,7 +3436,7 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
         case LOAD_VMX:
                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
                         return 0;
-               err = do_vec_load(op->reg, ea, size, regs, cross_endian);
+               err = do_vec_load(op->reg, ea, (size > 16) ? 16 : size, regs, cross_endian);
                 break;
  #endif
  #ifdef CONFIG_VSX
@@ -3507,7 +3507,7 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
         case STORE_VMX:
                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
                         return 0;
-               err = do_vec_store(op->reg, ea, size, regs, cross_endian);
+               err = do_vec_store(op->reg, ea, (size > 16) ? 16 : size, regs, cross_endian);
                 break;
  #endif
  #ifdef CONFIG_VSX

Is there something that I may be overlooking here? :)

Thanks!
--
Gustavo
