Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7054AB66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 10:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMgtl17VWz3cMr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 18:03:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CIFjPhFu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CIFjPhFu;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMgt622pBz3059
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 18:03:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69E71614A3;
	Tue, 14 Jun 2022 08:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7729EC3411B;
	Tue, 14 Jun 2022 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655193801;
	bh=xNEEaInH/LKZoWtvuDlNJaZfqiWphsqqnVIIBffqYSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIFjPhFu8bPc91HKOrRVeGWc64yPgQgu7Nx798L2QcZin1rlE/8KfDHbDsw0J3lH+
	 0ATgSyb5u3AMCxOU4RiaOqTLFgl7m5b7hotaQlJ4f7v/lyeVKhUvFyHgPGT3UYsRrZ
	 EmmHQbOvTL/oHlyjWzm/BWTw/IO/GrC//gTtJYDQ=
Date: Tue, 14 Jun 2022 10:03:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wenhu Wang <wenhu.wang@hotmail.com>
Subject: Re: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Message-ID: <YqhAxj0dLoUkBZfg@kroah.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
 <c76598b5-2d60-ea22-d590-4cc6998a8830@csgroup.eu>
 <SG2PR01MB29516D3BB7525390ADD5B0829FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR01MB29516D3BB7525390ADD5B0829FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 07:53:46AM +0000, Wenhu Wang wrote:
> >> >> +
> >> >> +struct mpc85xx_l2ctlr {
> >> >> +     u32     ctl;            /* 0x000 - L2 control */
> >> >
> >> >What is the endian of these u32 values?  You map them directly to
> >> >memory, so they must be specified some way, right?  Please make it
> >> >obvious what they are.
> >> >
> >>
> >> Surely, the values should be u32 here, modified in v2
> >> The controller info could be found in
> >> "QorIQ¢â P2020 Integrated Processor Reference Manual"
> >> "Chapter 6 L2 Look-Aside Cache/SRAM"
> >> See: http://m4udit.dinauz.org/P2020RM_rev0.pdf
> >
> >That's not the answer to my question :)
> >
> >These are big-endian, right?  Please mark them as such and access them
> >properly with the correct functions.
> 
> Yes, they are big-edian.
> Does it work to add comments(about order and access functions) for the structure ahead of it£¿
> And appending like "_be", "_access_be" or "_big_endian"? (struct mpc85xx_l2ctlr_be {¡¦¡¦};

No, not comments, these should be of the type __be32, right?

thanks,

greg k-h
