Return-Path: <linuxppc-dev+bounces-7458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E393A7CAA9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Apr 2025 19:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVMY54JsCz2ySr;
	Sun,  6 Apr 2025 03:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:470:ea4a:1:5054:ff:fec7:86e4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743873305;
	cv=none; b=hSjmDqVQAxuN0dahgWRD3wKEVYBjo4a42jT6I5WIW5c0JKN1/y1cHehDnaeM3o0zcHAREhiZKKogN7FxX5vi62OCjnJA2TusbLi6RQJTKhlFmOjrhHdGrDBv5MGxH+4JYWX35UGlfPuvNot4B3/9+9F+70AKk9Yi9hwbp1VBqFKaPvg7MGWS6NQk0UDZ8zKsANURuHwNCHB6Fqm2klLEGwpYGqpmT6QMuUH+im0LgsRhAj7YWvNu36L2uaSHn294WPNNMtnasOx0fNltINV1XNskpNxlh1786f6kGRvwf+tPLph73xx+42p1WgUvh9R+yZBK00cWjClNzbNiDdzsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743873305; c=relaxed/relaxed;
	bh=tmIf37hkJseqnFO4ijvf4xA+K3JIaSwLPz9+OPSHUO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fI3v+F/pQJwHOovaB0Wru8fS2gLqjgOwJThO/Cs/8cZtvbxg+wSawSLRcOgbuMUixNAqxpQkGZddyoTv5ASQybS9lsR4LKnrm5fZVbYhvv98os+JNUK0BDjWp6XNOD2mg7NehuCKpOo7aJos9ssmAfkaiZ/R1WLGg+NAC61LVWoDipMiLkgc5ToimzFJqhu0z719F9J4dRgm0Pf107U8SxjxsqcSDAglU88IaKzxYo11EdJYumd/78UxFHMQY5VZqNNgIIYpk/ST7309ffd1A1stFpMTPZr8I37APsXVSiJjAzOuGj7FUCiQYFycJ8z2n1CqgF5Nu9JF+JGPCrCVkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass (client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=lists.ozlabs.org) smtp.mailfrom=gentoo.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gentoo.org (client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Sun, 06 Apr 2025 03:15:04 AEST
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVMY42dNfz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Apr 2025 03:15:04 +1000 (AEST)
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5C1583430E5;
	Sat, 05 Apr 2025 17:09:14 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linmag7@gmail.com, Al Viro <viro@ftp.linux.org.uk>
Cc: arnd@arndb.de, chris@zankel.net, dinguyen@kernel.org,
 glaubitz@physik.fu-berlin.de, ink@unseen.parts, jcmvbkbc@gmail.com,
 kees@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, mattst88@gmail.com, monstr@monstr.eu,
 richard.henderson@linaro.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <87cyfejafj.fsf@gentoo.org>
Organization: Gentoo
References: <87cyfejafj.fsf@gentoo.org>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Sat, 05 Apr 2025 18:09:11 +0100
Message-ID: <87v7rik020.fsf@gentoo.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sam James <sam@gentoo.org> writes:

> Lovely cleanup and a great suggestion from Al.
>
> Reviewed-by: Sam James <sam@gentoo.org>
>
> I'd suggest adding a:
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>

Al, were you planning on taking this through your tree?

>
> thanks,
> sam

