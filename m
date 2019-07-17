Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF06BCB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 15:04:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pcsv6SbYzDqD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 23:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=arnaldo.melo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XcmxneGO"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pcL50fG9zDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 22:40:06 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id x22so18206673qtp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q+81HBhn1TUwxu9S0B9qtFUuISibjz0/U9PrqDWTTnk=;
 b=XcmxneGOy+2RXDL2AYuXAVZJAiyeHolR4ac1SzJQlQzwrwi+HqWSYoPkVqq9Vqmqg1
 FqUghmpMcUzFuf3FSS4kllx0urGVacAPOsHEEssg1IcCrdVZRwWcHQ0thUX6C1t4cJoL
 vOVr8CY1w5fJWuX4PjxWH/3qfPYVDkhrsa+FNQHmIYdGekpn15GeZDeuiy9HipKh7sJh
 AHKocRO3yKYaTZLEjMvmeWDl1D3ocNZt0VWgNuaxapMwQPRA6H6V64dvA6mG81cJSpNL
 aeJplonp1P4C/Vlc9tUcpxA5HCVp2ra7Vj9yw/aq7skHSfLh4Z2PuuHUmlIKQ9cKj5Od
 nTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q+81HBhn1TUwxu9S0B9qtFUuISibjz0/U9PrqDWTTnk=;
 b=KOYuLRJijqNfOZQKuNYeWAoSugsMKPY7L6jNFoa1hqXaoWYeIqm4VWaiD0Er5aVAlb
 J3rLxudBrFsyHucColcdZRNjfVCCHE/ye7Q58bbhjsrIY9DsgeA8k+FIRjmYWKPIyIWH
 3oxjQ8IaNtS264cphg0b04bHRnIx4fGYL7RO1XCSH3x7MwjZ6fC91apZ5m79wRqPkQ0I
 8I8RfkB1qM5KpJ1mXDBYLJEN8LHJdUez0wd/ZKfm/7+l0o4mMUnhCUIEvSZO3qIZV3Bu
 1u61+UtiAsZm2qGjP2zmJmN+XOe4TrYxD7gqYWNwT9ZQ8NYnH3S4lFQGDhJrcVJBIK60
 0xNQ==
X-Gm-Message-State: APjAAAX/3IKOLdkDRXazFiEAVxK96Zfmxyv4Iw4opOTBFzuttIMlXrvN
 aDzKMYWzrcWUi5ld7/47YKc=
X-Google-Smtp-Source: APXvYqzbfxutvFrMV7t1nPl0gN0Fy5aGVu/YO7Xv3MDir0s1nCKm8BxCu8WphxvR5dCLt5lXuy+aag==
X-Received: by 2002:aed:33e6:: with SMTP id v93mr27856811qtd.157.1563367202971; 
 Wed, 17 Jul 2019 05:40:02 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([179.97.35.11])
 by smtp.gmail.com with ESMTPSA id y67sm11220164qkd.40.2019.07.17.05.40.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 05:40:02 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id E255440340; Wed, 17 Jul 2019 09:39:59 -0300 (-03)
Date: Wed, 17 Jul 2019 09:39:59 -0300
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 4/4] tools: Add fchmodat4
Message-ID: <20190717123959.GB24063@kernel.org>
References: <20190717012719.5524-1-palmer@sifive.com>
 <20190717012719.5524-5-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717012719.5524-5-palmer@sifive.com>
X-Url: http://acmel.wordpress.com
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Wed, 17 Jul 2019 23:02:00 +1000
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
Cc: dalias@libc.org, catalin.marinas@arm.com, linux-sh@vger.kernel.org,
 peterz@infradead.org, heiko.carstens@de.ibm.com, stefan@agner.ch,
 linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 namhyung@kernel.org, kim.phillips@arm.com, paulus@samba.org,
 deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com,
 ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org,
 firoz.khan@linaro.org, mattst88@gmail.com, fenghua.yu@intel.com,
 Arnd Bergmann <arnd@arndb.de>, jolsa@redhat.com, tycho@tycho.ws,
 schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org,
 alexander.shishkin@linux.intel.com, tglx@linutronix.de, christian@brauner.io,
 rth@twiddle.net, axboe@kernel.dk, dhowells@redhat.com, monstr@monstr.eu,
 tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jul 16, 2019 at 06:27:19PM -0700, Palmer Dabbelt escreveu:
> I'm not sure why it's necessary to add this explicitly to tools/ as well
> as arch/, but there were a few instances of fspick in here so I blindly
> added fchmodat4 in the same fashion.

The copies in tools/ for these specific files are used to generate a
syscall table used by 'perf trace', and we don't/can't access files
outside of tools/ to build tools/perf/, so we grab a copy and have
checks in place to warn perf developers when those copies get out of
sync.

Its not required that kernel developers update anything in tools, you're
welcomed to do so if you wish tho.

Thanks,

- Arnaldo
 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  tools/include/uapi/asm-generic/unistd.h           | 4 +++-
>  tools/perf/arch/x86/entry/syscalls/syscall_64.tbl | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
> index a87904daf103..36232ea94956 100644
> --- a/tools/include/uapi/asm-generic/unistd.h
> +++ b/tools/include/uapi/asm-generic/unistd.h
> @@ -844,9 +844,11 @@ __SYSCALL(__NR_fsconfig, sys_fsconfig)
>  __SYSCALL(__NR_fsmount, sys_fsmount)
>  #define __NR_fspick 433
>  __SYSCALL(__NR_fspick, sys_fspick)
> +#define __NR_fchmodat4 434
> +__SYSCALL(__NR_fchmodat4, sys_fchmodat4)
>  
>  #undef __NR_syscalls
> -#define __NR_syscalls 434
> +#define __NR_syscalls 435
>  
>  /*
>   * 32 bit systems traditionally used different
> diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> index b4e6f9e6204a..b92d5b195e66 100644
> --- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> +++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> @@ -355,6 +355,7 @@
>  431	common	fsconfig		__x64_sys_fsconfig
>  432	common	fsmount			__x64_sys_fsmount
>  433	common	fspick			__x64_sys_fspick
> +434	common	fchmodat4		__x64_sys_fchmodat4
>  
>  #
>  # x32-specific system call numbers start at 512 to avoid cache impact
> -- 
> 2.21.0

-- 

- Arnaldo
