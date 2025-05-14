Return-Path: <linuxppc-dev+bounces-8577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC67AB6EBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 17:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyGmv4WJtz2yrr;
	Thu, 15 May 2025 01:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747234991;
	cv=none; b=aYO8ASzqry7ILxoA01NTOevav3qAwQwP+j7U/nD2jg3GztDKvqBvaZZB5DcFZTNDVJ03R1QA8bfPa13/BgFsQBT1Sfd8OZAR5iesBaHpCcZ0a0DtHKrkMP8WX/pm5T09Hg022JZ2NWRqgg8T/xpzK9htjurS7aR3JaRWbsOvjrVS/0pUAEmjDcewRk0Ko1nfmChBlS3VWtq1s8Z//snzPYG4dVYGOlIeusETz8CdrD/ftI9FDC6iXztUsz9SBVaXnhgiHcVR0UnLhUSBVRg0K+QW76jHCSoU/dfP6C1Pmz7m5iGOBHn6nET3/Pc4k2yBA5kboe1t1UUeCU7vU7KuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747234991; c=relaxed/relaxed;
	bh=VHlVUSZPZVnIa/sqVtyX3le4pmD5+ZVIgg4C1zqIUsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cJ/o+gmhylTZLx/Z9pm2GlrWNIKp4p8TUKyvNej0+OjyOMCQPDCpuFNCn/yAVpi5SprfFrusdrVX3iCb7y42Ykg0yctlnjv/Cpg+WLwd0uf4N7935bv8bBSG5ANPl8LAvByJxIYQJBrsh8Np9MTmjBa1EmVDA1QQUpz3XzJYIds5SfRgZH642CMiVD8FLUAMm00SZ9V9A363Xyjxx6L/5zmtbLjyBvHMwdx1sYi6oaA+9V1B58E7LyNaWopD7At5izWHJPzhaXc/wRDDXveG/33v8fGlQGIYqKTUTPNNfGgy1YwtLXQe/sZVCE0rV0eY8JwXX++dTb4+VuxOwmPNdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kJFdA2tm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kJFdA2tm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyGmt6L5sz2ydN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 01:03:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 614D34A816;
	Wed, 14 May 2025 15:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59A0C4AF09;
	Wed, 14 May 2025 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234988;
	bh=THM7iq9nTJk9Q8gCDTAEMYHnO9fGV9dakzHktzYuPNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kJFdA2tmwz+CrNON+B4SKIXvoPpy0j2SdGnod5EGPK+il+bqaGo6Aggz2mY6GN+mA
	 SuWQzCyqDZ8EfCfJwhGgu/nhoCmj7/+pjSVFvXOSD62x6U0HNXabn879lLqX1KEBQa
	 Sp7TGpZjlfmxaI9L5yUhsNmPtSlro7MowYTzMxiF/wHBHXZKYK859QPnnHNpy/2lHq
	 EG8yJotWKKmxk/x5cxnvZA8Y46TwPbHSJiU8MP8A95YC1LqSwHY4VO9r0A1Jg2sJIT
	 z8Sx22FLsr4mrCNBLoEYxFYT8XWsVCQ0nzr2xk0T9aUynYk+3e0TNG5ntRmaETV7LA
	 vT+ErACEESmYw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Ben Collins <bcollins@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <2025050513-complex-crane-2babb6@boujee-and-buff>
References: <2025050513-complex-crane-2babb6@boujee-and-buff>
Subject: Re: [PATCH v2] fsldma: Set correct dma_mask based on hw capability
Message-Id: <174723498654.115803.14478173273687526068.b4-ty@kernel.org>
Date: Wed, 14 May 2025 16:03:06 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 05 May 2025 13:53:07 -0400, Ben Collins wrote:
> The driver currently hardcodes DMA_BIT_MASK to 36-bits, which is only
> correct on eloplus:
> 
> elo3		supports 40-bits
> eloplus		supports 36-bits
> elo		supports 32-bits
> 
> [...]

Applied, thanks!

[1/1] fsldma: Set correct dma_mask based on hw capability
      commit: 00ff4d68a9ae4c9315c166f1fafa47f4c0a65f6f

Best regards,
-- 
~Vinod



