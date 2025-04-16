Return-Path: <linuxppc-dev+bounces-7677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A509EA8AE7B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 05:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zcn0g36NCz3blT;
	Wed, 16 Apr 2025 13:42:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744774963;
	cv=none; b=e9J06EwyKNbA8nP4TrUuvzWzUr7cupEsdKmxsrqq0xyPX+tC8KTvRgh8Gb4O8Mx3WFiDzges6/Q209Myr9eqCaTJsRm0aZrZrxLF95pjRb6oyzi1VTyiVaggyjrOW9GeRGpE4Qg0VSDbu8zwoQ0+oRPZzkeQ6tLfWPmHjfS9+4M97fBCj1jqoDLwwqE1h0itJz4oFVHbJDOvL6ghokDoR9ChuaErf+RYqPy3KoHO1J047uJX2mL92SkzwSn+PcDTSYDOjFIhe8vuqpEBPbwCuu9zO6Uen2vCB6LxnQun3D3wLxH+FUSu2lwYO+wZfSX6CIkkUmeSj/TP/a+ORPpLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744774963; c=relaxed/relaxed;
	bh=WvfhS4L9VPLgpQMlZsGnnnvMRtC4Bx+nHRlD/3eukhM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GPXWpPy/Q08a+WaUUdJK4CkzfoMKR5sUglqB3/yVzl69AY8jRPYs/RyFIgfmIfT1OJf1gjEoAEP9A4BKMU+zNup6Qn6xfiVrkTs1hS/NMDmlCM4kso0G3L4YnCyZNEJcUKWJGiOXwX8XuUdYV5opWPhntszxuOoxG0DnTegWmn35js8aSieeqeaMqfiIk98iRYcTgwlNbsrXsHjRRRtXLSwXy0RsY2uWLYmc8M8nceEskByGVmhdJaIuBoFyHsAVPVGwGRDaJFfnXl8y9GAlz3vom/YpCD75MEw06H+SKe0OBhLSK7Kx59FIAgbgml+RKQGvfJyqQjtwnj/MVO/JLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MBVvEAlY; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MBVvEAlY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zcn0f2B5tz3blC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 13:42:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFF664497D;
	Wed, 16 Apr 2025 03:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B85DC4CEEA;
	Wed, 16 Apr 2025 03:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744774959;
	bh=nBws4V36RnH91dCzptgVsPeT41zfd8Mcsqg5oOphTmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MBVvEAlYhsk3J9rwRldL2+ieUj/bNTseHBxu1+7L3Me3kDQ17RGcYprgU9YHSvXGL
	 5lToJG+oaBS6Nht1qX4i9QUIQUfCi1CWMF1S4cOol8GrXNBwycIR3hguSmXPgIY8/z
	 CsEVLaRu/In1lPNQzpki0+FvVwthusn3MmW5QB4F78Tl/c6kNVAn2Te+bmjyXt841Q
	 nhEnNYjeHkXgNeucnss2P43xdj7lRULMSPMH//6GX8eEFLDqBFsqieOBOK4kPZ3TYU
	 /JjHBJZlVd25Cu67lR2jdKefmJ1e2yvoXqeXp+Uw1ogZRrF0I6/ra3XMgZO4r1GdR6
	 /UvBsgYY/9nBQ==
Date: Tue, 15 Apr 2025 20:42:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250415204238.4e0634f8@kernel.org>
In-Reply-To: <20250411095752.3072696-5-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
	<20250411095752.3072696-5-wei.fang@nxp.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 11 Apr 2025 17:57:42 +0800 Wei Fang wrote:
>  	enetc4_pf_netdev_destroy(si);
>  	enetc4_pf_free(pf);
> +	destroy_workqueue(si->workqueue);

I think that you need to flush or cancel the work after unregistering
the netdev but before freeing it? The work may access netdev after its
freed.

