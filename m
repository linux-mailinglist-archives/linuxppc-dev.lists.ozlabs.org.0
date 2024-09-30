Return-Path: <linuxppc-dev+bounces-1696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62598A9BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 18:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHRKd6XpVz3013;
	Tue,  1 Oct 2024 02:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::221"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727713603;
	cv=none; b=OxYTsnPztfMYoyKngryuC9+4aq3OY4CK7hVN42JcSF7xBGL4mNWOfINuHQ6/iLVbq08fbZqM507DOZtawtlM++G+dVMB0utIyEnoMwRR4WJnKKcZyUGc7fCXv285aMRhHpGB5fh3Bx00bHLDiYcJsObCrVXSHOSWFwUpBKm6r8RyMjM2SL4dX5DNaYvr9vWd1h7Q3yv+d8VF2w+fWNZBTlBlwRsqbceHejh23ByjF6XpNAmRsdJMBmh52TvKyptKllWIzPqHHjQ1AyyNX3tH0hL7A4u7CXD/Vl2fIqTrmv/T/P3efcleaHelI9nX7DwnF4O64NdY2sGSfCNnF6DrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727713603; c=relaxed/relaxed;
	bh=F5fY6vmbXZmGi/YFQGI3QYA0A4g0No5R3ujeFb7Po5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rfu5V9nZCd7uUtYNEs1xJ99cEtIPSVUZs4VsdZGgVSlLZ4/Av4XAX8R/X6OEmRKTHmJKC2nRfM915pBjvlXVkW370mqzynbKAxeVmAvKWvOfaxyxm1We5scztyDdFnBsHEdAeKnXPRiCw37DIvNZjbunTjyqbOWd/KBBqkOZp0RJNSk25bYbS6VuXdU5sgFdsqDOCZ+Y/kazLeX/7mUgT7jAxt7EumviMebJi+n065nsk8JIl2bZS/9fULphEwSX0whPoTf+LgSARLx+9m3Nsxr9KMBcTgXykUg99du99rHZAFUKibs1ucVpA899PlVOVZOCJFggGNpffg0hL64S3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bOQbwi1e; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bOQbwi1e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHRKb122Mz300Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 02:26:41 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 444CF240003;
	Mon, 30 Sep 2024 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727713595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5fY6vmbXZmGi/YFQGI3QYA0A4g0No5R3ujeFb7Po5Y=;
	b=bOQbwi1e2Fqr7/xgoKfZhzl3gbXgMl+Fkdsw3N9swZcz4LBPYCVVetRz8bBgBTJk3twC2l
	/VB4lAzR1x6hFSg0jlNyVT/WR50YMzhA49j3/ck+QLodWDkINb/r/H/HvUZ6onNNaXy8BT
	yqIGPy1+1Nh+bhBh47UoW7rOcLniquF1MvD4ipyifhBuGQw9HkGcHJNDLShlW6teLLnGbu
	qb3vkhzBQghNDLIRtdw7SmA38Au69UztL+qPcRjAHgKdaWPehnD31RNh0J6lFk0VRi8PrL
	QjqbHWYg6ooZIwUAsonoihw5/IT+2gpco60vlaV6vlwmI520eM/IbOoVpozbVA==
Date: Mon, 30 Sep 2024 18:26:33 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, Kent Overstreet
 <kent.overstreet@linux.dev>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linux-bcache@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: Build regressions/improvements in v6.12-rc1
Message-ID: <20240930182633.6b5ce8ed@bootlin.com>
In-Reply-To: <6464b079-372d-d3f-d774-a7c05916fbe2@linux-m68k.org>
References: <CAHk-=wiwVOCZsC6a4dLdb1UjL2fS_CnLNjrPL0XGFbDd9C26Cg@mail.gmail.com>
	<20240930145322.129875-1-geert@linux-m68k.org>
	<6464b079-372d-d3f-d774-a7c05916fbe2@linux-m68k.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Geert,

On Mon, 30 Sep 2024 17:11:09 +0200 (CEST)
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Mon, 30 Sep 2024, Geert Uytterhoeven wrote:
> > Below is the list of build error/warning regressions/improvements in
> > v6.12-rc1[1] compared to v6.11[2].  

...

 powerpc-gcc13/ppc64_book3e_allmodconfig
> 
> drivers/soc/fsl/qe/qmc.c: In function 'qmc_qe_init_resources':
> include/linux/err.h:28:49: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>     28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
>        |                                                 ^
> include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>     77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>        |                                             ^
> drivers/soc/fsl/qe/qmc.c:1764:13: note: in expansion of macro 'IS_ERR_VALUE'
>   1764 |         if (IS_ERR_VALUE(info)) {
>        |             ^~~~~~~~~~~~
> 
> IS_ERR_VALUE() is meant for pointers (fix available)

I saw your patch, tested and acked it.
Thanks for the patch.

Hervé

