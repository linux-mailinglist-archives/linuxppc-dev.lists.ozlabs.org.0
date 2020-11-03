Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0CE2A4C34
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 18:03:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQbhg6CLfzDqfb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 04:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQbfn35MhzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 04:01:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CQbfn1TxQz8tWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 04:01:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CQbfn0VTBz9sTL; Wed,  4 Nov 2020 04:01:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CQbfl6RhNz9sTD
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 04:01:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQbfV7325z9v1x2;
 Tue,  3 Nov 2020 18:01:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id m8HW4sgOUSTa; Tue,  3 Nov 2020 18:01:38 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQbfV5PRfz9v1x0;
 Tue,  3 Nov 2020 18:01:38 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 17CA817B0; Tue,  3 Nov 2020 18:04:18 +0100 (CET)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Tue, 03 Nov 2020 18:04:18 +0100
Date: Tue, 03 Nov 2020 18:04:18 +0100
Message-ID: <20201103180418.Horde.6dzFEBWpf-sVPqsHtqccXA1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc: Don't use asm goto for put_user() with GCC 4.9
References: <20201103132915.529337-1-mpe@ellerman.id.au>
 <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
In-Reply-To: <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: schwab@linux-m68k.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Quoting Christophe Leroy <christophe.leroy@csgroup.eu>:

> Le 03/11/2020 =C3=A0 14:29, Michael Ellerman a =C3=A9crit=C2=A0:
>> Andreas reported that commit ee0a49a6870e ("powerpc/uaccess: Switch
>> __put_user_size_allowed() to __put_user_asm_goto()") broke
>> CLONE_CHILD_SETTID.
>>
>> Further inspection showed that the put_user() in schedule_tail() was
>> missing entirely, the store not emitted by the compiler.
>>
>
>>
>> Notice there are no stores other than to the stack. There should be a
>> stw in there for the store to current->set_child_tid.
>>
>> This is only seen with GCC 4.9 era compilers (tested with 4.9.3 and
>> 4.9.4), and only when CONFIG_PPC_KUAP is disabled.
>>
>> When CONFIG_PPC_KUAP=3Dy, the memory clobber that's part of the isync()
>> and mtspr() inlined via allow_user_access() seems to be enough to
>> avoid the bug.
>>
>> For now though let's just not use asm goto with GCC 4.9, to avoid this
>> bug and any other issues we haven't noticed yet. Possibly in future we
>> can find a smaller workaround.
>
> Is that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D58670 ?
>
> Should we use asm_volatile_goto() defined in include/linux/compiler-gcc.h=
 ?

It seems to be OK with asm_volatile_goto() with GCC 4.9, and it is=20=20
already=20what is used in our asm/jump_label.h


diff --git a/arch/powerpc/include/asm/uaccess.h=20=20
b/arch/powerpc/include/asm/uaccess.h
index=20ef5bbb705c08..501c9a79038c 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -178,7 +178,7 @@ do {								\
   * are no aliasing issues.
   */
  #define __put_user_asm_goto(x, addr, label, op)			\
-	asm volatile goto(					\
+	asm_volatile_goto(					\
  		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
  		EX_TABLE(1b, %l2)				\
  		:						\
@@ -191,7 +191,7 @@ do {								\
  	__put_user_asm_goto(x, ptr, label, "std")
  #else /* __powerpc64__ */
  #define __put_user_asm2_goto(x, addr, label)			\
-	asm volatile goto(					\
+	asm_volatile_goto(					\
  		"1:	stw%X1 %0, %1\n"			\
  		"2:	stw%X1 %L0, %L1\n"			\
  		EX_TABLE(1b, %l2)				\
---

Christophe

