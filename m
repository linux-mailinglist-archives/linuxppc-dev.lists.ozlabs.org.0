Return-Path: <linuxppc-dev+bounces-7897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9450EA968FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 14:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhhD9370Sz3bxC;
	Tue, 22 Apr 2025 22:21:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745324473;
	cv=none; b=Tt8ty6FqoNC+57o4xz4bsIryA4Z+NgeifhDVvS6TwMj5fZimGwy0G6qvCySHqOz3jhqyRfr+ATNIKV0ugUuWP71HS8mBiKhKDoYZlo+uHLRja0/+tfbyAnMoBMgqd2gpSxqIZdGB/xe7cdFfZbE1dp6gNJN8gagRI4INL7XU9lwAeZa1evD3tKLcaC4yYtxKqHKdQluwkGQH/yolhwj1vIvGj+PS4+EsjMKfWbYQ3JZMqRW9lHVBcX5E1/eEllI9hqy3gN8XXYVdttm2eGMAyobWXc5WY42gkOzqin8nYhiy/j2mGIbTFdpQFaCULU/herX6jj8pxoEbluMUNEA4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745324473; c=relaxed/relaxed;
	bh=8oBJTeTeSqAmlBkzfX0+Q7koKokBH4XsCV1CY4LEDPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpdaJSPQB8ZgNuAk9aAnFb7hizcs3MsdMSmGjeyvAxoikw0lEUFkhH/bBAv21nIFoIKkiQsvbqxG/Lv/G5camFeWq0uh69Pi8YJFVCjTsCr6v4j3/Ap7zjoL13EDziKdgRXvkiQNoi2xngMoysyj7OB6aFf/d+bdr9w7H7TZzKBRpMDXyE20TQ34juqK80QSCjxvDy636xGHTN7ioqEas2K1HRWR0vXJFoiia4nZYWeIGi07fr693UKOAgIVJ5BLyx1MxGa5DLBI0P5Q9nLUuvURgDfWx9v8NK/IA7dzCPznLpy9/Ye98xYhdBMGJ1A7rqJ6St/Fh8NFbTpIg4pJ+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=COcXoeJJ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=COcXoeJJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhhD864Rcz305P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 22:21:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AFFA61362;
	Tue, 22 Apr 2025 12:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B337EC4CEE9;
	Tue, 22 Apr 2025 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324470;
	bh=UkGLXk7kMq5D1ZBzI1XZJ1G7b1qF8z+/maQ3l+yeu/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COcXoeJJwlaJO+onyn7iAriK90zBeTbSijaIEAcaeYnzFZbEE31UI7+VUphpLfT3J
	 ROy2uyjUlrELQQ3FiriTFMzUb/TN7K6mjOSLXLXl9AJvEFJa99bfaDugzMrhL1grIi
	 3sKvHFJ3SaJ066kON+MyH/UrSLMB4ajwM6ONHcBrCllovDiaCqVjRVt5L30XoeUFAL
	 W46wyimiiFX/afMmpubm10xUYDYQpBNUWLjjdthzPUowQjXrB5C9l+l+dd79JEnXf+
	 cOuHiEgZDNWplG57NPDNPQiR6jtuoVkdwdT3aeWk9xtFiC7EoVqJNZ3sETu++DWBb1
	 YXmnpDdvTIb9w==
Date: Tue, 22 Apr 2025 13:21:07 +0100
From: Simon Horman <horms@kernel.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 3/3] net: ibmveth: added KUnit tests for some
 buffer pool functions
Message-ID: <20250422122107.GD2843373@horms.kernel.org>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
 <20250416205751.66365-4-davemarq@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416205751.66365-4-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 03:57:51PM -0500, Dave Marquardt wrote:
> Added KUnit tests for ibmveth_remove_buffer_from_pool and
> ibmveth_rxq_get_buffer under new IBMVETH_KUNIT_TEST config option.
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>

Reviewed-by: Simon Horman <horms@kernel.org>


