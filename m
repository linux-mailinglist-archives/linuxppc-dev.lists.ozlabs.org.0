Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A82003619C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:19:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM5fP4gqPz3c1W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:19:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=L2OY2xrZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=L2OY2xrZ; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM5dy6l4rz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 16:19:32 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d8so13408778plh.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0ULK0xvK0AaFlmfdN+zJSVpnvXjW9mKLMCPfk6y9Zqk=;
 b=L2OY2xrZoPg+ieFLphuZXE6ah4Tib0x7joZuFxOKOvs9qtSslCdV+QMWs13wJwQ1FG
 Oji259pHpJ2SWk4UC73GJMvYuGN2d0C5fOXxia/Ip7UPm15DOCNwFS2Ju8Wph7l1Ay2c
 UI8P80yqJr9tq5DwToPtYo3557gcpbOAuRMQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0ULK0xvK0AaFlmfdN+zJSVpnvXjW9mKLMCPfk6y9Zqk=;
 b=TE5odXvps+pxc8FcGoR7vI+TIAE6le8BdVMENp0C0AYMB1Bl9ydHirrFOrj4TXJ6s4
 ahCf7QG7nzKTPelzPFPV+A4TrzFiTPWQpEhtHYl1+lGfAeRhXjNUXv7PFfDpMtIidJtM
 0pWYTBaJBJ0F6Ey0R/PrJ6f6fpkHe8e9hH5ls4WzT0zgSWyxPi9BJJYDM2GSz9Oa0j14
 Cs2qxK7OMXzVEye6pu0lVGzKXFSlJeszEGxlwji0dzhIRn0/gLnAhWpKFwsHzOaz+xf0
 tirFPb8A/DeaEZpx8h5mE3gJ36XqzwthtLKMrezugiBdVdMNeWy6wxuRvOeATORb6T8Z
 snxg==
X-Gm-Message-State: AOAM533idCFtwWTlexzBOv5hpGW2anGrHi2uSFSf49HbBsJZ7MT9TRc2
 /igRcDD8oxa2xyaVG1ET3Ykayw==
X-Google-Smtp-Source: ABdhPJx5xwIuXgveR7HKXPlcXFYOIud0Fw77KSQASP6cWHg5E48ghJHxORI0F4LCfP4cdBQhfMU14Q==
X-Received: by 2002:a17:902:d2c9:b029:e9:67f7:9844 with SMTP id
 n9-20020a170902d2c9b02900e967f79844mr7778864plc.66.1618553969299; 
 Thu, 15 Apr 2021 23:19:29 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-09c3-a49e-2955-78c6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:9c3:a49e:2955:78c6])
 by smtp.gmail.com with ESMTPSA id l3sm4151589pju.44.2021.04.15.23.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 23:19:28 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: =?utf-8?B?6Z+p5aSn6bmPKEhhbiBEYXBlbmcp?= <handapeng@oppo.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, "x86\@kernel.org" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek
 <michal.lkml@markovi.net>, Mike Rapoport <rppt@kernel.org>, Pekka Enberg
 <penberg@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arseny
 Solokha <asolokha@kb.kras.ru>, =?utf-8?B?6Z+p5aSn6bmPKEhhbiBEYXBlbmcp?=
 <handapeng@oppo.com>, Arvind Sankar <nivedita@alum.mit.edu>, Kees Cook
 <keescook@chromium.org>, Joerg Roedel <jroedel@suse.de>, Christian Brauner
 <christian.brauner@ubuntu.com>, Kirill
 Tkhai <ktkhai@virtuozzo.com>, "linuxppc-dev\@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel\@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390\@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-kbuild\@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] symbol : Make the size of the compile-related array fixed
In-Reply-To: <TY2PR02MB3709103991CF81E89C8F1E37CB4C9@TY2PR02MB3709.apcprd02.prod.outlook.com>
References: <TY2PR02MB3709103991CF81E89C8F1E37CB4C9@TY2PR02MB3709.apcprd02.prod.outlook.com>
Date: Fri, 16 Apr 2021 16:19:24 +1000
Message-ID: <87h7k6g39v.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: =?utf-8?B?6ZmI5a6J5bqGKEFucWluZyk=?= <chenanqing@oppo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Thanks for your contribution to the kernel!

I notice that your patch is sumbitted as an attachment. In future,
please could you submit your patch inline, rather than as an attachment?
See https://www.kernel.org/doc/html/v4.15/process/5.Posting.html
I'd recommend you use git send-email if possible: see e.g.
https://www.kernel.org/doc/html/v4.15/process/email-clients.html

> Subject: [PATCH] symbol : Make the size of the compile-related array fixed
>
> For the same code, the machine's user name, hostname, or compilation time
> may cause the kernel symbol address to be inconsistent, which is not
> friendly to some symbol-dependent software, such as Crash.

If I understand correctly, this patch makes it easier to recompile the
kernel from the same source but at a different time or on a different
machine or with a different user, but still get the same symbols.
Is that right?

I wonder if there are other reproducible build techniques that might be
simpler to apply? There is a kernel documentation page at
https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html
which gives exisiting techniques to override the date, user and host.
Would they be sufficient to address your use case?

Kind regards,
Daniel

>
> Signed-off-by: Han Dapeng <handapeng@oppo.com>
> ---
>  arch/powerpc/mm/nohash/kaslr_booke.c | 2 +-
>  arch/s390/boot/version.c             | 2 +-
>  arch/x86/boot/compressed/kaslr.c     | 2 +-
>  arch/x86/boot/version.c              | 2 +-
>  init/version.c                       | 4 ++--
>  scripts/mkcompile_h                  | 2 ++
>  6 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
> index 4c74e8a5482b..494ef408e60c 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -37,7 +37,7 @@ struct regions {
>  };
>  
>  /* Simplified build-specific string for starting entropy. */
> -static const char build_str[] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
> +static const char build_str[COMPILE_STR_MAX] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
>  		LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION;
>  
>  struct regions __initdata regions;
> diff --git a/arch/s390/boot/version.c b/arch/s390/boot/version.c
> index d32e58bdda6a..627416a27d74 100644
> --- a/arch/s390/boot/version.c
> +++ b/arch/s390/boot/version.c
> @@ -3,5 +3,5 @@
>  #include <generated/compile.h>
>  #include "boot.h"
>  
> -const char kernel_version[] = UTS_RELEASE
> +const char kernel_version[COMPILE_STR_MAX] = UTS_RELEASE
>  	" (" LINUX_COMPILE_BY "@" LINUX_COMPILE_HOST ") " UTS_VERSION;
> diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
> index b92fffbe761f..7b72b518a4c8 100644
> --- a/arch/x86/boot/compressed/kaslr.c
> +++ b/arch/x86/boot/compressed/kaslr.c
> @@ -43,7 +43,7 @@
>  extern unsigned long get_cmd_line_ptr(void);
>  
>  /* Simplified build-specific string for starting entropy. */
> -static const char build_str[] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
> +static const char build_str[COMPILE_STR_MAX] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
>  		LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION;
>  
>  static unsigned long rotate_xor(unsigned long hash, const void *area,
> diff --git a/arch/x86/boot/version.c b/arch/x86/boot/version.c
> index a1aaaf6c06a6..08feaa2d7a10 100644
> --- a/arch/x86/boot/version.c
> +++ b/arch/x86/boot/version.c
> @@ -14,6 +14,6 @@
>  #include <generated/utsrelease.h>
>  #include <generated/compile.h>
>  
> -const char kernel_version[] =
> +const char kernel_version[COMPILE_STR_MAX] =
>  	UTS_RELEASE " (" LINUX_COMPILE_BY "@" LINUX_COMPILE_HOST ") "
>  	UTS_VERSION;
> diff --git a/init/version.c b/init/version.c
> index 92afc782b043..adfc9e91b56b 100644
> --- a/init/version.c
> +++ b/init/version.c
> @@ -35,11 +35,11 @@ struct uts_namespace init_uts_ns = {
>  EXPORT_SYMBOL_GPL(init_uts_ns);
>  
>  /* FIXED STRINGS! Don't touch! */
> -const char linux_banner[] =
> +const char linux_banner[COMPILE_STR_MAX] =
>  	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
>  	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
>  
> -const char linux_proc_banner[] =
> +const char linux_proc_banner[COMPILE_STR_MAX] =
>  	"%s version %s"
>  	" (" LINUX_COMPILE_BY "@" LINUX_COMPILE_HOST ")"
>  	" (" LINUX_COMPILER ") %s\n";
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 4ae735039daf..02b9d9d54da9 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -65,6 +65,8 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>    LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
>  		      | sed 's/[[:space:]]*$//')
>    printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
> +
> +  echo \#define COMPILE_STR_MAX 512
>  } > .tmpcompile
>  
>  # Only replace the real compile.h if the new one is different,
> -- 
> 2.27.0
