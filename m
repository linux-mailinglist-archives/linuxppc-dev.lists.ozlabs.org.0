Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C52B749C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 04:16:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbSdX5zc0zDqFL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 14:16:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CWX89Bo+; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbSYW1xGTzDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 14:13:02 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id p12so638813qtp.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 19:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HgvttKSz6Ny3sSVlQN/E9G/7G2kWLjw/Bo0sdK0fdRk=;
 b=CWX89Bo+RFqfV61MMdOpdtn/KsRiAv0G0nWF2X55CWUA3vxzkGmwgNiYrMRFCHUiB/
 o0l8A6oe7FDsV+fo36st+m1IqF34qmR/K5FK0pDOVozjatjBMqp+aiaYhnVO0JMvUfmW
 97CpMbMaCSWeQsTkCc7Y5BqlIGPIRHqIJ8MMyLx0f2BZz29e282yoOJyhPQM7GjwI+0B
 XFIC5yRLu6obhArZoDhs4yD0XZ1ZfH5DHBWQytkK5H1wp0zeG5ZF5Fud9EKQk8dX9LqT
 PSdC1hq90vaC4bpCLuG0I8nY+S/q1MaNGb/xdIbbSpX8361oQ6V/d1/NUfKzZ9vwAtDU
 82Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HgvttKSz6Ny3sSVlQN/E9G/7G2kWLjw/Bo0sdK0fdRk=;
 b=rNwgSUUsjySSUgsBuTm49asIq5KaTahE/5rlRptvXBMZqtrYzUPVlRDMDGkIJnJzMg
 jmewSYb8HqaZQ45FdclZxsmHV3BGNyvym+Q6n27PnBEa2Bu4U0a4X5Um0OTbXrndkKNV
 qnleZXdhMev2mvdhw23Y6ddNJYDfvyl/qWpQL6aHnBjK8QFcuTNWtwL2WZ9sH9HBLLd0
 BBhBEsPrGpNWXSF15NJ9ZYkPah5NaZipIRTEF3agJLrha0Ylv3wb1Nc5MmYjetrpvwn8
 MjR04tEeFW5jm/Dgx2RoP9QxjyMhbtUMpejTTV6ILW7H1NI3xmFY70r1y+R0RVcfaogH
 qT2g==
X-Gm-Message-State: AOAM531YgnhHXKbEUsdpMespR1W4qyWOC3mit0Vx/DUS19X2kkYnkvA0
 oAXuX79uU5wLMlGzH5Km8jQ=
X-Google-Smtp-Source: ABdhPJzuIDnMCVG5Tuz116cq6Z1nlyfDBVH+eUiGr+rwEJQdkH3cFq7bPI+slF+97TRva76BZFWfMA==
X-Received: by 2002:aed:2051:: with SMTP id 75mr2388981qta.332.1605669179405; 
 Tue, 17 Nov 2020 19:12:59 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id h11sm15438617qtr.13.2020.11.17.19.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 19:12:58 -0800 (PST)
Date: Tue, 17 Nov 2020 20:12:57 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <20201118031257.GB1001457@ubuntu-m3-large-x86>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201113195553.1487659-2-natechancellor@gmail.com>
 <202011171350.F95127F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202011171350.F95127F@keescook>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 "kernelci . org bot" <bot@kernelci.org>, linux-kbuild@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
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

On Tue, Nov 17, 2020 at 01:51:43PM -0800, Kees Cook wrote:
> On Fri, Nov 13, 2020 at 12:55:53PM -0700, Nathan Chancellor wrote:
> >  config LD_ORPHAN_WARN
> > -	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
> > +	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)
> 
> Readability nit-pick... I prefer separate "depends" lines to make things
> a little easier to parse, change, etc:
> 
> config LD_ORPHAN_WARN
> 	def_bool y
> 	depends on ARCH_WANT_LD_ORPHAN_WARN
> 	depends on !LD_IS_LLD || LLD_VERSION >= 110000
> 	depends on $(ld-option,--orphan-handling=warn)
> 
> Otherwise, yeah, looks good to me. With this and the other suggestions,
> please consider it:
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thank you, I have updated it locally for v2!

Cheers,
Nathan
