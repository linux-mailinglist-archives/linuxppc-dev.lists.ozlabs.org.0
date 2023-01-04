Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C138565CD55
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 07:47:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn0Xk47zCz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 17:47:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hIpEuo0+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=leon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hIpEuo0+;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn0Wp1lbNz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 17:47:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 26C2FB810A3;
	Wed,  4 Jan 2023 06:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEB0C433D2;
	Wed,  4 Jan 2023 06:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672814816;
	bh=Ce2cVNmnHW33oC2dbbxBr7ty/7AVWh3XFhy+5mBUDp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIpEuo0+/ygOTG8Dz2hbZZkPNeitPdV7IPTHKzKtcImcXcXEeEXcrc4uInwuSp4aS
	 CX5f7suvudBp8+mEqLj04JdokYLnhTEOFF4kzcUS/G1MDNHC55858EeEx4ormv0rZ4
	 ZkvFHCjfUpfRfY4XbLycUyBfuZTjkkoFCPTc72lRwHXjOcvhv4Wknd0bCCDQwHdHtV
	 VquhUvSY10TqwxPvbJQ6rBpeLyuDmWDTJzanwgaXP7BCx/otUp0yrElxnYNPeqpqJu
	 61iuuNF4jWICeh3NQg6p7y/F410/YNGx7CHnEHb4qxWIn+voOuEE1LGbSO3P6zL3Gt
	 ZVV3bwXa963lA==
Date: Wed, 4 Jan 2023 08:46:52 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Subject: Re: [PATCH] PCI/AER: Rate limit the reporting of the correctable
 errors
Message-ID: <Y7Ug3F6AIhaAiqCD@unreal>
References: <20230103191418.GA1011392@bhelgaas>
 <e6e53119-a249-a03f-c9eb-3caafbe5d983@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6e53119-a249-a03f-c9eb-3caafbe5d983@linux.intel.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "Neftin, Sasha" <sasha.neftin@intel.com>, linux-pci@vger.kernel.org, Frederick Zhang <frederick888@tsundere.moe>, rajat.khandelwal@intel.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 04, 2023 at 10:27:33AM +0530, Rajat Khandelwal wrote:
> Hi Bjorn,
> 
> Thanks for the acknowledgement.
> 
> On 1/4/2023 12:44 AM, Bjorn Helgaas wrote:
> > [+cc Paul, Sasha, Leon, Frederick]
> > 
> > (Please cc folks who have commented on previous versions of your
> > patch.)
> > 
> > On Tue, Jan 03, 2023 at 10:25:48PM +0530, Rajat Khandelwal wrote:
> > > There are many instances where correctable errors tend to inundate
> > > the message buffer. We observe such instances during thunderbolt PCIe
> > > tunneling.

<...>

> > > [54982.838808] igc 0000:2b:00.0:   device [8086:5502] error status/mask=00001000/00002000
> > > [54982.838817] igc 0000:2b:00.0:    [12] Timeout
> > Please remove the timestamps; they don't contribute to understanding
> > the problem.
> 
> --> Sure.

Please don't add "-->" or any marker to replies. It breaks mail color
scheme.

> 
> > 
> > > This gets repeated continuously, thus inundating the buffer.
> > Did you verify that we actually clear the Correctable Error Status
> > register?
> 
> --> This patch targets only rate limiting the correctable errors since they are
> non-fatal, and they kind of inundate the CPU logs, particularly during thunderbolt
> connections. It doesn't have an impact anywhere else.
> As per your suggestion in the igc patch, I found rate limiting as a doable option
> currently. Have eradicated any kind of masking the bits.

You didn't answer on the asked question. "Did you verify that we actually clear
the Correctable Error Status register?".

Thanks
