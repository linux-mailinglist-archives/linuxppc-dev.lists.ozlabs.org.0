Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309B69E9D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 23:01:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLtXw7230z3cF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 09:01:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XkUQWZr2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XkUQWZr2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLtX23t5Sz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 09:00:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA630611E2;
	Tue, 21 Feb 2023 22:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1441C433D2;
	Tue, 21 Feb 2023 22:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677016847;
	bh=j0zrKP/GGHhSUG30UAklPpysturO9uPV/EYPEoyyxIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkUQWZr27z4VKyDNMHOLD76wIWkLB0BCviBL8P+7hqxuclTgA1oh6hpIsGcZ0kBCI
	 SiOZXpwlS14UpWi0AKTVCKx+4cPgQAI/feLuBQmJ3T6Cm8gNIzeGyjy+K90l8rgW98
	 SjEgKOO1XHXWBIwz+pgv4ZgMJ+ULaTkA9xrp918+BToTxwlNCXHglX/lVMSblX2Zmv
	 YNe37ypD+bSrf9PrxgMQeXbozHJrVqxNdN+EgtbyFrjPIlHl+mJRXkiM5HRbNctXGl
	 DOZMn92DKAQJ4VaXGJ6UcKiZ5Mud3I+aj9KbY6EJjoytnea+Gmhrqz0mm9C4VciAg9
	 xdSF7jWBBJgIg==
Received: by pali.im (Postfix)
	id 57CB6708; Tue, 21 Feb 2023 23:00:44 +0100 (CET)
Date: Tue, 21 Feb 2023 23:00:44 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
Message-ID: <20230221220044.6j5fhxnook7yl6v3@pali>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <20230221201311.sadp3sq7xr25hcuu@pali>
 <Y/U5Ova9P78omJ66@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/U5Ova9P78omJ66@windriver.com>
User-Agent: NeoMutt/20180716
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 21 February 2023 16:35:54 Paul Gortmaker wrote:
> [Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms] On 21/02/2023 (Tue 21:13) Pali Roh??r wrote:
> 
> > Hello! I would like to let you know that I have there patch series which
> > creates one generic machine descriptor for all P2 boards:
> > https://lore.kernel.org/linuxppc-dev/20230218111405.27688-1-pali@kernel.org/
> > 
> > Basically it allows any P2 board to boot one universal kernel binary
> > just with correct DTS file. After P2 is merged I was thinking about
> > looking at P1 boards too.
> > 
> > So I would suggest to do some "big" removal of older code after this is
> > merged, so I do not have to rebase again my patch series which is
> > basically cleanup and make maintenance easier.
> 
> Thanks for the update -- I don't want to make extra work for anyone.
> 
> If I drop the MPC8568/P1 removal for now, then would you agree that your work
> and the remaining changes - this ADS/CDS removal can continue in parallel?

I hope that Christophe review my patches soon.

I'm looking again at my and your changes and seems that there should not
be conflicts because my patches touches only mpc85xx_ds.c+mpc85xx_rdb.c
and your changes touches remaining mpc85xx_*.c board files.

About P1 I have not decided if I do some code work in this area.
I wanted to look at it (and if it is big maybe I just drop my idea).

So I think both your and my patch series could continue in parallel (in
case they are not going to be bigger).

> Thanks,
> Paul.
> --
> 
> > 
> > I understand that removing old machine descriptions with board code for
> > old boards which nobody use and nobody wants to maintain is logical
> > step.
> > 
> > But if something like generic machine descriptor for P1 happens too
> > (like I did for P2 in above patch series), it would mean that the only
> > board specific information would be stored in DTS files.
> > And does it make sense to remove just old DTS files? Are there any
> > maintenance with them? (Do not take it wrong, just I'm asking)
