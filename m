Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0E77EF6E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:16:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=A9+ZOyBL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR9CQ0yVMz3bP2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=A9+ZOyBL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR9BS5Jq8z2xVW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 13:16:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=P/kFyzCr/eSDaJkbY0OlCILEe1j9xWTLXn/yJLAYIu4=; b=A9+ZOyBLxgvkefgcCG3G+GbFOc
	t3Q4LPTtkkpyh0LBpbAFdc+3lhG3pcvB3Tuy2cTe9/M//iW+Sx1QS7+tpwHS9HCucIDpD/RDGCGIr
	FphyIapebkE7eEjeEnFtOi+9dwumQAvsQRYGjE0GEiZ5WBo53AxtXkFjlluHJQQSFYe1ZQ0mwCfpK
	6X/okD9sKE4Z8iWegd56l1SCJXl6wUSJ5Uk04klLzVcTy3SNTh8mgr2aL00kPfkoj1Td2N2/Azxck
	21ORjXTS2+GmCUfbeyQtLCC4mizooGziW6L1eBdD4Ta+hfKURTJGkPtTMCT5Ht16ny8Gi1C8JbRXm
	mdreectQ==;
Received: from [2601:1c2:980:9ec0::1a0b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qWTTi-000tOI-Mm; Thu, 17 Aug 2023 03:15:18 +0000
Message-ID: <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
Date: Wed, 16 Aug 2023 20:15:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: 20230816055010.31534-1-rdunlap@infradead.org
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Boge
 ndoerfer <tsbogend@alpha.franken.de>, Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jesse,

On 8/16/23 15:45, Jesse Taube wrote:
> Hi, Randy
> 
>> diff -- a/init/Kconfig b/init/Kconfig
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
>>
>>        If unsure, say N.
>>
>> -config EMBEDDED
>> -    bool "Embedded system"
>> -    select EXPERT
>> -    help
>> -      This option should be enabled if compiling the kernel for
>> -      an embedded system so certain expert options are available
>> -      for configuration.
> 
> Wouldn't removing this break many out of tree configs?

I'm not familiar with out-of-tree configs.
Do you have some examples of some that use CONFIG_EMBEDDED?
(not distros)

> Should there be a warning here to update change it instead of removal?

kconfig doesn't have a warning mechanism AFAIK.
Do you have an idea of how this would work?

We could make a smaller change to init/Kconfig, like so:

 config EMBEDDED
-	bool "Embedded system"
+	bool "Embedded system (DEPRECATED)"
 	select EXPERT
 	help
-	  This option should be enabled if compiling the kernel for
-	  an embedded system so certain expert options are available
-	  for configuration.
+	  This option is being removed after Linux 6.6.
+	  Use EXPERT instead of EMBEDDED.

but there is no way to produce a warning message. I.e., even with this
change, the message will probably be overlooked.

---
~Randy

