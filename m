Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0C463D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 18:18:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QQkf23M6zDrh7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 02:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="W3Hqbykg"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QQhl5psBzDrTQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 02:16:23 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AFD12084E;
 Fri, 14 Jun 2019 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560528981;
 bh=nc6Gu5WBuukhttllfbWpI15h3ZGPSrpGNeXbIbz0ozA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3HqbykgRzdLv007Fa8DMJ6Kl9yBBdM5dM7hEe6w6/BmYne48hzMVGPojn41NRg+X
 XFl3RtVlQ6wQmWCQ26AzbUtsa1a3EzKI/xREY4FW1fTjzKYCyGiqINBlk2M+nLJMQy
 UD3crjifc+POF6aRF0+jbAnSYZenE2AX1jpaSB1w=
Date: Fri, 14 Jun 2019 18:16:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH 01/14] ABI: fix some syntax issues at the ABI database
Message-ID: <20190614161618.GA23190@kroah.com>
References: <cover.1560477540.git.mchehab+samsung@kernel.org>
 <b908fc6555df8cae3e4c734b2d5f6284c46a5f14.1560477540.git.mchehab+samsung@kernel.org>
 <1ef7b765-da34-c65b-a226-f17969935ce2@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ef7b765-da34-c65b-a226-f17969935ce2@linux.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: Tony Luck <tony.luck@intel.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Colin Cross <ccross@android.com>,
 linux-pm@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Anton Vorontsov <anton@enomsg.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2019 at 05:20:29PM +1000, Andrew Donnellan wrote:
> On 14/6/19 12:04 pm, Mauro Carvalho Chehab wrote:
> > diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/testing/sysfs-class-cxl
> > index bbbabffc682a..fc7c6f7c21b3 100644
> > --- a/Documentation/ABI/testing/sysfs-class-cxl
> > +++ b/Documentation/ABI/testing/sysfs-class-cxl
> > @@ -1,6 +1,6 @@
> > -Note: Attributes that are shared between devices are stored in the directory
> > -pointed to by the symlink device/.
> > -Example: The real path of the attribute /sys/class/cxl/afu0.0s/irqs_max is
> > +Please notice that attributes that are shared between devices are stored in
> 
> Would prefer "Please note" over "Please notice".

Now changed, but that's a minor grammer thing, both are correct. :)

> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>  # cxl

thanks,

greg k-h
