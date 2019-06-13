Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C094359C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 13:43:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Phhj0ZMdzDrQ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 21:43:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Phft1m8czDrNx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 21:42:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Phfr3V7Tz9s5c;
 Thu, 13 Jun 2019 21:42:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Pawel Dembicki <paweldembicki@gmail.com>
Subject: Re: [PATCH] powerpc: Enable kernel XZ compression option on PPC_85xx
In-Reply-To: <877e9qp3ou.fsf@dja-thinkpad.axtens.net>
References: <20190603164115.27471-1-paweldembicki@gmail.com>
 <877e9qp3ou.fsf@dja-thinkpad.axtens.net>
Date: Thu, 13 Jun 2019 21:42:09 +1000
Message-ID: <87ftodempa.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Christian Lamparter <chunkeey@gmail.com>, linux-kernel@vger.kernel.org,
 Pawel Dembicki <paweldembicki@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Pawel Dembicki <paweldembicki@gmail.com> writes:
>
>> Enable kernel XZ compression option on PPC_85xx. Tested with
>> simpleImage on TP-Link TL-WDR4900 (Freescale P1014 processor).
>>
>> Suggested-by: Christian Lamparter <chunkeey@gmail.com>
>> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
>> ---
>>  arch/powerpc/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 8c1c636308c8..daf4cb968922 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -196,7 +196,7 @@ config PPC
>>  	select HAVE_IOREMAP_PROT
>>  	select HAVE_IRQ_EXIT_ON_IRQ_STACK
>>  	select HAVE_KERNEL_GZIP
>> -	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x
>> +	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x || PPC_85xx
>
> (I'm not super well versed in the compression stuff, so apologies if
> this is a dumb question.) If it's this simple, is there any reason we
> can't turn it on generally, or convert it to a blacklist of platforms
> known not to work?

For some platforms enabling XZ requires that your u-boot has XZ support,
and I'm not very clear on when that support landed in u-boot and what
boards have it. And there are boards out there with old/custom u-boots
that effectively can't be updated.

But as a server guy I don't really know the details of all that very
well. So if someone tells me that we should enable XZ for everything, or
as you say just black list some platforms, then that's fine by me.

cheers
