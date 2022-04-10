Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B764FAEA1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 18:06:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kbxgr2sjZz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 02:06:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=giCO8IdB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=giCO8IdB; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kbxg91KRVz2xnD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 02:06:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=FM836GhEXqpwKC8D1Fkh0HgSJYHRHMp/sLuYDx0vbkY=; b=giCO8IdBvsPvrL7wWfE7W1Lujs
 sme0XiFVUz0iq9S3yAOqx2eQqfVpz8MLu0eH6EuaoPsxN32oXLl0Ehh5Cz0gw0HJfvY4k6ajEqHcb
 y2KUz6DMzvqRIWnEtFsyqSxVyhEClG8JyabKcPSvmkFr014oXdrUEpTDeefE9Rjt8pzhpBaUlj+nd
 hfRKlyf0Moj67XpCcPQEzcIHmv+AKUBuvTRBDmng6v5DKzk4BHP17fEcijcHKadirOgkAmWB+Hqvo
 hkQcbRTwr6IfDojsCqYsHPyJVPFvYpIsWGb7I8qDKc8u9DM9TPeaGzMTSBKQHqY4dDiOaK3BcPuVe
 Wxu7abmA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nda4M-00Bb9W-3V; Sun, 10 Apr 2022 16:05:42 +0000
Message-ID: <9cda10ff-7daa-808e-477f-6b9c4e0445d9@infradead.org>
Date: Sun, 10 Apr 2022 09:05:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] macintosh: fix via-pmu and via-cuda build without
 RTC_CLASS
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220409020821.10229-1-rdunlap@infradead.org>
 <ae85daa9-97a4-3ed2-5692-0d4545a88b58@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ae85daa9-97a4-3ed2-5692-0d4545a88b58@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
 Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi--

On 4/10/22 00:03, Christophe Leroy wrote:
> 
> 
> Le 09/04/2022 à 04:08, Randy Dunlap a écrit :
>> Fix build when RTC_CLASS is not set/enabled.
>> Eliminates these build errors:
>>
>> m68k-linux-ld: drivers/macintosh/via-pmu.o: in function `pmu_set_rtc_time':
>> drivers/macintosh/via-pmu.c:1769: undefined reference to `rtc_tm_to_time64'
>> m68k-linux-ld: drivers/macintosh/via-cuda.o: in function `cuda_set_rtc_time':
>> drivers/macintosh/via-cuda.c:797: undefined reference to `rtc_tm_to_time64'
> 
> You don't need RTC_CLASS for that. All you need is RTC_LIB I think.

Oh good.

> What about selecting RTC_LIB from m68k Kconfig just like powerpc and a 
> few architectures do ?

Sounds good. I'll test that now.

> See 
> https://elixir.bootlin.com/linux/v5.18-rc1/source/arch/powerpc/Kconfig#L269
> 
> Otherwise, I think it would be better to move (and rename) 
> rtc_tm_to_time64() into kernel/time/time.c instead of opencoding it twice.
> 

Yeah, I didn't like that either.

>>
>> Fixes: 0792a2c8e0bb ("macintosh: Use common code to access RTC")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Kees Cook <keescook@chromium.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Finn Thain <fthain@linux-m68k.org>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> ---
>>   drivers/macintosh/via-cuda.c |    5 ++++-
>>   drivers/macintosh/via-pmu.c  |    5 ++++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)

thanks.
-- 
~Randy
