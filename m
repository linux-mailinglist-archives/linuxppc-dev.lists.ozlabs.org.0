Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF240DD09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 16:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9KXY4ckTz307S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 00:41:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9KX72r8pz2xWf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 00:41:11 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 292C46120C;
 Thu, 16 Sep 2021 14:41:04 +0000 (UTC)
Date: Thu, 16 Sep 2021 15:41:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
Message-ID: <YUNXfWKZ7XYvw2EK@arm.com>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914121036.3975026-2-ardb@kernel.org>
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

On Tue, Sep 14, 2021 at 02:10:29PM +0200, Ard Biesheuvel wrote:
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> struct thread_info.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
