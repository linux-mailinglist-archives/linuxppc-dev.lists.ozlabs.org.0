Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B95E9EAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 12:09:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbdm43XDYz3cDs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 20:09:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NmQHGprz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NmQHGprz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbdl43kjmz3bxp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 20:09:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE1EC60AF2;
	Mon, 26 Sep 2022 10:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF84DC433C1;
	Mon, 26 Sep 2022 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664186940;
	bh=gVXyyA5IAbFfV7vJ/QOv0MxnXnumH7DZXircDqF5Z70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmQHGprzaXKvnrjt+vF3CfG0A6mz05d101IvDpP0S0KlWA/HxV02WBqm7aJ/85fKO
	 776eQFUJPgC7L8koUGoInyWAn2pq3tjO2Wuq1tJaAE3lYQNW1w0fnHhtUvXbulDefb
	 HXgalDIaN+/D6rCOCQ2fpGYC9oBSD55ApXAp20ZQhWiCbmquWs8KVP+pwjZ874O/Ku
	 eUR+d8MNkrIlEGjwBKad02tb2rHugUHFzpxGvXz6sxZBRE/XGdFqlGxB22WM2YuCMy
	 SBtGpekUg9s3HWGnMKKU0pfGald1AlS+OoImzYUVydBIrgF2Vviyt86f8+cK+lbcJ8
	 KLcwsluiqzqCQ==
Received: by pali.im (Postfix)
	id 00CE28A3; Mon, 26 Sep 2022 12:08:56 +0200 (CEST)
Date: Mon, 26 Sep 2022 12:08:56 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 5/7] powerpc/85xx: p2020: Define just one machine
 description
Message-ID: <20220926100856.klwmxgujr7nv4qik@pali>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-6-pali@kernel.org>
 <638a2f98-5c23-85ba-c835-bce276312182@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <638a2f98-5c23-85ba-c835-bce276312182@csgroup.eu>
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 26 September 2022 10:02:47 Christophe Leroy wrote:
> > +static int __init p2020_probe(void)
> >   {
> > -	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
> > -		return 1;
> > -	return 0;
> > +	struct device_node *p2020_cpu;
> > +
> > +	/*
> > +	 * There is no common compatible string for all P2020 boards.
> > +	 * The only common thing is "PowerPC,P2020@0" cpu node.
> > +	 * So check for P2020 board via this cpu node.
> > +	 */
> > +	p2020_cpu = of_find_node_by_path("/cpus/PowerPC,P2020@0");
> > +	if (!p2020_cpu)
> > +		return 0;
> 
> This looks odd. I though all probe were using the compatible, and in 
> fact I have a series in preparation that drops all 
> of_machine_is_compatible() checks in probe functions and do it in the 
> caller instead, after adding a .compatible string in the machine 
> description.
> 
> Is there really no compatible that can be used for all p2020 ?

Really. There is none. I have looked into all available P2020 DTB files
(either externals passed by bootloader or kernel in-tree) and there is
no common compatible string. The only "common" thing is cpu node, how I
implemented it int this patch series.

And same issue is with boards with P101x and P102x DTB files.
