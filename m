Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED7020CCDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 08:53:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wJ9T3Ct6zDqVR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 16:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wJ7q66PCzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 16:52:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49wJ7Z2bG8z9tvr7;
 Mon, 29 Jun 2020 08:51:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ql3tDOZ5HUJp; Mon, 29 Jun 2020 08:51:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49wJ7Z1fPrz9tvr5;
 Mon, 29 Jun 2020 08:51:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C2088B784;
 Mon, 29 Jun 2020 08:52:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lj7dlNmcEfXw; Mon, 29 Jun 2020 08:52:00 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B57FB8B75B;
 Mon, 29 Jun 2020 08:51:59 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 npiggin@gmail.com, segher@kernel.crashing.org
References: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7b916759-1683-b4df-0d4b-b04b3fcd9a02@csgroup.eu>
Date: Mon, 29 Jun 2020 08:52:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c2addbd9d76212242d3d8554a2f7ff849fb08b85.1587040754.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

I see this patch is marked as "defered" in patchwork, but I can't see 
any related discussion. Is it normal ?

Christophe

Le 16/04/2020 à 14:39, Christophe Leroy a écrit :
> At the time being, __put_user()/__get_user() and friends only use
> D-form addressing, with 0 offset. Ex:
> 
> 	lwz	reg1, 0(reg2)
> 
> Give the compiler the opportunity to use other adressing modes
> whenever possible, to get more optimised code.
> 
> Hereunder is a small exemple:
> 
> struct test {
> 	u32 item1;
> 	u16 item2;
> 	u8 item3;
> 	u64 item4;
> };
> 
> int set_test_user(struct test __user *from, struct test __user *to)
> {
> 	int err;
> 	u32 item1;
> 	u16 item2;
> 	u8 item3;
> 	u64 item4;
> 
> 	err = __get_user(item1, &from->item1);
> 	err |= __get_user(item2, &from->item2);
> 	err |= __get_user(item3, &from->item3);
> 	err |= __get_user(item4, &from->item4);
> 
> 	err |= __put_user(item1, &to->item1);
> 	err |= __put_user(item2, &to->item2);
> 	err |= __put_user(item3, &to->item3);
> 	err |= __put_user(item4, &to->item4);
> 
> 	return err;
> }
> 
> Before the patch:
> 
> 00000df0 <set_test_user>:
>   df0:	94 21 ff f0 	stwu    r1,-16(r1)
>   df4:	39 40 00 00 	li      r10,0
>   df8:	93 c1 00 08 	stw     r30,8(r1)
>   dfc:	93 e1 00 0c 	stw     r31,12(r1)
>   e00:	7d 49 53 78 	mr      r9,r10
>   e04:	80 a3 00 00 	lwz     r5,0(r3)
>   e08:	38 e3 00 04 	addi    r7,r3,4
>   e0c:	7d 46 53 78 	mr      r6,r10
>   e10:	a0 e7 00 00 	lhz     r7,0(r7)
>   e14:	7d 29 33 78 	or      r9,r9,r6
>   e18:	39 03 00 06 	addi    r8,r3,6
>   e1c:	7d 46 53 78 	mr      r6,r10
>   e20:	89 08 00 00 	lbz     r8,0(r8)
>   e24:	7d 29 33 78 	or      r9,r9,r6
>   e28:	38 63 00 08 	addi    r3,r3,8
>   e2c:	7d 46 53 78 	mr      r6,r10
>   e30:	83 c3 00 00 	lwz     r30,0(r3)
>   e34:	83 e3 00 04 	lwz     r31,4(r3)
>   e38:	7d 29 33 78 	or      r9,r9,r6
>   e3c:	7d 43 53 78 	mr      r3,r10
>   e40:	90 a4 00 00 	stw     r5,0(r4)
>   e44:	7d 29 1b 78 	or      r9,r9,r3
>   e48:	38 c4 00 04 	addi    r6,r4,4
>   e4c:	7d 43 53 78 	mr      r3,r10
>   e50:	b0 e6 00 00 	sth     r7,0(r6)
>   e54:	7d 29 1b 78 	or      r9,r9,r3
>   e58:	38 e4 00 06 	addi    r7,r4,6
>   e5c:	7d 43 53 78 	mr      r3,r10
>   e60:	99 07 00 00 	stb     r8,0(r7)
>   e64:	7d 23 1b 78 	or      r3,r9,r3
>   e68:	38 84 00 08 	addi    r4,r4,8
>   e6c:	93 c4 00 00 	stw     r30,0(r4)
>   e70:	93 e4 00 04 	stw     r31,4(r4)
>   e74:	7c 63 53 78 	or      r3,r3,r10
>   e78:	83 c1 00 08 	lwz     r30,8(r1)
>   e7c:	83 e1 00 0c 	lwz     r31,12(r1)
>   e80:	38 21 00 10 	addi    r1,r1,16
>   e84:	4e 80 00 20 	blr
> 
> After the patch:
> 
> 00000dbc <set_test_user>:
>   dbc:	39 40 00 00 	li      r10,0
>   dc0:	7d 49 53 78 	mr      r9,r10
>   dc4:	80 03 00 00 	lwz     r0,0(r3)
>   dc8:	7d 48 53 78 	mr      r8,r10
>   dcc:	a1 63 00 04 	lhz     r11,4(r3)
>   dd0:	7d 29 43 78 	or      r9,r9,r8
>   dd4:	7d 48 53 78 	mr      r8,r10
>   dd8:	88 a3 00 06 	lbz     r5,6(r3)
>   ddc:	7d 29 43 78 	or      r9,r9,r8
>   de0:	7d 48 53 78 	mr      r8,r10
>   de4:	80 c3 00 08 	lwz     r6,8(r3)
>   de8:	80 e3 00 0c 	lwz     r7,12(r3)
>   dec:	7d 29 43 78 	or      r9,r9,r8
>   df0:	7d 43 53 78 	mr      r3,r10
>   df4:	90 04 00 00 	stw     r0,0(r4)
>   df8:	7d 29 1b 78 	or      r9,r9,r3
>   dfc:	7d 43 53 78 	mr      r3,r10
>   e00:	b1 64 00 04 	sth     r11,4(r4)
>   e04:	7d 29 1b 78 	or      r9,r9,r3
>   e08:	7d 43 53 78 	mr      r3,r10
>   e0c:	98 a4 00 06 	stb     r5,6(r4)
>   e10:	7d 23 1b 78 	or      r3,r9,r3
>   e14:	90 c4 00 08 	stw     r6,8(r4)
>   e18:	90 e4 00 0c 	stw     r7,12(r4)
>   e1c:	7c 63 53 78 	or      r3,r3,r10
>   e20:	4e 80 00 20 	blr
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> ---
> v2:
> - Added <> modifier in __put_user_asm() and __get_user_asm()
> - Removed %U2 in __put_user_asm2() and __get_user_asm2()
> - Reworded the commit log
> ---
>   arch/powerpc/include/asm/uaccess.h | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 7c811442b607..9365b59495a2 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -114,7 +114,7 @@ extern long __put_user_bad(void);
>    */
>   #define __put_user_asm(x, addr, err, op)			\
>   	__asm__ __volatile__(					\
> -		"1:	" op " %1,0(%2)	# put_user\n"		\
> +		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
>   		"2:\n"						\
>   		".section .fixup,\"ax\"\n"			\
>   		"3:	li %0,%3\n"				\
> @@ -122,7 +122,7 @@ extern long __put_user_bad(void);
>   		".previous\n"					\
>   		EX_TABLE(1b, 3b)				\
>   		: "=r" (err)					\
> -		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
> +		: "r" (x), "m<>" (*addr), "i" (-EFAULT), "0" (err))
>   
>   #ifdef __powerpc64__
>   #define __put_user_asm2(x, ptr, retval)				\
> @@ -130,8 +130,8 @@ extern long __put_user_bad(void);
>   #else /* __powerpc64__ */
>   #define __put_user_asm2(x, addr, err)				\
>   	__asm__ __volatile__(					\
> -		"1:	stw %1,0(%2)\n"				\
> -		"2:	stw %1+1,4(%2)\n"			\
> +		"1:	stw%X2 %1,%2\n"			\
> +		"2:	stw%X2 %L1,%L2\n"			\
>   		"3:\n"						\
>   		".section .fixup,\"ax\"\n"			\
>   		"4:	li %0,%3\n"				\
> @@ -140,7 +140,7 @@ extern long __put_user_bad(void);
>   		EX_TABLE(1b, 4b)				\
>   		EX_TABLE(2b, 4b)				\
>   		: "=r" (err)					\
> -		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
> +		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
>   #endif /* __powerpc64__ */
>   
>   #define __put_user_size_allowed(x, ptr, size, retval)		\
> @@ -260,7 +260,7 @@ extern long __get_user_bad(void);
>   
>   #define __get_user_asm(x, addr, err, op)		\
>   	__asm__ __volatile__(				\
> -		"1:	"op" %1,0(%2)	# get_user\n"	\
> +		"1:	"op"%U2%X2 %1, %2	# get_user\n"	\
>   		"2:\n"					\
>   		".section .fixup,\"ax\"\n"		\
>   		"3:	li %0,%3\n"			\
> @@ -269,7 +269,7 @@ extern long __get_user_bad(void);
>   		".previous\n"				\
>   		EX_TABLE(1b, 3b)			\
>   		: "=r" (err), "=r" (x)			\
> -		: "b" (addr), "i" (-EFAULT), "0" (err))
> +		: "m<>" (*addr), "i" (-EFAULT), "0" (err))
>   
>   #ifdef __powerpc64__
>   #define __get_user_asm2(x, addr, err)			\
> @@ -277,8 +277,8 @@ extern long __get_user_bad(void);
>   #else /* __powerpc64__ */
>   #define __get_user_asm2(x, addr, err)			\
>   	__asm__ __volatile__(				\
> -		"1:	lwz %1,0(%2)\n"			\
> -		"2:	lwz %1+1,4(%2)\n"		\
> +		"1:	lwz%X2 %1, %2\n"			\
> +		"2:	lwz%X2 %L1, %L2\n"		\
>   		"3:\n"					\
>   		".section .fixup,\"ax\"\n"		\
>   		"4:	li %0,%3\n"			\
> @@ -289,7 +289,7 @@ extern long __get_user_bad(void);
>   		EX_TABLE(1b, 4b)			\
>   		EX_TABLE(2b, 4b)			\
>   		: "=r" (err), "=&r" (x)			\
> -		: "b" (addr), "i" (-EFAULT), "0" (err))
> +		: "m" (*addr), "i" (-EFAULT), "0" (err))
>   #endif /* __powerpc64__ */
>   
>   #define __get_user_size_allowed(x, ptr, size, retval)		\
> @@ -299,10 +299,10 @@ do {								\
>   	if (size > sizeof(x))					\
>   		(x) = __get_user_bad();				\
>   	switch (size) {						\
> -	case 1: __get_user_asm(x, ptr, retval, "lbz"); break;	\
> -	case 2: __get_user_asm(x, ptr, retval, "lhz"); break;	\
> -	case 4: __get_user_asm(x, ptr, retval, "lwz"); break;	\
> -	case 8: __get_user_asm2(x, ptr, retval);  break;	\
> +	case 1: __get_user_asm(x, (u8 __user *)ptr, retval, "lbz"); break;	\
> +	case 2: __get_user_asm(x, (u16 __user *)ptr, retval, "lhz"); break;	\
> +	case 4: __get_user_asm(x, (u32 __user *)ptr, retval, "lwz"); break;	\
> +	case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;	\
>   	default: (x) = __get_user_bad();			\
>   	}							\
>   } while (0)
> 
