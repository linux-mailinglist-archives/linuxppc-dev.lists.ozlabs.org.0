Return-Path: <linuxppc-dev+bounces-5784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ADBA25706
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 11:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmjZW2Q1Vz2yDk;
	Mon,  3 Feb 2025 21:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738578947;
	cv=none; b=YGqAYpOCoSCOfg/DByRqZiKa19iqGqQfkXVMTsIQW6ZbPJzQSJFif+a2iEC/H9diNpnMPN0tYQg6sqvhiiXLCU0Jdpi3ZcLz1TeANvNB+8eWuKhjMoyVU6AOvKpX0hOolJFLajU1qtuH3aTFGoeAOKQsHsKVZGBzGzQsYdYp5dA24ZfPHvVshcQP2ZHhZg9xA2w/8E/HjKCrVmKnj+Qk7NT89oIgg0jjhsok9yEu0rRfhllkuh+t1yeUpRQWFURWRx4DPpSAKphq4/5i7jrJw+E2OzHeqf1hftvZUpTXdqN2gyGOqiS/sJSPCWOBTV6NY3Vte9cunQ7XQb3Zfj1aDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738578947; c=relaxed/relaxed;
	bh=FEmiugC6rBX2OLCTg0Nwo4vFpIRSKT7Cs1VYExDtmL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eymB959A06em8EK+SEA2hNMtVNRVfxqURq5PMm0um01cSnUHrxx7uQzfcX1EPHID6tqwaCiQmCxa7yH+iFlrF4EzJmmaffX3ZwsKwkrPZN6gfJBX7txlM+i/gSocPW2bo2u7Lrx8z82BNVbk6KRUmwZ9/IIufsnV4kcmd/u9ZS8nI9V0WaVFL3cL1y5K8hdGpw9vZYndjCxq0nfWhVypX0vBbfkaFDae33XamtPobNuxz0jNn6fP+1vJN2Sfv4b60mkDrbpaGbT55hKnhd9l7TUwWwBN1OFEN5FKQcz8SAqh3vzbQSOB+idxA+f2P4ijQFAt4e464kSgxdfr5nuqfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmjZT5lJxz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 21:35:45 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 33C4872C8CC;
	Mon,  3 Feb 2025 13:35:43 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 1956F7CCB3A; Mon,  3 Feb 2025 12:35:43 +0200 (IST)
Date: Mon, 3 Feb 2025 12:35:43 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-snps-arc@lists.infradead.org, Rich Felker <dalias@libc.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andreas Larsson <andreas@gaisler.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
	linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>, linux-api@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Mike Frysinger <vapier@gentoo.org>,
	Davide Berardi <berardi.dav@gmail.com>,
	Renzo Davoli <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>, strace-devel@lists.strace.io,
	Charlie Jenkins <charlie@rivosinc.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
	loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	Stafford Horne <shorne@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-arm-kernel@lists.infradead.org,
	Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Oleg Nesterov <oleg@redhat.com>, Dinh Nguyen <dinguyen@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexey Gladkov <legion@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 0/7] ptrace: introduce PTRACE_SET_SYSCALL_INFO API
Message-ID: <20250203103542.GA16165@strace.io>
References: <20250203065849.GA14120@strace.io>
 <Z6CMgVm8QKEMRf8L@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6CMgVm8QKEMRf8L@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 03, 2025 at 10:29:37AM +0100, Alexander Gordeev wrote:
> On Mon, Feb 03, 2025 at 08:58:49AM +0200, Dmitry V. Levin wrote:
> 
> Hi Dmitry,
> 
> > PTRACE_SET_SYSCALL_INFO is a generic ptrace API that complements
> > PTRACE_GET_SYSCALL_INFO by letting the ptracer modify details of
> > system calls the tracee is blocked in.
> ...
> 
> FWIW, I am getting these on s390:
> 
> # ./tools/testing/selftests/ptrace/set_syscall_info 
> TAP version 13
> 1..1
> # Starting 1 tests from 1 test cases.
> #  RUN           global.set_syscall_info ...
> # set_syscall_info.c:87:set_syscall_info:Expected exp_entry->nr (-1) == info->entry.nr (65535)
> # set_syscall_info.c:88:set_syscall_info:wait #3: PTRACE_GET_SYSCALL_INFO #2: syscall nr mismatch
> # set_syscall_info: Test terminated by assertion
> #          FAIL  global.set_syscall_info
> not ok 1 global.set_syscall_info
> # FAILED: 0 / 1 tests passed.
> # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
> 
> I remember one of the earlier versions (v1 or v2) was working for me.
> 
> Thanks!

In v3, this test was extended to check whether PTRACE_GET_SYSCALL_INFO
called immediately after PTRACE_SET_SYSCALL_INFO returns the same syscall
number, and on s390 it apparently doesn't, thanks to its implementation
of syscall_get_nr() that returns 0xffff in this case.

To workaround this, we could either change syscall_get_nr() to return -1
in this case, or add an #ifdef __s390x__ exception to the test.

What would you prefer?


-- 
ldv

