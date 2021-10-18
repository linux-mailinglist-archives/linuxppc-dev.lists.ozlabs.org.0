Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1943103D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 08:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXmmF07hSz3c6g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 17:14:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QG191IV/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QG191IV/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXmlW4F2Pz2yQL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 17:13:27 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6686860F56;
 Mon, 18 Oct 2021 06:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634537604;
 bh=roG/LrnebQ24A/ZxdxzZ3+XJwO8+/2dyKFc3em3jnq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QG191IV/yu4uR2WjkHTA+csB2wOkyVZFW68dx1Sq3WC/3ZekKZXRTVudqjejgGbXM
 jLbmh/VVnkgJrRXlL6OTQp6+v4k4QUIUWaUPpT3fLPlA6o/DqhpDbztPiFvpeMBbiJ
 /VVnBXXqmWOc1ySlg+wQk/W2S0RHUx6EJAoP0SIsKCQLA7JV9/fCpyD9SCql6gDRHU
 vHaNooyJn1ZH2fzCBXP3FIHdc2dbqLxxkaQKWWuxH6cXP3c/M/LbaAJc2FXgdm4xaV
 KZeOTPwlbcut4fbYs/A42NouxtWEZ7lSsT0713s+VcSeM67cnkGlYmaDlZ4UfiiMhp
 0Y1i4yKaL+Gqw==
Date: Mon, 18 Oct 2021 11:43:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH] dmaengine: bestcomm: fix system boot lockups
Message-ID: <YW0Qf7v10P22WJI/@matsya>
References: <20211014094012.21286-1-agust@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014094012.21286-1-agust@denx.de>
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
Cc: dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14-10-21, 11:40, Anatolij Gustschin wrote:
> memset() and memcpy() on an MMIO region like here results in a
> lockup at startup on mpc5200 platform (since this first happens
> during probing of the ATA and Ethernet drivers). Use memset_io()
> and memcpy_toio() instead.

Applied, thanks

-- 
~Vinod
