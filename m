Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 872151625D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 12:55:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MK6g5s0dzDqhH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MK4L62zQzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 22:53:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L27A9Sg3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48MK4K0wsLz9sRG;
 Tue, 18 Feb 2020 22:53:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582026801;
 bh=L6BJzj9vw4s6lyjMRtWdcr4bYuLX+l2N7WBaWS3PrSs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L27A9Sg33AuJloFv7jLtXn9oLaSa5FnYgBYQSu4Fl1GVoJgghoeJrvfkt7qnU/b1A
 4D+UerBpjUUGus0szeu7dAcXRaebwtqzbKrMhEKcBCPc1fQW2qQyZFtgoRAAChVzY4
 Ufdm9rGGjrrRgn8mXac/E9+CFd8+GK8f2Es1oqjbnrQUv8Oa+c57cmlCks7ZDDSWGO
 nPTZM5c0esile5FaTEvFb1LmGoUXe6lgwu6uFTiW1yWAiS3W0ZB3ivxdzM8PiPfLs3
 oUaY/bQKb6psIgdgTCQokwPZvcLaSUYgpInhvMGGc14Fb4UMF7VlEKj+oZ4hY5mGcm
 T/irj+PT672Bg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v3] powerpc/book3s64: Fix error handling in
 mm_iommu_do_alloc()
In-Reply-To: <52916c5e-7c4e-9b3e-8fbd-12dad8e00611@ozlabs.ru>
References: <20191223060351.26359-1-aik@ozlabs.ru>
 <87mubjl27j.fsf@mpe.ellerman.id.au>
 <56e98c75-ea44-6805-4bd3-c41620834e9e@ozlabs.ru>
 <52916c5e-7c4e-9b3e-8fbd-12dad8e00611@ozlabs.ru>
Date: Tue, 18 Feb 2020 22:53:20 +1100
Message-ID: <87zhdgdscv.fsf@mpe.ellerman.id.au>
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
Cc: Jan Kara <jack@suse.cz>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 24/12/2019 10:32, Alexey Kardashevskiy wrote:
...
>> 
>> I could rearrange the code even more but since there is no NVLink3
>> coming ever, I'd avoid changing it more than necessary. Thanks,
>
> Repost? Rework?

I'll just take v3.

cheers
