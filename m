Return-Path: <linuxppc-dev+bounces-812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4B9661A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 14:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwHWj5sGGz30DR;
	Fri, 30 Aug 2024 22:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725020945;
	cv=none; b=MsqHYoKQkx58X8+8ZvisbQEyhZ1touAKWY0BIIgLaxptk6zFWg7+mJbznAl0be6ist4F32Z52W+4DhDYJ4wSqMi+94wfZQhtSLs0luO5d49hTnpWGTPt011525ZQA5N69IC+xyog5uNESOGaCN2xfyfSo5lOVPr7+eHzuR7lHrv6Ft/K841kmJUe7kDo+FUttx2D+PVPSN+3CjW/ga/4wIg+Rd8qykDk8t2ZR03X/qxSEGImJVlgLUSRS5BjnZ09XF1jTmgG3x+F4O8v/2xcnh70knVD1etXUXe52fX29vNJ4/thd4zjhyG2u3jvNugR1rRMsLugW3Gz/qOOTxN05w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725020945; c=relaxed/relaxed;
	bh=zfjQOEQidY7qXdxJGImzVTyTsvFNltR8CQq6znlC7O8=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=HhdqDX/qraFQ61OpiSpDMGoBV63QzhIGbDQWIcHu4Eqk6+5EbBQ7L7iTPoxvs8eqvL8K70YwZD0oTTduANNCJEFpzS5Lhjcje2A4LgyIbR+OEXl8rHZkRwIqwJpFO4tqJqW097YC7c2sRc2R+hxpD8zmDVAzs91T4cFmoYUurOHBIqz0vARxYaWWw8NH1OTXmndofL3PZvFe72kKTmPqk8HVOAj4M5HaGEqu/UphWk15lTkoJr/+Oy9sayDCENbDsNtSB2sGZVWhNv83i8tE4n0FPlX9UaqvtQJDP+WU0k48Bzzvo4iSqavsbl39GLSjY8IXWrxQSL2D10onl1QIvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwHWj3TGZz300B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 22:29:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwHWT1SM1z9sSN;
	Fri, 30 Aug 2024 14:28:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydIIWh2sToqu; Fri, 30 Aug 2024 14:28:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwHWS26lXz9sSH;
	Fri, 30 Aug 2024 14:28:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 38AB38B799;
	Fri, 30 Aug 2024 14:28:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id J276aqGJzHIH; Fri, 30 Aug 2024 14:28:52 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A73508B794;
	Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@mit.edu>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] selftests: vdso: Fix vDSO symbols lookup for powerpc64
Date: Fri, 30 Aug 2024 14:28:37 +0200
Message-ID: <fc1a0862516b1e11b336d409f2cb8aab10a97337.1725020674.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
References: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725020918; l=4496; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=39eNMMEoOEr5TEhEryae2qozQ9plEMYQV8tM9uHkz1o=; b=bHCtgzOdghRIPUD+W28xrc5q/N85UP8GEt2JZXB3Bbs70cpBfHzGQlx6E3a/7WlhFwIFspT9U vXtvDXA81fCBsOHx6jUmpWoKyS4OvXaJWlelfCyShtPqREuPxnkPLWt
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

On powerpc64, following tests fail locating vDSO functions:

  ~ # ./vdso_test_abi
  TAP version 13
  1..16
  # [vDSO kselftest] VDSO_VERSION: LINUX_2.6.15
  # Couldn't find __kernel_gettimeofday
  ok 1 # SKIP __kernel_gettimeofday
  # clock_id: CLOCK_REALTIME
  # Couldn't find __kernel_clock_gettime
  ok 2 # SKIP __kernel_clock_gettime CLOCK_REALTIME
  # Couldn't find __kernel_clock_getres
  ok 3 # SKIP __kernel_clock_getres CLOCK_REALTIME
  ...
  # Couldn't find __kernel_time
  ok 16 # SKIP __kernel_time
  # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:16 error:0

  ~ # ./vdso_test_getrandom
  __kernel_getrandom is missing!

  ~ # ./vdso_test_gettimeofday
  Could not find __kernel_gettimeofday

  ~ # ./vdso_test_getcpu
  Could not find __kernel_getcpu

On powerpc64, as shown below by readelf, vDSO functions symbols have
type NOTYPE, so also accept that type when looking for symbols.

$ powerpc64-linux-gnu-readelf -a arch/powerpc/kernel/vdso/vdso64.so.dbg
ELF Header:
  Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, big endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              DYN (Shared object file)
  Machine:                           PowerPC64
  Version:                           0x1
...

Symbol table '.dynsym' contains 12 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
     0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND
     1: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
     2: 00000000000005f0    36 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
     3: 0000000000000578    68 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
     4: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
     5: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
     6: 0000000000000614   172 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
     7: 00000000000006f0    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
     8: 000000000000047c    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
     9: 0000000000000454    12 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
    10: 00000000000004d0    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
    11: 00000000000005bc    52 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15

Symbol table '.symtab' contains 56 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
...
    45: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
    46: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __kernel_getcpu
    47: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_clock_getres
    48: 00000000000005f0    36 NOTYPE  GLOBAL DEFAULT    8 __kernel_get_tbfreq
    49: 000000000000047c    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_gettimeofday
    50: 0000000000000614   172 NOTYPE  GLOBAL DEFAULT    8 __kernel_sync_dicache
    51: 00000000000006f0    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_getrandom
    52: 0000000000000454    12 NOTYPE  GLOBAL DEFAULT    8 __kernel_sigtram[...]
    53: 0000000000000578    68 NOTYPE  GLOBAL DEFAULT    8 __kernel_time
    54: 00000000000004d0    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_clock_g[...]
    55: 00000000000005bc    52 NOTYPE  GLOBAL DEFAULT    8 __kernel_get_sys[...]

Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/vDSO/parse_vdso.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 4ae417372e9e..d9ccc5acac18 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -216,7 +216,8 @@ void *vdso_sym(const char *version, const char *name)
 		ELF(Sym) *sym = &vdso_info.symtab[chain];
 
 		/* Check for a defined global or weak function w/ right name. */
-		if (ELF64_ST_TYPE(sym->st_info) != STT_FUNC)
+		if (ELF64_ST_TYPE(sym->st_info) != STT_FUNC &&
+		    ELF64_ST_TYPE(sym->st_info) != STT_NOTYPE)
 			continue;
 		if (ELF64_ST_BIND(sym->st_info) != STB_GLOBAL &&
 		    ELF64_ST_BIND(sym->st_info) != STB_WEAK)
-- 
2.44.0


