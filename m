Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7E6445C6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 15:35:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRNHT5LYWz3bfZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 01:35:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=EeUMisWf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::81e; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=EeUMisWf;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2081e.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::81e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRNGT15tWz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 01:34:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5Xr7yttFZ6IKWmoDWIHQwulWLcEktykBS6I8Qpbl8ohoPnMJ1I+DYrOm/0vYtkMGoaDqnVFHVcvKSLKTtfg8hZDZVAXu+asmPQETvsPgsaVY7SInYgKNiE5RTQ6kqvF3X7Grk2aIgBemD3mKQTS0C2VHrcZSMtW1xpJyhk6Fin2fv2jrQv9t59OaC1QqoQXu+dkVuIMeUpDWCw/w+rRgqqVZEQXGwe7+rSJYmLJWZRPxssuiPmAojIvhw2WLC5GbJI2x9WzMeHxa9jG2nHrvEGmh8NAVlUTfPy8lUf0CI3dr6mNmmnmM+k9JFZN5t1lksV6uaAF+kYRy12K2dZU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=712H7lgui7y6JKIT38YiTq73OPMRMvLDDcUE25Lr6eo=;
 b=jfWz0NmFUhMsCvzTSd/KEx65x1IrkKWO0Vj2RN1Bt5zpbtesRdJ++FL47Z/jafNjEHlbRP6OHTOADGT74aI0fJjmWPzsPlfqmb4wHbFzR5II1Xx2j28rdPVz7XcGY5QUno6lQ4OFDZ7ZiweMDBcDgHcmXuA8TMlG/xN05dPYFVSZx3hvMt28E7Irqzq6t2ZVAvJH6N9C/xxOCEUdKdy7nTLUUKUiiLhwcYEbmY+F3Xzm2Tpprbm6CvxgWKshZGrQqpsq1/p5I4KGqBFHOfVG94Xby6ibL7F3kSG3omb9rZvBMgXDArUsA2Vnuhj6TbQWvermIipDgyqyOgEopXladQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=712H7lgui7y6JKIT38YiTq73OPMRMvLDDcUE25Lr6eo=;
 b=EeUMisWfAdi6DvMN0DEAGB0jXZG+5B5xuZDDFsj1NDoxPAdqoZrncQrh5jGZ65MFWjrdOHZoUZwYYK9gGDicmNLAMdZcxrYvU1WhPsLIfzyC7zY+OocrOgiQApkA5/HlUSza+7viB1NGVovldx2vCwQpYFgXLCtQcUp1mxNBX5qWu6TFzaQmnM0cxe0l3EokWlp+Uc89t+94s0L/HZDXFfXb+aK+uUsqNqPhS7za0AL+U0CLtJIuxZodHvFUdiqTnD3TTZZL5KAcfmP3Ck/YvsehyFwyD3ls2e6TGR6mpUBd8n9zhlNjb3AFxYWevDO9jThDQ4u5i/kYs8MkZViI0Q==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by OSZP286MB1967.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 14:34:00 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:34:00 +0000
Date: Tue, 6 Dec 2022 22:33:56 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Make remove() of any bus based driver void returned
Message-ID:  <TYCP286MB2323467DEE64E8CE2F8DD212CA1B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB23234ABCCF40E3FC42FD09A4CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <Y44VtN/rmjIU6sDC@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y44VtN/rmjIU6sDC@kroah.com>
X-TMN: [8Vq7ns3UEdT1MKuNI1EnmVRTFckh+vr7]
X-ClientProxiedBy: SG2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:3:17::25) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221206143356.GA176413@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|OSZP286MB1967:EE_
X-MS-Office365-Filtering-Correlation-Id: 93999e8e-2faa-414d-67c0-08dad796ea1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hSx0dzw/06nyY9YBvPt9lioT3Whlld0i+vanwf0UzirwW0h6UFOgLoS+AtinIVyfRKUUByJp+BsRdrm+r82FOUPRZpYUtncHwXGyD+6BtZGTToT0bU0FvrAZMaWBt/YFuTma/ojojC0AirZQWWukR/Akf1d8C4pJeVOBh4IY4HCSOjwxfdUHGLgLfeqZ3/vMW0xJEbL/eTLuVc1f6alHCOZ6+td3ciQhpZiOfxOEduqKgRD55/n85XXufGi9xeIXSazh+qReon6r109XvtXb2eM4yglxC0PcgI5ytRDJddwaTJ8KIXMJwelfYUnR/Sc4wRfT4OVUbQL8fmdzrYkY4o5gwo5LYITYyrCW3qrrGNIdIB5YEb7H2n0DXGn+inRJKtILNTr7yzManVcULtlgJAAz/pcFd6kyBIcQg8Se6TRkUDryng7x68IOCIe9OHiQeXcdGWgvFMDQRxTD9oSHG4l4QsgYlg197zHzujab7PYrlM6EI7QXXifbh7hhEs556USuj9joxn8i2Kxm6W5Jo+ut0+Mdlv/5jctNfgD14CmFOre6r/hUU1DdJi4xOIosJErFaqNJSoTM57m16Nl4OrwRfxi/oRufap5CtGPxFtv578XC8cZ/f9t1NTKoLYZ6tYng+opO9zn1xvi9m8+ZNA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?W4KM73/N0iVboquVZ75JvxrNVpwmX+upDIClAbR/V5uLzWUoVFMgXvCDkYvd?=
 =?us-ascii?Q?KJAp4izY1pXDksrxoHUYwVq5VYISVKLX+XFHXQi7svJ9NHm5+WUHOjsi6Rvd?=
 =?us-ascii?Q?V8rqqicsALu/q2//JLxYNCoR5nNKzJbQjv1mdxPqzHHK+voorHMhn4FETcrE?=
 =?us-ascii?Q?/PJiojtCEW4dWg7NototcYFZuPEEjyPMooAnS026OCqV6PwYO3SDNGbvh3nN?=
 =?us-ascii?Q?90vXySTzMB3z5DFGPhvpEr7dElRUmF+odyRqVT5HZs5Tq/G/YS0ir+JR0JRB?=
 =?us-ascii?Q?aejNuTH02NsxX8sCH7wZ35Y9w0GNehFtSKiMVit33xJ1jyAPuGgUKBz0Uf+R?=
 =?us-ascii?Q?tmWqIY/3MB71nlwGsLXEdbCV7ToB9g6qI+E+g+dTdtYA0kEhArFgYj0jW0j7?=
 =?us-ascii?Q?e8qnHCKJHw2gZdiLZhA8hwCHDzKgbY62iws4X7lnjtfS4P1WbNH+3KEA5QGe?=
 =?us-ascii?Q?UUP5bh0fLZ7Om1AXGQSrzmKdwOL6XLHBKsZETcW0L2nF5u4x8bMWYiNPkL3W?=
 =?us-ascii?Q?Iwq/s7xrwxl3T7OI+v64kmY9TS+fu1w5h8QfMkwg69b1amijG7z4D3t8+Ksn?=
 =?us-ascii?Q?4CaZiGN8SZQgA06722EDZ9hCZCZzzaS6loAOjR6SVzQg+aFhk6pRa+oH3XTt?=
 =?us-ascii?Q?XyG383bFv5hlj9LqvObJbfcV22ihwAuFoKiqYY/tZrM/ug/WSZ4OctiJTX9c?=
 =?us-ascii?Q?pZ2eLStO79n/Yo7BrBF5Juxhyv4I8XluzKfZCe+jKirmCe/Mnu0ErWqMVssG?=
 =?us-ascii?Q?CRLBeaTpXhZ/FmSLAcre89tiu9k7NOjIwl8xpR8vAKHi7xK3pCLylF3pPFt7?=
 =?us-ascii?Q?bJ+gtSiDrr3p0GnSRwvt7wYk47cUH8l54F26CIlpfcu6G5agvaLPNTyruGDR?=
 =?us-ascii?Q?S7ze1MMti5wrVRv2muGqNbT3aZn3j3ohMbfzsHRaJvGOP5Gl6cfZE9ZS2sUA?=
 =?us-ascii?Q?hp+z9aIFa8JnlDpfHXEXHn84IgzD683x2ZlZQ33lyR8vpD+JTMuONvPg2lnR?=
 =?us-ascii?Q?hz8exlgXmb+LOqAqd617ovbwpr13OpMuKkVCXYd6iSOsMLN/P41QCA8ol29U?=
 =?us-ascii?Q?MQBSyazfF++ZEG/vNqTG2zPKEGpBIKorrGDMTvP9TmTv5IWKERONe29/0CXG?=
 =?us-ascii?Q?QyAX5JZHvk7Lbl/a38thFgw48Y98961o17THYmA6oRiTqryBugGT+gpEyjHs?=
 =?us-ascii?Q?fIOe3QxQiBZpbWZPG9Fy4u3t8gAyx3yMKq4JZDRFnyV5ZOjyMzJGvbRtVu+W?=
 =?us-ascii?Q?rYdMtOdwYP4aZlTsdO2Hv9VK7GV8EXX0CF5HEH0TEA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93999e8e-2faa-414d-67c0-08dad796ea1f
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:34:00.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1967
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022 at 05:00:52PM +0100, Greg KH wrote:
> On Mon, Dec 05, 2022 at 11:36:38PM +0800, Dawei Li wrote:
> > For bus-based driver, device removal is implemented as:
> > device_remove() => bus->remove() => driver->remove()
> > 
> > Driver core needs no feedback from bus driver about the result of
> > remove callback. In which case, commit fc7a6209d571 ("bus: Make
> > remove callback return void") forces bus_type::remove be void-returned.
> > 
> > Now we have the situation that both 1st & 2nd part of calling chain
> > are void returned, so it does not make much sense for the last one
> > (driver->remove) to return non-void to its caller.
> > 
> > So the basic idea behind this patchset is making remove() callback of
> > any bus-based driver to be void returned.
> > 
> > This patchset includes changes for drivers below:
> > 1. hyperv
> > 2. macio
> > 3. apr
> > 4. xen
> > 5. ac87
> > 6. soundbus

Hi Greg:
Thanks for the reviewing.
> 
> Then that should be 6 different patchsets going to 6 different
> subsystems.  No need to make this seems like a unified set of patches at
> all.
Right, will fix all the issues for this patchset and resend them in 6
independent patches.

Thanks
      Dawei

> 
> > Q: Why not platform drivers?
> > A: Too many of them.(maybe 4K+)
> 
> That will have to be done eventually, right?
> 
> thanks,
> 
> greg k-h
