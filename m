Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D31872625
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 19:02:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=acGE0/E9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq3Ls1ds7z3vhs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 05:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=acGE0/E9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq3L64R5xz3vg8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 05:02:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 528E761495;
	Tue,  5 Mar 2024 18:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C77C433C7;
	Tue,  5 Mar 2024 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709661722;
	bh=DuC3d/cwIEAQKuPyMuJn/MWa7uNznQPc1WusaND35/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acGE0/E9tmRibmy22wtC6gaejMjj/jz9L7AVbUxQnolYCbeX0EoCvWIoJHwojStI+
	 XyBvAiIDTDnEra0DvqMXSY6YJXhsU0/Jc64r1V/QPAx2NzYjWwKgof2lZRHjxmjsyY
	 72xTlVRxBnyY2/iSHxYtVHIkUc8mFRb7s8dW/SDZi84mKv+t8XeMK8UrtpSC8m2MB+
	 F34swpWg8ONbvYKYzJKTJptOe8qN85A0FomY8hw6Im4EPnI/7dFD9/CURkzLv37YTt
	 uJjrRRWSNkK851ykbVVkPZxme70O3Vk+QTrKEglGcNEfj9OszBfjnJ5sjmkQSbIm/+
	 edkQy9QbRIxjA==
Date: Tue, 5 Mar 2024 12:02:00 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] soc: fsl: qbman: Remove RESERVEDMEM_OF_DECLARE usage
Message-ID: <170966167830.3808046.18290518120456288771.robh@kernel.org>
References: <20240201192931.1324130-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201192931.1324130-1-robh@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 01 Feb 2024 13:29:30 -0600, Rob Herring wrote:
> There is no reason to use RESERVEDMEM_OF_DECLARE() as the initialization
> hook just saves off the base address and size. Use of
> RESERVEDMEM_OF_DECLARE() is reserved for non-driver code and
> initialization which must be done early. For qbman, retrieving the
> address and size can be done in probe just as easily.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/soc/fsl/qbman/bman_ccsr.c | 27 +++---------
>  drivers/soc/fsl/qbman/dpaa_sys.c  | 12 +++--
>  drivers/soc/fsl/qbman/dpaa_sys.h  |  4 +-
>  drivers/soc/fsl/qbman/qman_ccsr.c | 73 ++++++++++---------------------
>  4 files changed, 38 insertions(+), 78 deletions(-)
> 

No one is going to pick this up? I applied to the DT tree.

Rob
