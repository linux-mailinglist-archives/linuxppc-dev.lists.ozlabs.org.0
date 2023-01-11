Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6276662C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 19:29:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsbnQ5yqDz3cfG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 05:29:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m85A0ufJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m85A0ufJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsbmR2xqwz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 05:28:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CCB5CB81BB0;
	Wed, 11 Jan 2023 18:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F09C433EF;
	Wed, 11 Jan 2023 18:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673461729;
	bh=SEVadaaZ7nAyP60UPoBxxqnNElyp72turpT4z9GLOgY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m85A0ufJDBXb1Inco40yvIDQ6syjaqa2qJNvkraRufme1NPFfmkrc2yP1g8IIwYoj
	 8rz2fJymIGpMd0JU0P/YxWFMV9OU8pyOREFqkvZLywcbXyqn+tHXHGyBa3eBqHTBtl
	 Jzzr1Oa+oEE7Q+90PDiH28vBpInizMmr0UFWsZ8sxjzWxrDj3CtFXGzm5k/9qShacS
	 9XAff7LW6mN77xfgxFRb07WIdrZgMH9I1T5vKVdFbsi2HJr3rSJmuRlB7SvzUts/pJ
	 vmfa1RylFItRdURplCvZY+ftCtggDjwIQQxC5LAdqJWNSEojhB1kHaQfr34nmBY1xb
	 MY5VhmTgsnCiw==
Date: Wed, 11 Jan 2023 10:28:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Esina Ekaterina <eesina@astralinux.ru>
Subject: Re: [PATCH v3]   net: wan: Add checks for NULL for utdm in
 undo_uhdlc_init and unmap_si_regs
Message-ID: <20230111102848.44863b9c@kernel.org>
In-Reply-To: <20230111090504.66434-1-eesina@astralinux.ru>
References: <20230110204418.79f43f45@kernel.org>
	<20230111090504.66434-1-eesina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Jan 2023 12:05:03 +0300 Esina Ekaterina wrote:
> Subject: [PATCH v3]   net: wan: Add checks for NULL for utdm in undo_uhdlc_init and unmap_si_regs

net: wan: prevent null-deref on error path for non-tdm case

>   If uhdlc_priv_tsa != 1 then utdm is not initialized.
>   And if ret != NULL then goto undo_uhdlc_init, where
>   utdm is dereferenced. Same if dev == NULL.
> 
>   Found by Linux Verification Center (linuxtesting.org) with SVACE.

I did the indentation to make the content stand out in the email, 
there should be no indentation in the actual msg, sorry.

> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -1243,9 +1243,11 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
>  free_dev:
>  	free_netdev(dev);
>  undo_uhdlc_init:
> -	iounmap(utdm->siram);
> +	if (utdm != NULL)

and here just:

	if (utdm)

comparing to NULL or zero is less idiomatic in kernel C.

> +		iounmap(utdm->siram);
>  unmap_si_regs:
> -	iounmap(utdm->si_regs);
> +	if (utdm != NULL)
> +		iounmap(utdm->si_regs);
