Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E569423F21
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 15:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPZyc2Fckz3086
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 00:28:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X538M987;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=X538M987; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPZxz3Hd9z2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 00:27:34 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3CFF610A8;
 Wed,  6 Oct 2021 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633526851;
 bh=tCrOPXDPFM6eq1CqRmq09A35LYUJQAclm0PN/6KnclU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X538M987gwaUNdE2XqqRmAsl+RJhXQeVdlbqcqhQZqzfauW0coofiDvJN0Ti5vdYU
 f5oSEja+rqYyo8+7Tl+nYDbi/etUvNBlZZzOw1DwlnZ7nRj95eHClHRufWG+mvg/ik
 NRqAH8kUkM2/y0Jm8g9EoDsMQejOWG8jZSqS6qxE=
Date: Wed, 6 Oct 2021 15:27:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sohaib Mohamed <sohaib.amhmd@gmail.com>
Subject: Re: [PATCH] docs: typo fixes in Documentation/ABI/
Message-ID: <YV2kQT1glItmPS2y@kroah.com>
References: <20211006132104.105288-1-sohaib.amhmd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006132104.105288-1-sohaib.amhmd@gmail.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Daejun Park <daejun7.park@samsung.com>,
 Gioh Kim <gi-oh.kim@ionos.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Can Guo <cang@codeaurora.org>,
 Avri Altman <avri.altman@wdc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linuxppc-dev@lists.ozlabs.org,
 Carlos Bilbao <bilbao@vt.edu>, Bean Huo <beanhuo@micron.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 03:20:56PM +0200, Sohaib Mohamed wrote:
> All these changes are about to remove repeated words from severals place in the Documentation/ABI/ directory:

Please properly line-wrap your changelog text.

> - In file stable/sysfs-module:41: "the the source"
> 
> - In file testing/sysfs-bus-rapidio:98: "that that owns"
> 
> - In file testing/sysfs-class-cxl:106: "the the lowest"
> 
> - In file testing/sysfs-class-cxl:107: "this this kernel"
> 
> - In file testing/sysfs-class-rnbd-client:131: "as as the"
> 
> - In file testing/sysfs-class-rtrs-client:81: "the the name"
> 
> - In file testing/sysfs-class-rtrs-server:27: "the the name"
> 
> - In file testing/sysfs-devices-platform-ACPI-TAD:77: "the the status"
> 
> - In file testing/sysfs-devices-power:306: "the the children"
> 
> - In file testing/sysfs-driver-ufs:986: "the The amount"
> 
> - In file testing/sysfs-firmware-acpi:115: "send send a Notify"

Doesn't this look like you need to send a lot of individual patches
instead?

thanks,

greg k-h
