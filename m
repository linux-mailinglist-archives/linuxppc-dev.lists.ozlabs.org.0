Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D464BB708
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 11:39:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Sr60fldz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 21:39:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GNc8YOML;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=GNc8YOML; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0SqP0j0rz3cBq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 21:39:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D554061DF1;
 Fri, 18 Feb 2022 10:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDA5C340E9;
 Fri, 18 Feb 2022 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645180748;
 bh=AXk2+EOvPxt+EsgH98RvaHo3VvfiaQ9uGDMWbs4K9rQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GNc8YOMLI/uSWjvk4TA2BR3xx9WRi+E4O3hS6rBETOM2hGs7hForvBG/OeuEwup+M
 kmLRrWUvVQeT2+8NAwmfbGItCbcmL6jzW/91YcMX8RDz6Ou4kTfit5DkEkcmbfZQa8
 Iednuy6D20ByrMZc04Rhw7qV+SYXe/I9g22H3fzc=
Date: Fri, 18 Feb 2022 11:39:04 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Message-ID: <Yg93SMnfNlDK7MIM@kroah.com>
References: <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
 <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
 <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
 <b6aa24cc-6ddc-7dda-b098-0033e4f6aa03@leemhuis.info>
 <PH0PR10MB4615990F8589556B65005387F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR10MB4615990F8589556B65005387F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Thorsten Leemhuis <regressions@leemhuis.info>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 10:21:12AM +0000, Joakim Tjernlund wrote:
> I think you could apply them as is, only criticism was the commit msgs.

That is always a good reason to reject a change.  Please resubmit them
with the commit message cleaned up and I will be glad to review it
again.

thanks,

greg k-h
