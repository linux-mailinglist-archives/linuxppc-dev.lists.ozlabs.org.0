Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9018A6D5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 16:08:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXd2NkHS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJm9H3KYSz3vZZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 00:08:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXd2NkHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJm8T0rHyz3cgg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 00:07:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93EA86122F;
	Tue, 16 Apr 2024 14:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CEEC32786;
	Tue, 16 Apr 2024 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713276468;
	bh=5yq4csUG5rBzT+UQdA0n4IvddA9o380zAC421EEiAGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXd2NkHSyi6ASW+ZFU0qZIh2V3/ntZeOJG3e2ogSwftrnp8cPKYdTanuUoAaK8tjw
	 W3TeSTJgmcQqACtP7B/ERTGkfCDZuZFfHldIUtb+gEfDAPx5gVsLjIuFXP4eF6uAJa
	 ClMAmc5TBPV11RXDUe3hKUrLCM+6XExKO1P+nzlq5TDh7yFD7sCIS+BIBi0Q6tm7r5
	 InseEYL6db28k6kD4vwa4tVz2sV4dqxnegin7KhAynB31gQfysBQFYtmEVoC+7mScc
	 bg5azoxGxLzEHDLG7nQ7c3SBGPrp9JgxbcTn/Eaaq0NB7Miqa0nG9cBZElv9Pp3ujK
	 d5F1NWeWN2Pug==
Date: Tue, 16 Apr 2024 16:07:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Message-ID: <ctfgvm32ga232lcxlanyu2cvcbybfgkwj5ovxzha6rq7yrf2sn@xduhb3qnssao>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
 <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
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
Cc: Abhinav Jain <jain.abhinav177@gmail.com>, "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Chris,

On Tue, Apr 16, 2024 at 03:59:13AM +0000, Chris Packham wrote:
> On 16/04/24 08:54, Andi Shyti wrote:
> >>   	/* Enable I2C interrupts for mpc5121 */
> >> -	node_ctrl = of_find_compatible_node(NULL, NULL,
> >> -					    "fsl,mpc5121-i2c-ctrl");
> >> +	struct device_node *node_ctrl __free(device_node) =
> > How have you tested this?
> 
> I'm not sure I know anyone that still has a mpc5121. Maybe someone on 
> linuxppc-dev?

that's why I was asking, this would be the first driver in i2c
using Rob's __free(device_node).

> I did try to take the patch for a spin on my T2081RDB but I'm having 
> some userland issues on it for some reason (unrelated to this change). 
> The kernel boot does discover a few peripherals hanging of the I2C 
> interface but I'm not in a position to offer up a Tested-by and I've run 
> out of time to debug why my board is unhappy.

Thanks for giving it a try.

Andi
