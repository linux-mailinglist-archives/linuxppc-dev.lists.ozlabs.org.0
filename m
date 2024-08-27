Return-Path: <linuxppc-dev+bounces-576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF689602C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:15:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtJj34yz2z2xGH;
	Tue, 27 Aug 2024 17:15:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724742919;
	cv=none; b=TEg5XE/AwC7NqgSsYBez9cInFI40yT47Trr8CVVziVCVbmEko5HKPYhNHA6NB5xHQrSUB3ZTdwevy/mVb7w1uOb69bPmMMuMoH5TpW85P2o/xa9UOJAX7QDFg2u9WCu4uz6ztLW3Jl3owX0vKWNQjiFlsWuzGEDs6/IiG7SVhZVdWQSBA6q5r/JLfRhYRs3Vuz1COH3Q8ihXXdrSpGrJ3Q+vc/YIkSZt+uo/REF6fyhXC2Z3jVzdzc+iVtZ3GVqTHnO9tg9vhOsiRGlbA6ayPy2rwUfaMIazEKYpz/uyxg0qj8fK5Sc+OpqLrFW9y8Zbrf9iyp1x3rS1e6KrjRIHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724742919; c=relaxed/relaxed;
	bh=vV422L4mnpf+hOkJJ5Z0peDj4WQZoCKVdxmLvkpZwrM=;
	h=DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=PITSLQqDoOk19KV6altc70QOejNUevyEJi9RL6oyXLpPZ9z11jR6R7r+M7a5JBm4tfpDfG71P5Wapl+u0CNj9Q75PR3HW2RAMylev0cQPmVvJ71jZ6x6zj/kcZC2Re1En3cg2WeumuF8x1smfxfNnlpdoOC940phZMKSIUQpwm6SlLhjB+nuVGe75SiomcI2UlzplOCSM3GxXZHiZsmFN7tHcYDu5QKN0uIHZJOmifgAjg5YaWRk6d5Qp6xMomgqA/4OPJEQ9xk8schO/T2FUdzpJTqi53qrdHwOBsoPYR13ySTek2ApCnxp4deI52BHsbpSGJag69xkE4/HySPaIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UDVxsNos; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UDVxsNos;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtJj34nnzz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:15:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724742919;
	bh=vV422L4mnpf+hOkJJ5Z0peDj4WQZoCKVdxmLvkpZwrM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UDVxsNosUCVKE+chsQQm8obg19tSKk/5jpFDuz95nAGSVLypK10durKnqxmMALoBP
	 6p+/LlJ0q6VP9BOMFMCMoQuHgID+6xQASVHT6bHHi13MGNa6Pmx7a0ztdGM7p4MB77
	 uasb1tNM6sh57wKtbvA/V7LM59fD5hRLS4ClkuXtoQJY3z48Ve6Vc6+GhWfuXJzqdi
	 bzhvJV6E1z8TB4E2RGHCX23v1ykNQIT8EpHSgOkF2w+oMX28gRN0BAhM3WTGHLglEm
	 aeCCRHTH3vL7YIdrpNMpoXXjP4Omx1Z0BGt2GFk6UEZvh7y/X3BKaw5Vcu3pcsjrxV
	 uBHpl2ZWBUSNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtJj30MJ6z4x6l;
	Tue, 27 Aug 2024 17:15:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
In-Reply-To: <beb30d280eaa5d857c38a0834b147dffd6b28aa9.1724157750.git.christophe.leroy@csgroup.eu>
References: <beb30d280eaa5d857c38a0834b147dffd6b28aa9.1724157750.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/64e: Define mmu_pte_psize static
Message-Id: <172474289342.32718.7307817190802798616.b4-ty@ellerman.id.au>
Date: Tue, 27 Aug 2024 17:14:53 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 20 Aug 2024 14:42:38 +0200, Christophe Leroy wrote:
> mmu_pte_psize is only used in the tlb_64e.c, define it static.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/64e: Define mmu_pte_psize static
      https://git.kernel.org/powerpc/c/d92b5cc29c792f1d3f0aaa3b29dddfe816c03e88

cheers

