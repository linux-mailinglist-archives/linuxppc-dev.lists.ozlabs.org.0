Return-Path: <linuxppc-dev+bounces-10164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374DAFE8FF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jul 2025 14:33:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bccnl2qCpz30Pn;
	Wed,  9 Jul 2025 22:32:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752064379;
	cv=none; b=CoONh4jAF9ncAhuBXAYFAoDFv/ehgKiI4U77YPDJxOHwpF1APNLocd3cgFyEmjvhVH0xuFUkCinaRVMSb4UYAcnFyKli4a/GWwTdr1atodaD8rj+GlXkQBfU9DBlUYlr5p4aMY2IQ5Fve0rz9oV9Jg5vE8tOkOeBkNDs7zduQmxHU8U9R/SJGIq0tb/NsWu8EligvQ0hlUl7e3hOBAfcQ/abGmaeUIMZYY81kFeSVYwxXKwm0INinEWOFmtmrIHGd//KG+seCmQzqV9yLwqeq8wCNIBMh8LUa3w17tsOEFp0jaILA8GUWQJRFH5ccnq27lMaiM36rlpdGr6D1F2egA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752064379; c=relaxed/relaxed;
	bh=CzAk93GWfLjEN7IUai4BO+vczlN+4495jIU1AA/MGwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5amjx8EeMnitioUyMYkDOf5GPKGgbrx37ztZCw3nGF58gERvDzAoR+L+yaxfquC2ggBXMyc1ti+g/9vkIUxriyxfHZqk6OYSumbgaCvrNUqQkVgmGU9af/TYzelLfrv6LakHlayp+KcQZJqmvcUPDcZ5M1WHNgHePefH4Z54Lhku4qOa2l8cwWQ3RFTGrnbT5G37xQhzUv5T0JPDHORVh0+m0zZ6sTGHhPLp+809xy+QjnpMAJgA424WB2vB+iyWDwXD587gNm7wRyuOYyrRYXtSYv/YNf94UgHBhIv4+mZaMlyEPwRMKIUEPOQmD4vsBgt27GUA/trtXuJt8jCmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uRo2ZBkn; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uRo2ZBkn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bccnk51cCz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jul 2025 22:32:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4AFC445BF;
	Wed,  9 Jul 2025 12:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6DCC4CEF4;
	Wed,  9 Jul 2025 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752064375;
	bh=k7oBzbUjKiMJ0Q6br+E4o5sLW0SuJMJPvvMOS+TTwB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRo2ZBknsQXEL2PqhpkMfov9GoHoVLEFK+mGaAD/zykvYjQoxAFBbWBESB7gT+Afe
	 4vJlGVe6oDN8cTQoK6+nMdRNbw4zpfcOKW7McKj1ZhrlHnGWc2C9F6oajfHdpTq2fE
	 45o/gKZGbTQfWpXwiwblIFd90+riYbc8NM1+apOYwxTpwnirc7co5q6qt90GhXMZYA
	 H5F02DWDnqeMDqfrcEnJ/NNdQoQAtpioxpjGgqIKnvvryLVFAUVMrPkxnw+VDb/YtI
	 bsNGtm/53f4RO28Z+SbrhhMTL/jmEm02GocgFDe02LFwK1LUuOadkd4WvSydBZwQp2
	 XajktGCcknU9A==
Date: Wed, 9 Jul 2025 18:02:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <fpb23ogxfppvrkbr7mwk5jinq3m5bswzzepkt4hqpchycvttfl@o72xdeqm3eia>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
 <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
 <aGuqA92VDLK8eRY1@ryzen>
 <aGuvkkeVkezGJWXn@ryzen>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGuvkkeVkezGJWXn@ryzen>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jul 07, 2025 at 01:29:22PM GMT, Niklas Cassel wrote:
> + Mani's kernel.org email.
> 
> On Mon, Jul 07, 2025 at 01:05:39PM +0200, Niklas Cassel wrote:
> > Hello Mani,
> > 
> > On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> > > On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> > > 
> > > > I think pci_host_handle_link_down() should take a Root Port, not a
> > > > host bridge, and the controller driver should figure out which port
> > > > needs to be recovered, or the controller driver can have its own loop
> > > > to recover all of them if it can't figure out which one needs it.
> > > > 
> > > 
> > > This should also work. Feel free to drop the relevant commits for v6.16, I can
> > > resubmit them (including dw-rockchip after -rc1).
> > 
> > What is the current status of this?
> > 

Thanks for the nudge!

I couldn't respin the series as I lost access to the hardware I was testing on
due to job change. I'll figure out a way to test it and respin it asap.

> > I assume that there is not much time left before 6.17 cut-off.

Mid of -rc5 is not that bad ;) Let's see how long it takes.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

