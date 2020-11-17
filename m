Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 753552B7122
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 22:55:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbKWB3kn6zDqVZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 08:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FumCDSza; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbKRc0fvBzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 08:52:28 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q5so41321pfk.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4XjG60ocQx4PkwGgrAEoZIyPUhnxDgPZrMBdqiIZG+4=;
 b=FumCDSzaVj4k7q4V2p0oNKAIKu0GYbAFc2SyCI1aqTxJUFpFoUH6T8PWWxOryTG19/
 Q1zlGV6Di3ZGEwaZIfQcQ4NcdAXg07SmAHCYzmm4aemVr6P+UEqs5yTGo761PszGobNa
 LiUwMgr6+SbWyc3qbTPN/Ai3ee1ReodEOFMas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4XjG60ocQx4PkwGgrAEoZIyPUhnxDgPZrMBdqiIZG+4=;
 b=ovtoeEzknstmIS6JGg489wK3llr/qtowjpJ6OZnYSdV3cBGKpfPi9rKkMu/BdlcfNZ
 g7t9ifNE9mmrylKbxDJJgMh1wY68GnPZDLSle4OW0snYlrEoJ95Z4DK0OaGkVDdu+7VO
 k0P5/bsv4318U36quqCcNc5niTRoUU4rV/1iEQgCw2Eqt/JnO204y4Hg9FIP0okz+ACs
 +0PxirmjBqcKrCLbhFqxqldpT2APFNC5Hdrq9xT+t2XJhBSjDxLqHE0yEmqFSCRg8gEt
 M3mYsT19udhwCOqGxBu0UwYaV8VW2/LGNDBcEYxW8xO+a3M9vtvIfwbx/1rwE1GUzwce
 j6UQ==
X-Gm-Message-State: AOAM530mleT8RHUCo7D077ugaP8SncsqiL3KhrYPJnW6qNM2Jq0KVQgB
 5bSFLrCzB0nY/uoa2qUAZ1b8lg==
X-Google-Smtp-Source: ABdhPJwx/GwY1vsKuE+ZykhwdU5XFj+Q/8T4Jjrzzd8kbh1afM17NqsLxZ988EMini1U8GWrTVGnNg==
X-Received: by 2002:a63:1445:: with SMTP id 5mr5119858pgu.357.1605649945756;
 Tue, 17 Nov 2020 13:52:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b29sm1039089pgn.87.2020.11.17.13.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 13:52:24 -0800 (PST)
Date: Tue, 17 Nov 2020 13:52:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <202011171351.728E1194EF@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113195553.1487659-1-natechancellor@gmail.com>
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Arvind Sankar <nivedita@alum.mit.edu>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 clang-built-linux@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 12:55:52PM -0700, Nathan Chancellor wrote:
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
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Looks good to me. With the other suggestions from the thread added,
please consider it:

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
