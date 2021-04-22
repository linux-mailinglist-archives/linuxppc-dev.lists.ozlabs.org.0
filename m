Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8E368929
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 00:59:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRCXy67xlz30D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 08:59:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=BGdKfM4X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=BGdKfM4X; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRCXY2Wzsz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 08:59:06 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id s22so12806953pgk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=om3adLmjsOL25zP7hAROfU4pqW1M7DWgt1R1d964z/8=;
 b=BGdKfM4XzPhjZQDEBLa8yWSZhGHzdVmF0SqqHC/WOqMIHn56dgXM7B13/lhMwb+qUd
 0lanr3ctz4u4EUVTFbOy7eu8Y2bZ9XB+CQyjT0xhi2ZhrLhCADvoyUXkXdKHXmqJ8M6g
 b4sm0nkCwqmyQZUnQCMTyqRNZkrL0FnXQ+0nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=om3adLmjsOL25zP7hAROfU4pqW1M7DWgt1R1d964z/8=;
 b=S0i+t2jJ/96s9zOVBhUVOgiQQK29G3sMP+b1IaBivPWgQ/GzPUPOHKQbr4b95bZF1w
 HuH+tuY5GzAGuQviiLBJ70bkka4PDHqtuYT+nk5PdVk7jEZspC0zBfjnwJxpgZh1dNsQ
 Pqb1LI4bNjjFG9euvA4DFZ3+/J90TLeGx2/EQhAYup4QVP/ylt9kuIO4GAttz/AFySJc
 RNeypGvrdyhUgqLw73A8maTxHJkf8A9olYubEAfKaK03WGclCqEoco19tU1DNYvhCRcq
 ZPmmJPqopIertsqR8VEQRrjcz/6tvmLyH0Tdl6GOwSRvb8RojZSBXmJkknkan51jUGUo
 c7Zg==
X-Gm-Message-State: AOAM5311Xvrm4Hc2x+KAt4uM3G/4+fCYu1PNkqTK/CjrL/n15Ue4ouL4
 fTlEEKlPIaMcJRUnwASgTsLAqXsqunj1Ug==
X-Google-Smtp-Source: ABdhPJyYJ8TY0Cppw9AnebK1BgLPEXLIpQbzKXlPGTo9TPbPe8Dk+olw1wKG4X7Lxv2uCs6XPzmrhQ==
X-Received: by 2002:aa7:824e:0:b029:20a:3a1:eeda with SMTP id
 e14-20020aa7824e0000b029020a03a1eedamr774031pfn.71.1619132344252; 
 Thu, 22 Apr 2021 15:59:04 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-587a-8af2-ee3d-5684.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:587a:8af2:ee3d:5684])
 by smtp.gmail.com with ESMTPSA id bj15sm5829124pjb.6.2021.04.22.15.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 15:59:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
In-Reply-To: <20210422092737.895392-1-aik@ozlabs.ru>
References: <20210422092737.895392-1-aik@ozlabs.ru>
Date: Fri, 23 Apr 2021 08:58:59 +1000
Message-ID: <87mttqylho.fsf@dja-thinkpad.axtens.net>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexey,

> The $(CPP) (do only preprocessing) macro is already defined in Makefile.
> However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
> in flags duplication. Which is not a big deal by itself except for
> the flags which depend on other flags and the compiler checks them
> as it parses the command line.
>
> Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
> If clang+llvm+sanitizer are enabled, this results in
> -fno-lto -flto -fsanitize=cfi-mfcall  .... -fno-lto -flto -fsanitize=cfi-mfcall

Checkpatch doesn't like this line:
WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#14: 
-fno-lto -flto -fsanitize=cfi-mfcall  .... -fno-lto -flto -fsanitize=cfi-mfcall
However, it doesn't make sense to wrap the line so we should just ignore
checkpatch here.

> in the clang command line and triggers error:
>
> clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'
>
> This removes unnecessary CPP redifinition.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index c9d2c7825cd6..3a2f2001c62b 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -214,7 +214,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
>  KBUILD_AFLAGS	+= $(AFLAGS-y)
>  KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
>  KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
> -CPP		= $(CC) -E $(KBUILD_CFLAGS)

I was trying to check the history to see why powerpc has its own
definition. It seems to date back at least as far as merging the two
powerpc platforms into one, maybe it was helpful then. I agree it
doesn't seem to be needed now.

Snowpatch claims that this breaks the build, but I haven't been able to
reproduce the issue in either pmac32 or ppc64 defconfig. I have sent it
off to a fork of mpe's linux-ci repo to see if any of those builds hit
any issues: https://github.com/daxtens/linux-ci/actions

Assuming that doesn't break, this patch looks good to me:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
