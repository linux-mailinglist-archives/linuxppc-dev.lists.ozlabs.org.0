Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E92174F72EF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 05:17:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYmll01stz3bbV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 13:17:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=gRH3I/rn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=gRH3I/rn; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYml12sgCz2xY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 13:17:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=tLxlzYMHBM2oOeRyE57OoUafeLa+ku21SzsWV13PpHo=; b=gRH3I/rn8HloF2Lfm8aJ4bIBYX
 WBeaRm4iYLsEDFQm10Jd5BGY4IHVSe7gv8keZY3W2djnyGV4zBfmTNYG3wPmw/h0AZQzh/2/Tto99
 ivGMioN2V+QzAz5TB81l/lqx333kCqjqYHvSwwiD5KPeNxgQ61qkTYXYg/pmE+A/63+6++6Kpm+7u
 RPc2ak9Es2LmCp9yAc6HL3g5snkledPhW/pXf+qka+fO3TAopa7unYtQGJA/ftSNSYC5/+/Bkx4Rv
 UlkMVrlKf9QA0m6MJRTfc8pKdO8EydUhHzsgKkK8094TKBr3e+174vgJ/TKFSKu5S/KGOAoq0ZilE
 JEkPlDnQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncIdQ-008R8g-D0; Thu, 07 Apr 2022 03:16:36 +0000
Message-ID: <c8c2b89b-8546-8449-a27e-ef6e89186e26@infradead.org>
Date: Wed, 6 Apr 2022 20:16:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] macintosh: fix via-pmu and via-cuda build errors
Content-Language: en-US
To: linux-kernel@vger.kernel.org
References: <20220407023700.7216-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220407023700.7216-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kernel test robot <lkp@intel.com>, Finn Thain <fthain@linux-m68k.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/6/22 19:37, Randy Dunlap wrote:
> When CONFIG_INPUT=m, the input_*() family of functions is not
> available to builtin drivers.
> 
> When CONFIG_RTC_CLASS is not set, rtc_tm_to_time64() is not defined.
> 
> Fix multiple build errors by making these Kconfig symbols required by
> ADB_CUDA (RTC_CLASS) and ADB_PMU (RTC_CLASS and INPUT).

Ah yes, Finn has already fixed the INPUT problems here.

Maybe that patch hasn't been merged anywhere yet?

The RTC_CLASS problem is still present AFAICT.

> m68k-linux-ld: drivers/macintosh/via-pmu.o: in function `pmu_set_rtc_time':
> drivers/macintosh/via-pmu.c:1758: undefined reference to `rtc_tm_to_time64'
> m68k-linux-ld: drivers/macintosh/via-pmu-event.o: in function `input_report_key':
> include/linux/input.h:425: undefined reference to `input_event'
> m68k-linux-ld: drivers/macintosh/via-pmu-event.o: in function `input_report_switch':
> include/linux/input.h:445: undefined reference to `input_event'
> m68k-linux-ld: drivers/macintosh/via-pmu-event.o: in function `via_pmu_event_init':
> drivers/macintosh/via-pmu-event.c:38: undefined reference to `input_allocate_device'
> m68k-linux-ld: drivers/macintosh/via-pmu-event.c:53: undefined reference to `input_register_device'
> m68k-linux-ld: drivers/macintosh/via-pmu-event.c:55: undefined reference to `input_free_device'
> m68k-linux-ld: drivers/macintosh/via-cuda.o: in function `cuda_set_rtc_time':
> drivers/macintosh/via-cuda.c:797: undefined reference to `rtc_tm_to_time64'
> 
> Fixes: 0792a2c8e0bb ("macintosh: Use common code to access RTC")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> This is a big hammer type of patch. We could possibly do (a) some
> conditional code blocks for RTC_CLASS and (b) only build via-pmu-event
> if CONFIG_INPUT=y if needed.
> 
>  drivers/macintosh/Kconfig |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- a/drivers/macintosh/Kconfig
> +++ b/drivers/macintosh/Kconfig
> @@ -44,6 +44,7 @@ config ADB_IOP
>  config ADB_CUDA
>  	bool "Support for Cuda/Egret based Macs and PowerMacs"
>  	depends on (ADB || PPC_PMAC) && !PPC_PMAC64
> +	depends on RTC_CLASS
>  	help
>  	  This provides support for Cuda/Egret based Macintosh and
>  	  Power Macintosh systems. This includes most m68k based Macs,
> @@ -57,6 +58,8 @@ config ADB_CUDA
>  config ADB_PMU
>  	bool "Support for PMU based PowerMacs and PowerBooks"
>  	depends on PPC_PMAC || MAC
> +	depends on INPUT=y
> +	depends on RTC_CLASS
>  	help
>  	  On PowerBooks, iBooks, and recent iMacs and Power Macintoshes, the
>  	  PMU is an embedded microprocessor whose primary function is to

-- 
~Randy
