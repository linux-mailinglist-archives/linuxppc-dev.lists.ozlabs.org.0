Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588339AF19
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 02:34:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx3gN4X3lz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 10:34:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MTBAZvCi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MTBAZvCi; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx3fz2j1wz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 10:34:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fx3fr5fzwz9s1l;
 Fri,  4 Jun 2021 10:34:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622766853;
 bh=DlYD7/ikT8YNbVnd2jRpmnUISzjs7MCffewKt+dV8Zk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MTBAZvCihWnDtnLJ4HtIxdEG+CsBNWqSCDh/aKFo7J0FQp3ZvmnIfHmaTW0SH6dH6
 TGrEG3/TTlNCiXMXrv6D0sCmHdmIvrPJfUfTgz9D9FkATH8vzrovgkESaE58lSH3IN
 dzxbq9TLirzG8TbrbZCrAQS8QCXgUrCaw6PxYQwkZEiI+QikDUZ9grqCA9pOwcMb+d
 2aKKsgO608zGTeIdGEFzbrZJXz4QwaREAr7pf4wCncmFchOzU6SBzQhvV4nUpWmzds
 xRK3CRgxmaVj2wmh0TMu/S8nkcHXNik6PCFsv0/4WjoYMPalRswmWl/0T8lVxrBToa
 7rAvfzwAd8UCA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 0/5] DMA fixes for PS3 device drivers
In-Reply-To: <850d4850-d45a-e22f-d4bb-18bd68a35031@infradead.org>
References: <cover.1622577339.git.geoff@infradead.org>
 <875yyvh5iy.fsf@mpe.ellerman.id.au>
 <850d4850-d45a-e22f-d4bb-18bd68a35031@infradead.org>
Date: Fri, 04 Jun 2021 10:34:10 +1000
Message-ID: <8735tyh3i5.fsf@mpe.ellerman.id.au>
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> writes:
> Hi Michael,
>
> On 6/2/21 10:38 PM, Michael Ellerman wrote:
>> Geoff Levand <geoff@infradead.org> writes:
>>> Hi,
>>>
>>> This is a set of patches that fix various DMA related problems in the PS3
>>> device drivers, and add better error checking and improved message logging.
>>>
>>> The gelic network driver had a number of problems and most of the changes are
>>> in it's sources.
>>>
>>> Please consider.
>> 
>> Who are you thinking would merge this?
>> 
>> It's sort of splattered all over the place, but is mostly networking by
>> lines changed.
>> 
>> Maybe patches 3-5 should go via networking and I take 1-2?
>
> As suggested, I split the V1 series into two separate series, one for
> powerpc, and one for network.  

Thanks.

> I thought it made more sense for patch 3, 'powerpc/ps3: Add dma_mask
> to ps3_dma_region' to go with the powerpc series, so put it into that
> series.

Oh I thought patches 4 and 5 had a dependency on it, but if not yeah
makes sense for patch 3 to go via the powerpc tree.

cheers
