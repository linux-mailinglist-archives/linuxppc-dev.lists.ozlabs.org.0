Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A156D0A7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 19:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LgvrN0Pd3z3c5X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 03:58:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nDCtJFQe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nDCtJFQe;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lgvqh5C73z3bZB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 03:57:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5542DB80B95;
	Sun, 10 Jul 2022 17:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CE9C3411E;
	Sun, 10 Jul 2022 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657475851;
	bh=NSVT8pRObvkt/VAUFyL3V+ogDaz+KTUNsHES7wK8hvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDCtJFQef1NjSVO1hZyUQllM++oTBPR3q7ko8iMd2YNeFxmUwECOkutSTzY9spKSg
	 PIt0bfkcE8EgTBb4y0tB1WqPJ9CYxmVT8KpyHi8q6lzXymqkICKI8ZGsu1Vw9y/FKf
	 agP5kWIHlL/nN9bdBmVs+pLbdZ50L0iI2Vq2KeTrPcvMhY0eopk6aPj4KVuDEteePO
	 1COBnOpMKeYWwwPn0Y5JAZAsrWXFDawx9/l0rkCDpCMX4MY0oppNcjOfK1KuipHxVh
	 QrBPkdFCfdsP/j2pLzJAwuOuiBLG5NDymbyMoHfTI74TceBNmdUPT1hGahhy3iuFtT
	 R4ecJtT0kMlsw==
Received: by pali.im (Postfix)
	id C193B792; Sun, 10 Jul 2022 19:57:27 +0200 (CEST)
Date: Sun, 10 Jul 2022 19:57:27 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220710175727.ee52xoqfwlphjxv5@pali>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220704131358.fy3z7tjcmk2m6pfh@pali>
 <20220708171422.mpbhb4ejarwnce6m@pali>
 <358f5a57-5eee-56af-fe73-f5d11cfad98e@csgroup.eu>
 <20220709102305.t2ouadn6zscp2m7i@pali>
 <c77df184-c79c-8d81-0327-9eaefb71c890@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c77df184-c79c-8d81-0327-9eaefb71c890@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sunday 10 July 2022 17:38:33 Christophe Leroy wrote:
> Le 09/07/2022 à 12:23, Pali Rohár a écrit :
> >>>    
> >>> -ifdef CONFIG_PPC_BOOK3S_64
> >>>    ifdef CONFIG_CPU_LITTLE_ENDIAN
> >>> -CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
> >>> -CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power9,-mtune=power8)
> >>> +CFLAGS-$(CONFIG_PPC_BOOK3S_64) += -mcpu=power8
> >>> +CFLAGS-$(CONFIG_PPC_BOOK3S_64) += $(call cc-option,-mtune=power9,-mtune=power8)
> >>>    else
> >>> -CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power7,$(call cc-option,-mtune=power5))
> >>> -CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mcpu=power5,-mcpu=power4)
> >>> -endif
> >>> -else ifdef CONFIG_PPC_BOOK3E_64
> >>> -CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
> >>> +CFLAGS-$(CONFIG_PPC_BOOK3S_64) += $(call cc-option,-mtune=power7,$(call cc-option,-mtune=power5))
> >>> +CFLAGS-$(CONFIG_PPC_BOOK3S_64) += $(call cc-option,-mcpu=power5,-mcpu=power4)
> >>
> >> So before that change I got -mcpu=power9
> >>
> >> Now I get -mtune=power7 -mcpu=power5 -mcpu=power9
> > 
> > I did it like Arnd wrote.
> > 
> > And seems that it does not work and now is fully out of the scope of the
> > original issue. Now I'm really lost here.
> > 
> > So I nobody comes with better solution, I would prefer to stick with my
> > original version which targets _only_ e500 cores.
> > 
> > Any other suggestion?
> 
> I sent a patch based on the TARGET_CPU logic, does it work for you ?
> 
> Christophe

Perfect, it works! Thank you.


Anyway, same problem is with arch/powerpc/boot/Makefile file when
building "uImage" target. There is hardcoded -mcpu=powerpc flag.
