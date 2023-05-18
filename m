Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137A708735
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 19:48:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMcsT6V2Xz3fDQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 03:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psL702gx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psL702gx;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMcrc2jVyz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 03:48:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7711E6516A;
	Thu, 18 May 2023 17:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B473CC433D2;
	Thu, 18 May 2023 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684432075;
	bh=QQbT/H+RhsbZvXK7PdSe10D3Oq+2SsaxOfRTrjkPKT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psL702gx1GrogPBlTwC+UYcP8IbOTuo/EBujZxTKJgoxloTQ01faEClLdpWXZp1RC
	 TQNWL/XkNQ5mgSbk+1L4Rf3qKNsEWnuTD2kVnFk0BaZlV4Pd3SDaJS4itJsXxO1gCG
	 kAYrS73B+MjCUXkfSznKtTXWvccBjlGyEcnU+PRQWFr/nIKQl26/GohstbrdJlbLb/
	 YuENcXDcLNmhz7RIz2r04Rnxks0PKHSdaHs0e7gNSQ8AM6gxw8agTyBNuF9cxJZfBe
	 gleuxThJQk3owQVerm+XLkZcBdLdmDTZGo97e4y4CHDOHLInfbUuM0nozDRu6RGz2C
	 u139V1XrohELw==
Date: Thu, 18 May 2023 13:47:54 -0400
From: Sasha Levin <sashal@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.3 6/7] powerpc/fsl_uli1575: Allow to disable
 FSL_ULI1575 support
Message-ID: <ZGZkylhlTdJoZJ3V@sashalap>
References: <20230509035455.59524-1-sashal@kernel.org>
 <20230509035455.59524-6-sashal@kernel.org>
 <62539831-1f8c-d908-bd7c-2a926702fa7f@infradead.org>
 <87jzxix9g7.fsf@mail.lhotse>
 <20230509071835.rrfefrhwtwsxlngy@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230509071835.rrfefrhwtwsxlngy@pali>
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
Cc: arnd@arndb.de, linus.walleij@linaro.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 09, 2023 at 09:18:35AM +0200, Pali Rohár wrote:
>On Tuesday 09 May 2023 17:14:48 Michael Ellerman wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>> > Hi--
>> >
>> > Just a heads up. This patch can cause build errors.
>> > I sent a patch for these on 2023-APR-28:
>> >   https://lore.kernel.org/linuxppc-dev/20230429043519.19807-1-rdunlap@infradead.org/
>> >
>> > Michael, I think this is your area if I'm not mistaken.
>>
>> Yes. The fix is in my fixes branch as:
>>   536d948a8dee ("powerpc/fsl_uli1575: fix kconfig warnings and build errors")
>>
>> But I don't think this commit (22fdf79171e8) really warrants going to
>> stable, it's a nice-to-have but doesn't fix any pressing bugs.
>
>Exactly. And also this patch alone without 1/8 would not work as in 1/8
>https://lore.kernel.org/all/20230409000812.18904-2-pali@kernel.org/ was
>added static inline variant of function which is used when ULI is
>disabled.

I'll drop it, thanks!

-- 
Thanks,
Sasha
