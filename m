Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29536596934
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 08:16:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6ySf0jhQz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 16:16:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YlYJWJE/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YlYJWJE/;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6yS05pGnz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 16:15:28 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id u133so11246547pfc.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 23:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=V/WWAglTMLKqDnCjeLq46a4fbo9tCoelyGe1SAfOR/k=;
        b=YlYJWJE/PCNViHtIOZW4O1+R2iJAm9NkOWcITR7ggRW5tiqhBwZNDcRjEcx3ChBhSD
         kPn3/A04CfrTNbDj2GJjMNOWFoXwD/lyUhkrhOf6Tt/J0t+SwFognBlHV+xVwzF4Nyd9
         ItO+V0T1neUEzD4FcveLrcPLfzl+ZJJQmdP6RQDDMYcivbuXVIvdmHZSWgNTZYGVOScP
         7gX/DXkKpGBJ85OqXK+XVReXwNDW0FOHR4uHKjfJP/qJxB40w3B5fOY0ozloCmIRdLwz
         0IjqD25m22r9mEcCypIHh88WmktzVXQwnBh7r5mC/GwwC8wItNaurUwejBqHekH3pVhk
         MxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=V/WWAglTMLKqDnCjeLq46a4fbo9tCoelyGe1SAfOR/k=;
        b=m3VqEZGbgZTaUJRCwSF+4VlkyI0KY9bjF5IMO4KfN3VIl3MPCEBXHvE5f2gLKGUuA2
         RhehiOTcKtEI6yJ7sYjoePOFk7PmfVoxF6A6E3Ykywg+mV2F2DH7Vs1fsEroQaWvdcgN
         8983u1QBubTkCCRRRUD/m0ZAmsPH+rzwna7edIHUgSAJz/jahtasoby8HCRQXTSkGD+w
         6GiyIcEtRyYGkzLnhNEAbp/O2h1+upCkpV9YGGEc469wFi7h+LXzJaqpDGTpz7iWUgux
         a+bRL20H5foKRSZafyHR1YrltbIAIfEVY97faA9na82cJaSyiUb/l9HmPzVuUoXVo0I8
         xwpg==
X-Gm-Message-State: ACgBeo1OfUUmumSkhBxNeUbTT6euqdRYqRCc7/tiBy2pvcIkDYgASePB
	wnjQQ5TlefeUgYxwHYRz8ys=
X-Google-Smtp-Source: AA6agR4fnFRb2kKnWaHcGEdnVjMuoIdfuJUH/ni4C3A7/FlJUUXsv0mCe2GW1oXaSmt3y8wyLliXNQ==
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id o12-20020a63f14c000000b0041ab83da636mr20445300pgk.361.1660716925100;
        Tue, 16 Aug 2022 23:15:25 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id d20-20020aa797b4000000b00517c84fd24asm9842553pfq.172.2022.08.16.23.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 23:15:24 -0700 (PDT)
Message-ID: <faa82449f058e4d57372dc4e7b5ca2dc091cb454.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] selftests/powerpc: Add a test for execute-only
 memory
From: Jordan Niethe <jniethe5@gmail.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 17 Aug 2022 16:15:19 +1000
In-Reply-To: <20220817050640.406017-2-ruscur@russell.cc>
References: <20220817050640.406017-1-ruscur@russell.cc>
	 <20220817050640.406017-2-ruscur@russell.cc>
Content-Type: text/plain; charset="UTF-7"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com, linux-hardening@vger.kernel.org, nicholas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-08-17 at 15:06 +-1000, Russell Currey wrote:
+AD4 From: Nicholas Miehlbradt +ADw-nicholas+AEA-linux.ibm.com+AD4
+AD4 
+AD4 This selftest is designed to cover execute-only protections
+AD4 on the Radix MMU but will also work with Hash.
+AD4 
+AD4 The tests are based on those found in pkey+AF8-exec+AF8-test with modifications
+AD4 to use the generic mprotect() instead of the pkey variants.

Would it make sense to rename pkey+AF8-exec+AF8-test to exec+AF8-test and have this test be apart of that?

+AD4 
+AD4 Signed-off-by: Nicholas Miehlbradt +ADw-nicholas+AEA-linux.ibm.com+AD4
+AD4 Signed-off-by: Russell Currey +ADw-ruscur+AEA-russell.cc+AD4
+AD4 ---
+AD4 v4: new
+AD4 
+AD4  tools/testing/selftests/powerpc/mm/Makefile   +AHw   3 +--
+AD4  .../testing/selftests/powerpc/mm/exec+AF8-prot.c  +AHw 231 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
+AD4  2 files changed, 233 insertions(+-), 1 deletion(-)
+AD4  create mode 100644 tools/testing/selftests/powerpc/mm/exec+AF8-prot.c
+AD4 
+AD4 diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
+AD4 index 27dc09d0bfee..19dd0b2ea397 100644
+AD4 --- a/tools/testing/selftests/powerpc/mm/Makefile
+AD4 +-+-+- b/tools/testing/selftests/powerpc/mm/Makefile
+AD4 +AEAAQA -3,7 +-3,7 +AEAAQA noarg:
+AD4  	+ACQ(MAKE) -C ../
+AD4  
+AD4  TEST+AF8-GEN+AF8-PROGS :+AD0 hugetlb+AF8-vs+AF8-thp+AF8-test subpage+AF8-prot prot+AF8-sao segv+AF8-errors wild+AF8-bctr +AFw
+AD4 -		  large+AF8-vm+AF8-fork+AF8-separation bad+AF8-accesses pkey+AF8-exec+AF8-prot +AFw
+AD4 +-		  large+AF8-vm+AF8-fork+AF8-separation bad+AF8-accesses exec+AF8-prot pkey+AF8-exec+AF8-prot +AFw
+AD4  		  pkey+AF8-siginfo stack+AF8-expansion+AF8-signal stack+AF8-expansion+AF8-ldst +AFw
+AD4  		  large+AF8-vm+AF8-gpr+AF8-corruption
+AD4  TEST+AF8-PROGS :+AD0 stress+AF8-code+AF8-patching.sh
+AD4 +AEAAQA -22,6 +-22,7 +AEAAQA +ACQ(OUTPUT)/wild+AF8-bctr: CFLAGS +-+AD0 -m64
+AD4  +ACQ(OUTPUT)/large+AF8-vm+AF8-fork+AF8-separation: CFLAGS +-+AD0 -m64
+AD4  +ACQ(OUTPUT)/large+AF8-vm+AF8-gpr+AF8-corruption: CFLAGS +-+AD0 -m64
+AD4  +ACQ(OUTPUT)/bad+AF8-accesses: CFLAGS +-+AD0 -m64
+AD4 +-+ACQ(OUTPUT)/exec+AF8-prot: CFLAGS +-+AD0 -m64
+AD4  +ACQ(OUTPUT)/pkey+AF8-exec+AF8-prot: CFLAGS +-+AD0 -m64
+AD4  +ACQ(OUTPUT)/pkey+AF8-siginfo: CFLAGS +-+AD0 -m64
+AD4  
+AD4 diff --git a/tools/testing/selftests/powerpc/mm/exec+AF8-prot.c b/tools/testing/selftests/powerpc/mm/exec+AF8-prot.c
+AD4 new file mode 100644
+AD4 index 000000000000..db75b2225de1
+AD4 --- /dev/null
+AD4 +-+-+- b/tools/testing/selftests/powerpc/mm/exec+AF8-prot.c
+AD4 +AEAAQA -0,0 +-1,231 +AEAAQA
+AD4 +-// SPDX-License-Identifier: GPL-2.0
+AD4 +-
+AD4 +-/+ACo
+AD4 +- +ACo Copyright 2022, Nicholas Miehlbradt, IBM Corporation
+AD4 +- +ACo based on pkey+AF8-exec+AF8-prot.c
+AD4 +- +ACo
+AD4 +- +ACo Test if applying execute protection on pages works as expected.
+AD4 +- +ACo-/
+AD4 +-
+AD4 +-+ACM-define +AF8-GNU+AF8-SOURCE
+AD4 +-+ACM-include +ADw-stdio.h+AD4
+AD4 +-+ACM-include +ADw-stdlib.h+AD4
+AD4 +-+ACM-include +ADw-string.h+AD4
+AD4 +-+ACM-include +ADw-signal.h+AD4
+AD4 +-
+AD4 +-+ACM-include +ADw-unistd.h+AD4
+AD4 +-+ACM-include +ADw-sys/mman.h+AD4
+AD4 +-
+AD4 +-+ACM-include +ACI-pkeys.h+ACI
+AD4 +-
+AD4 +-
+AD4 +-+ACM-define PPC+AF8-INST+AF8-NOP	0x60000000
+AD4 +-+ACM-define PPC+AF8-INST+AF8-TRAP	0x7fe00008
+AD4 +-+ACM-define PPC+AF8-INST+AF8-BLR	0x4e800020
+AD4 +-
+AD4 +-static volatile sig+AF8-atomic+AF8-t fault+AF8-code+ADs
+AD4 +-static volatile sig+AF8-atomic+AF8-t remaining+AF8-faults+ADs
+AD4 +-static volatile unsigned int +ACo-fault+AF8-addr+ADs
+AD4 +-static unsigned long pgsize, numinsns+ADs
+AD4 +-static unsigned int +ACo-insns+ADs
+AD4 +-static bool pkeys+AF8-supported+ADs
+AD4 +-
+AD4 +-static bool is+AF8-fault+AF8-expected(int fault+AF8-code)
+AD4 +-+AHs
+AD4 +-	if (fault+AF8-code +AD0APQ SEGV+AF8-ACCERR)
+AD4 +-		return true+ADs
+AD4 +-
+AD4 +-	/+ACo Assume any pkey error is fine since pkey+AF8-exec+AF8-prot test covers them +ACo-/
+AD4 +-	if (fault+AF8-code +AD0APQ SEGV+AF8-PKUERR +ACYAJg pkeys+AF8-supported)
+AD4 +-		return true+ADs
+AD4 +-
+AD4 +-	return false+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static void trap+AF8-handler(int signum, siginfo+AF8-t +ACo-sinfo, void +ACo-ctx)
+AD4 +-+AHs
+AD4 +-	/+ACo Check if this fault originated from the expected address +ACo-/
+AD4 +-	if (sinfo-+AD4-si+AF8-addr +ACEAPQ (void +ACo)fault+AF8-addr)
+AD4 +-		sigsafe+AF8-err(+ACI-got a fault for an unexpected address+AFw-n+ACI)+ADs
+AD4 +-
+AD4 +-	+AF8-exit(1)+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static void segv+AF8-handler(int signum, siginfo+AF8-t +ACo-sinfo, void +ACo-ctx)
+AD4 +-+AHs
+AD4 +-	fault+AF8-code +AD0 sinfo-+AD4-si+AF8-code+ADs
+AD4 +-
+AD4 +-	/+ACo Check if this fault originated from the expected address +ACo-/
+AD4 +-	if (sinfo-+AD4-si+AF8-addr +ACEAPQ (void +ACo)fault+AF8-addr) +AHs
+AD4 +-		sigsafe+AF8-err(+ACI-got a fault for an unexpected address+AFw-n+ACI)+ADs
+AD4 +-		+AF8-exit(1)+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	/+ACo Check if too many faults have occurred for a single test case +ACo-/
+AD4 +-	if (+ACE-remaining+AF8-faults) +AHs
+AD4 +-		sigsafe+AF8-err(+ACI-got too many faults for the same address+AFw-n+ACI)+ADs
+AD4 +-		+AF8-exit(1)+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-
+AD4 +-	/+ACo Restore permissions in order to continue +ACo-/
+AD4 +-	if (is+AF8-fault+AF8-expected(fault+AF8-code)) +AHs
+AD4 +-		if (mprotect(insns, pgsize, PROT+AF8-READ +AHw PROT+AF8-WRITE +AHw PROT+AF8-EXEC)) +AHs
+AD4 +-			sigsafe+AF8-err(+ACI-failed to set access permissions+AFw-n+ACI)+ADs
+AD4 +-			+AF8-exit(1)+ADs
+AD4 +-		+AH0
+AD4 +-	+AH0 else +AHs
+AD4 +-		sigsafe+AF8-err(+ACI-got a fault with an unexpected code+AFw-n+ACI)+ADs
+AD4 +-		+AF8-exit(1)+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-	remaining+AF8-faults--+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int check+AF8-exec+AF8-fault(int rights)
+AD4 +-+AHs
+AD4 +-	/+ACo
+AD4 +-	 +ACo Jump to the executable region.
+AD4 +-	 +ACo
+AD4 +-	 +ACo The first iteration also checks if the overwrite of the
+AD4 +-	 +ACo first instruction word from a trap to a no-op succeeded.
+AD4 +-	 +ACo-/
+AD4 +-	fault+AF8-code +AD0 -1+ADs
+AD4 +-	remaining+AF8-faults +AD0 0+ADs
+AD4 +-	if (+ACE(rights +ACY PROT+AF8-EXEC))
+AD4 +-		remaining+AF8-faults +AD0 1+ADs
+AD4 +-
+AD4 +-	FAIL+AF8-IF(mprotect(insns, pgsize, rights) +ACEAPQ 0)+ADs
+AD4 +-	asm volatile(+ACI-mtctr	+ACU-0+ADs bctrl+ACI : : +ACI-r+ACI(insns))+ADs
+AD4 +-
+AD4 +-	FAIL+AF8-IF(remaining+AF8-faults +ACEAPQ 0)+ADs
+AD4 +-	if (+ACE(rights +ACY PROT+AF8-EXEC))
+AD4 +-		FAIL+AF8-IF(+ACE-is+AF8-fault+AF8-expected(fault+AF8-code))+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int test(void)
+AD4 +-+AHs
+AD4 +-	struct sigaction segv+AF8-act, trap+AF8-act+ADs
+AD4 +-	int i+ADs
+AD4 +-
+AD4 +-	/+ACo Skip the test if the CPU doesn't support Radix +ACo-/
+AD4 +-	SKIP+AF8-IF(+ACE-have+AF8-hwcap2(PPC+AF8-FEATURE2+AF8-ARCH+AF8-3+AF8-00))+ADs
+AD4 +-
+AD4 +-	/+ACo Check if pkeys are supported +ACo-/
+AD4 +-	pkeys+AF8-supported +AD0 pkeys+AF8-unsupported() +AD0APQ 0+ADs
+AD4 +-
+AD4 +-	/+ACo Setup SIGSEGV handler +ACo-/
+AD4 +-	segv+AF8-act.sa+AF8-handler +AD0 0+ADs
+AD4 +-	segv+AF8-act.sa+AF8-sigaction +AD0 segv+AF8-handler+ADs
+AD4 +-	FAIL+AF8-IF(sigprocmask(SIG+AF8-SETMASK, 0, +ACY-segv+AF8-act.sa+AF8-mask) +ACEAPQ 0)+ADs
+AD4 +-	segv+AF8-act.sa+AF8-flags +AD0 SA+AF8-SIGINFO+ADs
+AD4 +-	segv+AF8-act.sa+AF8-restorer +AD0 0+ADs
+AD4 +-	FAIL+AF8-IF(sigaction(SIGSEGV, +ACY-segv+AF8-act, NULL) +ACEAPQ 0)+ADs
+AD4 +-
+AD4 +-	/+ACo Setup SIGTRAP handler +ACo-/
+AD4 +-	trap+AF8-act.sa+AF8-handler +AD0 0+ADs
+AD4 +-	trap+AF8-act.sa+AF8-sigaction +AD0 trap+AF8-handler+ADs
+AD4 +-	FAIL+AF8-IF(sigprocmask(SIG+AF8-SETMASK, 0, +ACY-trap+AF8-act.sa+AF8-mask) +ACEAPQ 0)+ADs
+AD4 +-	trap+AF8-act.sa+AF8-flags +AD0 SA+AF8-SIGINFO+ADs
+AD4 +-	trap+AF8-act.sa+AF8-restorer +AD0 0+ADs
+AD4 +-	FAIL+AF8-IF(sigaction(SIGTRAP, +ACY-trap+AF8-act, NULL) +ACEAPQ 0)+ADs
+AD4 +-
+AD4 +-	/+ACo Setup executable region +ACo-/
+AD4 +-	pgsize +AD0 getpagesize()+ADs
+AD4 +-	numinsns +AD0 pgsize / sizeof(unsigned int)+ADs
+AD4 +-	insns +AD0 (unsigned int +ACo)mmap(NULL, pgsize, PROT+AF8-READ +AHw PROT+AF8-WRITE,
+AD4 +-				      MAP+AF8-PRIVATE +AHw MAP+AF8-ANONYMOUS, -1, 0)+ADs
+AD4 +-	FAIL+AF8-IF(insns +AD0APQ MAP+AF8-FAILED)+ADs
+AD4 +-
+AD4 +-	/+ACo Write the instruction words +ACo-/
+AD4 +-	for (i +AD0 1+ADs i +ADw numinsns - 1+ADs i+-+-)
+AD4 +-		insns+AFs-i+AF0 +AD0 PPC+AF8-INST+AF8-NOP+ADs
+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo Set the first instruction as an unconditional trap. If
+AD4 +-	 +ACo the last write to this address succeeds, this should
+AD4 +-	 +ACo get overwritten by a no-op.
+AD4 +-	 +ACo-/
+AD4 +-	insns+AFs-0+AF0 +AD0 PPC+AF8-INST+AF8-TRAP+ADs
+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo Later, to jump to the executable region, we use a branch
+AD4 +-	 +ACo and link instruction (bctrl) which sets the return address
+AD4 +-	 +ACo automatically in LR. Use that to return back.
+AD4 +-	 +ACo-/
+AD4 +-	insns+AFs-numinsns - 1+AF0 +AD0 PPC+AF8-INST+AF8-BLR+ADs
+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo Pick the first instruction's address from the executable
+AD4 +-	 +ACo region.
+AD4 +-	 +ACo-/
+AD4 +-	fault+AF8-addr +AD0 insns+ADs
+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo Read an instruction word from the address when the page
+AD4 +-	 +ACo is execute only. This should generate an access fault.
+AD4 +-	 +ACo-/
+AD4 +-	fault+AF8-code +AD0 -1+ADs
+AD4 +-	remaining+AF8-faults +AD0 1+ADs
+AD4 +-	printf(+ACI-Testing read on --x, should fault...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(mprotect(insns, pgsize, PROT+AF8-EXEC) +ACEAPQ 0)+ADs
+AD4 +-	i +AD0 +ACo-fault+AF8-addr+ADs
+AD4 +-	FAIL+AF8-IF(remaining+AF8-faults +ACEAPQ 0 +AHwAfA +ACE-is+AF8-fault+AF8-expected(fault+AF8-code))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	/+ACo
+AD4 +-	 +ACo Write an instruction word to the address when the page
+AD4 +-	 +ACo execute only. This should also generate an access fault.
+AD4 +-	 +ACo-/
+AD4 +-	fault+AF8-code +AD0 -1+ADs
+AD4 +-	remaining+AF8-faults +AD0 1+ADs
+AD4 +-	printf(+ACI-Testing write on --x, should fault...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(mprotect(insns, pgsize, PROT+AF8-EXEC) +ACEAPQ 0)+ADs
+AD4 +-	+ACo-fault+AF8-addr +AD0 PPC+AF8-INST+AF8-NOP+ADs
+AD4 +-	FAIL+AF8-IF(remaining+AF8-faults +ACEAPQ 0 +AHwAfA +ACE-is+AF8-fault+AF8-expected(fault+AF8-code))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on ---, should fault...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-NONE))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on r--, should fault...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-READ))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on -w-, should fault...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-WRITE))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on rw-, should fault...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-READ +AHw PROT+AF8-WRITE))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on --x, should succeed...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-EXEC))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on r-x, should succeed...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-READ +AHw PROT+AF8-EXEC))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on -wx, should succeed...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-WRITE +AHw PROT+AF8-EXEC))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	printf(+ACI-Testing exec on rwx, should succeed...+ACI)+ADs
+AD4 +-	FAIL+AF8-IF(check+AF8-exec+AF8-fault(PROT+AF8-READ +AHw PROT+AF8-WRITE +AHw PROT+AF8-EXEC))+ADs
+AD4 +-	printf(+ACI-ok+ACEAXA-n+ACI)+ADs
+AD4 +-
+AD4 +-	/+ACo Cleanup +ACo-/
+AD4 +-	FAIL+AF8-IF(munmap((void +ACo)insns, pgsize))+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-int main(void)
+AD4 +-+AHs
+AD4 +-	return test+AF8-harness(test, +ACI-exec+AF8-prot+ACI)+ADs
+AD4 +-+AH0

