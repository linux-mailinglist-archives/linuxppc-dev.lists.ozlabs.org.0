Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC994B9CC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 11:11:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzrFS5XKXz3cXt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 21:11:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzrF16yDPz3bb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 21:10:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JzrDt2Pclz9sT6;
 Thu, 17 Feb 2022 11:10:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id praua7vPF23R; Thu, 17 Feb 2022 11:10:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JzrDc04DCz9sT7;
 Thu, 17 Feb 2022 11:10:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA7DB8B77A;
 Thu, 17 Feb 2022 11:10:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QPhJSFFg6W1H; Thu, 17 Feb 2022 11:10:23 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.225])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ADC428B763;
 Thu, 17 Feb 2022 11:10:23 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21HAAEIp395970
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:10:14 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21HAACu3395969;
 Thu, 17 Feb 2022 11:10:12 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] net: Force inlining of checksum functions in net/checksum.h
Date: Thu, 17 Feb 2022 11:10:05 +0100
Message-Id: <8a1278500231505b5eaf8b207802ebc5bae1717b.1645092478.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645092604; l=7956; s=20211009;
 h=from:subject:message-id; bh=bPgs7KPwwbliZibxb/OK7E+BJYoJBOKMtwFreQoMAiQ=;
 b=ytxfObuW/eVbODboIgrI7UVjcxSetXta+cHKPTrRt1+pxi1qn6uA+yeSf3uzmzo+W83AGaoTEggj
 JgyuXJheCH9HYm/CsHuqtXhQz8Qufg0JPdWf3VZjMLfJ1ctLN4u/
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All functions defined as static inline in net/checksum.h are
meant to be inlined for performance reason.

But since commit ac7c3e4ff401 ("compiler: enable
CONFIG_OPTIMIZE_INLINING forcibly") the compiler is allowed to
uninline functions when it wants.

Fair enough in the general case, but for tiny performance critical
checksum helpers that's counter-productive.

The problem mainly arises when selecting CONFIG_CC_OPTIMISE_FOR_SIZE,
Those helpers being 'static inline' in header files you suddenly find
them duplicated many times in the resulting vmlinux.

Here is a typical exemple when building powerpc pmac32_defconfig
with CONFIG_CC_OPTIMISE_FOR_SIZE. csum_sub() appears 4 times:

	c04a23cc <csum_sub>:
	c04a23cc:	7c 84 20 f8 	not     r4,r4
	c04a23d0:	7c 63 20 14 	addc    r3,r3,r4
	c04a23d4:	7c 63 01 94 	addze   r3,r3
	c04a23d8:	4e 80 00 20 	blr
		...
	c04a2ce8:	4b ff f6 e5 	bl      c04a23cc <csum_sub>
		...
	c04a2d2c:	4b ff f6 a1 	bl      c04a23cc <csum_sub>
		...
	c04a2d54:	4b ff f6 79 	bl      c04a23cc <csum_sub>
		...
	c04a754c <csum_sub>:
	c04a754c:	7c 84 20 f8 	not     r4,r4
	c04a7550:	7c 63 20 14 	addc    r3,r3,r4
	c04a7554:	7c 63 01 94 	addze   r3,r3
	c04a7558:	4e 80 00 20 	blr
		...
	c04ac930:	4b ff ac 1d 	bl      c04a754c <csum_sub>
		...
	c04ad264:	4b ff a2 e9 	bl      c04a754c <csum_sub>
		...
	c04e3b08 <csum_sub>:
	c04e3b08:	7c 84 20 f8 	not     r4,r4
	c04e3b0c:	7c 63 20 14 	addc    r3,r3,r4
	c04e3b10:	7c 63 01 94 	addze   r3,r3
	c04e3b14:	4e 80 00 20 	blr
		...
	c04e5788:	4b ff e3 81 	bl      c04e3b08 <csum_sub>
		...
	c04e65c8:	4b ff d5 41 	bl      c04e3b08 <csum_sub>
		...
	c0512d34 <csum_sub>:
	c0512d34:	7c 84 20 f8 	not     r4,r4
	c0512d38:	7c 63 20 14 	addc    r3,r3,r4
	c0512d3c:	7c 63 01 94 	addze   r3,r3
	c0512d40:	4e 80 00 20 	blr
		...
	c0512dfc:	4b ff ff 39 	bl      c0512d34 <csum_sub>
		...
	c05138bc:	4b ff f4 79 	bl      c0512d34 <csum_sub>
		...

Restore the expected behaviour by using __always_inline for all
functions defined in net/checksum.h

vmlinux size is even reduced by 256 bytes with this patch:

	   text	   data	    bss	    dec	    hex	filename
	6980022	2515362	 194384	9689768	 93daa8	vmlinux.before
	6979862	2515266	 194384	9689512	 93d9a8	vmlinux.now

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/net/checksum.h | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/net/checksum.h b/include/net/checksum.h
index 9badcd5532ef..2ad8ef6b0ce2 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -22,7 +22,7 @@
 #include <asm/checksum.h>
 
 #ifndef _HAVE_ARCH_COPY_AND_CSUM_FROM_USER
-static inline
+static __always_inline
 __wsum csum_and_copy_from_user (const void __user *src, void *dst,
 				      int len)
 {
@@ -33,7 +33,7 @@ __wsum csum_and_copy_from_user (const void __user *src, void *dst,
 #endif
 
 #ifndef HAVE_CSUM_COPY_USER
-static __inline__ __wsum csum_and_copy_to_user
+static __always_inline __wsum csum_and_copy_to_user
 (const void *src, void __user *dst, int len)
 {
 	__wsum sum = csum_partial(src, len, ~0U);
@@ -45,7 +45,7 @@ static __inline__ __wsum csum_and_copy_to_user
 #endif
 
 #ifndef _HAVE_ARCH_CSUM_AND_COPY
-static inline __wsum
+static __always_inline __wsum
 csum_partial_copy_nocheck(const void *src, void *dst, int len)
 {
 	memcpy(dst, src, len);
@@ -54,7 +54,7 @@ csum_partial_copy_nocheck(const void *src, void *dst, int len)
 #endif
 
 #ifndef HAVE_ARCH_CSUM_ADD
-static inline __wsum csum_add(__wsum csum, __wsum addend)
+static __always_inline __wsum csum_add(__wsum csum, __wsum addend)
 {
 	u32 res = (__force u32)csum;
 	res += (__force u32)addend;
@@ -62,12 +62,12 @@ static inline __wsum csum_add(__wsum csum, __wsum addend)
 }
 #endif
 
-static inline __wsum csum_sub(__wsum csum, __wsum addend)
+static __always_inline __wsum csum_sub(__wsum csum, __wsum addend)
 {
 	return csum_add(csum, ~addend);
 }
 
-static inline __sum16 csum16_add(__sum16 csum, __be16 addend)
+static __always_inline __sum16 csum16_add(__sum16 csum, __be16 addend)
 {
 	u16 res = (__force u16)csum;
 
@@ -75,53 +75,53 @@ static inline __sum16 csum16_add(__sum16 csum, __be16 addend)
 	return (__force __sum16)(res + (res < (__force u16)addend));
 }
 
-static inline __sum16 csum16_sub(__sum16 csum, __be16 addend)
+static __always_inline __sum16 csum16_sub(__sum16 csum, __be16 addend)
 {
 	return csum16_add(csum, ~addend);
 }
 
-static inline __wsum csum_shift(__wsum sum, int offset)
+static __always_inline __wsum csum_shift(__wsum sum, int offset)
 {
 	/* rotate sum to align it with a 16b boundary */
 	return (__force __wsum)rol32((__force u32)sum, (offset & 1) << 3);
 }
 
-static inline __wsum
+static __always_inline __wsum
 csum_block_add(__wsum csum, __wsum csum2, int offset)
 {
 	return csum_add(csum, csum_shift(csum2, offset));
 }
 
-static inline __wsum
+static __always_inline __wsum
 csum_block_add_ext(__wsum csum, __wsum csum2, int offset, int len)
 {
 	return csum_block_add(csum, csum2, offset);
 }
 
-static inline __wsum
+static __always_inline __wsum
 csum_block_sub(__wsum csum, __wsum csum2, int offset)
 {
 	return csum_block_add(csum, ~csum2, offset);
 }
 
-static inline __wsum csum_unfold(__sum16 n)
+static __always_inline __wsum csum_unfold(__sum16 n)
 {
 	return (__force __wsum)n;
 }
 
-static inline __wsum csum_partial_ext(const void *buff, int len, __wsum sum)
+static __always_inline __wsum csum_partial_ext(const void *buff, int len, __wsum sum)
 {
 	return csum_partial(buff, len, sum);
 }
 
 #define CSUM_MANGLED_0 ((__force __sum16)0xffff)
 
-static inline void csum_replace_by_diff(__sum16 *sum, __wsum diff)
+static __always_inline void csum_replace_by_diff(__sum16 *sum, __wsum diff)
 {
 	*sum = csum_fold(csum_add(diff, ~csum_unfold(*sum)));
 }
 
-static inline void csum_replace4(__sum16 *sum, __be32 from, __be32 to)
+static __always_inline void csum_replace4(__sum16 *sum, __be32 from, __be32 to)
 {
 	__wsum tmp = csum_sub(~csum_unfold(*sum), (__force __wsum)from);
 
@@ -134,7 +134,7 @@ static inline void csum_replace4(__sum16 *sum, __be32 from, __be32 to)
  *  m : old value of a 16bit field
  *  m' : new value of a 16bit field
  */
-static inline void csum_replace2(__sum16 *sum, __be16 old, __be16 new)
+static __always_inline void csum_replace2(__sum16 *sum, __be16 old, __be16 new)
 {
 	*sum = ~csum16_add(csum16_sub(~(*sum), old), new);
 }
@@ -148,7 +148,7 @@ void inet_proto_csum_replace16(__sum16 *sum, struct sk_buff *skb,
 void inet_proto_csum_replace_by_diff(__sum16 *sum, struct sk_buff *skb,
 				     __wsum diff, bool pseudohdr);
 
-static inline void inet_proto_csum_replace2(__sum16 *sum, struct sk_buff *skb,
+static __always_inline void inet_proto_csum_replace2(__sum16 *sum, struct sk_buff *skb,
 					    __be16 from, __be16 to,
 					    bool pseudohdr)
 {
@@ -156,7 +156,7 @@ static inline void inet_proto_csum_replace2(__sum16 *sum, struct sk_buff *skb,
 				 (__force __be32)to, pseudohdr);
 }
 
-static inline __wsum remcsum_adjust(void *ptr, __wsum csum,
+static __always_inline __wsum remcsum_adjust(void *ptr, __wsum csum,
 				    int start, int offset)
 {
 	__sum16 *psum = (__sum16 *)(ptr + offset);
@@ -173,12 +173,12 @@ static inline __wsum remcsum_adjust(void *ptr, __wsum csum,
 	return delta;
 }
 
-static inline void remcsum_unadjust(__sum16 *psum, __wsum delta)
+static __always_inline void remcsum_unadjust(__sum16 *psum, __wsum delta)
 {
 	*psum = csum_fold(csum_sub(delta, (__force __wsum)*psum));
 }
 
-static inline __wsum wsum_negate(__wsum val)
+static __always_inline __wsum wsum_negate(__wsum val)
 {
 	return (__force __wsum)-((__force u32)val);
 }
-- 
2.34.1

