Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A079C5B2278
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 17:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNjrQ4yCxz3br9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 01:35:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jtuXUldp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jtuXUldp;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNjqq2wDwz30Qt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 01:35:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5640CB8214A;
	Thu,  8 Sep 2022 15:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F05C433C1;
	Thu,  8 Sep 2022 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662651315;
	bh=1HH8dtHniEemIyqgAOVQ7bA85JJUJ7y9/44WJRBwSCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtuXUldpXq4AZ4gbzvBqJ+hUY8LnvKeFDn3wTlDvP0la8BqO1YRLKBeORZnIZrrEn
	 FE/FbCvMREQD+mWPp2gf9mlDIkJKt+hB3Y8wdqZqUseL42cje7fqAcvZFxADT7z0om
	 b+PY3woI5hLvo32l218UiRAa5U9Gr5sCJ4LAWQUzM1EveQX8YOhxkmWpoht+fnsfgc
	 SlhVW/dONbhlgA5EPEg1laTajQe/ctgQNlW6yjrcufj73gj9S+BXnW2UDv8jCgNIrM
	 M216TK7W3S5ZsU98BNrYM1m5hq6qH5vqIihxVQA7Pq+J7YQLLn3hW/eBN/zOtyVNi0
	 Qq8zT2+i7ewmA==
Received: by pali.im (Postfix)
	id 104B47EF; Thu,  8 Sep 2022 17:35:12 +0200 (CEST)
Date: Thu, 8 Sep 2022 17:35:11 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 11/12] powerpc: wiiu: don't enforce flat memory
Message-ID: <20220908153511.57ceunyusziqfcav@pali>
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220302044406.63401-12-ash@heyquark.com>
 <20220513224353.n56qg5fhstbaqhfz@pali>
 <d84e4d24-f350-80fc-6c31-b7e7f8d429f4@heyquark.com>
 <20220520080454.c3cqodsdbfbkmg56@pali>
 <935b426a-6c64-beb0-907f-8c3f0a089ab7@heyquark.com>
 <20220520123002.rd46p5ty6wumi7cc@pali>
 <20220609222420.ponpoodiqmaqtwht@pali>
 <20220808184034.lskqrk6z3gb5q76r@pali>
 <219cda7b-da4b-7a5a-9809-0878e0fc02ba@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <219cda7b-da4b-7a5a-9809-0878e0fc02ba@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulus@samba.org" <paulus@samba.org>, Ash Logan <ash@heyquark.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 08 September 2022 15:25:14 Christophe Leroy wrote:
> Le 08/08/2022 à 20:40, Pali Rohár a écrit :
> > On Friday 10 June 2022 00:24:20 Pali Rohár wrote:
> >> On Friday 20 May 2022 14:30:02 Pali Rohár wrote:
> >>> + linux-mm
> >>>
> >>> Do you know what are requirements for kernel to support non-contiguous
> >>> memory support and what is needed to enable it for 32-bit powerpc?
> >>
> >> Any hints?
> > 
> > PING?
> > 
> 
> The tree following patches landed in powerpc/next branch, so they should 
> soon be visible in linux-next too:
> 
> fc06755e2562 ("powerpc/32: Drop a stale comment about reservation of 
> gigantic pages")
> b0e0d68b1c52 ("powerpc/32: Allow fragmented physical memory")
> 0115953dcebe ("powerpc/32: Remove wii_memory_fixups()")

Ou, nice! I will try to test it if it allows me to access more than 2GB
of RAM from 4GB DDR3 module with 32-bit addressing mode on P2020 CPU.
