Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1C39AAEB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 21:28:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwwtB3qkWz30Dl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 05:28:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=iZo72Ya2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=iZo72Ya2; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwwsk0SMpz2ywx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 05:28:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=NG7Tne/SPQ7BN6SB4JycJ3Ccw3cfCbyVQ3NINOGf8ts=; b=iZo72Ya2j9m/ti8s+bmC9EATR5
 89pdUaOKNcVa+X4PD91UztZGOqCrgWz89eJm0Ls2Jy/VoUogrYRRuUcrw3SMfmUSfVn42amDm+mkr
 eNuRINSxmysUEYWBMIxTbMSEXTx7iQ0EPa4ik0kcKlaV7zxMcPjuUHmUfhMLRqdjr/pnye2D8T/yd
 0yaLXY7RaLGL1ZV5vcgYjf88PD9oAV+Gu4c1VwIp/SxfvGt6fdk34tZ+PNSaFQFUPEAelV666UEUF
 VpfPi2bJa7TtpKob0DUd/Ew46X2FsQYaHllXdGpcAWLz2YqbanqOMP21G0w1DKkiO0YC1fMC9153l
 57cdD0Ew==;
Received: from [2602:306:c5a2:a380:6179:50cb:5c30:2e73]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lot0S-003Emm-E4; Thu, 03 Jun 2021 19:27:59 +0000
Subject: Re: [PATCH 0/5] DMA fixes for PS3 device drivers
To: Michael Ellerman <mpe@ellerman.id.au>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <cover.1622577339.git.geoff@infradead.org>
 <875yyvh5iy.fsf@mpe.ellerman.id.au>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <850d4850-d45a-e22f-d4bb-18bd68a35031@infradead.org>
Date: Thu, 3 Jun 2021 12:27:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <875yyvh5iy.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 6/2/21 10:38 PM, Michael Ellerman wrote:
> Geoff Levand <geoff@infradead.org> writes:
>> Hi,
>>
>> This is a set of patches that fix various DMA related problems in the PS3
>> device drivers, and add better error checking and improved message logging.
>>
>> The gelic network driver had a number of problems and most of the changes are
>> in it's sources.
>>
>> Please consider.
> 
> Who are you thinking would merge this?
> 
> It's sort of splattered all over the place, but is mostly networking by
> lines changed.
> 
> Maybe patches 3-5 should go via networking and I take 1-2?

As suggested, I split the V1 series into two separate series, one for
powerpc, and one for network.  

I thought it made more sense for patch 3, 'powerpc/ps3: Add dma_mask
to ps3_dma_region' to go with the powerpc series, so put it into that
series.

>> Geoff Levand (5):
>>       powerpc/ps3: Add CONFIG_PS3_VERBOSE_RESULT option
>>       powerpc/ps3: Warn on PS3 device errors
>>       powerpc/ps3: Add dma_mask to ps3_dma_region
>>       net/ps3_gelic: Add gelic_descr structures
>>       net/ps3_gelic: Cleanups, improve logging
>>
>>  arch/powerpc/include/asm/ps3.h               |   4 +-
>>  arch/powerpc/platforms/ps3/Kconfig           |   9 +
>>  arch/powerpc/platforms/ps3/mm.c              |  12 +
>>  arch/powerpc/platforms/ps3/system-bus.c      |   9 +-
>>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 968 +++++++++++++++------------
>>  drivers/net/ethernet/toshiba/ps3_gelic_net.h |  24 +-
>>  drivers/ps3/ps3-vuart.c                      |   2 +-
>>  drivers/ps3/ps3av.c                          |  22 +-
>>  8 files changed, 598 insertions(+), 452 deletions(-)

-Geoff
