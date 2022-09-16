Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FB5BB59D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 04:39:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTwBp5Zktz3c1G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 12:39:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=osandov-com.20210112.gappssmtp.com header.i=@osandov-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yQYnZNYX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=osandov@osandov.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20210112.gappssmtp.com header.i=@osandov-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yQYnZNYX;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTkvJ1sWZz3bdk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 05:40:42 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id y11so5077754pjv.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vH9TYUFkIGeMDXb5QksQYPq2h16Z8OyKOOQMeyEvl7I=;
        b=yQYnZNYXV2FOBIibg997hqy6cC66Xcky9Sj1dsdt9zQ2ExgJBmCw7m7HEVew01OMsq
         F5Syd9PMYleHHa8qZTq3Fm9U8YYRdzBT6XwXkLH6AkBSRD4kYLWXSbmA+XE0Ijd7Y02R
         fywzlhmHsq9NLj5EqW7MBVPTfeuC0m1PXQXy01iqcDPQ5fpf2SfP9VjvqQG43JPfEMzd
         THexk1qxiNY3EdQ9PhS20kfWyFX+ybdJ8u7ZRMlpfyWhiuQGOrEOcL0pCG6Ph5f1NyCE
         rYM8RxnObeweJJ5wHVpXvCjsOKxxl4A9iZ4d9eqpD/xkB/ezV5oRZDFpQnnhCdNgRhRC
         Uehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vH9TYUFkIGeMDXb5QksQYPq2h16Z8OyKOOQMeyEvl7I=;
        b=ljMPam6lZV3zYy2ixcqdE+5DRrgnWa8UrDylF6WmchFFPMi0QLpbHyKMr4vkrqJ95h
         J0/MO8GmvCT185i36Sp7OSWfeFq6xvixyRaWbfaETOxf/iMFgJ3I/xtr6bW08ap5RYfP
         dBXbFkygs7kshPjv8QjUrsLJIb6TzKpQPd8PB+sjg4Sb1332QM2bbnR+xQaAsgp9hANf
         I9Q3XXN4XN81Y1yIXBC++TqM25tsbwxr4Q8XRAJUmdvRzxNkDN1r6g8328xxoccewzlG
         IZKo1AyopQLQ0tNAEMkY9zumo/rpm32LQk2ZnU/hxIjsXELKwushibCLu1KDILYE6m35
         dMJA==
X-Gm-Message-State: ACrzQf3QlfHh56cJDci/LLWrKH6lNHVXDKtKIab23YXgtR81dsfvoE7G
	O2A6DuAHh/Uzz/IadPQzuyXjBw==
X-Google-Smtp-Source: AMsMyM7bBzN5wKpJ4/hmwedRCv3ia/zW3TzU2MrSu2w0889ImAiNQlhDbVHcvxIyYWbaKNLMT5PpHA==
X-Received: by 2002:a17:90b:4c0c:b0:203:1407:809c with SMTP id na12-20020a17090b4c0c00b002031407809cmr7126292pjb.193.1663357237910;
        Fri, 16 Sep 2022 12:40:37 -0700 (PDT)
Received: from relinquished.localdomain ([2620:10d:c090:500::3:3c76])
        by smtp.gmail.com with ESMTPSA id c3-20020a170903234300b001780a528540sm15448988plh.93.2022.09.16.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 12:40:37 -0700 (PDT)
Date: Fri, 16 Sep 2022 12:40:35 -0700
From: Omar Sandoval <osandov@osandov.com>
To: "H.J. Lu" <hjl.tools@gmail.com>
Subject: Re: [PATCH 2/2] Discard .note.gnu.property sections in generic NOTES
Message-ID: <YyTRM3/9Mm+b+M8N@relinquished.localdomain>
References: <20200428132105.170886-1-hjl.tools@gmail.com>
 <20200428132105.170886-2-hjl.tools@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428132105.170886-2-hjl.tools@gmail.com>
X-Mailman-Approved-At: Sat, 17 Sep 2022 12:39:15 +1000
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
Cc: linux-arch@vger.kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 06:21:05AM -0700, H.J. Lu wrote:
> With the command-line option, -mx86-used-note=yes, the x86 assembler
> in binutils 2.32 and above generates a program property note in a note
> section, .note.gnu.property, to encode used x86 ISAs and features.  But
> kernel linker script only contains a single NOTE segment:
> 
> PHDRS {
>  text PT_LOAD FLAGS(5);
>  data PT_LOAD FLAGS(6);
>  percpu PT_LOAD FLAGS(6);
>  init PT_LOAD FLAGS(7);
>  note PT_NOTE FLAGS(0);
> }
> SECTIONS
> {
> ...
>  .notes : AT(ADDR(.notes) - 0xffffffff80000000) { __start_notes = .; KEEP(*(.not
> e.*)) __stop_notes = .; } :text :note
> ...
> }
> 
> The NOTE segment generated by kernel linker script is aligned to 4 bytes.
> But .note.gnu.property section must be aligned to 8 bytes on x86-64 and
> we get
> 
> [hjl@gnu-skx-1 linux]$ readelf -n vmlinux
> 
> Displaying notes found in: .notes
>   Owner                Data size Description
>   Xen                  0x00000006 Unknown note type: (0x00000006)
>    description data: 6c 69 6e 75 78 00
>   Xen                  0x00000004 Unknown note type: (0x00000007)
>    description data: 32 2e 36 00
>   xen-3.0              0x00000005 Unknown note type: (0x006e6558)
>    description data: 08 00 00 00 03
> readelf: Warning: note with invalid namesz and/or descsz found at offset 0x50
> readelf: Warning:  type: 0xffffffff, namesize: 0x006e6558, descsize:
> 0x80000000, alignment: 8
> [hjl@gnu-skx-1 linux]$
> 
> Since note.gnu.property section in kernel image is never used, this patch
> discards .note.gnu.property sections in kernel linker script by adding
> 
> /DISCARD/ : {
>   *(.note.gnu.property)
> }
> 
> before kernel NOTE segment in generic NOTES.
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> ---
>  include/asm-generic/vmlinux.lds.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 71e387a5fe90..95cd678428f4 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -833,7 +833,14 @@
>  #define TRACEDATA
>  #endif
>  
> +/*
> + * Discard .note.gnu.property sections which are unused and have
> + * different alignment requirement from kernel note sections.
> + */
>  #define NOTES								\
> +	/DISCARD/ : {							\
> +		*(.note.gnu.property)					\
> +	}								\
>  	.notes : AT(ADDR(.notes) - LOAD_OFFSET) {			\
>  		__start_notes = .;					\
>  		KEEP(*(.note.*))					\
> -- 
> 2.25.4
> 

Hi, H.J.,

I recently ran into this same .notes corruption when building kernels on
Arch Linux.

What ended up happening to this patch? It doesn't appear to have been
merged, and I couldn't find any further discussion about it. I'm happy
to resend it for you if you need a hand.

Thanks,
Omar
