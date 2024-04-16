Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C608A6D6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 16:09:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vJ+6c1nm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJmBm2VRHz3vbF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 00:09:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vJ+6c1nm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJm9z55sGz3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 00:09:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1972FCE1089;
	Tue, 16 Apr 2024 14:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB11C113CE;
	Tue, 16 Apr 2024 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713276545;
	bh=ztYAfRqyCAO4TihC8giRcF/Rn09DqX63ao2fuDHUQw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJ+6c1nmWW33jynK9xJcmJix7xN9eJXDw9YZXIlotYkpCMvOe4Hz06JcAopp+ESCC
	 TRcx5jYGQ5+GTwyxMZjuYQyLCcfn6Q6g90hYYEMaIwgZJ1EKJI18PSsT+CcdgCKBPP
	 ckNB0R3kvGQVz1kWzQN5c6OFcd6ozWBU5KmMBQ4sSwm26ClhcOo+PtxMzFXFB2KLby
	 EaOShXvLC4lv2fNdsGCtXQjuc/HIqF7g/iXvKneJgvstUzwtKIdwUfewhmBn/+dB5C
	 xFedLa5tmj4cZwHMvZP0TC2XNSHxymDJts1tHD/RVaN3mku46MZp/ptcPw2lDvzuoP
	 3/bEFoWIdQY4A==
Date: Tue, 16 Apr 2024 16:09:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Message-ID: <y5yjitgjf3v4tui6wrg5x4ltuaieugzgkk7aiggefqxfbezdev@t36fwhrzrxsz>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
 <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
 <ctfgvm32ga232lcxlanyu2cvcbybfgkwj5ovxzha6rq7yrf2sn@xduhb3qnssao>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ctfgvm32ga232lcxlanyu2cvcbybfgkwj5ovxzha6rq7yrf2sn@xduhb3qnssao>
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

On Tue, Apr 16, 2024 at 04:07:48PM +0200, Andi Shyti wrote:
> On Tue, Apr 16, 2024 at 03:59:13AM +0000, Chris Packham wrote:
> > On 16/04/24 08:54, Andi Shyti wrote:
> > >>   	/* Enable I2C interrupts for mpc5121 */
> > >> -	node_ctrl = of_find_compatible_node(NULL, NULL,
> > >> -					    "fsl,mpc5121-i2c-ctrl");
> > >> +	struct device_node *node_ctrl __free(device_node) =
> > > How have you tested this?
> > 
> > I'm not sure I know anyone that still has a mpc5121. Maybe someone on 
> > linuxppc-dev?
> 
> that's why I was asking, this would be the first driver in i2c
> using Rob's __free(device_node).

Jonathan's, of course :-)

Andi
