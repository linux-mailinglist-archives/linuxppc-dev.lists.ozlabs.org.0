Return-Path: <linuxppc-dev+bounces-3376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021249D039E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj91lWBz3blk;
	Sun, 17 Nov 2024 23:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846333;
	cv=none; b=Kv+r//tbBJogbdFdv4mbJUD4KizhN3o3gqRCxgYFvazBWoe2SaH2Yp/SY1vU8SAqnJ0Ay299AOCZsGlPZb+RPI6CsSWbEARyZvZailfMYgJuf6dyJW566K0AcN0362ZqCNZ62UWKX5z8QxUa/hXdUVZqMvzAhz9FO1Ap2pHBgHtEI1ttZWJnaSSl5AipK0Td3lttDE8r/opG9Rishsk0T/S5IlJC2JrMRZ2saguRqjbLFBrGn4MswXE3iWvqUn5gOK69eGG8MQflkGBgvXmFfHk3kcLNkGGsENLik2ExtBp99LHVWPbpGCgeDGYgN4hozMORIBpWxPrf4Vv4kqVCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846333; c=relaxed/relaxed;
	bh=hcx7Si3RCicXp8+LBuexcRjVWYdmVOGZhHAmvk7MWsE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=opXUc/uqibj4/tygXg7RubAezgeWMRWMfZO4WYqT1D4cc3i4T4fxIg53ohDBjsQlAzbQNlK5ZnYsVZ9A+5LZqQ+YnPqZZ8SeMzCIy4T1uV3D4glAC6gS1ST3dedKz5xIS/opKOXpAaXYeTPgFaT61es7OBeyYqRh/aXZSrgugmX7L33Z8GaHAkcX2P4NTTS86JxlLgcZkLNVzOg169440b4maKr1nHn/Ob5UoKnG39GQc7eoKgTUVlpEhvh21+GmonrTNPBF/8UlzYvoRW9/byecu27Sbvf4c8liMs9E4VCMoYzlh7gBp6ydoDoyemkTW2cLCOXVcBjNNDoZZ5sx/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J1HK1P+V; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J1HK1P+V;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj83t0pz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846329;
	bh=hcx7Si3RCicXp8+LBuexcRjVWYdmVOGZhHAmvk7MWsE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=J1HK1P+VSoHqpL0EJh72wsa677a12MfBJFBurd4Q3M7O1PYTtGYlp8kulZcNwgPs3
	 5W22HLM2dFas5ArcB6IE0VTNMJCORwh8BVVVqP4K/Fd7xhmwB3IVwzYI+0omOrDPzc
	 ylE1Ok2SpY3GNAuWKXFHnJEMqx0LPFp0824PXJ3QCjunPEelHv7nZO2DZliigOSwFM
	 bV/hdS77z0pwTLuiAlNMLdOHLqeh7TzsWubc07VkzSPR4b0VjZM9ZYE/P7Mh9WNEzT
	 5w1R7LuhOm3CPmSm/6tYWW3C11v3E3YZmi9xyabC0ZKT7COcuIY7qrJmneWSMxUwrR
	 L5P3RCZoJJDcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj53G0cz4xfN;
	Sun, 17 Nov 2024 23:25:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20241112114805.453894-1-mpe@ellerman.id.au>
References: <20241112114805.453894-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/cell: Remove dead extern declaration for spu_priv1_beat_ops
Message-Id: <173184539748.890800.4302309984042672758.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 12 Nov 2024 22:48:05 +1100, Michael Ellerman wrote:
> spu_priv1_beat_ops were removed in commit bf4981a00636 ("powerpc: Remove
> the celleb support"), remove the unneeded extern.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/cell: Remove dead extern declaration for spu_priv1_beat_ops
      https://git.kernel.org/powerpc/c/be6b0eb5c46d85e360c0ff8bdde1aaa199a8fb6d

cheers

