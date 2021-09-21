Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71324133D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 15:12:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDMKq4tZhz2yd6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:12:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDMKJ5VPNz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 23:12:20 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFEFC61166;
 Tue, 21 Sep 2021 13:12:13 +0000 (UTC)
Date: Tue, 21 Sep 2021 14:12:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
Message-ID: <YUnaKixPsMuHksI9@arm.com>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914121036.3975026-6-ardb@kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Keith Packard <keithpac@amazon.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 14, 2021 at 02:10:33PM +0200, Ard Biesheuvel wrote:
> THREAD_INFO_IN_TASK moved the CPU field out of thread_info, but this
> causes some issues on architectures that define raw_smp_processor_id()
> in terms of this field, due to the fact that #include'ing linux/sched.h
> to get at struct task_struct is problematic in terms of circular
> dependencies.
> 
> Given that thread_info and task_struct are the same data structure
> anyway when THREAD_INFO_IN_TASK=y, let's move it back so that having
> access to the type definition of struct thread_info is sufficient to
> reference the CPU number of the current task.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
