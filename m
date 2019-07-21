Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F076F23A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jul 2019 10:00:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45rxxG1kFWzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jul 2019 18:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F+3j4KE4"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45rxvf50pmzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jul 2019 17:58:54 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id z1so36128265wru.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jul 2019 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KjFqhj+1+eAtfMXp50Z4QVsx38KMeRmBtQT+k2GCdbU=;
 b=F+3j4KE4L16fZjJFtZa9OVcI00IjRKyCPUd9VHs3Oz0V+DXcLVk44H+S6Pr3MijxXk
 0SlhboFCJQjoG8nmQ6aKBNID2QH8aovl6GVLT7Rd+dgMzV+EkrPnoHZzPdFPNk8CPIgY
 16Lt78hVaxzkfoldr2j3XzOUyO6LNFVhg9FxyQdUheKwSdikbLuf6xC+LVoqTPEEv8T9
 ab49PYmFZVNEnUEs+/o7Sx2REvd8131tF7TfV4An04GQzcvdYa+Z7q02g5F9Zh8OsrVn
 lTlmpX69SDaVZwc/j+PiE8g4/zuIVVRbzr6iLamJA3a/LkYPd5LR/Zfyw6wJ8W4je+lu
 qcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KjFqhj+1+eAtfMXp50Z4QVsx38KMeRmBtQT+k2GCdbU=;
 b=pYngXycSd8gNg5z9M8hcfVhGXCjA4gZX5iyfx0T2ayR2lfsomrkxIyvY6NDhJ3FzYv
 DmfdeQLeRyqgJRIaHa9ylzmO8DZjFa7sc3BWr78VWL5YzATZ2odPJlSzMK7U1CXzGF6V
 WGU1d+BupXLjTkV5Ri2bqnD7SblVl7wyc22Hvq2r4Q5dmbmNTU5GCXYSVse2ST5+fVVT
 w66xXXP463/9MrtmRiE6MD7M+Ys+FcA3Do08Y/mNOPYhDU0/iFlEILC8AXpPs9IrWVnS
 4yRZ40UWdfBg5epP3BaAXok4ivoH92ML3IGxY8XoEvzo7MULnTIklXy2E5oqteEsc6IH
 HhIg==
X-Gm-Message-State: APjAAAUU1wN6+ni0iHHWxl/tVkWFpjVpUEon4ztNYnivFgaRTZkFyplF
 G6rmb/dTrdJWT4dgWB8/YQs=
X-Google-Smtp-Source: APXvYqy62Led3Ojjlz2zM7bWLwaeUD0l84hO3J30rZGZYty0hFR/aly0k+pXpDztkanFW0r6fdwwsQ==
X-Received: by 2002:adf:eac4:: with SMTP id o4mr65668798wrn.290.1563695929500; 
 Sun, 21 Jul 2019 00:58:49 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id h8sm35570615wmf.12.2019.07.21.00.58.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 00:58:48 -0700 (PDT)
Date: Sun, 21 Jul 2019 00:58:46 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
Message-ID: <20190721075846.GA97701@archlinux-threadripper>
References: <c6ff2faba7fbb56a7f5b5f08cd3453f89fc0aaf4.1557480165.git.christophe.leroy@c-s.fr>
 <45hnfp6SlLz9sP0@ozlabs.org>
 <20190708191416.GA21442@archlinux-threadripper>
 <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
 <20190709064952.GA40851@archlinux-threadripper>
 <20190719032456.GA14108@archlinux-threadripper>
 <20190719152303.GA20882@gate.crashing.org>
 <20190719160455.GA12420@archlinux-threadripper>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <20190719160455.GA12420@archlinux-threadripper>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 19, 2019 at 09:04:55AM -0700, Nathan Chancellor wrote:
> On Fri, Jul 19, 2019 at 10:23:03AM -0500, Segher Boessenkool wrote:
> > On Thu, Jul 18, 2019 at 08:24:56PM -0700, Nathan Chancellor wrote:
> > > On Mon, Jul 08, 2019 at 11:49:52PM -0700, Nathan Chancellor wrote:
> > > > On Tue, Jul 09, 2019 at 07:04:43AM +0200, Christophe Leroy wrote:
> > > > > Is that a Clang bug ?
> > > > 
> > > > No idea, it happens with clang-8 and clang-9 though (pretty sure there
> > > > were fixes for PowerPC in clang-8 so something before it probably won't
> > > > work but I haven't tried).
> > > > 
> > > > > 
> > > > > Do you have a disassembly of the code both with and without this patch in
> > > > > order to compare ?
> > > > 
> > > > I can give you whatever disassembly you want (or I can upload the raw
> > > > files if that is easier).
> > > 
> > > What disassembly/files did you need to start taking a look at this? I
> > > can upload/send whatever you need.
> > 
> > A before and after of *only this patch*.  And then look at what changed;
> > it maybe be obvious what is the problem to you, as well, so look at it
> > yourself first?
> > 
> > 
> > Segher

Hi Segher,

Looks like the problematic function is dcbz, as there is no segfault
when only that function is reverted to a
pre-6c5875843b87c3adea2beade9d1b8b3d4523900a state.

I was able to expose a singular problematic callsite using the attached
patch (let me know if that is insufficient).

I have attached the disassembly of arch/powerpc/kernel/mem.o with
clear_page (working) and broken_clear_page (broken), along with the side
by side diff. My assembly knowledge is fairly limited as it stands and
it is certainly not up to snuff on PowerPC so I have no idea what I am
looking for. Please let me know if anything immediately looks off or if
there is anything else I can do to help out.

Cheers,
Nathan

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-powerpc-Test-broken-dcbz.patch"

From 3d7f79f7601c312d47245141185bea7defffffa4 Mon Sep 17 00:00:00 2001
From: Nathan Chancellor <natechancellor@gmail.com>
Date: Sat, 20 Jul 2019 23:37:55 -0700
Subject: [PATCH] powerpc: Test broken dcbz

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/powerpc/include/asm/cache.h   |  2 +-
 arch/powerpc/include/asm/page_32.h | 13 +++++++++++++
 arch/powerpc/mm/mem.c              |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index b3388d95f451..ba76291b4d4d 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -107,7 +107,7 @@ extern void _set_L3CR(unsigned long);
 
 static inline void dcbz(void *addr)
 {
-	__asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
 }
 
 static inline void dcbi(void *addr)
diff --git a/arch/powerpc/include/asm/page_32.h b/arch/powerpc/include/asm/page_32.h
index 683dfbc67ca8..125c2ba7cd79 100644
--- a/arch/powerpc/include/asm/page_32.h
+++ b/arch/powerpc/include/asm/page_32.h
@@ -40,6 +40,19 @@ typedef unsigned long long pte_basic_t;
 typedef unsigned long pte_basic_t;
 #endif
 
+static inline void broken_dcbz(void *addr)
+{
+	__asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
+}
+
+static inline void broken_clear_page(void *addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < PAGE_SIZE / L1_CACHE_BYTES; i++, addr += L1_CACHE_BYTES)
+		broken_dcbz(addr);
+}
+
 /*
  * Clear page using the dcbz instruction, which doesn't cause any
  * memory traffic (except to write out any cache lines which get
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9259337d7374..7bb88e7a2e4c 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -361,7 +361,7 @@ EXPORT_SYMBOL(flush_dcache_icache_page);
 
 void clear_user_page(void *page, unsigned long vaddr, struct page *pg)
 {
-	clear_page(page);
+	broken_clear_page(page);
 
 	/*
 	 * We shouldn't have to do this, but some versions of glibc
-- 
2.22.0


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mem-working.txt"


mem-working.o:	file format ELF32-ppc


Disassembly of section .text:

00000000 phys_mem_access_prot:
       0: 7c 08 02 a6                  	mflr 0
       4: 90 01 00 04                  	stw 0, 4(1)
       8: 94 21 ff e0                  	stwu 1, -32(1)
       c: 93 a1 00 14                  	stw 29, 20(1)
      10: 7c fd 3b 78                  	mr 29, 7
      14: 3c e0 00 00                  	lis 7, 0
      18: 38 e7 00 00                  	addi 7, 7, 0
      1c: 81 07 00 a0                  	lwz 8, 160(7)
      20: 93 c1 00 18                  	stw 30, 24(1)
      24: 28 08 00 00                  	cmplwi	8, 0
      28: 7c 7e 1b 78                  	mr 30, 3
      2c: 41 82 00 20                  	bt	2, .+32
      30: 80 7d 00 00                  	lwz 3, 0(29)
      34: 38 e1 00 08                  	addi 7, 1, 8
      38: 7d 09 03 a6                  	mtctr 8
      3c: 90 61 00 08                  	stw 3, 8(1)
      40: 7f c3 f3 78                  	mr 3, 30
      44: 4e 80 04 21                  	bctrl
      48: 48 00 00 28                  	b .+40
      4c: 7c a3 2b 78                  	mr 3, 5
      50: 48 00 00 01                  	bl .+0
      54: 28 03 00 00                  	cmplwi	3, 0
      58: 80 7d 00 00                  	lwz 3, 0(29)
      5c: 40 82 00 10                  	bf	2, .+16
      60: 54 63 06 26                  	rlwinm 3, 3, 0, 24, 19
      64: 60 63 05 00                  	ori 3, 3, 1280
      68: 90 7d 00 00                  	stw 3, 0(29)
      6c: 90 7e 00 00                  	stw 3, 0(30)
      70: 83 c1 00 18                  	lwz 30, 24(1)
      74: 83 a1 00 14                  	lwz 29, 20(1)
      78: 80 01 00 24                  	lwz 0, 36(1)
      7c: 38 21 00 20                  	addi 1, 1, 32
      80: 7c 08 03 a6                  	mtlr 0
      84: 4e 80 00 20                  	blr

00000088 free_initmem:
      88: 7c 08 02 a6                  	mflr 0
      8c: 90 01 00 04                  	stw 0, 4(1)
      90: 94 21 ff f0                  	stwu 1, -16(1)
      94: 3c 60 00 00                  	lis 3, 0
      98: 3c 80 00 00                  	lis 4, 0
      9c: 38 63 00 00                  	addi 3, 3, 0
      a0: 38 84 00 00                  	addi 4, 4, 0
      a4: 90 83 00 60                  	stw 4, 96(3)
      a8: 48 00 00 01                  	bl .+0
      ac: 3c 60 00 00                  	lis 3, 0
      b0: 38 80 00 01                  	li 4, 1
      b4: 98 83 00 00                  	stb 4, 0(3)
      b8: 3c 60 00 00                  	lis 3, 0
      bc: 3c 80 00 00                  	lis 4, 0
      c0: 3c a0 00 00                  	lis 5, 0
      c4: 38 63 00 00                  	addi 3, 3, 0
      c8: 38 84 00 00                  	addi 4, 4, 0
      cc: 38 c5 00 00                  	addi 6, 5, 0
      d0: 38 a0 00 cc                  	li 5, 204
      d4: 48 00 00 01                  	bl .+0
      d8: 80 01 00 14                  	lwz 0, 20(1)
      dc: 38 21 00 10                  	addi 1, 1, 16
      e0: 7c 08 03 a6                  	mtlr 0
      e4: 4e 80 00 20                  	blr

000000e8 flush_dcache_page:
      e8: 80 83 00 00                  	lwz 4, 0(3)
      ec: 70 84 08 00                  	andi. 4, 4, 2048
      f0: 4d 82 00 20                  	bclr	12, 2
      f4: 38 80 08 00                  	li 4, 2048
      f8: 7c a0 18 28                  	lwarx 5, 0, 3
      fc: 7c a5 20 78                  	andc 5, 5, 4
     100: 7c a0 19 2d                  	stwcx. 5, 0, 3
     104: 40 a2 ff f4                  	bc 5, 2, .+65524
     108: 4e 80 00 20                  	blr

0000010c flush_dcache_icache_page:
     10c: 7c 08 02 a6                  	mflr 0
     110: 90 01 00 04                  	stw 0, 4(1)
     114: 94 21 ff f0                  	stwu 1, -16(1)
     118: 80 82 00 00                  	lwz 4, 0(2)
     11c: 38 84 00 01                  	addi 4, 4, 1
     120: 90 82 00 00                  	stw 4, 0(2)
     124: 80 82 0a e4                  	lwz 4, 2788(2)
     128: 38 84 00 01                  	addi 4, 4, 1
     12c: 90 82 0a e4                  	stw 4, 2788(2)
     130: 3c 80 00 00                  	lis 4, 0
     134: 80 84 00 00                  	lwz 4, 0(4)
     138: 7c 64 18 50                  	subf 3, 4, 3
     13c: 3c 80 cc cc                  	lis 4, -13108
     140: 54 63 e8 fe                  	srwi 3, 3, 3
     144: 60 84 d0 00                  	ori 4, 4, 53248
     148: 7c 63 21 d6                  	mullw 3, 3, 4
     14c: 3c 63 c0 00                  	addis 3, 3, -16384
     150: 48 00 00 01                  	bl .+0
     154: 80 62 0a e4                  	lwz 3, 2788(2)
     158: 38 63 ff ff                  	addi 3, 3, -1
     15c: 90 62 0a e4                  	stw 3, 2788(2)
     160: 80 62 00 00                  	lwz 3, 0(2)
     164: 38 63 ff ff                  	addi 3, 3, -1
     168: 90 62 00 00                  	stw 3, 0(2)
     16c: 80 01 00 14                  	lwz 0, 20(1)
     170: 38 21 00 10                  	addi 1, 1, 16
     174: 7c 08 03 a6                  	mtlr 0
     178: 4e 80 00 20                  	blr

0000017c clear_user_page:
     17c: 38 80 00 80                  	li 4, 128
     180: 7c 89 03 a6                  	mtctr 4
     184: 7c 00 1f ec                  	dcbz 0, 3
     188: 38 63 00 20                  	addi 3, 3, 32
     18c: 42 00 ff f8                  	bdnz .+65528
     190: 80 65 00 00                  	lwz 3, 0(5)
     194: 70 63 08 00                  	andi. 3, 3, 2048
     198: 4d 82 00 20                  	bclr	12, 2
     19c: 38 60 08 00                  	li 3, 2048
     1a0: 7c 80 28 28                  	lwarx 4, 0, 5
     1a4: 7c 84 18 78                  	andc 4, 4, 3
     1a8: 7c 80 29 2d                  	stwcx. 4, 0, 5
     1ac: 40 a2 ff f4                  	bc 5, 2, .+65524
     1b0: 4e 80 00 20                  	blr

000001b4 copy_user_page:
     1b4: 7c 08 02 a6                  	mflr 0
     1b8: 90 01 00 04                  	stw 0, 4(1)
     1bc: 94 21 ff f0                  	stwu 1, -16(1)
     1c0: 93 c1 00 08                  	stw 30, 8(1)
     1c4: 7c de 33 78                  	mr 30, 6
     1c8: 48 00 00 01                  	bl .+0
     1cc: 80 7e 00 00                  	lwz 3, 0(30)
     1d0: 70 63 08 00                  	andi. 3, 3, 2048
     1d4: 41 82 00 18                  	bt	2, .+24
     1d8: 38 60 08 00                  	li 3, 2048
     1dc: 7c 80 f0 28                  	lwarx 4, 0, 30
     1e0: 7c 84 18 78                  	andc 4, 4, 3
     1e4: 7c 80 f1 2d                  	stwcx. 4, 0, 30
     1e8: 40 a2 ff f4                  	bc 5, 2, .+65524
     1ec: 83 c1 00 08                  	lwz 30, 8(1)
     1f0: 80 01 00 14                  	lwz 0, 20(1)
     1f4: 38 21 00 10                  	addi 1, 1, 16
     1f8: 7c 08 03 a6                  	mtlr 0
     1fc: 4e 80 00 20                  	blr

00000200 flush_icache_user_range:
     200: 7c 08 02 a6                  	mflr 0
     204: 90 01 00 04                  	stw 0, 4(1)
     208: 94 21 ff e0                  	stwu 1, -32(1)
     20c: 3c 60 00 00                  	lis 3, 0
     210: 93 81 00 10                  	stw 28, 16(1)
     214: 7c 9c 23 78                  	mr 28, 4
     218: 38 63 00 00                  	addi 3, 3, 0
     21c: 38 80 00 53                  	li 4, 83
     220: 93 a1 00 14                  	stw 29, 20(1)
     224: 7c bd 2b 78                  	mr 29, 5
     228: 38 a0 00 00                  	li 5, 0
     22c: 93 c1 00 18                  	stw 30, 24(1)
     230: 7c de 33 78                  	mr 30, 6
     234: 48 00 00 01                  	bl .+0
     238: 3c 60 00 00                  	lis 3, 0
     23c: 3c 80 cc cc                  	lis 4, -13108
     240: 80 63 00 00                  	lwz 3, 0(3)
     244: 60 84 d0 00                  	ori 4, 4, 53248
     248: 7c 63 e0 50                  	subf 3, 3, 28
     24c: 54 63 e8 fe                  	srwi 3, 3, 3
     250: 7c 63 21 d6                  	mullw 3, 3, 4
     254: 57 a4 05 3e                  	clrlwi	4, 29, 20
     258: 50 64 00 26                  	rlwimi 4, 3, 0, 0, 19
     25c: 3c 64 c0 00                  	addis 3, 4, -16384
     260: 7c 83 f2 14                  	add 4, 3, 30
     264: 48 00 00 01                  	bl .+0
     268: 83 c1 00 18                  	lwz 30, 24(1)
     26c: 83 a1 00 14                  	lwz 29, 20(1)
     270: 83 81 00 10                  	lwz 28, 16(1)
     274: 80 01 00 24                  	lwz 0, 36(1)
     278: 38 21 00 20                  	addi 1, 1, 32
     27c: 7c 08 03 a6                  	mtlr 0
     280: 4e 80 00 20                  	blr

00000284 update_mmu_cache:
     284: 4e 80 00 20                  	blr

00000288 devmem_is_allowed:
     288: 7c 08 02 a6                  	mflr 0
     28c: 90 01 00 04                  	stw 0, 4(1)
     290: 94 21 ff f0                  	stwu 1, -16(1)
     294: 93 c1 00 08                  	stw 30, 8(1)
     298: 7c 7e 1b 78                  	mr 30, 3
     29c: 54 63 65 3e                  	srwi 3, 3, 20
     2a0: 57 c4 60 26                  	slwi 4, 30, 12
     2a4: 48 00 00 01                  	bl .+0
     2a8: 70 63 00 01                  	andi. 3, 3, 1
     2ac: 38 60 00 00                  	li 3, 0
     2b0: 41 81 00 14                  	bt	1, .+20
     2b4: 7f c3 f3 78                  	mr 3, 30
     2b8: 48 00 00 01                  	bl .+0
     2bc: 7c 63 00 34                  	cntlzw	3, 3
     2c0: 54 63 df fe                  	rlwinm 3, 3, 27, 31, 31
     2c4: 83 c1 00 08                  	lwz 30, 8(1)
     2c8: 80 01 00 14                  	lwz 0, 20(1)
     2cc: 38 21 00 10                  	addi 1, 1, 16
     2d0: 7c 08 03 a6                  	mtlr 0
     2d4: 4e 80 00 20                  	blr

Disassembly of section .init.text:

00000000 mem_topology_setup:
       0: 7c 08 02 a6                  	mflr 0
       4: 90 01 00 04                  	stw 0, 4(1)
       8: 94 21 ff f0                  	stwu 1, -16(1)
       c: 48 00 00 01                  	bl .+0
      10: 54 84 a0 3e                  	rotlwi	4, 4, 20
      14: 3c a0 00 00                  	lis 5, 0
      18: 50 64 a0 16                  	rlwimi 4, 3, 20, 0, 11
      1c: 3c 60 00 00                  	lis 3, 0
      20: 90 85 00 00                  	stw 4, 0(5)
      24: 38 a0 ff ff                  	li 5, -1
      28: 90 83 00 00                  	stw 4, 0(3)
      2c: 3c 60 00 00                  	lis 3, 0
      30: 38 80 00 00                  	li 4, 0
      34: 38 c0 ff ff                  	li 6, -1
      38: 39 00 00 00                  	li 8, 0
      3c: 90 83 00 00                  	stw 4, 0(3)
      40: 3c 60 00 00                  	lis 3, 0
      44: 38 80 00 00                  	li 4, 0
      48: 38 63 00 00                  	addi 3, 3, 0
      4c: 38 e3 00 10                  	addi 7, 3, 16
      50: 38 60 00 00                  	li 3, 0
      54: 48 00 00 01                  	bl .+0
      58: 80 01 00 14                  	lwz 0, 20(1)
      5c: 38 21 00 10                  	addi 1, 1, 16
      60: 7c 08 03 a6                  	mtlr 0
      64: 4e 80 00 20                  	blr

00000068 initmem_init:
      68: 7c 08 02 a6                  	mflr 0
      6c: 90 01 00 04                  	stw 0, 4(1)
      70: 94 21 ff f0                  	stwu 1, -16(1)
      74: 38 60 00 00                  	li 3, 0
      78: 48 00 00 01                  	bl .+0
      7c: 80 01 00 14                  	lwz 0, 20(1)
      80: 38 21 00 10                  	addi 1, 1, 16
      84: 7c 08 03 a6                  	mtlr 0
      88: 4e 80 00 20                  	blr

0000008c paging_init:
      8c: 7c 08 02 a6                  	mflr 0
      90: 90 01 00 04                  	stw 0, 4(1)
      94: 94 21 ff d0                  	stwu 1, -48(1)
      98: 93 21 00 14                  	stw 25, 20(1)
      9c: 93 41 00 18                  	stw 26, 24(1)
      a0: 93 61 00 1c                  	stw 27, 28(1)
      a4: 93 81 00 20                  	stw 28, 32(1)
      a8: 93 a1 00 24                  	stw 29, 36(1)
      ac: 93 c1 00 28                  	stw 30, 40(1)
      b0: 48 00 00 01                  	bl .+0
      b4: 7c 7e 1b 78                  	mr 30, 3
      b8: 7c 9d 23 78                  	mr 29, 4
      bc: 3f 40 ff fe                  	lis 26, -2
      c0: 48 00 00 01                  	bl .+0
      c4: 7c 7c 1b 78                  	mr 28, 3
      c8: 7c 9b 23 78                  	mr 27, 4
      cc: 3b 20 00 00                  	li 25, 0
      d0: 38 e1 00 08                  	addi 7, 1, 8
      d4: 7f 43 d3 78                  	mr 3, 26
      d8: 93 21 00 10                  	stw 25, 16(1)
      dc: 38 a0 00 00                  	li 5, 0
      e0: 38 c0 00 00                  	li 6, 0
      e4: 93 21 00 08                  	stw 25, 8(1)
      e8: 48 00 00 01                  	bl .+0
      ec: 3b 5a 10 00                  	addi 26, 26, 4096
      f0: 2c 1a f0 00                  	cmpwi	26, -4096
      f4: 40 82 ff dc                  	bf	2, .+65500
      f8: 3c 60 00 00                  	lis 3, 0
      fc: 4c c6 31 82                  	crclr	6
     100: 7f 85 e3 78                  	mr 5, 28
     104: 38 63 00 00                  	addi 3, 3, 0
     108: 7f 66 db 78                  	mr 6, 27
     10c: 7f c7 f3 78                  	mr 7, 30
     110: 7f a8 eb 78                  	mr 8, 29
     114: 48 00 00 01                  	bl .+0
     118: 7c 7d d8 10                  	subfc 3, 29, 27
     11c: 4c c6 31 82                  	crclr	6
     120: 7c be e1 10                  	subfe 5, 30, 28
     124: 54 64 60 3e                  	rotlwi	4, 3, 12
     128: 3c 60 00 00                  	lis 3, 0
     12c: 50 a4 60 26                  	rlwimi 4, 5, 12, 0, 19
     130: 38 63 00 00                  	addi 3, 3, 0
     134: 48 00 00 01                  	bl .+0
     138: 3c 60 00 00                  	lis 3, 0
     13c: 80 83 00 00                  	lwz 4, 0(3)
     140: 3c 60 00 00                  	lis 3, 0
     144: 94 83 00 00                  	stwu 4, 0(3)
     148: 48 00 00 01                  	bl .+0
     14c: 83 c1 00 28                  	lwz 30, 40(1)
     150: 83 a1 00 24                  	lwz 29, 36(1)
     154: 83 81 00 20                  	lwz 28, 32(1)
     158: 83 61 00 1c                  	lwz 27, 28(1)
     15c: 83 41 00 18                  	lwz 26, 24(1)
     160: 83 21 00 14                  	lwz 25, 20(1)
     164: 80 01 00 34                  	lwz 0, 52(1)
     168: 38 21 00 30                  	addi 1, 1, 48
     16c: 7c 08 03 a6                  	mtlr 0
     170: 4e 80 00 20                  	blr

00000174 mem_init:
     174: 7c 08 02 a6                  	mflr 0
     178: 90 01 00 04                  	stw 0, 4(1)
     17c: 94 21 ff e0                  	stwu 1, -32(1)
     180: 3c 60 00 00                  	lis 3, 0
     184: 3c 80 00 00                  	lis 4, 0
     188: 93 81 00 10                  	stw 28, 16(1)
     18c: 3f 80 00 00                  	lis 28, 0
     190: 80 63 00 00                  	lwz 3, 0(3)
     194: 80 84 00 00                  	lwz 4, 0(4)
     198: 54 63 60 26                  	slwi 3, 3, 12
     19c: 3c 63 c0 00                  	addis 3, 3, -16384
     1a0: 90 7c 00 00                  	stw 3, 0(28)
     1a4: 3c 60 00 00                  	lis 3, 0
     1a8: 93 a1 00 14                  	stw 29, 20(1)
     1ac: 93 c1 00 18                  	stw 30, 24(1)
     1b0: 90 83 00 00                  	stw 4, 0(3)
     1b4: 48 00 00 01                  	bl .+0
     1b8: 38 60 00 00                  	li 3, 0
     1bc: 48 00 00 01                  	bl .+0
     1c0: 3c 60 00 00                  	lis 3, 0
     1c4: 4c c6 31 82                  	crclr	6
     1c8: 38 63 00 00                  	addi 3, 3, 0
     1cc: 48 00 00 01                  	bl .+0
     1d0: 3c 80 ff fd                  	lis 4, -3
     1d4: 3c 60 00 00                  	lis 3, 0
     1d8: 4c c6 31 82                  	crclr	6
     1dc: 60 9e f0 00                  	ori 30, 4, 61440
     1e0: 38 63 00 00                  	addi 3, 3, 0
     1e4: 7f c4 f3 78                  	mr 4, 30
     1e8: 38 a0 f0 00                  	li 5, -4096
     1ec: 48 00 00 01                  	bl .+0
     1f0: 3c 80 ff dd                  	lis 4, -35
     1f4: 3c 60 00 00                  	lis 3, 0
     1f8: 4c c6 31 82                  	crclr	6
     1fc: 60 9d f0 00                  	ori 29, 4, 61440
     200: 38 63 00 00                  	addi 3, 3, 0
     204: 7f a4 eb 78                  	mr 4, 29
     208: 7f c5 f3 78                  	mr 5, 30
     20c: 48 00 00 01                  	bl .+0
     210: 3f c0 00 00                  	lis 30, 0
     214: 3c 60 00 00                  	lis 3, 0
     218: 4c c6 31 82                  	crclr	6
     21c: 80 9e 00 00                  	lwz 4, 0(30)
     220: 38 63 00 00                  	addi 3, 3, 0
     224: 7f a5 eb 78                  	mr 5, 29
     228: 48 00 00 01                  	bl .+0
     22c: 80 7c 00 00                  	lwz 3, 0(28)
     230: 3c 80 01 00                  	lis 4, 256
     234: 4c c6 31 82                  	crclr	6
     238: 38 63 ff ff                  	addi 3, 3, -1
     23c: 80 be 00 00                  	lwz 5, 0(30)
     240: 3c 63 10 00                  	addis 3, 3, 4096
     244: 54 63 00 06                  	rlwinm 3, 3, 0, 0, 3
     248: 50 64 02 0c                  	rlwimi 4, 3, 0, 8, 6
     24c: 3c 60 00 00                  	lis 3, 0
     250: 38 63 00 00                  	addi 3, 3, 0
     254: 48 00 00 01                  	bl .+0
     258: 83 c1 00 18                  	lwz 30, 24(1)
     25c: 83 a1 00 14                  	lwz 29, 20(1)
     260: 83 81 00 10                  	lwz 28, 16(1)
     264: 80 01 00 24                  	lwz 0, 36(1)
     268: 38 21 00 20                  	addi 1, 1, 32
     26c: 7c 08 03 a6                  	mtlr 0
     270: 4e 80 00 20                  	blr

00000274 add_system_ram_resources:
     274: 7c 08 02 a6                  	mflr 0
     278: 90 01 00 04                  	stw 0, 4(1)
     27c: 94 21 ff c0                  	stwu 1, -64(1)
     280: 3c 60 00 00                  	lis 3, 0
     284: 93 a1 00 34                  	stw 29, 52(1)
     288: 3b a3 00 00                  	addi 29, 3, 0
     28c: 80 7d 00 10                  	lwz 3, 16(29)
     290: 93 81 00 30                  	stw 28, 48(1)
     294: 1c 63 00 18                  	mulli 3, 3, 24
     298: 83 9d 00 20                  	lwz 28, 32(29)
     29c: 7c 7c 1a 14                  	add 3, 28, 3
     2a0: 92 a1 00 14                  	stw 21, 20(1)
     2a4: 7c 1c 18 40                  	cmplw	28, 3
     2a8: 92 c1 00 18                  	stw 22, 24(1)
     2ac: 92 e1 00 1c                  	stw 23, 28(1)
     2b0: 93 01 00 20                  	stw 24, 32(1)
     2b4: 93 21 00 24                  	stw 25, 36(1)
     2b8: 93 41 00 28                  	stw 26, 40(1)
     2bc: 93 61 00 2c                  	stw 27, 44(1)
     2c0: 93 c1 00 38                  	stw 30, 56(1)
     2c4: 40 80 00 ac                  	bf	0, .+172
     2c8: 3c 60 00 00                  	lis 3, 0
     2cc: 3c 80 00 00                  	lis 4, 0
     2d0: 3c a0 81 00                  	lis 5, -32512
     2d4: 3c c0 00 00                  	lis 6, 0
     2d8: 3b 7c ff e8                  	addi 27, 28, -24
     2dc: 3b 40 00 00                  	li 26, 0
     2e0: 3b 23 00 00                  	addi 25, 3, 0
     2e4: 3b 04 00 00                  	addi 24, 4, 0
     2e8: 60 b7 02 00                  	ori 23, 5, 512
     2ec: 3b c6 00 00                  	addi 30, 6, 0
     2f0: 80 79 00 18                  	lwz 3, 24(25)
     2f4: 38 80 0d c0                  	li 4, 3520
     2f8: 38 a0 00 28                  	li 5, 40
     2fc: 82 db 00 1c                  	lwz 22, 28(27)
     300: 82 bb 00 24                  	lwz 21, 36(27)
     304: 48 00 00 01                  	bl .+0
     308: 7c 64 1b 78                  	mr 4, 3
     30c: 7c 63 00 34                  	cntlzw	3, 3
     310: 28 04 00 00                  	cmplwi	4, 0
     314: 54 63 df fe                  	rlwinm 3, 3, 27, 31, 31
     318: 0f 03 00 00                  	twnei	3, 0
     31c: 41 82 00 34                  	bt	2, .+52
     320: 7c 76 aa 14                  	add 3, 22, 21
     324: 93 04 00 10                  	stw 24, 16(4)
     328: 38 63 ff ff                  	addi 3, 3, -1
     32c: 90 64 00 0c                  	stw 3, 12(4)
     330: 7f c3 f3 78                  	mr 3, 30
     334: 93 44 00 00                  	stw 26, 0(4)
     338: 92 c4 00 04                  	stw 22, 4(4)
     33c: 93 44 00 08                  	stw 26, 8(4)
     340: 92 e4 00 14                  	stw 23, 20(4)
     344: 48 00 00 01                  	bl .+0
     348: 54 63 0f fe                  	srwi 3, 3, 31
     34c: 0f 03 00 00                  	twnei	3, 0
     350: 80 7d 00 10                  	lwz 3, 16(29)
     354: 3b 9c 00 18                  	addi 28, 28, 24
     358: 3b 7b 00 18                  	addi 27, 27, 24
     35c: 80 9d 00 20                  	lwz 4, 32(29)
     360: 1c 63 00 18                  	mulli 3, 3, 24
     364: 7c 64 1a 14                  	add 3, 4, 3
     368: 7c 1c 18 40                  	cmplw	28, 3
     36c: 41 80 ff 84                  	bt	0, .+65412
     370: 38 60 00 00                  	li 3, 0
     374: 83 c1 00 38                  	lwz 30, 56(1)
     378: 83 a1 00 34                  	lwz 29, 52(1)
     37c: 83 81 00 30                  	lwz 28, 48(1)
     380: 83 61 00 2c                  	lwz 27, 44(1)
     384: 83 41 00 28                  	lwz 26, 40(1)
     388: 83 21 00 24                  	lwz 25, 36(1)
     38c: 83 01 00 20                  	lwz 24, 32(1)
     390: 82 e1 00 1c                  	lwz 23, 28(1)
     394: 82 c1 00 18                  	lwz 22, 24(1)
     398: 82 a1 00 14                  	lwz 21, 20(1)
     39c: 80 01 00 44                  	lwz 0, 68(1)
     3a0: 38 21 00 40                  	addi 1, 1, 64
     3a4: 7c 08 03 a6                  	mtlr 0
     3a8: 4e 80 00 20                  	blr

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mem-broken.txt"


mem-broken.o:	file format ELF32-ppc


Disassembly of section .text:

00000000 phys_mem_access_prot:
       0: 7c 08 02 a6                  	mflr 0
       4: 90 01 00 04                  	stw 0, 4(1)
       8: 94 21 ff e0                  	stwu 1, -32(1)
       c: 93 a1 00 14                  	stw 29, 20(1)
      10: 7c fd 3b 78                  	mr 29, 7
      14: 3c e0 00 00                  	lis 7, 0
      18: 38 e7 00 00                  	addi 7, 7, 0
      1c: 81 07 00 a0                  	lwz 8, 160(7)
      20: 93 c1 00 18                  	stw 30, 24(1)
      24: 28 08 00 00                  	cmplwi	8, 0
      28: 7c 7e 1b 78                  	mr 30, 3
      2c: 41 82 00 20                  	bt	2, .+32
      30: 80 7d 00 00                  	lwz 3, 0(29)
      34: 38 e1 00 08                  	addi 7, 1, 8
      38: 7d 09 03 a6                  	mtctr 8
      3c: 90 61 00 08                  	stw 3, 8(1)
      40: 7f c3 f3 78                  	mr 3, 30
      44: 4e 80 04 21                  	bctrl
      48: 48 00 00 28                  	b .+40
      4c: 7c a3 2b 78                  	mr 3, 5
      50: 48 00 00 01                  	bl .+0
      54: 28 03 00 00                  	cmplwi	3, 0
      58: 80 7d 00 00                  	lwz 3, 0(29)
      5c: 40 82 00 10                  	bf	2, .+16
      60: 54 63 06 26                  	rlwinm 3, 3, 0, 24, 19
      64: 60 63 05 00                  	ori 3, 3, 1280
      68: 90 7d 00 00                  	stw 3, 0(29)
      6c: 90 7e 00 00                  	stw 3, 0(30)
      70: 83 c1 00 18                  	lwz 30, 24(1)
      74: 83 a1 00 14                  	lwz 29, 20(1)
      78: 80 01 00 24                  	lwz 0, 36(1)
      7c: 38 21 00 20                  	addi 1, 1, 32
      80: 7c 08 03 a6                  	mtlr 0
      84: 4e 80 00 20                  	blr

00000088 free_initmem:
      88: 7c 08 02 a6                  	mflr 0
      8c: 90 01 00 04                  	stw 0, 4(1)
      90: 94 21 ff f0                  	stwu 1, -16(1)
      94: 3c 60 00 00                  	lis 3, 0
      98: 3c 80 00 00                  	lis 4, 0
      9c: 38 63 00 00                  	addi 3, 3, 0
      a0: 38 84 00 00                  	addi 4, 4, 0
      a4: 90 83 00 60                  	stw 4, 96(3)
      a8: 48 00 00 01                  	bl .+0
      ac: 3c 60 00 00                  	lis 3, 0
      b0: 38 80 00 01                  	li 4, 1
      b4: 98 83 00 00                  	stb 4, 0(3)
      b8: 3c 60 00 00                  	lis 3, 0
      bc: 3c 80 00 00                  	lis 4, 0
      c0: 3c a0 00 00                  	lis 5, 0
      c4: 38 63 00 00                  	addi 3, 3, 0
      c8: 38 84 00 00                  	addi 4, 4, 0
      cc: 38 c5 00 00                  	addi 6, 5, 0
      d0: 38 a0 00 cc                  	li 5, 204
      d4: 48 00 00 01                  	bl .+0
      d8: 80 01 00 14                  	lwz 0, 20(1)
      dc: 38 21 00 10                  	addi 1, 1, 16
      e0: 7c 08 03 a6                  	mtlr 0
      e4: 4e 80 00 20                  	blr

000000e8 flush_dcache_page:
      e8: 80 83 00 00                  	lwz 4, 0(3)
      ec: 70 84 08 00                  	andi. 4, 4, 2048
      f0: 4d 82 00 20                  	bclr	12, 2
      f4: 38 80 08 00                  	li 4, 2048
      f8: 7c a0 18 28                  	lwarx 5, 0, 3
      fc: 7c a5 20 78                  	andc 5, 5, 4
     100: 7c a0 19 2d                  	stwcx. 5, 0, 3
     104: 40 a2 ff f4                  	bc 5, 2, .+65524
     108: 4e 80 00 20                  	blr

0000010c flush_dcache_icache_page:
     10c: 7c 08 02 a6                  	mflr 0
     110: 90 01 00 04                  	stw 0, 4(1)
     114: 94 21 ff f0                  	stwu 1, -16(1)
     118: 80 82 00 00                  	lwz 4, 0(2)
     11c: 38 84 00 01                  	addi 4, 4, 1
     120: 90 82 00 00                  	stw 4, 0(2)
     124: 80 82 0a e4                  	lwz 4, 2788(2)
     128: 38 84 00 01                  	addi 4, 4, 1
     12c: 90 82 0a e4                  	stw 4, 2788(2)
     130: 3c 80 00 00                  	lis 4, 0
     134: 80 84 00 00                  	lwz 4, 0(4)
     138: 7c 64 18 50                  	subf 3, 4, 3
     13c: 3c 80 cc cc                  	lis 4, -13108
     140: 54 63 e8 fe                  	srwi 3, 3, 3
     144: 60 84 d0 00                  	ori 4, 4, 53248
     148: 7c 63 21 d6                  	mullw 3, 3, 4
     14c: 3c 63 c0 00                  	addis 3, 3, -16384
     150: 48 00 00 01                  	bl .+0
     154: 80 62 0a e4                  	lwz 3, 2788(2)
     158: 38 63 ff ff                  	addi 3, 3, -1
     15c: 90 62 0a e4                  	stw 3, 2788(2)
     160: 80 62 00 00                  	lwz 3, 0(2)
     164: 38 63 ff ff                  	addi 3, 3, -1
     168: 90 62 00 00                  	stw 3, 0(2)
     16c: 80 01 00 14                  	lwz 0, 20(1)
     170: 38 21 00 10                  	addi 1, 1, 16
     174: 7c 08 03 a6                  	mtlr 0
     178: 4e 80 00 20                  	blr

0000017c clear_user_page:
     17c: 94 21 ff f0                  	stwu 1, -16(1)
     180: 38 80 00 80                  	li 4, 128
     184: 38 63 ff e0                  	addi 3, 3, -32
     188: 7c 89 03 a6                  	mtctr 4
     18c: 38 81 00 0f                  	addi 4, 1, 15
     190: 8c c3 00 20                  	lbzu 6, 32(3)
     194: 98 c1 00 0f                  	stb 6, 15(1)
     198: 7c 00 27 ec                  	dcbz 0, 4
     19c: 42 00 ff f4                  	bdnz .+65524
     1a0: 80 65 00 00                  	lwz 3, 0(5)
     1a4: 70 63 08 00                  	andi. 3, 3, 2048
     1a8: 41 82 00 18                  	bt	2, .+24
     1ac: 38 60 08 00                  	li 3, 2048
     1b0: 7c 80 28 28                  	lwarx 4, 0, 5
     1b4: 7c 84 18 78                  	andc 4, 4, 3
     1b8: 7c 80 29 2d                  	stwcx. 4, 0, 5
     1bc: 40 a2 ff f4                  	bc 5, 2, .+65524
     1c0: 38 21 00 10                  	addi 1, 1, 16
     1c4: 4e 80 00 20                  	blr

000001c8 copy_user_page:
     1c8: 7c 08 02 a6                  	mflr 0
     1cc: 90 01 00 04                  	stw 0, 4(1)
     1d0: 94 21 ff f0                  	stwu 1, -16(1)
     1d4: 93 c1 00 08                  	stw 30, 8(1)
     1d8: 7c de 33 78                  	mr 30, 6
     1dc: 48 00 00 01                  	bl .+0
     1e0: 80 7e 00 00                  	lwz 3, 0(30)
     1e4: 70 63 08 00                  	andi. 3, 3, 2048
     1e8: 41 82 00 18                  	bt	2, .+24
     1ec: 38 60 08 00                  	li 3, 2048
     1f0: 7c 80 f0 28                  	lwarx 4, 0, 30
     1f4: 7c 84 18 78                  	andc 4, 4, 3
     1f8: 7c 80 f1 2d                  	stwcx. 4, 0, 30
     1fc: 40 a2 ff f4                  	bc 5, 2, .+65524
     200: 83 c1 00 08                  	lwz 30, 8(1)
     204: 80 01 00 14                  	lwz 0, 20(1)
     208: 38 21 00 10                  	addi 1, 1, 16
     20c: 7c 08 03 a6                  	mtlr 0
     210: 4e 80 00 20                  	blr

00000214 flush_icache_user_range:
     214: 7c 08 02 a6                  	mflr 0
     218: 90 01 00 04                  	stw 0, 4(1)
     21c: 94 21 ff e0                  	stwu 1, -32(1)
     220: 3c 60 00 00                  	lis 3, 0
     224: 93 81 00 10                  	stw 28, 16(1)
     228: 7c 9c 23 78                  	mr 28, 4
     22c: 38 63 00 00                  	addi 3, 3, 0
     230: 38 80 00 53                  	li 4, 83
     234: 93 a1 00 14                  	stw 29, 20(1)
     238: 7c bd 2b 78                  	mr 29, 5
     23c: 38 a0 00 00                  	li 5, 0
     240: 93 c1 00 18                  	stw 30, 24(1)
     244: 7c de 33 78                  	mr 30, 6
     248: 48 00 00 01                  	bl .+0
     24c: 3c 60 00 00                  	lis 3, 0
     250: 3c 80 cc cc                  	lis 4, -13108
     254: 80 63 00 00                  	lwz 3, 0(3)
     258: 60 84 d0 00                  	ori 4, 4, 53248
     25c: 7c 63 e0 50                  	subf 3, 3, 28
     260: 54 63 e8 fe                  	srwi 3, 3, 3
     264: 7c 63 21 d6                  	mullw 3, 3, 4
     268: 57 a4 05 3e                  	clrlwi	4, 29, 20
     26c: 50 64 00 26                  	rlwimi 4, 3, 0, 0, 19
     270: 3c 64 c0 00                  	addis 3, 4, -16384
     274: 7c 83 f2 14                  	add 4, 3, 30
     278: 48 00 00 01                  	bl .+0
     27c: 83 c1 00 18                  	lwz 30, 24(1)
     280: 83 a1 00 14                  	lwz 29, 20(1)
     284: 83 81 00 10                  	lwz 28, 16(1)
     288: 80 01 00 24                  	lwz 0, 36(1)
     28c: 38 21 00 20                  	addi 1, 1, 32
     290: 7c 08 03 a6                  	mtlr 0
     294: 4e 80 00 20                  	blr

00000298 update_mmu_cache:
     298: 4e 80 00 20                  	blr

0000029c devmem_is_allowed:
     29c: 7c 08 02 a6                  	mflr 0
     2a0: 90 01 00 04                  	stw 0, 4(1)
     2a4: 94 21 ff f0                  	stwu 1, -16(1)
     2a8: 93 c1 00 08                  	stw 30, 8(1)
     2ac: 7c 7e 1b 78                  	mr 30, 3
     2b0: 54 63 65 3e                  	srwi 3, 3, 20
     2b4: 57 c4 60 26                  	slwi 4, 30, 12
     2b8: 48 00 00 01                  	bl .+0
     2bc: 70 63 00 01                  	andi. 3, 3, 1
     2c0: 38 60 00 00                  	li 3, 0
     2c4: 41 81 00 14                  	bt	1, .+20
     2c8: 7f c3 f3 78                  	mr 3, 30
     2cc: 48 00 00 01                  	bl .+0
     2d0: 7c 63 00 34                  	cntlzw	3, 3
     2d4: 54 63 df fe                  	rlwinm 3, 3, 27, 31, 31
     2d8: 83 c1 00 08                  	lwz 30, 8(1)
     2dc: 80 01 00 14                  	lwz 0, 20(1)
     2e0: 38 21 00 10                  	addi 1, 1, 16
     2e4: 7c 08 03 a6                  	mtlr 0
     2e8: 4e 80 00 20                  	blr

Disassembly of section .init.text:

00000000 mem_topology_setup:
       0: 7c 08 02 a6                  	mflr 0
       4: 90 01 00 04                  	stw 0, 4(1)
       8: 94 21 ff f0                  	stwu 1, -16(1)
       c: 48 00 00 01                  	bl .+0
      10: 54 84 a0 3e                  	rotlwi	4, 4, 20
      14: 3c a0 00 00                  	lis 5, 0
      18: 50 64 a0 16                  	rlwimi 4, 3, 20, 0, 11
      1c: 3c 60 00 00                  	lis 3, 0
      20: 90 85 00 00                  	stw 4, 0(5)
      24: 38 a0 ff ff                  	li 5, -1
      28: 90 83 00 00                  	stw 4, 0(3)
      2c: 3c 60 00 00                  	lis 3, 0
      30: 38 80 00 00                  	li 4, 0
      34: 38 c0 ff ff                  	li 6, -1
      38: 39 00 00 00                  	li 8, 0
      3c: 90 83 00 00                  	stw 4, 0(3)
      40: 3c 60 00 00                  	lis 3, 0
      44: 38 80 00 00                  	li 4, 0
      48: 38 63 00 00                  	addi 3, 3, 0
      4c: 38 e3 00 10                  	addi 7, 3, 16
      50: 38 60 00 00                  	li 3, 0
      54: 48 00 00 01                  	bl .+0
      58: 80 01 00 14                  	lwz 0, 20(1)
      5c: 38 21 00 10                  	addi 1, 1, 16
      60: 7c 08 03 a6                  	mtlr 0
      64: 4e 80 00 20                  	blr

00000068 initmem_init:
      68: 7c 08 02 a6                  	mflr 0
      6c: 90 01 00 04                  	stw 0, 4(1)
      70: 94 21 ff f0                  	stwu 1, -16(1)
      74: 38 60 00 00                  	li 3, 0
      78: 48 00 00 01                  	bl .+0
      7c: 80 01 00 14                  	lwz 0, 20(1)
      80: 38 21 00 10                  	addi 1, 1, 16
      84: 7c 08 03 a6                  	mtlr 0
      88: 4e 80 00 20                  	blr

0000008c paging_init:
      8c: 7c 08 02 a6                  	mflr 0
      90: 90 01 00 04                  	stw 0, 4(1)
      94: 94 21 ff d0                  	stwu 1, -48(1)
      98: 93 21 00 14                  	stw 25, 20(1)
      9c: 93 41 00 18                  	stw 26, 24(1)
      a0: 93 61 00 1c                  	stw 27, 28(1)
      a4: 93 81 00 20                  	stw 28, 32(1)
      a8: 93 a1 00 24                  	stw 29, 36(1)
      ac: 93 c1 00 28                  	stw 30, 40(1)
      b0: 48 00 00 01                  	bl .+0
      b4: 7c 7e 1b 78                  	mr 30, 3
      b8: 7c 9d 23 78                  	mr 29, 4
      bc: 3f 40 ff fe                  	lis 26, -2
      c0: 48 00 00 01                  	bl .+0
      c4: 7c 7c 1b 78                  	mr 28, 3
      c8: 7c 9b 23 78                  	mr 27, 4
      cc: 3b 20 00 00                  	li 25, 0
      d0: 38 e1 00 08                  	addi 7, 1, 8
      d4: 7f 43 d3 78                  	mr 3, 26
      d8: 93 21 00 10                  	stw 25, 16(1)
      dc: 38 a0 00 00                  	li 5, 0
      e0: 38 c0 00 00                  	li 6, 0
      e4: 93 21 00 08                  	stw 25, 8(1)
      e8: 48 00 00 01                  	bl .+0
      ec: 3b 5a 10 00                  	addi 26, 26, 4096
      f0: 2c 1a f0 00                  	cmpwi	26, -4096
      f4: 40 82 ff dc                  	bf	2, .+65500
      f8: 3c 60 00 00                  	lis 3, 0
      fc: 4c c6 31 82                  	crclr	6
     100: 7f 85 e3 78                  	mr 5, 28
     104: 38 63 00 00                  	addi 3, 3, 0
     108: 7f 66 db 78                  	mr 6, 27
     10c: 7f c7 f3 78                  	mr 7, 30
     110: 7f a8 eb 78                  	mr 8, 29
     114: 48 00 00 01                  	bl .+0
     118: 7c 7d d8 10                  	subfc 3, 29, 27
     11c: 4c c6 31 82                  	crclr	6
     120: 7c be e1 10                  	subfe 5, 30, 28
     124: 54 64 60 3e                  	rotlwi	4, 3, 12
     128: 3c 60 00 00                  	lis 3, 0
     12c: 50 a4 60 26                  	rlwimi 4, 5, 12, 0, 19
     130: 38 63 00 00                  	addi 3, 3, 0
     134: 48 00 00 01                  	bl .+0
     138: 3c 60 00 00                  	lis 3, 0
     13c: 80 83 00 00                  	lwz 4, 0(3)
     140: 3c 60 00 00                  	lis 3, 0
     144: 94 83 00 00                  	stwu 4, 0(3)
     148: 48 00 00 01                  	bl .+0
     14c: 83 c1 00 28                  	lwz 30, 40(1)
     150: 83 a1 00 24                  	lwz 29, 36(1)
     154: 83 81 00 20                  	lwz 28, 32(1)
     158: 83 61 00 1c                  	lwz 27, 28(1)
     15c: 83 41 00 18                  	lwz 26, 24(1)
     160: 83 21 00 14                  	lwz 25, 20(1)
     164: 80 01 00 34                  	lwz 0, 52(1)
     168: 38 21 00 30                  	addi 1, 1, 48
     16c: 7c 08 03 a6                  	mtlr 0
     170: 4e 80 00 20                  	blr

00000174 mem_init:
     174: 7c 08 02 a6                  	mflr 0
     178: 90 01 00 04                  	stw 0, 4(1)
     17c: 94 21 ff e0                  	stwu 1, -32(1)
     180: 3c 60 00 00                  	lis 3, 0
     184: 3c 80 00 00                  	lis 4, 0
     188: 93 81 00 10                  	stw 28, 16(1)
     18c: 3f 80 00 00                  	lis 28, 0
     190: 80 63 00 00                  	lwz 3, 0(3)
     194: 80 84 00 00                  	lwz 4, 0(4)
     198: 54 63 60 26                  	slwi 3, 3, 12
     19c: 3c 63 c0 00                  	addis 3, 3, -16384
     1a0: 90 7c 00 00                  	stw 3, 0(28)
     1a4: 3c 60 00 00                  	lis 3, 0
     1a8: 93 a1 00 14                  	stw 29, 20(1)
     1ac: 93 c1 00 18                  	stw 30, 24(1)
     1b0: 90 83 00 00                  	stw 4, 0(3)
     1b4: 48 00 00 01                  	bl .+0
     1b8: 38 60 00 00                  	li 3, 0
     1bc: 48 00 00 01                  	bl .+0
     1c0: 3c 60 00 00                  	lis 3, 0
     1c4: 4c c6 31 82                  	crclr	6
     1c8: 38 63 00 00                  	addi 3, 3, 0
     1cc: 48 00 00 01                  	bl .+0
     1d0: 3c 80 ff fd                  	lis 4, -3
     1d4: 3c 60 00 00                  	lis 3, 0
     1d8: 4c c6 31 82                  	crclr	6
     1dc: 60 9e f0 00                  	ori 30, 4, 61440
     1e0: 38 63 00 00                  	addi 3, 3, 0
     1e4: 7f c4 f3 78                  	mr 4, 30
     1e8: 38 a0 f0 00                  	li 5, -4096
     1ec: 48 00 00 01                  	bl .+0
     1f0: 3c 80 ff dd                  	lis 4, -35
     1f4: 3c 60 00 00                  	lis 3, 0
     1f8: 4c c6 31 82                  	crclr	6
     1fc: 60 9d f0 00                  	ori 29, 4, 61440
     200: 38 63 00 00                  	addi 3, 3, 0
     204: 7f a4 eb 78                  	mr 4, 29
     208: 7f c5 f3 78                  	mr 5, 30
     20c: 48 00 00 01                  	bl .+0
     210: 3f c0 00 00                  	lis 30, 0
     214: 3c 60 00 00                  	lis 3, 0
     218: 4c c6 31 82                  	crclr	6
     21c: 80 9e 00 00                  	lwz 4, 0(30)
     220: 38 63 00 00                  	addi 3, 3, 0
     224: 7f a5 eb 78                  	mr 5, 29
     228: 48 00 00 01                  	bl .+0
     22c: 80 7c 00 00                  	lwz 3, 0(28)
     230: 3c 80 01 00                  	lis 4, 256
     234: 4c c6 31 82                  	crclr	6
     238: 38 63 ff ff                  	addi 3, 3, -1
     23c: 80 be 00 00                  	lwz 5, 0(30)
     240: 3c 63 10 00                  	addis 3, 3, 4096
     244: 54 63 00 06                  	rlwinm 3, 3, 0, 0, 3
     248: 50 64 02 0c                  	rlwimi 4, 3, 0, 8, 6
     24c: 3c 60 00 00                  	lis 3, 0
     250: 38 63 00 00                  	addi 3, 3, 0
     254: 48 00 00 01                  	bl .+0
     258: 83 c1 00 18                  	lwz 30, 24(1)
     25c: 83 a1 00 14                  	lwz 29, 20(1)
     260: 83 81 00 10                  	lwz 28, 16(1)
     264: 80 01 00 24                  	lwz 0, 36(1)
     268: 38 21 00 20                  	addi 1, 1, 32
     26c: 7c 08 03 a6                  	mtlr 0
     270: 4e 80 00 20                  	blr

00000274 add_system_ram_resources:
     274: 7c 08 02 a6                  	mflr 0
     278: 90 01 00 04                  	stw 0, 4(1)
     27c: 94 21 ff c0                  	stwu 1, -64(1)
     280: 3c 60 00 00                  	lis 3, 0
     284: 93 a1 00 34                  	stw 29, 52(1)
     288: 3b a3 00 00                  	addi 29, 3, 0
     28c: 80 7d 00 10                  	lwz 3, 16(29)
     290: 93 81 00 30                  	stw 28, 48(1)
     294: 1c 63 00 18                  	mulli 3, 3, 24
     298: 83 9d 00 20                  	lwz 28, 32(29)
     29c: 7c 7c 1a 14                  	add 3, 28, 3
     2a0: 92 a1 00 14                  	stw 21, 20(1)
     2a4: 7c 1c 18 40                  	cmplw	28, 3
     2a8: 92 c1 00 18                  	stw 22, 24(1)
     2ac: 92 e1 00 1c                  	stw 23, 28(1)
     2b0: 93 01 00 20                  	stw 24, 32(1)
     2b4: 93 21 00 24                  	stw 25, 36(1)
     2b8: 93 41 00 28                  	stw 26, 40(1)
     2bc: 93 61 00 2c                  	stw 27, 44(1)
     2c0: 93 c1 00 38                  	stw 30, 56(1)
     2c4: 40 80 00 ac                  	bf	0, .+172
     2c8: 3c 60 00 00                  	lis 3, 0
     2cc: 3c 80 00 00                  	lis 4, 0
     2d0: 3c a0 81 00                  	lis 5, -32512
     2d4: 3c c0 00 00                  	lis 6, 0
     2d8: 3b 7c ff e8                  	addi 27, 28, -24
     2dc: 3b 40 00 00                  	li 26, 0
     2e0: 3b 23 00 00                  	addi 25, 3, 0
     2e4: 3b 04 00 00                  	addi 24, 4, 0
     2e8: 60 b7 02 00                  	ori 23, 5, 512
     2ec: 3b c6 00 00                  	addi 30, 6, 0
     2f0: 80 79 00 18                  	lwz 3, 24(25)
     2f4: 38 80 0d c0                  	li 4, 3520
     2f8: 38 a0 00 28                  	li 5, 40
     2fc: 82 db 00 1c                  	lwz 22, 28(27)
     300: 82 bb 00 24                  	lwz 21, 36(27)
     304: 48 00 00 01                  	bl .+0
     308: 7c 64 1b 78                  	mr 4, 3
     30c: 7c 63 00 34                  	cntlzw	3, 3
     310: 28 04 00 00                  	cmplwi	4, 0
     314: 54 63 df fe                  	rlwinm 3, 3, 27, 31, 31
     318: 0f 03 00 00                  	twnei	3, 0
     31c: 41 82 00 34                  	bt	2, .+52
     320: 7c 76 aa 14                  	add 3, 22, 21
     324: 93 04 00 10                  	stw 24, 16(4)
     328: 38 63 ff ff                  	addi 3, 3, -1
     32c: 90 64 00 0c                  	stw 3, 12(4)
     330: 7f c3 f3 78                  	mr 3, 30
     334: 93 44 00 00                  	stw 26, 0(4)
     338: 92 c4 00 04                  	stw 22, 4(4)
     33c: 93 44 00 08                  	stw 26, 8(4)
     340: 92 e4 00 14                  	stw 23, 20(4)
     344: 48 00 00 01                  	bl .+0
     348: 54 63 0f fe                  	srwi 3, 3, 31
     34c: 0f 03 00 00                  	twnei	3, 0
     350: 80 7d 00 10                  	lwz 3, 16(29)
     354: 3b 9c 00 18                  	addi 28, 28, 24
     358: 3b 7b 00 18                  	addi 27, 27, 24
     35c: 80 9d 00 20                  	lwz 4, 32(29)
     360: 1c 63 00 18                  	mulli 3, 3, 24
     364: 7c 64 1a 14                  	add 3, 4, 3
     368: 7c 1c 18 40                  	cmplw	28, 3
     36c: 41 80 ff 84                  	bt	0, .+65412
     370: 38 60 00 00                  	li 3, 0
     374: 83 c1 00 38                  	lwz 30, 56(1)
     378: 83 a1 00 34                  	lwz 29, 52(1)
     37c: 83 81 00 30                  	lwz 28, 48(1)
     380: 83 61 00 2c                  	lwz 27, 44(1)
     384: 83 41 00 28                  	lwz 26, 40(1)
     388: 83 21 00 24                  	lwz 25, 36(1)
     38c: 83 01 00 20                  	lwz 24, 32(1)
     390: 82 e1 00 1c                  	lwz 23, 28(1)
     394: 82 c1 00 18                  	lwz 22, 24(1)
     398: 82 a1 00 14                  	lwz 21, 20(1)
     39c: 80 01 00 44                  	lwz 0, 68(1)
     3a0: 38 21 00 40                  	addi 1, 1, 64
     3a4: 7c 08 03 a6                  	mtlr 0
     3a8: 4e 80 00 20                  	blr

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mem-diff.txt"


mem-working.o:	file format ELF32-ppc			      |	mem-broken.o:	file format ELF32-ppc


Disassembly of section .text:					Disassembly of section .text:

00000000 phys_mem_access_prot:					00000000 phys_mem_access_prot:
       0: 7c 08 02 a6                  	mflr 0			       0: 7c 08 02 a6                  	mflr 0
       4: 90 01 00 04                  	stw 0, 4(1)		       4: 90 01 00 04                  	stw 0, 4(1)
       8: 94 21 ff e0                  	stwu 1, -32(1)		       8: 94 21 ff e0                  	stwu 1, -32(1)
       c: 93 a1 00 14                  	stw 29, 20(1)		       c: 93 a1 00 14                  	stw 29, 20(1)
      10: 7c fd 3b 78                  	mr 29, 7		      10: 7c fd 3b 78                  	mr 29, 7
      14: 3c e0 00 00                  	lis 7, 0		      14: 3c e0 00 00                  	lis 7, 0
      18: 38 e7 00 00                  	addi 7, 7, 0		      18: 38 e7 00 00                  	addi 7, 7, 0
      1c: 81 07 00 a0                  	lwz 8, 160(7)		      1c: 81 07 00 a0                  	lwz 8, 160(7)
      20: 93 c1 00 18                  	stw 30, 24(1)		      20: 93 c1 00 18                  	stw 30, 24(1)
      24: 28 08 00 00                  	cmplwi	8, 0		      24: 28 08 00 00                  	cmplwi	8, 0
      28: 7c 7e 1b 78                  	mr 30, 3		      28: 7c 7e 1b 78                  	mr 30, 3
      2c: 41 82 00 20                  	bt	2, .+32		      2c: 41 82 00 20                  	bt	2, .+32
      30: 80 7d 00 00                  	lwz 3, 0(29)		      30: 80 7d 00 00                  	lwz 3, 0(29)
      34: 38 e1 00 08                  	addi 7, 1, 8		      34: 38 e1 00 08                  	addi 7, 1, 8
      38: 7d 09 03 a6                  	mtctr 8			      38: 7d 09 03 a6                  	mtctr 8
      3c: 90 61 00 08                  	stw 3, 8(1)		      3c: 90 61 00 08                  	stw 3, 8(1)
      40: 7f c3 f3 78                  	mr 3, 30		      40: 7f c3 f3 78                  	mr 3, 30
      44: 4e 80 04 21                  	bctrl			      44: 4e 80 04 21                  	bctrl
      48: 48 00 00 28                  	b .+40			      48: 48 00 00 28                  	b .+40
      4c: 7c a3 2b 78                  	mr 3, 5			      4c: 7c a3 2b 78                  	mr 3, 5
      50: 48 00 00 01                  	bl .+0			      50: 48 00 00 01                  	bl .+0
      54: 28 03 00 00                  	cmplwi	3, 0		      54: 28 03 00 00                  	cmplwi	3, 0
      58: 80 7d 00 00                  	lwz 3, 0(29)		      58: 80 7d 00 00                  	lwz 3, 0(29)
      5c: 40 82 00 10                  	bf	2, .+16		      5c: 40 82 00 10                  	bf	2, .+16
      60: 54 63 06 26                  	rlwinm 3, 3, 0, 24, 1	      60: 54 63 06 26                  	rlwinm 3, 3, 0, 24, 1
      64: 60 63 05 00                  	ori 3, 3, 1280		      64: 60 63 05 00                  	ori 3, 3, 1280
      68: 90 7d 00 00                  	stw 3, 0(29)		      68: 90 7d 00 00                  	stw 3, 0(29)
      6c: 90 7e 00 00                  	stw 3, 0(30)		      6c: 90 7e 00 00                  	stw 3, 0(30)
      70: 83 c1 00 18                  	lwz 30, 24(1)		      70: 83 c1 00 18                  	lwz 30, 24(1)
      74: 83 a1 00 14                  	lwz 29, 20(1)		      74: 83 a1 00 14                  	lwz 29, 20(1)
      78: 80 01 00 24                  	lwz 0, 36(1)		      78: 80 01 00 24                  	lwz 0, 36(1)
      7c: 38 21 00 20                  	addi 1, 1, 32		      7c: 38 21 00 20                  	addi 1, 1, 32
      80: 7c 08 03 a6                  	mtlr 0			      80: 7c 08 03 a6                  	mtlr 0
      84: 4e 80 00 20                  	blr			      84: 4e 80 00 20                  	blr

00000088 free_initmem:						00000088 free_initmem:
      88: 7c 08 02 a6                  	mflr 0			      88: 7c 08 02 a6                  	mflr 0
      8c: 90 01 00 04                  	stw 0, 4(1)		      8c: 90 01 00 04                  	stw 0, 4(1)
      90: 94 21 ff f0                  	stwu 1, -16(1)		      90: 94 21 ff f0                  	stwu 1, -16(1)
      94: 3c 60 00 00                  	lis 3, 0		      94: 3c 60 00 00                  	lis 3, 0
      98: 3c 80 00 00                  	lis 4, 0		      98: 3c 80 00 00                  	lis 4, 0
      9c: 38 63 00 00                  	addi 3, 3, 0		      9c: 38 63 00 00                  	addi 3, 3, 0
      a0: 38 84 00 00                  	addi 4, 4, 0		      a0: 38 84 00 00                  	addi 4, 4, 0
      a4: 90 83 00 60                  	stw 4, 96(3)		      a4: 90 83 00 60                  	stw 4, 96(3)
      a8: 48 00 00 01                  	bl .+0			      a8: 48 00 00 01                  	bl .+0
      ac: 3c 60 00 00                  	lis 3, 0		      ac: 3c 60 00 00                  	lis 3, 0
      b0: 38 80 00 01                  	li 4, 1			      b0: 38 80 00 01                  	li 4, 1
      b4: 98 83 00 00                  	stb 4, 0(3)		      b4: 98 83 00 00                  	stb 4, 0(3)
      b8: 3c 60 00 00                  	lis 3, 0		      b8: 3c 60 00 00                  	lis 3, 0
      bc: 3c 80 00 00                  	lis 4, 0		      bc: 3c 80 00 00                  	lis 4, 0
      c0: 3c a0 00 00                  	lis 5, 0		      c0: 3c a0 00 00                  	lis 5, 0
      c4: 38 63 00 00                  	addi 3, 3, 0		      c4: 38 63 00 00                  	addi 3, 3, 0
      c8: 38 84 00 00                  	addi 4, 4, 0		      c8: 38 84 00 00                  	addi 4, 4, 0
      cc: 38 c5 00 00                  	addi 6, 5, 0		      cc: 38 c5 00 00                  	addi 6, 5, 0
      d0: 38 a0 00 cc                  	li 5, 204		      d0: 38 a0 00 cc                  	li 5, 204
      d4: 48 00 00 01                  	bl .+0			      d4: 48 00 00 01                  	bl .+0
      d8: 80 01 00 14                  	lwz 0, 20(1)		      d8: 80 01 00 14                  	lwz 0, 20(1)
      dc: 38 21 00 10                  	addi 1, 1, 16		      dc: 38 21 00 10                  	addi 1, 1, 16
      e0: 7c 08 03 a6                  	mtlr 0			      e0: 7c 08 03 a6                  	mtlr 0
      e4: 4e 80 00 20                  	blr			      e4: 4e 80 00 20                  	blr

000000e8 flush_dcache_page:					000000e8 flush_dcache_page:
      e8: 80 83 00 00                  	lwz 4, 0(3)		      e8: 80 83 00 00                  	lwz 4, 0(3)
      ec: 70 84 08 00                  	andi. 4, 4, 2048	      ec: 70 84 08 00                  	andi. 4, 4, 2048
      f0: 4d 82 00 20                  	bclr	12, 2		      f0: 4d 82 00 20                  	bclr	12, 2
      f4: 38 80 08 00                  	li 4, 2048		      f4: 38 80 08 00                  	li 4, 2048
      f8: 7c a0 18 28                  	lwarx 5, 0, 3		      f8: 7c a0 18 28                  	lwarx 5, 0, 3
      fc: 7c a5 20 78                  	andc 5, 5, 4		      fc: 7c a5 20 78                  	andc 5, 5, 4
     100: 7c a0 19 2d                  	stwcx. 5, 0, 3		     100: 7c a0 19 2d                  	stwcx. 5, 0, 3
     104: 40 a2 ff f4                  	bc 5, 2, .+65524	     104: 40 a2 ff f4                  	bc 5, 2, .+65524
     108: 4e 80 00 20                  	blr			     108: 4e 80 00 20                  	blr

0000010c flush_dcache_icache_page:				0000010c flush_dcache_icache_page:
     10c: 7c 08 02 a6                  	mflr 0			     10c: 7c 08 02 a6                  	mflr 0
     110: 90 01 00 04                  	stw 0, 4(1)		     110: 90 01 00 04                  	stw 0, 4(1)
     114: 94 21 ff f0                  	stwu 1, -16(1)		     114: 94 21 ff f0                  	stwu 1, -16(1)
     118: 80 82 00 00                  	lwz 4, 0(2)		     118: 80 82 00 00                  	lwz 4, 0(2)
     11c: 38 84 00 01                  	addi 4, 4, 1		     11c: 38 84 00 01                  	addi 4, 4, 1
     120: 90 82 00 00                  	stw 4, 0(2)		     120: 90 82 00 00                  	stw 4, 0(2)
     124: 80 82 0a e4                  	lwz 4, 2788(2)		     124: 80 82 0a e4                  	lwz 4, 2788(2)
     128: 38 84 00 01                  	addi 4, 4, 1		     128: 38 84 00 01                  	addi 4, 4, 1
     12c: 90 82 0a e4                  	stw 4, 2788(2)		     12c: 90 82 0a e4                  	stw 4, 2788(2)
     130: 3c 80 00 00                  	lis 4, 0		     130: 3c 80 00 00                  	lis 4, 0
     134: 80 84 00 00                  	lwz 4, 0(4)		     134: 80 84 00 00                  	lwz 4, 0(4)
     138: 7c 64 18 50                  	subf 3, 4, 3		     138: 7c 64 18 50                  	subf 3, 4, 3
     13c: 3c 80 cc cc                  	lis 4, -13108		     13c: 3c 80 cc cc                  	lis 4, -13108
     140: 54 63 e8 fe                  	srwi 3, 3, 3		     140: 54 63 e8 fe                  	srwi 3, 3, 3
     144: 60 84 d0 00                  	ori 4, 4, 53248		     144: 60 84 d0 00                  	ori 4, 4, 53248
     148: 7c 63 21 d6                  	mullw 3, 3, 4		     148: 7c 63 21 d6                  	mullw 3, 3, 4
     14c: 3c 63 c0 00                  	addis 3, 3, -16384	     14c: 3c 63 c0 00                  	addis 3, 3, -16384
     150: 48 00 00 01                  	bl .+0			     150: 48 00 00 01                  	bl .+0
     154: 80 62 0a e4                  	lwz 3, 2788(2)		     154: 80 62 0a e4                  	lwz 3, 2788(2)
     158: 38 63 ff ff                  	addi 3, 3, -1		     158: 38 63 ff ff                  	addi 3, 3, -1
     15c: 90 62 0a e4                  	stw 3, 2788(2)		     15c: 90 62 0a e4                  	stw 3, 2788(2)
     160: 80 62 00 00                  	lwz 3, 0(2)		     160: 80 62 00 00                  	lwz 3, 0(2)
     164: 38 63 ff ff                  	addi 3, 3, -1		     164: 38 63 ff ff                  	addi 3, 3, -1
     168: 90 62 00 00                  	stw 3, 0(2)		     168: 90 62 00 00                  	stw 3, 0(2)
     16c: 80 01 00 14                  	lwz 0, 20(1)		     16c: 80 01 00 14                  	lwz 0, 20(1)
     170: 38 21 00 10                  	addi 1, 1, 16		     170: 38 21 00 10                  	addi 1, 1, 16
     174: 7c 08 03 a6                  	mtlr 0			     174: 7c 08 03 a6                  	mtlr 0
     178: 4e 80 00 20                  	blr			     178: 4e 80 00 20                  	blr

0000017c clear_user_page:					0000017c clear_user_page:
     17c: 38 80 00 80                  	li 4, 128	      |	     17c: 94 21 ff f0                  	stwu 1, -16(1)
     180: 7c 89 03 a6                  	mtctr 4		      |	     180: 38 80 00 80                  	li 4, 128
     184: 7c 00 1f ec                  	dcbz 0, 3	      |	     184: 38 63 ff e0                  	addi 3, 3, -32
     188: 38 63 00 20                  	addi 3, 3, 32	      |	     188: 7c 89 03 a6                  	mtctr 4
     18c: 42 00 ff f8                  	bdnz .+65528	      |	     18c: 38 81 00 0f                  	addi 4, 1, 15
     190: 80 65 00 00                  	lwz 3, 0(5)	      |	     190: 8c c3 00 20                  	lbzu 6, 32(3)
     194: 70 63 08 00                  	andi. 3, 3, 2048      |	     194: 98 c1 00 0f                  	stb 6, 15(1)
     198: 4d 82 00 20                  	bclr	12, 2	      |	     198: 7c 00 27 ec                  	dcbz 0, 4
     19c: 38 60 08 00                  	li 3, 2048	      |	     19c: 42 00 ff f4                  	bdnz .+65524
     1a0: 7c 80 28 28                  	lwarx 4, 0, 5	      |	     1a0: 80 65 00 00                  	lwz 3, 0(5)
     1a4: 7c 84 18 78                  	andc 4, 4, 3	      |	     1a4: 70 63 08 00                  	andi. 3, 3, 2048
     1a8: 7c 80 29 2d                  	stwcx. 4, 0, 5	      |	     1a8: 41 82 00 18                  	bt	2, .+24
     1ac: 40 a2 ff f4                  	bc 5, 2, .+65524      |	     1ac: 38 60 08 00                  	li 3, 2048
     1b0: 4e 80 00 20                  	blr		      |	     1b0: 7c 80 28 28                  	lwarx 4, 0, 5
							      |	     1b4: 7c 84 18 78                  	andc 4, 4, 3
000001b4 copy_user_page:				      |	     1b8: 7c 80 29 2d                  	stwcx. 4, 0, 5
     1b4: 7c 08 02 a6                  	mflr 0		      |	     1bc: 40 a2 ff f4                  	bc 5, 2, .+65524
     1b8: 90 01 00 04                  	stw 0, 4(1)	      |	     1c0: 38 21 00 10                  	addi 1, 1, 16
     1bc: 94 21 ff f0                  	stwu 1, -16(1)	      |	     1c4: 4e 80 00 20                  	blr
     1c0: 93 c1 00 08                  	stw 30, 8(1)	      |
     1c4: 7c de 33 78                  	mr 30, 6	      |	000001c8 copy_user_page:
     1c8: 48 00 00 01                  	bl .+0		      |	     1c8: 7c 08 02 a6                  	mflr 0
     1cc: 80 7e 00 00                  	lwz 3, 0(30)	      |	     1cc: 90 01 00 04                  	stw 0, 4(1)
     1d0: 70 63 08 00                  	andi. 3, 3, 2048      |	     1d0: 94 21 ff f0                  	stwu 1, -16(1)
     1d4: 41 82 00 18                  	bt	2, .+24	      |	     1d4: 93 c1 00 08                  	stw 30, 8(1)
     1d8: 38 60 08 00                  	li 3, 2048	      |	     1d8: 7c de 33 78                  	mr 30, 6
     1dc: 7c 80 f0 28                  	lwarx 4, 0, 30	      |	     1dc: 48 00 00 01                  	bl .+0
     1e0: 7c 84 18 78                  	andc 4, 4, 3	      |	     1e0: 80 7e 00 00                  	lwz 3, 0(30)
     1e4: 7c 80 f1 2d                  	stwcx. 4, 0, 30	      |	     1e4: 70 63 08 00                  	andi. 3, 3, 2048
     1e8: 40 a2 ff f4                  	bc 5, 2, .+65524      |	     1e8: 41 82 00 18                  	bt	2, .+24
     1ec: 83 c1 00 08                  	lwz 30, 8(1)	      |	     1ec: 38 60 08 00                  	li 3, 2048
     1f0: 80 01 00 14                  	lwz 0, 20(1)	      |	     1f0: 7c 80 f0 28                  	lwarx 4, 0, 30
     1f4: 38 21 00 10                  	addi 1, 1, 16	      |	     1f4: 7c 84 18 78                  	andc 4, 4, 3
     1f8: 7c 08 03 a6                  	mtlr 0		      |	     1f8: 7c 80 f1 2d                  	stwcx. 4, 0, 30
     1fc: 4e 80 00 20                  	blr		      |	     1fc: 40 a2 ff f4                  	bc 5, 2, .+65524
							      |	     200: 83 c1 00 08                  	lwz 30, 8(1)
00000200 flush_icache_user_range:			      |	     204: 80 01 00 14                  	lwz 0, 20(1)
     200: 7c 08 02 a6                  	mflr 0		      |	     208: 38 21 00 10                  	addi 1, 1, 16
     204: 90 01 00 04                  	stw 0, 4(1)	      |	     20c: 7c 08 03 a6                  	mtlr 0
     208: 94 21 ff e0                  	stwu 1, -32(1)	      |	     210: 4e 80 00 20                  	blr
     20c: 3c 60 00 00                  	lis 3, 0	      |
     210: 93 81 00 10                  	stw 28, 16(1)	      |	00000214 flush_icache_user_range:
     214: 7c 9c 23 78                  	mr 28, 4	      |	     214: 7c 08 02 a6                  	mflr 0
     218: 38 63 00 00                  	addi 3, 3, 0	      |	     218: 90 01 00 04                  	stw 0, 4(1)
     21c: 38 80 00 53                  	li 4, 83	      |	     21c: 94 21 ff e0                  	stwu 1, -32(1)
     220: 93 a1 00 14                  	stw 29, 20(1)	      |	     220: 3c 60 00 00                  	lis 3, 0
     224: 7c bd 2b 78                  	mr 29, 5	      |	     224: 93 81 00 10                  	stw 28, 16(1)
     228: 38 a0 00 00                  	li 5, 0		      |	     228: 7c 9c 23 78                  	mr 28, 4
     22c: 93 c1 00 18                  	stw 30, 24(1)	      |	     22c: 38 63 00 00                  	addi 3, 3, 0
     230: 7c de 33 78                  	mr 30, 6	      |	     230: 38 80 00 53                  	li 4, 83
     234: 48 00 00 01                  	bl .+0		      |	     234: 93 a1 00 14                  	stw 29, 20(1)
     238: 3c 60 00 00                  	lis 3, 0	      |	     238: 7c bd 2b 78                  	mr 29, 5
     23c: 3c 80 cc cc                  	lis 4, -13108	      |	     23c: 38 a0 00 00                  	li 5, 0
     240: 80 63 00 00                  	lwz 3, 0(3)	      |	     240: 93 c1 00 18                  	stw 30, 24(1)
     244: 60 84 d0 00                  	ori 4, 4, 53248	      |	     244: 7c de 33 78                  	mr 30, 6
     248: 7c 63 e0 50                  	subf 3, 3, 28	      |	     248: 48 00 00 01                  	bl .+0
     24c: 54 63 e8 fe                  	srwi 3, 3, 3	      |	     24c: 3c 60 00 00                  	lis 3, 0
     250: 7c 63 21 d6                  	mullw 3, 3, 4	      |	     250: 3c 80 cc cc                  	lis 4, -13108
     254: 57 a4 05 3e                  	clrlwi	4, 29, 20     |	     254: 80 63 00 00                  	lwz 3, 0(3)
     258: 50 64 00 26                  	rlwimi 4, 3, 0, 0, 19 |	     258: 60 84 d0 00                  	ori 4, 4, 53248
     25c: 3c 64 c0 00                  	addis 3, 4, -16384    |	     25c: 7c 63 e0 50                  	subf 3, 3, 28
     260: 7c 83 f2 14                  	add 4, 3, 30	      |	     260: 54 63 e8 fe                  	srwi 3, 3, 3
     264: 48 00 00 01                  	bl .+0		      |	     264: 7c 63 21 d6                  	mullw 3, 3, 4
     268: 83 c1 00 18                  	lwz 30, 24(1)	      |	     268: 57 a4 05 3e                  	clrlwi	4, 29, 20
     26c: 83 a1 00 14                  	lwz 29, 20(1)	      |	     26c: 50 64 00 26                  	rlwimi 4, 3, 0, 0, 19
     270: 83 81 00 10                  	lwz 28, 16(1)	      |	     270: 3c 64 c0 00                  	addis 3, 4, -16384
     274: 80 01 00 24                  	lwz 0, 36(1)	      |	     274: 7c 83 f2 14                  	add 4, 3, 30
     278: 38 21 00 20                  	addi 1, 1, 32	      |	     278: 48 00 00 01                  	bl .+0
     27c: 7c 08 03 a6                  	mtlr 0		      |	     27c: 83 c1 00 18                  	lwz 30, 24(1)
     280: 4e 80 00 20                  	blr		      |	     280: 83 a1 00 14                  	lwz 29, 20(1)
							      |	     284: 83 81 00 10                  	lwz 28, 16(1)
00000284 update_mmu_cache:				      |	     288: 80 01 00 24                  	lwz 0, 36(1)
     284: 4e 80 00 20                  	blr		      |	     28c: 38 21 00 20                  	addi 1, 1, 32
							      |	     290: 7c 08 03 a6                  	mtlr 0
00000288 devmem_is_allowed:				      |	     294: 4e 80 00 20                  	blr
     288: 7c 08 02 a6                  	mflr 0		      |
     28c: 90 01 00 04                  	stw 0, 4(1)	      |	00000298 update_mmu_cache:
     290: 94 21 ff f0                  	stwu 1, -16(1)	      |	     298: 4e 80 00 20                  	blr
     294: 93 c1 00 08                  	stw 30, 8(1)	      |
     298: 7c 7e 1b 78                  	mr 30, 3	      |	0000029c devmem_is_allowed:
     29c: 54 63 65 3e                  	srwi 3, 3, 20	      |	     29c: 7c 08 02 a6                  	mflr 0
     2a0: 57 c4 60 26                  	slwi 4, 30, 12	      |	     2a0: 90 01 00 04                  	stw 0, 4(1)
     2a4: 48 00 00 01                  	bl .+0		      |	     2a4: 94 21 ff f0                  	stwu 1, -16(1)
     2a8: 70 63 00 01                  	andi. 3, 3, 1	      |	     2a8: 93 c1 00 08                  	stw 30, 8(1)
     2ac: 38 60 00 00                  	li 3, 0		      |	     2ac: 7c 7e 1b 78                  	mr 30, 3
     2b0: 41 81 00 14                  	bt	1, .+20	      |	     2b0: 54 63 65 3e                  	srwi 3, 3, 20
     2b4: 7f c3 f3 78                  	mr 3, 30	      |	     2b4: 57 c4 60 26                  	slwi 4, 30, 12
     2b8: 48 00 00 01                  	bl .+0			     2b8: 48 00 00 01                  	bl .+0
     2bc: 7c 63 00 34                  	cntlzw	3, 3	      |	     2bc: 70 63 00 01                  	andi. 3, 3, 1
     2c0: 54 63 df fe                  	rlwinm 3, 3, 27, 31,  |	     2c0: 38 60 00 00                  	li 3, 0
     2c4: 83 c1 00 08                  	lwz 30, 8(1)	      |	     2c4: 41 81 00 14                  	bt	1, .+20
     2c8: 80 01 00 14                  	lwz 0, 20(1)	      |	     2c8: 7f c3 f3 78                  	mr 3, 30
     2cc: 38 21 00 10                  	addi 1, 1, 16	      |	     2cc: 48 00 00 01                  	bl .+0
     2d0: 7c 08 03 a6                  	mtlr 0		      |	     2d0: 7c 63 00 34                  	cntlzw	3, 3
     2d4: 4e 80 00 20                  	blr		      |	     2d4: 54 63 df fe                  	rlwinm 3, 3, 27, 31, 
							      >	     2d8: 83 c1 00 08                  	lwz 30, 8(1)
							      >	     2dc: 80 01 00 14                  	lwz 0, 20(1)
							      >	     2e0: 38 21 00 10                  	addi 1, 1, 16
							      >	     2e4: 7c 08 03 a6                  	mtlr 0
							      >	     2e8: 4e 80 00 20                  	blr

Disassembly of section .init.text:				Disassembly of section .init.text:

00000000 mem_topology_setup:					00000000 mem_topology_setup:
       0: 7c 08 02 a6                  	mflr 0			       0: 7c 08 02 a6                  	mflr 0
       4: 90 01 00 04                  	stw 0, 4(1)		       4: 90 01 00 04                  	stw 0, 4(1)
       8: 94 21 ff f0                  	stwu 1, -16(1)		       8: 94 21 ff f0                  	stwu 1, -16(1)
       c: 48 00 00 01                  	bl .+0			       c: 48 00 00 01                  	bl .+0
      10: 54 84 a0 3e                  	rotlwi	4, 4, 20	      10: 54 84 a0 3e                  	rotlwi	4, 4, 20
      14: 3c a0 00 00                  	lis 5, 0		      14: 3c a0 00 00                  	lis 5, 0
      18: 50 64 a0 16                  	rlwimi 4, 3, 20, 0, 1	      18: 50 64 a0 16                  	rlwimi 4, 3, 20, 0, 1
      1c: 3c 60 00 00                  	lis 3, 0		      1c: 3c 60 00 00                  	lis 3, 0
      20: 90 85 00 00                  	stw 4, 0(5)		      20: 90 85 00 00                  	stw 4, 0(5)
      24: 38 a0 ff ff                  	li 5, -1		      24: 38 a0 ff ff                  	li 5, -1
      28: 90 83 00 00                  	stw 4, 0(3)		      28: 90 83 00 00                  	stw 4, 0(3)
      2c: 3c 60 00 00                  	lis 3, 0		      2c: 3c 60 00 00                  	lis 3, 0
      30: 38 80 00 00                  	li 4, 0			      30: 38 80 00 00                  	li 4, 0
      34: 38 c0 ff ff                  	li 6, -1		      34: 38 c0 ff ff                  	li 6, -1
      38: 39 00 00 00                  	li 8, 0			      38: 39 00 00 00                  	li 8, 0
      3c: 90 83 00 00                  	stw 4, 0(3)		      3c: 90 83 00 00                  	stw 4, 0(3)
      40: 3c 60 00 00                  	lis 3, 0		      40: 3c 60 00 00                  	lis 3, 0
      44: 38 80 00 00                  	li 4, 0			      44: 38 80 00 00                  	li 4, 0
      48: 38 63 00 00                  	addi 3, 3, 0		      48: 38 63 00 00                  	addi 3, 3, 0
      4c: 38 e3 00 10                  	addi 7, 3, 16		      4c: 38 e3 00 10                  	addi 7, 3, 16
      50: 38 60 00 00                  	li 3, 0			      50: 38 60 00 00                  	li 3, 0
      54: 48 00 00 01                  	bl .+0			      54: 48 00 00 01                  	bl .+0
      58: 80 01 00 14                  	lwz 0, 20(1)		      58: 80 01 00 14                  	lwz 0, 20(1)
      5c: 38 21 00 10                  	addi 1, 1, 16		      5c: 38 21 00 10                  	addi 1, 1, 16
      60: 7c 08 03 a6                  	mtlr 0			      60: 7c 08 03 a6                  	mtlr 0
      64: 4e 80 00 20                  	blr			      64: 4e 80 00 20                  	blr

00000068 initmem_init:						00000068 initmem_init:
      68: 7c 08 02 a6                  	mflr 0			      68: 7c 08 02 a6                  	mflr 0
      6c: 90 01 00 04                  	stw 0, 4(1)		      6c: 90 01 00 04                  	stw 0, 4(1)
      70: 94 21 ff f0                  	stwu 1, -16(1)		      70: 94 21 ff f0                  	stwu 1, -16(1)
      74: 38 60 00 00                  	li 3, 0			      74: 38 60 00 00                  	li 3, 0
      78: 48 00 00 01                  	bl .+0			      78: 48 00 00 01                  	bl .+0
      7c: 80 01 00 14                  	lwz 0, 20(1)		      7c: 80 01 00 14                  	lwz 0, 20(1)
      80: 38 21 00 10                  	addi 1, 1, 16		      80: 38 21 00 10                  	addi 1, 1, 16
      84: 7c 08 03 a6                  	mtlr 0			      84: 7c 08 03 a6                  	mtlr 0
      88: 4e 80 00 20                  	blr			      88: 4e 80 00 20                  	blr

0000008c paging_init:						0000008c paging_init:
      8c: 7c 08 02 a6                  	mflr 0			      8c: 7c 08 02 a6                  	mflr 0
      90: 90 01 00 04                  	stw 0, 4(1)		      90: 90 01 00 04                  	stw 0, 4(1)
      94: 94 21 ff d0                  	stwu 1, -48(1)		      94: 94 21 ff d0                  	stwu 1, -48(1)
      98: 93 21 00 14                  	stw 25, 20(1)		      98: 93 21 00 14                  	stw 25, 20(1)
      9c: 93 41 00 18                  	stw 26, 24(1)		      9c: 93 41 00 18                  	stw 26, 24(1)
      a0: 93 61 00 1c                  	stw 27, 28(1)		      a0: 93 61 00 1c                  	stw 27, 28(1)
      a4: 93 81 00 20                  	stw 28, 32(1)		      a4: 93 81 00 20                  	stw 28, 32(1)
      a8: 93 a1 00 24                  	stw 29, 36(1)		      a8: 93 a1 00 24                  	stw 29, 36(1)
      ac: 93 c1 00 28                  	stw 30, 40(1)		      ac: 93 c1 00 28                  	stw 30, 40(1)
      b0: 48 00 00 01                  	bl .+0			      b0: 48 00 00 01                  	bl .+0
      b4: 7c 7e 1b 78                  	mr 30, 3		      b4: 7c 7e 1b 78                  	mr 30, 3
      b8: 7c 9d 23 78                  	mr 29, 4		      b8: 7c 9d 23 78                  	mr 29, 4
      bc: 3f 40 ff fe                  	lis 26, -2		      bc: 3f 40 ff fe                  	lis 26, -2
      c0: 48 00 00 01                  	bl .+0			      c0: 48 00 00 01                  	bl .+0
      c4: 7c 7c 1b 78                  	mr 28, 3		      c4: 7c 7c 1b 78                  	mr 28, 3
      c8: 7c 9b 23 78                  	mr 27, 4		      c8: 7c 9b 23 78                  	mr 27, 4
      cc: 3b 20 00 00                  	li 25, 0		      cc: 3b 20 00 00                  	li 25, 0
      d0: 38 e1 00 08                  	addi 7, 1, 8		      d0: 38 e1 00 08                  	addi 7, 1, 8
      d4: 7f 43 d3 78                  	mr 3, 26		      d4: 7f 43 d3 78                  	mr 3, 26
      d8: 93 21 00 10                  	stw 25, 16(1)		      d8: 93 21 00 10                  	stw 25, 16(1)
      dc: 38 a0 00 00                  	li 5, 0			      dc: 38 a0 00 00                  	li 5, 0
      e0: 38 c0 00 00                  	li 6, 0			      e0: 38 c0 00 00                  	li 6, 0
      e4: 93 21 00 08                  	stw 25, 8(1)		      e4: 93 21 00 08                  	stw 25, 8(1)
      e8: 48 00 00 01                  	bl .+0			      e8: 48 00 00 01                  	bl .+0
      ec: 3b 5a 10 00                  	addi 26, 26, 4096	      ec: 3b 5a 10 00                  	addi 26, 26, 4096
      f0: 2c 1a f0 00                  	cmpwi	26, -4096	      f0: 2c 1a f0 00                  	cmpwi	26, -4096
      f4: 40 82 ff dc                  	bf	2, .+65500	      f4: 40 82 ff dc                  	bf	2, .+65500
      f8: 3c 60 00 00                  	lis 3, 0		      f8: 3c 60 00 00                  	lis 3, 0
      fc: 4c c6 31 82                  	crclr	6		      fc: 4c c6 31 82                  	crclr	6
     100: 7f 85 e3 78                  	mr 5, 28		     100: 7f 85 e3 78                  	mr 5, 28
     104: 38 63 00 00                  	addi 3, 3, 0		     104: 38 63 00 00                  	addi 3, 3, 0
     108: 7f 66 db 78                  	mr 6, 27		     108: 7f 66 db 78                  	mr 6, 27
     10c: 7f c7 f3 78                  	mr 7, 30		     10c: 7f c7 f3 78                  	mr 7, 30
     110: 7f a8 eb 78                  	mr 8, 29		     110: 7f a8 eb 78                  	mr 8, 29
     114: 48 00 00 01                  	bl .+0			     114: 48 00 00 01                  	bl .+0
     118: 7c 7d d8 10                  	subfc 3, 29, 27		     118: 7c 7d d8 10                  	subfc 3, 29, 27
     11c: 4c c6 31 82                  	crclr	6		     11c: 4c c6 31 82                  	crclr	6
     120: 7c be e1 10                  	subfe 5, 30, 28		     120: 7c be e1 10                  	subfe 5, 30, 28
     124: 54 64 60 3e                  	rotlwi	4, 3, 12	     124: 54 64 60 3e                  	rotlwi	4, 3, 12
     128: 3c 60 00 00                  	lis 3, 0		     128: 3c 60 00 00                  	lis 3, 0
     12c: 50 a4 60 26                  	rlwimi 4, 5, 12, 0, 1	     12c: 50 a4 60 26                  	rlwimi 4, 5, 12, 0, 1
     130: 38 63 00 00                  	addi 3, 3, 0		     130: 38 63 00 00                  	addi 3, 3, 0
     134: 48 00 00 01                  	bl .+0			     134: 48 00 00 01                  	bl .+0
     138: 3c 60 00 00                  	lis 3, 0		     138: 3c 60 00 00                  	lis 3, 0
     13c: 80 83 00 00                  	lwz 4, 0(3)		     13c: 80 83 00 00                  	lwz 4, 0(3)
     140: 3c 60 00 00                  	lis 3, 0		     140: 3c 60 00 00                  	lis 3, 0
     144: 94 83 00 00                  	stwu 4, 0(3)		     144: 94 83 00 00                  	stwu 4, 0(3)
     148: 48 00 00 01                  	bl .+0			     148: 48 00 00 01                  	bl .+0
     14c: 83 c1 00 28                  	lwz 30, 40(1)		     14c: 83 c1 00 28                  	lwz 30, 40(1)
     150: 83 a1 00 24                  	lwz 29, 36(1)		     150: 83 a1 00 24                  	lwz 29, 36(1)
     154: 83 81 00 20                  	lwz 28, 32(1)		     154: 83 81 00 20                  	lwz 28, 32(1)
     158: 83 61 00 1c                  	lwz 27, 28(1)		     158: 83 61 00 1c                  	lwz 27, 28(1)
     15c: 83 41 00 18                  	lwz 26, 24(1)		     15c: 83 41 00 18                  	lwz 26, 24(1)
     160: 83 21 00 14                  	lwz 25, 20(1)		     160: 83 21 00 14                  	lwz 25, 20(1)
     164: 80 01 00 34                  	lwz 0, 52(1)		     164: 80 01 00 34                  	lwz 0, 52(1)
     168: 38 21 00 30                  	addi 1, 1, 48		     168: 38 21 00 30                  	addi 1, 1, 48
     16c: 7c 08 03 a6                  	mtlr 0			     16c: 7c 08 03 a6                  	mtlr 0
     170: 4e 80 00 20                  	blr			     170: 4e 80 00 20                  	blr

00000174 mem_init:						00000174 mem_init:
     174: 7c 08 02 a6                  	mflr 0			     174: 7c 08 02 a6                  	mflr 0
     178: 90 01 00 04                  	stw 0, 4(1)		     178: 90 01 00 04                  	stw 0, 4(1)
     17c: 94 21 ff e0                  	stwu 1, -32(1)		     17c: 94 21 ff e0                  	stwu 1, -32(1)
     180: 3c 60 00 00                  	lis 3, 0		     180: 3c 60 00 00                  	lis 3, 0
     184: 3c 80 00 00                  	lis 4, 0		     184: 3c 80 00 00                  	lis 4, 0
     188: 93 81 00 10                  	stw 28, 16(1)		     188: 93 81 00 10                  	stw 28, 16(1)
     18c: 3f 80 00 00                  	lis 28, 0		     18c: 3f 80 00 00                  	lis 28, 0
     190: 80 63 00 00                  	lwz 3, 0(3)		     190: 80 63 00 00                  	lwz 3, 0(3)
     194: 80 84 00 00                  	lwz 4, 0(4)		     194: 80 84 00 00                  	lwz 4, 0(4)
     198: 54 63 60 26                  	slwi 3, 3, 12		     198: 54 63 60 26                  	slwi 3, 3, 12
     19c: 3c 63 c0 00                  	addis 3, 3, -16384	     19c: 3c 63 c0 00                  	addis 3, 3, -16384
     1a0: 90 7c 00 00                  	stw 3, 0(28)		     1a0: 90 7c 00 00                  	stw 3, 0(28)
     1a4: 3c 60 00 00                  	lis 3, 0		     1a4: 3c 60 00 00                  	lis 3, 0
     1a8: 93 a1 00 14                  	stw 29, 20(1)		     1a8: 93 a1 00 14                  	stw 29, 20(1)
     1ac: 93 c1 00 18                  	stw 30, 24(1)		     1ac: 93 c1 00 18                  	stw 30, 24(1)
     1b0: 90 83 00 00                  	stw 4, 0(3)		     1b0: 90 83 00 00                  	stw 4, 0(3)
     1b4: 48 00 00 01                  	bl .+0			     1b4: 48 00 00 01                  	bl .+0
     1b8: 38 60 00 00                  	li 3, 0			     1b8: 38 60 00 00                  	li 3, 0
     1bc: 48 00 00 01                  	bl .+0			     1bc: 48 00 00 01                  	bl .+0
     1c0: 3c 60 00 00                  	lis 3, 0		     1c0: 3c 60 00 00                  	lis 3, 0
     1c4: 4c c6 31 82                  	crclr	6		     1c4: 4c c6 31 82                  	crclr	6
     1c8: 38 63 00 00                  	addi 3, 3, 0		     1c8: 38 63 00 00                  	addi 3, 3, 0
     1cc: 48 00 00 01                  	bl .+0			     1cc: 48 00 00 01                  	bl .+0
     1d0: 3c 80 ff fd                  	lis 4, -3		     1d0: 3c 80 ff fd                  	lis 4, -3
     1d4: 3c 60 00 00                  	lis 3, 0		     1d4: 3c 60 00 00                  	lis 3, 0
     1d8: 4c c6 31 82                  	crclr	6		     1d8: 4c c6 31 82                  	crclr	6
     1dc: 60 9e f0 00                  	ori 30, 4, 61440	     1dc: 60 9e f0 00                  	ori 30, 4, 61440
     1e0: 38 63 00 00                  	addi 3, 3, 0		     1e0: 38 63 00 00                  	addi 3, 3, 0
     1e4: 7f c4 f3 78                  	mr 4, 30		     1e4: 7f c4 f3 78                  	mr 4, 30
     1e8: 38 a0 f0 00                  	li 5, -4096		     1e8: 38 a0 f0 00                  	li 5, -4096
     1ec: 48 00 00 01                  	bl .+0			     1ec: 48 00 00 01                  	bl .+0
     1f0: 3c 80 ff dd                  	lis 4, -35		     1f0: 3c 80 ff dd                  	lis 4, -35
     1f4: 3c 60 00 00                  	lis 3, 0		     1f4: 3c 60 00 00                  	lis 3, 0
     1f8: 4c c6 31 82                  	crclr	6		     1f8: 4c c6 31 82                  	crclr	6
     1fc: 60 9d f0 00                  	ori 29, 4, 61440	     1fc: 60 9d f0 00                  	ori 29, 4, 61440
     200: 38 63 00 00                  	addi 3, 3, 0		     200: 38 63 00 00                  	addi 3, 3, 0
     204: 7f a4 eb 78                  	mr 4, 29		     204: 7f a4 eb 78                  	mr 4, 29
     208: 7f c5 f3 78                  	mr 5, 30		     208: 7f c5 f3 78                  	mr 5, 30
     20c: 48 00 00 01                  	bl .+0			     20c: 48 00 00 01                  	bl .+0
     210: 3f c0 00 00                  	lis 30, 0		     210: 3f c0 00 00                  	lis 30, 0
     214: 3c 60 00 00                  	lis 3, 0		     214: 3c 60 00 00                  	lis 3, 0
     218: 4c c6 31 82                  	crclr	6		     218: 4c c6 31 82                  	crclr	6
     21c: 80 9e 00 00                  	lwz 4, 0(30)		     21c: 80 9e 00 00                  	lwz 4, 0(30)
     220: 38 63 00 00                  	addi 3, 3, 0		     220: 38 63 00 00                  	addi 3, 3, 0
     224: 7f a5 eb 78                  	mr 5, 29		     224: 7f a5 eb 78                  	mr 5, 29
     228: 48 00 00 01                  	bl .+0			     228: 48 00 00 01                  	bl .+0
     22c: 80 7c 00 00                  	lwz 3, 0(28)		     22c: 80 7c 00 00                  	lwz 3, 0(28)
     230: 3c 80 01 00                  	lis 4, 256		     230: 3c 80 01 00                  	lis 4, 256
     234: 4c c6 31 82                  	crclr	6		     234: 4c c6 31 82                  	crclr	6
     238: 38 63 ff ff                  	addi 3, 3, -1		     238: 38 63 ff ff                  	addi 3, 3, -1
     23c: 80 be 00 00                  	lwz 5, 0(30)		     23c: 80 be 00 00                  	lwz 5, 0(30)
     240: 3c 63 10 00                  	addis 3, 3, 4096	     240: 3c 63 10 00                  	addis 3, 3, 4096
     244: 54 63 00 06                  	rlwinm 3, 3, 0, 0, 3	     244: 54 63 00 06                  	rlwinm 3, 3, 0, 0, 3
     248: 50 64 02 0c                  	rlwimi 4, 3, 0, 8, 6	     248: 50 64 02 0c                  	rlwimi 4, 3, 0, 8, 6
     24c: 3c 60 00 00                  	lis 3, 0		     24c: 3c 60 00 00                  	lis 3, 0
     250: 38 63 00 00                  	addi 3, 3, 0		     250: 38 63 00 00                  	addi 3, 3, 0
     254: 48 00 00 01                  	bl .+0			     254: 48 00 00 01                  	bl .+0
     258: 83 c1 00 18                  	lwz 30, 24(1)		     258: 83 c1 00 18                  	lwz 30, 24(1)
     25c: 83 a1 00 14                  	lwz 29, 20(1)		     25c: 83 a1 00 14                  	lwz 29, 20(1)
     260: 83 81 00 10                  	lwz 28, 16(1)		     260: 83 81 00 10                  	lwz 28, 16(1)
     264: 80 01 00 24                  	lwz 0, 36(1)		     264: 80 01 00 24                  	lwz 0, 36(1)
     268: 38 21 00 20                  	addi 1, 1, 32		     268: 38 21 00 20                  	addi 1, 1, 32
     26c: 7c 08 03 a6                  	mtlr 0			     26c: 7c 08 03 a6                  	mtlr 0
     270: 4e 80 00 20                  	blr			     270: 4e 80 00 20                  	blr

00000274 add_system_ram_resources:				00000274 add_system_ram_resources:
     274: 7c 08 02 a6                  	mflr 0			     274: 7c 08 02 a6                  	mflr 0
     278: 90 01 00 04                  	stw 0, 4(1)		     278: 90 01 00 04                  	stw 0, 4(1)
     27c: 94 21 ff c0                  	stwu 1, -64(1)		     27c: 94 21 ff c0                  	stwu 1, -64(1)
     280: 3c 60 00 00                  	lis 3, 0		     280: 3c 60 00 00                  	lis 3, 0
     284: 93 a1 00 34                  	stw 29, 52(1)		     284: 93 a1 00 34                  	stw 29, 52(1)
     288: 3b a3 00 00                  	addi 29, 3, 0		     288: 3b a3 00 00                  	addi 29, 3, 0
     28c: 80 7d 00 10                  	lwz 3, 16(29)		     28c: 80 7d 00 10                  	lwz 3, 16(29)
     290: 93 81 00 30                  	stw 28, 48(1)		     290: 93 81 00 30                  	stw 28, 48(1)
     294: 1c 63 00 18                  	mulli 3, 3, 24		     294: 1c 63 00 18                  	mulli 3, 3, 24
     298: 83 9d 00 20                  	lwz 28, 32(29)		     298: 83 9d 00 20                  	lwz 28, 32(29)
     29c: 7c 7c 1a 14                  	add 3, 28, 3		     29c: 7c 7c 1a 14                  	add 3, 28, 3
     2a0: 92 a1 00 14                  	stw 21, 20(1)		     2a0: 92 a1 00 14                  	stw 21, 20(1)
     2a4: 7c 1c 18 40                  	cmplw	28, 3		     2a4: 7c 1c 18 40                  	cmplw	28, 3
     2a8: 92 c1 00 18                  	stw 22, 24(1)		     2a8: 92 c1 00 18                  	stw 22, 24(1)
     2ac: 92 e1 00 1c                  	stw 23, 28(1)		     2ac: 92 e1 00 1c                  	stw 23, 28(1)
     2b0: 93 01 00 20                  	stw 24, 32(1)		     2b0: 93 01 00 20                  	stw 24, 32(1)
     2b4: 93 21 00 24                  	stw 25, 36(1)		     2b4: 93 21 00 24                  	stw 25, 36(1)
     2b8: 93 41 00 28                  	stw 26, 40(1)		     2b8: 93 41 00 28                  	stw 26, 40(1)
     2bc: 93 61 00 2c                  	stw 27, 44(1)		     2bc: 93 61 00 2c                  	stw 27, 44(1)
     2c0: 93 c1 00 38                  	stw 30, 56(1)		     2c0: 93 c1 00 38                  	stw 30, 56(1)
     2c4: 40 80 00 ac                  	bf	0, .+172	     2c4: 40 80 00 ac                  	bf	0, .+172
     2c8: 3c 60 00 00                  	lis 3, 0		     2c8: 3c 60 00 00                  	lis 3, 0
     2cc: 3c 80 00 00                  	lis 4, 0		     2cc: 3c 80 00 00                  	lis 4, 0
     2d0: 3c a0 81 00                  	lis 5, -32512		     2d0: 3c a0 81 00                  	lis 5, -32512
     2d4: 3c c0 00 00                  	lis 6, 0		     2d4: 3c c0 00 00                  	lis 6, 0
     2d8: 3b 7c ff e8                  	addi 27, 28, -24	     2d8: 3b 7c ff e8                  	addi 27, 28, -24
     2dc: 3b 40 00 00                  	li 26, 0		     2dc: 3b 40 00 00                  	li 26, 0
     2e0: 3b 23 00 00                  	addi 25, 3, 0		     2e0: 3b 23 00 00                  	addi 25, 3, 0
     2e4: 3b 04 00 00                  	addi 24, 4, 0		     2e4: 3b 04 00 00                  	addi 24, 4, 0
     2e8: 60 b7 02 00                  	ori 23, 5, 512		     2e8: 60 b7 02 00                  	ori 23, 5, 512
     2ec: 3b c6 00 00                  	addi 30, 6, 0		     2ec: 3b c6 00 00                  	addi 30, 6, 0
     2f0: 80 79 00 18                  	lwz 3, 24(25)		     2f0: 80 79 00 18                  	lwz 3, 24(25)
     2f4: 38 80 0d c0                  	li 4, 3520		     2f4: 38 80 0d c0                  	li 4, 3520
     2f8: 38 a0 00 28                  	li 5, 40		     2f8: 38 a0 00 28                  	li 5, 40
     2fc: 82 db 00 1c                  	lwz 22, 28(27)		     2fc: 82 db 00 1c                  	lwz 22, 28(27)
     300: 82 bb 00 24                  	lwz 21, 36(27)		     300: 82 bb 00 24                  	lwz 21, 36(27)
     304: 48 00 00 01                  	bl .+0			     304: 48 00 00 01                  	bl .+0
     308: 7c 64 1b 78                  	mr 4, 3			     308: 7c 64 1b 78                  	mr 4, 3
     30c: 7c 63 00 34                  	cntlzw	3, 3		     30c: 7c 63 00 34                  	cntlzw	3, 3
     310: 28 04 00 00                  	cmplwi	4, 0		     310: 28 04 00 00                  	cmplwi	4, 0
     314: 54 63 df fe                  	rlwinm 3, 3, 27, 31, 	     314: 54 63 df fe                  	rlwinm 3, 3, 27, 31, 
     318: 0f 03 00 00                  	twnei	3, 0		     318: 0f 03 00 00                  	twnei	3, 0
     31c: 41 82 00 34                  	bt	2, .+52		     31c: 41 82 00 34                  	bt	2, .+52
     320: 7c 76 aa 14                  	add 3, 22, 21		     320: 7c 76 aa 14                  	add 3, 22, 21
     324: 93 04 00 10                  	stw 24, 16(4)		     324: 93 04 00 10                  	stw 24, 16(4)
     328: 38 63 ff ff                  	addi 3, 3, -1		     328: 38 63 ff ff                  	addi 3, 3, -1
     32c: 90 64 00 0c                  	stw 3, 12(4)		     32c: 90 64 00 0c                  	stw 3, 12(4)
     330: 7f c3 f3 78                  	mr 3, 30		     330: 7f c3 f3 78                  	mr 3, 30
     334: 93 44 00 00                  	stw 26, 0(4)		     334: 93 44 00 00                  	stw 26, 0(4)
     338: 92 c4 00 04                  	stw 22, 4(4)		     338: 92 c4 00 04                  	stw 22, 4(4)
     33c: 93 44 00 08                  	stw 26, 8(4)		     33c: 93 44 00 08                  	stw 26, 8(4)
     340: 92 e4 00 14                  	stw 23, 20(4)		     340: 92 e4 00 14                  	stw 23, 20(4)
     344: 48 00 00 01                  	bl .+0			     344: 48 00 00 01                  	bl .+0
     348: 54 63 0f fe                  	srwi 3, 3, 31		     348: 54 63 0f fe                  	srwi 3, 3, 31
     34c: 0f 03 00 00                  	twnei	3, 0		     34c: 0f 03 00 00                  	twnei	3, 0
     350: 80 7d 00 10                  	lwz 3, 16(29)		     350: 80 7d 00 10                  	lwz 3, 16(29)
     354: 3b 9c 00 18                  	addi 28, 28, 24		     354: 3b 9c 00 18                  	addi 28, 28, 24
     358: 3b 7b 00 18                  	addi 27, 27, 24		     358: 3b 7b 00 18                  	addi 27, 27, 24
     35c: 80 9d 00 20                  	lwz 4, 32(29)		     35c: 80 9d 00 20                  	lwz 4, 32(29)
     360: 1c 63 00 18                  	mulli 3, 3, 24		     360: 1c 63 00 18                  	mulli 3, 3, 24
     364: 7c 64 1a 14                  	add 3, 4, 3		     364: 7c 64 1a 14                  	add 3, 4, 3
     368: 7c 1c 18 40                  	cmplw	28, 3		     368: 7c 1c 18 40                  	cmplw	28, 3
     36c: 41 80 ff 84                  	bt	0, .+65412	     36c: 41 80 ff 84                  	bt	0, .+65412
     370: 38 60 00 00                  	li 3, 0			     370: 38 60 00 00                  	li 3, 0
     374: 83 c1 00 38                  	lwz 30, 56(1)		     374: 83 c1 00 38                  	lwz 30, 56(1)
     378: 83 a1 00 34                  	lwz 29, 52(1)		     378: 83 a1 00 34                  	lwz 29, 52(1)
     37c: 83 81 00 30                  	lwz 28, 48(1)		     37c: 83 81 00 30                  	lwz 28, 48(1)
     380: 83 61 00 2c                  	lwz 27, 44(1)		     380: 83 61 00 2c                  	lwz 27, 44(1)
     384: 83 41 00 28                  	lwz 26, 40(1)		     384: 83 41 00 28                  	lwz 26, 40(1)
     388: 83 21 00 24                  	lwz 25, 36(1)		     388: 83 21 00 24                  	lwz 25, 36(1)
     38c: 83 01 00 20                  	lwz 24, 32(1)		     38c: 83 01 00 20                  	lwz 24, 32(1)
     390: 82 e1 00 1c                  	lwz 23, 28(1)		     390: 82 e1 00 1c                  	lwz 23, 28(1)
     394: 82 c1 00 18                  	lwz 22, 24(1)		     394: 82 c1 00 18                  	lwz 22, 24(1)
     398: 82 a1 00 14                  	lwz 21, 20(1)		     398: 82 a1 00 14                  	lwz 21, 20(1)
     39c: 80 01 00 44                  	lwz 0, 68(1)		     39c: 80 01 00 44                  	lwz 0, 68(1)
     3a0: 38 21 00 40                  	addi 1, 1, 64		     3a0: 38 21 00 40                  	addi 1, 1, 64
     3a4: 7c 08 03 a6                  	mtlr 0			     3a4: 7c 08 03 a6                  	mtlr 0
     3a8: 4e 80 00 20                  	blr			     3a8: 4e 80 00 20                  	blr

--cWoXeonUoKmBZSoM--
