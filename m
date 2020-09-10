Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3C264FA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 21:47:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnTv56H4ZzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 05:47:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=eC6xHFZe; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnTrw4VxXzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 05:45:50 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s65so3771930pgb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kT3st5L2W/yGrskNA7hV4WTKcp+VzTZ5Pgaqe30vqT8=;
 b=eC6xHFZebGzDOu2iJFlC4sYhGBsPBPtk9a7oklICzLNlEMzSAdGnasLCc1rhvVduzw
 WWGkAB927UqclP1++HPY0zndFIqCAsSEoCB33GsJW1zgx9zdnqi9fNwkG+wGtFEr+T3z
 bUYjH1Oc2jBMRnj0f0FQ3tH0tHQIOzzYF+914=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kT3st5L2W/yGrskNA7hV4WTKcp+VzTZ5Pgaqe30vqT8=;
 b=pU4ey+h76ctooDly6MkcygZOIo8Q06yPte7ULka2+wxlHLyqRmt2+Lu18xrUp85F3d
 2c0FoJTjWPifRV4eyLdZtNkQFHBD6buFDU4mV9KcaOqr3gZ/6vZhPZpiuU66wf30hixn
 Igah2cxq1v6POGVeKTMs2cbJhHVAxrHUCGyg+GnGAHnJ3rEukJa5G+uU83L9dE94V0Uq
 PjzwfT1fhvbUjF7td0UT+Dl6ymcYheDVjFuB2EiYUeRjJooNQW6nnZTJ+UbOWQroNTZd
 X4b0cX+OT65m9q3vZiTPCM2blgA1ZTQynsmsT/6fIbMeYaTUgKJm5tg0CKIvdpogMbH3
 Ypkg==
X-Gm-Message-State: AOAM531B+nmtf//1icQTrEmQFqbGFaokRBSDG4rimxdsuDXlEu3P4Qff
 0UZe7k5VtnJ/W3IktHBSyPRDVA==
X-Google-Smtp-Source: ABdhPJwWpKs77i2Pw4YhFhAT5cZe6s0qx17kIVE+as0BWVJNc55TKLnEBagdP5cQWEjWPugWxrbACw==
X-Received: by 2002:aa7:858e:: with SMTP id w14mr2753410pfn.95.1599767146631; 
 Thu, 10 Sep 2020 12:45:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l79sm2905776pfd.210.2020.09.10.12.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 12:45:45 -0700 (PDT)
Date: Thu, 10 Sep 2020 12:45:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: preprocess module linker script
Message-ID: <202009101245.493610D05@keescook>
References: <20200904133122.133071-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904133122.133071-1-masahiroy@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Michal Marek <michal.lkml@markovi.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 04, 2020 at 10:31:21PM +0900, Masahiro Yamada wrote:
> There was a request to preprocess the module linker script like we do
> for the vmlinux one (https://lkml.org/lkml/2020/8/21/512).
> 
> The difference between vmlinux.lds and module.lds is that the latter
> is needed for external module builds, thus must be cleaned up by
> 'make mrproper' instead of 'make clean' (also, it must be created by
> 'make modules_prepare').
> 
> You cannot put it in arch/*/kernel/ because 'make clean' descends into
> it. I moved arch/*/kernel/module.lds to arch/*/include/asm/module.lds.h,
> which is included from scripts/module.lds.S.
> 
> scripts/module.lds is fine because 'make clean' keeps all the build
> artifacts under scripts/.
> 
> You can add arch-specific sections in <asm/module.lds.h>.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
