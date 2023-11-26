Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0907F9317
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 15:23:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Caor826w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdWDS2lPYz3cRl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 01:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Caor826w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdWCZ0hYdz3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 01:23:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4546C60E04;
	Sun, 26 Nov 2023 14:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE997C433C7;
	Sun, 26 Nov 2023 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008574;
	bh=BNgeLRJLCAh0rW9IkfVXu7f7qPYQfsEuFY1bt7Md1nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Caor826w4BjAII1NYrBsv+w1kcRWAfbeXDKWIM0TQZdZxpuxOrZfNF76V/fNHSPJo
	 nEwm4WzeoC/GPPzaj54RpB8+6+Qe55NjxQGQqt0+NRJrQjbe+gDcqdu5YnKdbppnHQ
	 st7neXsE3C09N20vbiYyNL9TBxFMzUSl4VNIdYUi6B05jt6T3tylxyFDpsfPrNs00P
	 rq1t0WCk/Qs5skZNaGOxIFja+PNOb7LhgGfNOXvSY3k19KySZ9IZlgkRGA50vkLVlx
	 ohsgdHR7P+9BS6bCSzttd36bYb7Z56YfLPz5sO/V7SMDa+hGlVBK06zs2A3fsgNgv1
	 RFc3J6bkEuoWg==
Date: Sun, 26 Nov 2023 15:22:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 03/10] i2c: pasemi: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <20231126142250.afzfqb5obrvkglsl@zenone.zhora.eu>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-4-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124101619.6470-4-hkallweit1@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Heiner,

On Fri, Nov 24, 2023 at 11:16:12AM +0100, Heiner Kallweit wrote:
> After removal of the legacy eeprom driver the only remaining I2C
> client device driver supporting I2C_CLASS_SPD is jc42. Because this
> driver also supports I2C_CLASS_HWMON, adapters don't have to
> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
> 
> Series was created supported by Coccinelle and its splitpatch.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
