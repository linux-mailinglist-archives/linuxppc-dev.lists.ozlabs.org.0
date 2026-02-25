Return-Path: <linuxppc-dev+bounces-17205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JE+Jx5Pn2n+ZwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 20:35:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA819CC20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 20:35:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLlF55pd3z3fDm;
	Thu, 26 Feb 2026 06:35:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772048153;
	cv=none; b=EQ6fHFeDq0to2xoZwvO0HeJ00SsxV8eaIvQXjQzthAZ8WGZEy9rVAVyRJXUYiUYzHp37Y5tDhXOVzbu32QtQVP6dJnebSdKlpIqpzfx/GrQhdYAR0XxKt9hdB9HBKnPuwHEmVhKj9SFNARVfOkYH3Js4ntr/QV9gnbUteuuZmY85iuS0iZ48QtSuFw/WxJuk8i5GHFkQy2vZwl+PGRu3JVdS/1VV+7wUZZHrSuo51svOBRCw+V5d2jexv5IdMc6UhlA42zeBRTaybbM/ONYNVeIyvFOsNMr6bAHIXmfc9tP42SiEYdFZUvHjxajGdBV+dBz/lafgRMSyyoWj2Xfc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772048153; c=relaxed/relaxed;
	bh=tHZ5nRyU2kDhJOCF1SRfF9UCRr2RlD5jXmKCm3i5oHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWckx+Bd0Xu9fEy0zo1e6Slu6pkK8KVEkuGa8O457pqXHNsmmLu55T09JBdBp519GXHKksZExifGqn/GSDvqMlhP7YHAzBO8bIsQRSHFMuasGG7cQwE7U/AKNMOnfmCci5tGnE7XVkZKyB1LvF5wGiqRmxnqjWqbUN+An4I7sqYynxAm8jPqUEfCYNZx76RWG8pzkQKL1mUa0XJuK0odvM3hbMKmfXVE04OLtgL1XzjQ9smaKttjf3gUAR2tiPqrCKJmu9qlP6RWNNXA2h5aixzYAA6oPm/usUc6ydqptDloTqk3JjuL9Y2xHiyG1YzxgNcdHRdfP8D76KBdVAHRqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DuUm8457; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DuUm8457;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLlF444l9z3fDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 06:35:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D347460054;
	Wed, 25 Feb 2026 19:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BE2C116D0;
	Wed, 25 Feb 2026 19:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772048149;
	bh=LCcCGykLEqUy1dDs5e+ctne0AhEZqRPJSzXFbWQkanE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuUm8457BOfpyG2LF6Aawb2CnIyALtsyAAnPzQ6jyysWIOCEZuVVbN6gZRvd8ywmZ
	 SzdQ654EnIeoke7oBprsGnsOnJZG2OPZfs3zTBaWVXvDU7JbhiOuR/H/kqMdbuIAeq
	 EvDFGjc/OlaBxGldm7MJy1NU3GNJ2ct4NhEMmt9VH5eaJHj8gQHVKLDmMSDz9yZTFj
	 OCBw/WYQGBwPF34HcYWhKY02bWGUsbKSH02AO21SFnixMkxKz8ACdfyaBn6R5s3cOt
	 KE7dRgT9Ac9aQtvDKS4e47hYMQvUXtND9LHMlmF8pDKStiEQb3UvBkyolKAl9hUmIK
	 4Tqszr8GKHdmA==
Date: Wed, 25 Feb 2026 19:35:45 +0000
From: Simon Horman <horms@kernel.org>
To: Abhilekh Deka <abhindeka@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net/ibmveth: fix comment typos in imbveth.c
Message-ID: <aZ9PEaog5ZMr7LqW@horms.kernel.org>
References: <20260224153101.16935-1-abhindeka@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224153101.16935-1-abhindeka@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17205-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[horms@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abhindeka@gmail.com,m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:nnac123@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[horms.kernel.org:mid]
X-Rspamd-Queue-Id: BEEA819CC20
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:01:01PM +0530, Abhilekh Deka wrote:
> Correct spelling mistakes in comments:
> - Fix misspelling of gro_receive
> - Fix misspelling of Partition
> 
> Signed-off-by: Abhilekh Deka <abhindeka@gmail.com>

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>


