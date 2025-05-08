Return-Path: <linuxppc-dev+bounces-8453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2AAB0446
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 22:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtjgF67ldz2xs7;
	Fri,  9 May 2025 06:00:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746734457;
	cv=none; b=mqdU8n2yrbIZPrZN5Uaua8pr9P+gdeK9wRJh+a+5cFIG4yr3L+u5BhdejHY8BcbQr72FsdSahBoTVEab+YIcClEuMfGs2xiHNxAuc/Mal1RD1YURjaUPOIrlvl2GnPr1m+qNkIjnElr2y4rfJD+898pBJ8asiTe35V+npBpfizhNBsU6opSPW9UGmdVba+/6WTUug8o+wWzWo2yIIThK8hN39HOGQlm2ks3ZjNuLCSk+inzJMsG0uuZI2aGs8WSZsdF9DKTjnNqHNDR9TKtIJXIKDoie+MTtsn6mb+vuNpomBu/8cRgg3SbNr0H7GK0z7wEF1BGqqOQHhkxXxWQQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746734457; c=relaxed/relaxed;
	bh=WcTOiqY3Q13roGwqiggNCr+ilIh5tTP+DT9I/IZ7qsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4ZStIh4WgcTnQHDWFyMHJXJuov8xSenIvI10V5ANEoDYmBw9wjWPqCPlXYCauUwjQYKcTeHKzt2uqADehrJIjfAHHqAfERxJYhRkDJChk6mL0M4uhMuS+i/GL9b97I3KUEwi00PruyUN1BONLctQabr4zKUYBCbIN0P6DVIDaPzmXoyrM7XBWaYO3IUFYFv62XyQAjgNwDoia6H/C1VbqG5WjzsHY8lsSgsOsuxNo54laHYZWl9m8selnWjn+mV8VWSJ8qAsetk4fiFnm3W2rTtC/DidZPBru2j220gT7KjCcyM8RjiS789UXJP977NgFu/tkTamqhpRRb+ddbYZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l5aKvbvo; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l5aKvbvo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtjgF1nmcz2xqC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 06:00:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE5E344ED2;
	Thu,  8 May 2025 20:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93FDC4CEE7;
	Thu,  8 May 2025 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746734454;
	bh=RkjjpKYG+r35+gc9d0tTnqu/pElbyqXWwGFn4pZKP4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5aKvbvoZXXzxoR08YFj5FH5BYBKSoSB5/P6wBMQaV75fDXFA7Zlnr2BGbwqroxU4
	 se3IIq+1q6ZCT6StAGKBgYyklxpO9vZqxh+7+j96coWFcBuJiRpQ9TzxENPmgeY1zi
	 L9dEOl/IE3bWTKodiCXQa1hmweDbecZLdE24AOlPAUmynQ+YnJzDM5bAvErNcQyElo
	 T0SYuZRCPAbKY1HY+B5LZmStBmb78AFhB5pGDL9NFTzQ3IJFJLK50MAhTJLyh8NVEs
	 1GbawfQ4AVJazKSphVFxJEhd4yNWLMmnDj44J7nR+KePu3+Ku/P+2NsX1MRg1YwLy9
	 MQMYF0SOMcLEQ==
Date: Thu, 8 May 2025 23:00:49 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <aB0NcS-LPZ8q-h5B@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-2-sgarzare@redhat.com>
 <aBJETstuSlBUMwj1@kernel.org>
 <o72kb2x2jjxyzgyixeva42sk3lr2wwphnyhkcdbxxgfevoqp3n@ir6rwldztmt7>
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
In-Reply-To: <o72kb2x2jjxyzgyixeva42sk3lr2wwphnyhkcdbxxgfevoqp3n@ir6rwldztmt7>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 06, 2025 at 02:56:54PM +0200, Stefano Garzarella wrote:
> On Wed, Apr 30, 2025 at 06:39:58PM +0300, Jarkko Sakkinen wrote:
> > On Mon, Apr 14, 2025 at 04:56:50PM +0200, Stefano Garzarella wrote:
> > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > 
> > > In preparation for the next commit, add a new `buf_size` parameter to
> > > the `.send` callback in `tpm_class_ops` which contains the entire buffer
> > > size. In this patch it is pretty much ignored by all drivers, but it will
> > > be used in the next patch.
> > 
> > So instead "in preparation for the next commit" just plain say why it
> > will be needed. "next commit" is a fuzzy reference :-)
> > 
> > Same goes for "next patch". Neither can be used to query any possible
> > information. That sort of makes the whole paragraph useless, once it
> > is in the commit log.
> 
> Got it! What about somethig like this:
> 
>    Add a new `buf_size` parameter to the `.send` callback in
>    `tpm_class_ops`. This parameter will allow drivers to differentiate
>    between the actual command length to send and the total buffer
>    size. Currently `buf_now` is not used, but it will be used to
>    support devices with synchronous `.send` callback to send the
>    command and receive the response on the same buffer.

definitely to right direction

> 
> Thanks,
> Stefano

BR, Jarkko

