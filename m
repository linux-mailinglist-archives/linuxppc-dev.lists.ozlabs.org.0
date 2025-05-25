Return-Path: <linuxppc-dev+bounces-8926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C1AC3359
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 May 2025 11:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b4tf13098z2xBV;
	Sun, 25 May 2025 19:20:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748164809;
	cv=none; b=WmBv7wNBg0pgi4MEBVvGabKzx4ZA8ul4JnKEw6U1LxZJLIKYdGBUZa5X6cipWxJY6DOfYruG+tfGUEBN/w1R7ElqkccwB/XlTuWFvCtBukkb6d5eWZzY9m2eL0lHKv05wan1b8BTsQN6Y1OI9U102rR7yT/tpCu/MmB3jXAeE8jjsA3TgLegxEdB8AVe0TPYUl0no5jwjuarUc4hWP3QdgjcgsEHtoJ8pL347zdd2T4uRi2JnODPx6bgRxO0TLhSl35PAwZBYAN1j/d12MKSU71S1OJIe6Q+lvu8jWiaaNCL4t7wId+kzS3d83oCIP/DINJfh/Y70vTvD1RupOPUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748164809; c=relaxed/relaxed;
	bh=Jue5ol/Wvwq12JYRCYOmA2vH05RAMgyLlXH8/BDabMg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EiVPSFDzfJuMZw7O/c9eK5RFEClBMGH/PD6CS5QoFoZ8MM9zVnJFAe3AFivm1XoPLuQEVeI4+M7HS+pJVXRQpxFAX78+V5WsSt4RDZ30/Av1hG5rYSstBFoZ/KEY8e9dfiAKRkR1VGxjuj5wytAZW/oyhqUlsUiS1qqSP2rCL9FPvvU+YkMMmP/OrSwOKr2Xrpjmw9SFTXi+nvgsk/AF3+8uj8+khdV15gkuBSx7ijYT6pmzx6tNqFjND9rM7VL5oRkjs3bT5sPbZsQ0cfIpxlGYRoJhAnbnDlK09B76yEeeFbfbq7mRWFW4dCpOHoDo1cP0G7vR0wH1nGMODo2GNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z0e70Sgl; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z0e70Sgl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b4tdz4vh7z2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 May 2025 19:20:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11CDB60007;
	Sun, 25 May 2025 09:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB1AC4CEEA;
	Sun, 25 May 2025 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748164804;
	bh=M6wNUdl+f/LJKZELy9CIlDDMGL8GGdionU7cG+oIVJQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z0e70SglbUOUYIUwGE9EvW/JcY14JljkXPcrXvRwOWMfKnOoZdPxFBk8x8EpFANPI
	 vG1u78itnbNpPvqJV9za7eDRQY7XiGc2O7R63dkSTog6u6Uhs9V0ueAnnn3xAPPb5N
	 NwgpL7Hr54FI18ZatUXKTjIXNlibhMXTDRag936yRj1pELwLfCoJnG4HDYHId6DCex
	 74tRpY6EUPIkdT8JgYWiDgVG4pfAUzLo+J6CpUlIxjEgTttC2+uVcp+CRt0A56C/PS
	 4Dw7oQHewMIHBpcl9NpvXPNpOrRqIeUMG/Kt/haznyrvxckVqMqHM4XmaH8IuvBeSY
	 SF/KBNh4I7ppw==
Date: Sun, 25 May 2025 10:19:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nuno Sa <nuno.sa@analog.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Subject: Re: [PATCH v4 1/6] iio: backend: fix out-of-bound write
Message-ID: <20250525101953.7930a410@jic23-huawei>
In-Reply-To: <20250511152707.294bc7b9@jic23-huawei>
References: <20250508130612.82270-1-markus.burri@mt.com>
	<20250508130612.82270-2-markus.burri@mt.com>
	<20250511152707.294bc7b9@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 11 May 2025 15:27:07 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu,  8 May 2025 15:06:07 +0200
> Markus Burri <markus.burri@mt.com> wrote:
> 
> > The buffer is set to 80 character. If a caller write more characters,
> > count is truncated to the max available space in "simple_write_to_buffer".
> > But afterwards a string terminator is written to the buffer at offset count
> > without boundary check. The zero termination is written OUT-OF-BOUND.
> > 
> > Add a check that the given buffer is smaller then the buffer to prevent.
> > 
> > Fixes: 035b4989211d ("iio: backend: make sure to NULL terminate stack buffer")
> > Signed-off-by: Markus Burri <markus.burri@mt.com>  
> I'm looking for a tag from Nuno on this one before applying.

Please make sure to pick up tags on earlier versions. Nuno had sent a RB for
this one which I've now added.

People don't tend to look again at patches that they've already tagged so Nuno
probably didn't see my ask for a tag above.

Anyhow, now applied but will have to wait for a rebase of my fixes-togreg tree
on rc1 once available.

Thanks,

Jonathan

> 
> J
> > ---
> >  drivers/iio/industrialio-backend.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> > index a43c8d1bb3d0..31fe793e345e 100644
> > --- a/drivers/iio/industrialio-backend.c
> > +++ b/drivers/iio/industrialio-backend.c
> > @@ -155,11 +155,14 @@ static ssize_t iio_backend_debugfs_write_reg(struct file *file,
> >  	ssize_t rc;
> >  	int ret;
> >  
> > +	if (count >= sizeof(buf))
> > +		return -ENOSPC;
> > +
> >  	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
> >  	if (rc < 0)
> >  		return rc;
> >  
> > -	buf[count] = '\0';
> > +	buf[rc] = '\0';
> >  
> >  	ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
> >    
> 
> 


