Return-Path: <linuxppc-dev+bounces-1368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78839978D13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 05:17:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5GYs1PHgz2yGF;
	Sat, 14 Sep 2024 13:17:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726283825;
	cv=none; b=mVEycAUpUFCutuLvm95QA+2YZFPb9FJ49AWZN1xFi8X+gU4e7t4zWhUQXyi5Czy+/zPePShtAtrTNU4MT57uNNWjGdwAMLVDqtqW0aqIXnFktW20Gf6+hRxi4UUbcSNZqpis4ciYnbI4JKJLYhYGaZbARrLkXT5EzYn38UKHLalwGYuPsZdG+rt/p/gV35OCGFCxmWexS5KxStGFZWdbSEr9ntpi2sTGRjNYCr8/SCMbgx4p0cO/v/s4xAExtp6DfA0So7UCpXLUDL7cb5mxmxDasZo45j4FY+YCUB1BQ8k7hzemHBm5XrNySOq2X7gNWztdDUKVpEwXzg8JN8+Vhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726283825; c=relaxed/relaxed;
	bh=ZYGa1ajHkTRgtYyyOxpfvH+ooDRvIDXj/TsxrUr9334=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D90FJEmXRMcG6egKCxj/ExkebvC2ZiIbKtXLlmisyQo3dSglux5xbX0ujB5oXAocgdwbg3utVCrgtn5AjKCGJeO3ZHIsda28yLRzlil7oCqRzH8lWIl8w9N7n5byOJ/eRma2xFE5pjxggsyepBBfWx9M3vk/Q/M0GPYrNLoa0IoK/ua9OnuPCKft0QDQdOauA9TTv1XBm0TdXDgfBbuFldMKGwlVJ1B37y9VMhW25Rwmg6MWd+2fQ/W+hYdsH5/YsTD1tEL/GAez3rZ8Hg6w3HrPyhdlRGSIYz+WjdqVq0YtMeIEurunKLkDYjZakxGmHMJYmqiLA0Ax/IsIingYcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CeE8KWbU; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CeE8KWbU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5GYr6vTyz2y83
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 13:17:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A7C55C5C9A;
	Sat, 14 Sep 2024 03:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36223C4CEC0;
	Sat, 14 Sep 2024 03:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726283821;
	bh=Gffs7E+w0YaUF775WZiM4kfYw2JL46REVe0T5O7hsDw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CeE8KWbUsErIEv9POLRn5OrYtnAA+yxGiaCgN0iQzyK6851hca/o2FAYYIt3qrJT+
	 fraclGxus91DJWNZrzfM1C44nQ50cm/WLZGDFtybdnHwFJ5S9QDVsmLWMt2QW+Wbgd
	 7bI4GFRjuGjNky7Q1YWNz4S206boxM9XCQSZ0jftFL2AVb3qy76yrerxWbOiLOeRBL
	 bld457NZdfQZpNcZsUbpbXteOgip7OWGvXiT/2LiDQfguoLZ5KyDK638FZbozrllKE
	 92GLCrDAh00e83keI0Hz8M8Ryh7vIo4LFdf1uKqGve6TZMUOPkDj/7ghgTajT65xDs
	 7sswukRlTdNew==
Date: Fri, 13 Sep 2024 20:17:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew
 Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <20240913201700.34249129@kernel.org>
In-Reply-To: <87jzffq9ge.fsf@mail.lhotse>
References: <20240913213351.3537411-1-almasrymina@google.com>
	<87jzffq9ge.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Sep 2024 12:02:09 +1000 Michael Ellerman wrote:
> Can you try the patch below, it fixes the build error for me.

Excellent, fixes it for me too!
-- 
pw-bot: nap

