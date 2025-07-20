Return-Path: <linuxppc-dev+bounces-10331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C48B0B4F1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jul 2025 12:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4blKv21ldgz30WS;
	Sun, 20 Jul 2025 20:45:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753008349;
	cv=none; b=JHqF2NEObWCjSME6hWjWJrRzpVtZLfZUX+85YvPc+bIOwMttJkaztv355Q2FjTp+USP5NT7Qe0DXpUi9ftzMMxFf2eCu55NrBsMTjHJbtj+hV7Sfnw8MADgOVhGw+sWQKI6sVnnPa8sppL9LKSOTSM3oEKKO4mpZ1I4qjRM9C9uKSYddYksHKbYd3R7JfatXeA1SRAvVC8/2knRHtCVFfnZoYyYMk38Gpbc8utqzWSm8HngBHu0E46waunmVLDhc6Vg6QG+MV7Lomy/TaatzSU4aP4KOU73I+DLi3KOZS8yMo8Kaw+7Arr01GxsLlGe7ZJSkJpXnjSqzLy6KuK6IQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753008349; c=relaxed/relaxed;
	bh=eUC0ZUJmk9/9Ww+pi9OYCw9XQPVrf4mf3V4VZE4N6YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ax7vbH/NHb+e4Cgu7uHe64HooOjCNX+xaAyyl7+iZJeUeVx/WOfa6vPVA8AW7RIEktJ9RgRnQnrtXP8s74oPAtthJSCIr/zSgdOlfz9u/D8pjAXC1aYbbtu5oANginrMsAXl0GXxlt/dEnN7xxHXiurUegQ7wN3mXf7bO3B6jm7SElrfAUfbXU2OLDnlTj3rePjbbW8jAQ8KFUFXDPyo3v5i3VfHvVcua2cX/uSi13++elnKanX6KaP9KGwSfmDc9b+qSz2r+Xx1SgOZ7C7lwZKc5RCMp8nGFp6Ark/+bSRbdBSLBhEOOQHHZ3EDkPV2Hp4R+4RhdoQQ/hkszwWYtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L8CW69PX; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L8CW69PX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blKv05DJ3z30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jul 2025 20:45:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6D67A51EAB;
	Sun, 20 Jul 2025 10:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8F8C4CEEB;
	Sun, 20 Jul 2025 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753008345;
	bh=DN719qsScgBppgUAmwXoJ0mGKLQSOt3EtG58RyMWE1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8CW69PXm+6ZCGN76xnQDueS0cH1fryY85s0KlBaStVCvi0NV98J/SMFGaxsWy7RK
	 v6QwQ/Ius9t3jjCKsTCzHdmWg4REwZ4YZKACkIUqbGirbdGtfNWfuOChLBMnrct0cE
	 rq6YiiE+jKZU0L22y/On5JgeqCUZFaH5N9HJi9T83UoTL1VGJWOxuOcESdX2wh2d8E
	 VYbRa6hrMXEF2rPOW1lT+d7F7/s7I3OsT/U/zUh9Z0E9L86hWC0LZBXdRfnVK5qZR2
	 uOojWuKW4IqJ6LAm/i2gZnVz3FkCyuBQRXMrk2v8MnFP2khwBge7Z02zziLy+rmyen
	 UhlyFRpZG3qdQ==
Date: Sun, 20 Jul 2025 11:45:40 +0100
From: Simon Horman <horms@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
	ricklind@linux.ibm.com, davemarq@linux.ibm.com, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
	edumazet@google.com, pabeni@redhat.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2] ibmveth: Add multi buffers rx replenishment
 hcall support
Message-ID: <20250720104540.GU2459@horms.kernel.org>
References: <20250719091356.57252-1-mmc@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250719091356.57252-1-mmc@linux.ibm.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jul 19, 2025 at 05:13:56AM -0400, Mingming Cao wrote:
> This patch enables batched RX buffer replenishment in ibmveth by
> using the new firmware-supported h_add_logical_lan_buffers() hcall
>  to submit up to 8 RX buffers in a single call, instead of repeatedly
> calling the single-buffer h_add_logical_lan_buffer() hcall.
> 
> During the probe, with the patch, the driver queries ILLAN attributes
> to detect IBMVETH_ILLAN_RX_MULTI_BUFF_SUPPORT bit. If the attribute is
> present, rx_buffers_per_hcall is set to 8, enabling batched replenishment.
> Otherwise, it defaults to 1, preserving the original upstream behavior
>  with no change in code flow for unsupported systems.
> 
> The core rx replenish logic remains the same. But when batching
> is enabled, the driver aggregates up to 8 fully prepared descriptors
> into a single h_add_logical_lan_buffers() hypercall. If any allocation
> or DMA mapping fails while preparing a batch, only the successfully
> prepared buffers are submitted, and the remaining are deferred for
> the next replenish cycle.
> 
> If at runtime the firmware stops accepting the batched hcall—e,g,
> after a Live Partition Migration (LPM) to a host that does not
> support h_add_logical_lan_buffers(), the hypercall returns H_FUNCTION.
> In that case, the driver transparently disables batching, resets
> rx_buffers_per_hcall to 1, and falls back to the single-buffer hcall
> in next future replenishments to take care of these and future buffers.
> 
> Test were done on systems with firmware that both supports and
> does not support the new h_add_logical_lan_buffers hcall.
> 
> On supported firmware, this reduces hypercall overhead significantly
> over multiple buffers. SAR measurements showed about a 15% improvement
> in packet processing rate under moderate RX load, with heavier traffic
> seeing gains more than 30%
> 
> Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
> Reviewed-by: Brian King <bjking1@linux.ibm.com>
> Reviewed-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Dave Marquardt <davemarq@linux.ibm.com>

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

...

