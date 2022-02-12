Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB24B375B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 19:28:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwzWn6zXtz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 05:28:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66;
 helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de;
 receiver=<UNKNOWN>)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwzWF6HNMz2xgb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 05:28:08 +1100 (AEDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1nIx76-001UOn-Ci; Sat, 12 Feb 2022 19:27:16 +0100
Received: from dynamic-077-011-010-081.77.11.pool.telefonica.de ([77.11.10.81]
 helo=[192.168.1.7]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1nIx75-000dOg-TM; Sat, 12 Feb 2022 19:27:16 +0100
Message-ID: <0396e38b-f681-a035-b6ea-21127fdf5615@physik.fu-berlin.de>
Date: Sat, 12 Feb 2022 19:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
To: ojeda@kernel.org
References: <20220212130410.6901-17-ojeda@kernel.org>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
Content-Language: en-US
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20220212130410.6901-17-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.11.10.81
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
Cc: thesven73@gmail.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 macanroj@gmail.com, paulus@samba.org, gary@garyguo.net, d0u9.su@outlook.com,
 linux-riscv@lists.infradead.org, will@kernel.org, tglx@linutronix.de,
 hpa@zytor.com, masahiroy@kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 torvalds@linux-foundation.org, mingo@redhat.com, wedsonaf@google.com,
 alex.gaynor@gmail.com, ark.email@gmail.com, aou@eecs.berkeley.edu,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 boqun.feng@gmail.com, antonio.terceiro@linaro.org, bp@alien8.de,
 paul.walmsley@sifive.com, me@kloenk.de, dsosnowski@dsosnowski.pl,
 linux-arm-kernel@lists.infradead.org, michal.lkml@markovi.net,
 gregkh@linuxfoundation.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, bobo1239@web.de, palmer@dabbelt.com,
 dxu@dxuuu.xyz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Sat, Feb 12, 2022 at 02:03:42PM +0100, Miguel Ojeda wrote:
> +config RUST
> +	bool "Rust support"
> +	depends on RUST_IS_AVAILABLE
> +	depends on ARM64 || CPU_32v6 || CPU_32v6K || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64 || RISCV

Is there any particular reason why this list excludes MIPS*, i386, big-endian
PowerPC and SPARC targets which are already supported by the Rust programming
language?

Are the arch/$ARCH/rust/target.json files everything that's needed for supporting
the other targets?

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

