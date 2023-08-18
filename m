Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD47815E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 01:46:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pZH/ksRw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSJRB6mJtz3cR3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 09:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pZH/ksRw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSJQ60lmxz3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 09:45:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xTd+xM15uwaYqGAW/S8CZDkcwvuJ3aJIIjx1MPGNF/Y=; b=pZH/ksRwnPq3maIwYAlJC3Rrrr
	9sXlHg5rZOuCTKksS/zIoMTj4CYgiei2BSHr/Fmq4d5o6u6K44iFq95QRQnAeXh21SPlKB1dSqI9S
	Cfts7MiOtQtejm51Kqr727hN42qMODja2NIagNNWPITLUN3zgCX6JPHkj/KLLfXzJl6lnRj2IQpX0
	rdlY37izaBlOJXXS/VdrrvoBUDNRoF1KuxWjFO1MPDhsEqGcrcCV503FRIC+zvjs3tCc/aw4OtNDw
	1CgyBaH6pumLMmkbfGn+hR53qU8NQHPiWTB5c7oduD3LBzu4IRjjLr3T37jzgVW5PH9+G1oKRWkqj
	I69daqCw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qX98o-00ABNX-07;
	Fri, 18 Aug 2023 23:44:30 +0000
Message-ID: <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
Date: Fri, 18 Aug 2023 16:44:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Jesse Taube <mr.bossman075@gmail.com>
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
 <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
In-Reply-To: <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
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

I replied to your comment a few days ago, but for some reason
your email to me contains:
Reply-To: 20230816055010.31534-1-rdunlap@infradead.org
so it wasn't sent directly to you.

My former reply is below.

On 8/16/23 20:15, Randy Dunlap wrote:
> Hi Jesse,
> 
> On 8/16/23 15:45, Jesse Taube wrote:
>> Hi, Randy
>>
>>> diff -- a/init/Kconfig b/init/Kconfig
>>> --- a/init/Kconfig
>>> +++ b/init/Kconfig
>>> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
>>>
>>>         If unsure, say N.
>>>
>>> -config EMBEDDED
>>> -    bool "Embedded system"
>>> -    select EXPERT
>>> -    help
>>> -      This option should be enabled if compiling the kernel for
>>> -      an embedded system so certain expert options are available
>>> -      for configuration.
>>
>> Wouldn't removing this break many out of tree configs?
> 
> I'm not familiar with out-of-tree configs.
> Do you have some examples of some that use CONFIG_EMBEDDED?
> (not distros)
> 
>> Should there be a warning here to update change it instead of removal?
> 
> kconfig doesn't have a warning mechanism AFAIK.
> Do you have an idea of how this would work?
> 
> We could make a smaller change to init/Kconfig, like so:
> 
>  config EMBEDDED
> -	bool "Embedded system"
> +	bool "Embedded system (DEPRECATED)"
>  	select EXPERT
>  	help
> -	  This option should be enabled if compiling the kernel for
> -	  an embedded system so certain expert options are available
> -	  for configuration.
> +	  This option is being removed after Linux 6.6.
> +	  Use EXPERT instead of EMBEDDED.
> 
> but there is no way to produce a warning message. I.e., even with this
> change, the message will probably be overlooked.
> 
> ---
> ~Randy

-- 
~Randy
