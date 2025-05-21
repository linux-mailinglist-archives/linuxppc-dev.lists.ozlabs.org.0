Return-Path: <linuxppc-dev+bounces-8842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9169ABFB70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 18:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2cdn1bpnz3c2C;
	Thu, 22 May 2025 02:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747845725;
	cv=none; b=KJFVWTw8vKpbS3A/VQcpvTCTBfcGs82fX+Q/eWOvH7vtRAbA/K4aRHOF9kwpLifm/oQZ2eNb54FTLtfJjVpsb/oEK/pzZgaaJyKKeShitYa2KqZa3484hOAbugDmBJLAOntDkhKOlJKC64dBKauViA5M+kqpO3lN9uckTq3XDrlnsE5+nDFNh9P11vxXOCczDT4MyD8IeDUv9WLt3yg695R7ckA5tu/J/KN18a/7boq5sMIY+PUsytbtoflYl4aiQRiIjxPfm83MzsUguIUoSTAyuKlFRYgMwp8QmRrIWCENTE7EKZvlMvnVyc4zS5p2om83jYaZNJ0rouiYiTOjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747845725; c=relaxed/relaxed;
	bh=nqV3lRwJwEi5A0n42n94rqiFtoc8WGmVMSwJFR2qgmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rcrc3etDD62u9dUGHTGiTM+v+kgW02bLskblv92AkEY6tmIahKUlK+3ZOLIm/yQRCeEBV4hozqLZuBqS9IKx7ZkuTqFNLCPX6Cm1i7upXsH18Q8+Xqp59BM+6VD7nAf/m2F3YznQ7YpFUfvqQEhixzRmyLEaqB/EzDf9KJ6aa/627HfBkwrfwmBEB7WQTx5s9WH8I+X/onn8zOSPhr6WwdNaySaW+U4L2EXCdssMqFmsB9IeYEneBuPapuzzucqoAHrI9jhgmQ6fd+oq/NjHsHABUTMN8174d1AjeWEmlgrDPWLoYiqm1uRA/t+2WNecbHmDczMi/bszbce0nACHgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W5UxbfYH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W5UxbfYH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2cdm20Btz3c20
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 02:42:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDDBB4496E;
	Wed, 21 May 2025 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C091C4CEE4;
	Wed, 21 May 2025 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747845721;
	bh=fNlJI98IRmJku5DUDB7KU0NTAR5l/AoBK5dNhkMKy3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5UxbfYHZeoYDuN5ngewjlWzVx7fvv+BRtndc80ovjhiG8g1I0PHO5ybTj6Lu6x7z
	 g36JHRBWYtNWkCBo4PMkcy0oVlBeyMphixat7L/44FREl/Q339WNexmioK64JLpHrr
	 ovP+rgZvQ9g6LwFcH/HDCu9vpS3tLCd/GJAcQWnttlw4kKAxt0ie+p9RLIYWYKjjhH
	 93rSYCm1Z1xfN5fXmFJkD1WSt0TC4uayOcstPRMB2i+aKB06sSd7LdyWxS+W5yFd8X
	 bdNdzs+Y/THmEK3YDLZn9UkbD1V8YTXfyH5h5kHwmICgedMJsRAjUNUWn2aXZj8rj/
	 RKYVBmYwmsZHw==
Date: Wed, 21 May 2025 19:41:57 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aC4CVUXpThAyKQdf@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
 <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org>
 <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC2nBCxkvWWz5y5E@kernel.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > I tried, but the last patch (this one) is based on the series merged
> > on the tip tree, where I introduced tpm_svsm.
> > I can see that series in linux-next merged with commit
> > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > but I can't see it in your next tree [1].
> > 
> > How do we proceed in such cases?
> > 
> > Just to be sure, did I use the right tree?
> 
> Thanks for the remark. Lemme check tonight. Hold on doing
> anything ;-) We'll get there...

I just rebased my branches on top of latest from Linus. That is what I
need base PR also on, and:

$ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07

I'd use git cherry-pick on a range to take them from linux-next to a
mainline tip...

BR, Jarkko

