Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3E78F00F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 17:17:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAtcvuir;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc4Wv3jKhz3bhy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 01:16:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAtcvuir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc4Vw4ds8z30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 01:16:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dZ+CYy+NiImbraQzZFb/jEDAIlzMlTzLoJNY/bcsZII=; b=MAtcvuir2tPTWB75BVsumuwLNf
	3SooZiTyRkl4NwwpAYGOymwio5PIxPeO7goMfZuC6v6azsGwn6ZG6xFHPdq1rjRfhDhmDfcYaHQRW
	9zJs0RzRqdtAUyxGgrxmSHXaBy4/NKQWQUCDlJrcrBRMd3MLEtFzpb5MbH5zYrKmSQOwmHnSKTLm9
	VGga4lf1vf4k8gDv7/BffS+yWM9S7qd+lUcP0n0V9+Oiik8gm6t1+0bvEhmNQldVY04Mx4j5HwxyJ
	XkVeUjYjkHOqa4DpkWTitDU5CzYOhznQLNyuCQXxOw8TOm+d3Ep4S8sFi4ECuBwjIBvqXp6APdICj
	ikW0w1ag==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qbjOg-00FUAa-1n;
	Thu, 31 Aug 2023 15:15:50 +0000
Message-ID: <478ac7ec-a89c-32ae-6b0b-e6f5c3f8e151@infradead.org>
Date: Thu, 31 Aug 2023 08:15:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] macintosh: Explicitly include correct DT includes
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
References: <20230714174654.4058898-1-robh@kernel.org>
 <6df12112-0849-4d7b-8f99-d2a7a3560a97@roeck-us.net>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6df12112-0849-4d7b-8f99-d2a7a3560a97@roeck-us.net>
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
Cc: Colin Leroy <colin@colino.net>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/31/23 07:04, Guenter Roeck wrote:
> On Fri, Jul 14, 2023 at 11:46:54AM -0600, Rob Herring wrote:
>> The DT of_device.h and of_platform.h date back to the separate
>> of_platform_bus_type before it as merged into the regular platform bus.
>> As part of that merge prepping Arm DT support 13 years ago, they
>> "temporarily" include each other. They also include platform_device.h
>> and of.h. As a result, there's a pretty much random mix of those include
>> files used throughout the tree. In order to detangle these headers and
>> replace the implicit includes with struct declarations, users need to
>> explicitly include the correct includes.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> This patch results in the following build error.
> 
> Building powerpc:ppc32_allmodconfig ... failed
> --------------
> Error log:
> drivers/macintosh/ams/ams-input.c: In function 'ams_input_enable':
> drivers/macintosh/ams/ams-input.c:68:45: error: invalid use of undefined type 'struct platform_device'
>    68 |         input->dev.parent = &ams_info.of_dev->dev;
>       |                                             ^~
> drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
> drivers/macintosh/ams/ams-input.c:146:51: error: invalid use of undefined type 'struct platform_device'
>   146 |         return device_create_file(&ams_info.of_dev->dev, &dev_attr_joystick);
>       |                                                   ^~
> drivers/macintosh/ams/ams-input.c: In function 'ams_input_exit':
> drivers/macintosh/ams/ams-input.c:151:44: error: invalid use of undefined type 'struct platform_device'
>   151 |         device_remove_file(&ams_info.of_dev->dev, &dev_attr_joystick);
>       |                                            ^~
> drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
> drivers/macintosh/ams/ams-input.c:147:1: error: control reaches end of non-void function 
> 
> Bisect log attached.

Hi Guenter,
I posted a patch for this 2 days ago and Michael Ellerman just did a pull request
to Linus with the fix.

-- 
~Randy
