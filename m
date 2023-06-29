Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7BA742262
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 10:42:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S0OaURq2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsBlK1mXJz30h1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 18:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S0OaURq2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsBkS0k3yz309t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 18:41:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15624614C9;
	Thu, 29 Jun 2023 08:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274BCC433C8;
	Thu, 29 Jun 2023 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688028074;
	bh=vlYpLQJZtSXpTdxzzf+x19uXJCjU4SjJ4HABmL6bQ1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0OaURq2kmc5FgaPb1sSe+BgEZbOtTXQ5/3kv73tKzw9fyAoe2Ba0UjeKqU4d0cKA
	 +mIurc+uOOwsEjJpqZHOFSu+DDKSv9sNUvFmcGI/rWqDVsEPtasTGzwp1MAuttg3Q8
	 gAUbcpKPhXGP9aMN1rXSCZqqH0rlYIPghF8qt9qk=
Date: Thu, 29 Jun 2023 10:41:11 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Message-ID: <2023062958-graffiti-skyrocket-cfee@gregkh>
References: <20230628081511.186850-1-make_ruc2021@163.com>
 <AM0PR04MB62893E77D085030A6E2C37B28F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <f321287d-8156-b805-26fd-58acfa26e324@csgroup.eu>
 <AM0PR04MB628929736762F5DF46C55D708F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <7975b5bf-c8e0-237e-d6f4-98e641d39959@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7975b5bf-c8e0-237e-d6f4-98e641d39959@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ma Ke <make_ruc2021@163.com>, Leo Li <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 29, 2023 at 05:56:30AM +0000, Christophe Leroy wrote:
> 
> 
> Le 28/06/2023 à 23:10, Leo Li a écrit :
> > 
> > 
> >> -----Original Message-----
> >> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Sent: Wednesday, June 28, 2023 2:40 PM
> >> To: Leo Li <leoyang.li@nxp.com>; Ma Ke <make_ruc2021@163.com>
> >> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; linuxppc-
> >> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org
> >> Subject: Re: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for
> >> ch9 udc
> >>
> >>
> >>
> >> Le 28/06/2023 à 19:04, Leo Li a écrit :
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Ma Ke <make_ruc2021@163.com>
> >>>> Sent: Wednesday, June 28, 2023 3:15 AM
> >>>> To: Leo Li <leoyang.li@nxp.com>
> >>>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; linuxppc-
> >>>> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; Ma Ke
> >>>> <make_ruc2021@163.com>
> >>>> Subject: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for
> >>>> ch9 udc
> >>>>
> >>>> We should verify the bound of the array to assure that host may not
> >>>> manipulate the index to point past endpoint array.
> >>>>
> >>>> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> >>>> ---
> >>>>    drivers/usb/gadget/udc/fsl_qe_udc.c | 2 ++
> >>>>    1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c
> >>>> b/drivers/usb/gadget/udc/fsl_qe_udc.c
> >>>> index 3b1cc8fa30c8..f4e5cbd193b7 100644
> >>>> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> >>>> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> >>>> @@ -1959,6 +1959,8 @@ static void ch9getstatus(struct qe_udc *udc, u8
> >>>> request_type, u16 value,
> >>>>    	} else if ((request_type & USB_RECIP_MASK) ==
> >>>> USB_RECIP_ENDPOINT) {
> >>>>    		/* Get endpoint status */
> >>>>    		int pipe = index & USB_ENDPOINT_NUMBER_MASK;
> >>>> +		if (pipe >= USB_MAX_ENDPOINTS)
> >>>> +			goto stall;
> >>>
> >>> Thanks.  This seems to be the right thing to do.  But normally we don't mix
> >> declarations with code within a code block.  Could we re-arrange the code a
> >> little bit so declarations stay on top?
> >>
> >> But we are at the start of a code block aren't we ?
> > 
> > But they were at the beginning of a { } block which is compliant with the C89 standard.  I know gcc is more relaxed from this.  But it is probably still good to stick to the standard?
> 
> Sorry I misread the patch and failed to see that the declaration block 
> was continuing after the change.
> 
> So yes don't interleave code with declarations. Leave declaration at the 
> top of a block with a blank line between declarations and code.

This is fine as-is, no need to change anything.

greg k-h
