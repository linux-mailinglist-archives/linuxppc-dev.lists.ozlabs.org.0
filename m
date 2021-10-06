Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784F423DD1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 14:36:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPYqQ3scNz2yw2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:36:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PCTkgjrS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=PCTkgjrS; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPYpk1RzQz2yQ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 23:36:12 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06EDC61139;
 Wed,  6 Oct 2021 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633523770;
 bh=j3+A2Qlyg5D4UfN7RyIXmxav9UVc764TxGgamnb+Tgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PCTkgjrS6zmdAMIphuyQznjQUc1Fc5rawZj8vr9BXl5RbAfnkWrgj1dPvKLRNTyma
 3PzbdHGqyiKZuVNVQ5Pq+TIelMzTDg3Kmv3wjnRMrz4rInRl23r9/poTRlsIIiHnQX
 9o81jymzJHAlaFy0sMRMI/PHwiWELHBBU5zLF8yI=
Date: Wed, 6 Oct 2021 14:36:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sohaib Mohamed <sohaib.amhmd@gmail.com>
Subject: Re: [PATCH] docs: typo fixes in Documentation/ABI/
Message-ID: <YV2YOJuNKU/J3SEN@kroah.com>
References: <20211006121333.75799-1-sohaib.amhmd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006121333.75799-1-sohaib.amhmd@gmail.com>
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
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Ilya Dryomov <idryomov@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linuxppc-dev@lists.ozlabs.org,
 Zhang Rui <rui.zhang@intel.com>, Bean Huo <beanhuo@micron.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 02:13:25PM +0200, Sohaib Mohamed wrote:
> Signed-off-by: Sohaib Mohamed <sohaib.amhmd@gmail.com>

I can not take patches without any changelog text, sorry.

thanks,

greg k-h
