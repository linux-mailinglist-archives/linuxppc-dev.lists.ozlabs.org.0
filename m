Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E05752BBA89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 01:10:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CdDMB2WxrzDr43
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 11:10:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jdjYaxbU; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CdDKZ4t5HzDr0d
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 11:08:48 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id c66so9444950pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 16:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZrI6T0ydbBGHVkvNAITM1/rIzBX4TKDzD+4JBPsjVAU=;
 b=jdjYaxbUzlqk4snx5STJs9c411mkqGRvaAvaha/amTKXJU9fZPQWsoZ8Ed3KIQw4ja
 mBRbalwnztTkPDbdJI5G2sIfrSCr7If5HYlFrLCJbofKQbI0ZoWG8UUmNU8xPtQqLFiR
 RQcHeEoMBRUOZMePca3LRVAiz6fVXCeRkfjAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZrI6T0ydbBGHVkvNAITM1/rIzBX4TKDzD+4JBPsjVAU=;
 b=hiyQqrjp7zl0pdQvOBXAwj/8WtFRs3f5eONP8G3bKdy+AFR6Ib+JZzBug23lyBUfkx
 uzFRw7yw+ZHxd0LIdqpuHkaVLgkxQxlKtUw4vtqja77bVU1DqJ42xOsv1IrboAfJPsm4
 YdLSxONEI2dPNIonAdDey1vpBDB32FhzWwb5QybPFTNYRfePdN0wutlTkqIh4WMPdUTS
 b5yyQwtaH9uCVPncdyUt9Cqo7hQES7GYL93/QagvJb/EStuU4yrDIfwPDrrz8yHKAgoo
 5bSq9oDhlVVLeFqz5QnX8s/78QlnhuCFozsuUPXpRl+99ceYNwQGEMe3eTQoyOBl1z0Z
 0RKg==
X-Gm-Message-State: AOAM530ZhtHhvIS6u3TSrgdFYGVTCHH3fJ+F9TE6Kkd19a6tJOSrA2pC
 eQo5u4XNXM+LTA5gOIDwivCqag==
X-Google-Smtp-Source: ABdhPJz2VCMT0GkwPGQ5DfLfgvDeslgTacR3q9aKQe4GBKPv6eKou3aGHdxLiBBAYPFreVGoa8LMSA==
X-Received: by 2002:a62:cd0d:0:b029:18b:a1cc:a5be with SMTP id
 o13-20020a62cd0d0000b029018ba1cca5bemr16150890pfg.67.1605917325096; 
 Fri, 20 Nov 2020 16:08:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id fu5sm5201126pjb.11.2020.11.20.16.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 16:08:44 -0800 (PST)
Date: Fri, 20 Nov 2020 16:08:43 -0800
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <202011201607.75FA476@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119204656.3261686-1-natechancellor@gmail.com>
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Arvind Sankar <nivedita@alum.mit.edu>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 01:46:56PM -0700, Nathan Chancellor wrote:
> Currently, '--orphan-handling=warn' is spread out across four different
> architectures in their respective Makefiles, which makes it a little
> unruly to deal with in case it needs to be disabled for a specific
> linker version (in this case, ld.lld 10.0.1).
> 
> To make it easier to control this, hoist this warning into Kconfig and
> the main Makefile so that disabling it is simpler, as the warning will
> only be enabled in a couple places (main Makefile and a couple of
> compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> conditional is easier due to Kconfig syntax. One small additional
> benefit of this is saving a call to ld-option on incremental builds
> because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
> 
> To keep the list of supported architectures the same, introduce
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> gain this automatically after all of the sections are specified and size
> asserted. A special thanks to Kees Cook for the help text on this
> config.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Masahiro, do you want to take these to get them to Linus for v5.10? I
can send them if you'd prefer.

-Kees

-- 
Kees Cook
