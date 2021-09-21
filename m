Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61941339C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 14:55:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDLy23vHNz2yxB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 22:55:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=QASWuh6R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDLxD5WYCz2xtR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 22:54:50 +1000 (AEST)
Received: from zn.tnic (p200300ec2f0d0600f4996d443fa85fcf.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:600:f499:6d44:3fa8:5fcf])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 46FEE1EC0298;
 Tue, 21 Sep 2021 14:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632228874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=hZ7yxBVSWH21LOuOd2ow1m9BReyxD+pdLNk3tjWtt4g=;
 b=QASWuh6RdRkpA0LAaYaPhIJvLhaVZ2ici0IxlRxwCS/ouu8ti51xV8dExeVbLhVxveiljk
 98P3emQVKTBiP8qqaHik3OQBCEzhzYM5cYi7UXe462n6pN2+B+DUvtqOeoyBmVf3tcUcc8
 9SKW8H64cSA4GH1lz9E0o4TPwp9cPbI=
Date: Tue, 21 Sep 2021 14:54:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 2/8] x86: add CPU field to struct thread_info
Message-ID: <YUnWBJekSa5Vx1I9@zn.tnic>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-3-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210914121036.3975026-3-ardb@kernel.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 14, 2021 at 02:10:30PM +0200, Ard Biesheuvel wrote:
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to x86's definition of
> struct thread_info.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/include/asm/thread_info.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
> index cf132663c219..ebec69c35e95 100644
> --- a/arch/x86/include/asm/thread_info.h
> +++ b/arch/x86/include/asm/thread_info.h
> @@ -57,6 +57,9 @@ struct thread_info {
>  	unsigned long		flags;		/* low level flags */
>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
>  	u32			status;		/* thread synchronous flags */
> +#ifdef CONFIG_SMP
> +	u32			cpu;		/* current CPU */
> +#endif
>  };
>  
>  #define INIT_THREAD_INFO(tsk)			\
> -- 

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
