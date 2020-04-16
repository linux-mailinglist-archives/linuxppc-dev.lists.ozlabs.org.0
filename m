Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A91AB734
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 07:26:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492nl53mnzzDrMJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 15:26:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.18; helo=m17618.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492nhz0dPFzDr7m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 15:24:35 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.227])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 771484E1CA0;
 Thu, 16 Apr 2020 13:23:00 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: christophe.leroy@c-s.fr
Subject: Re: [PATCH v2,5/5] drivers: uio: new driver for fsl_85xx_cache_sram
Date: Wed, 15 Apr 2020 22:22:47 -0700
Message-Id: <20200416052247.112887-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <37b6b890-e537-7424-6b26-04565681f40a@c-s.fr>
References: <37b6b890-e537-7424-6b26-04565681f40a@c-s.fr>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSlVCSEtCQkJCQk9JTExCTllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pkk6Fzo*Lzg6LAhNCUJNDEwS
 LSIaFCJVSlVKTkNMS0pPTkNJQ0NKVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlMWVdZCAFZQU9CTko3Bg++
X-HM-Tid: 0a718170ba219376kuws771484e1ca0
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
Cc: linux-kernel@vger.kernel.org, oss@buserror.net, kernel@vivo.com,
 gregkh@linuxfoundation.org, wenhu.wang@vivo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yes, kzalloc() would clean the allocated areas and the init of remaining array
elements are redundant. I will remove the block in v3.

>> > +		dev_err(&pdev->dev, "error no valid uio-map configured\n");
>> > +		ret = -EINVAL;
>> > +		goto err_info_free_internel;
>> > +	}
>> > +
>> > +	info->version = "0.1.0";
>> 
>> Could you define some DRIVER_VERSION in the top of the file next to 
>> DRIVER_NAME instead of hard coding in the middle on a function ?
>
>That's what v1 had, and Greg KH said to remove it.  I'm guessing that he
>thought it was the common-but-pointless practice of having the driver print a
>version number that never gets updated, rather than something the UIO API
>(unfortunately, compared to a feature query interface) expects.  That said,
>I'm not sure what the value is of making it a macro since it should only be
>used once, that use is self documenting, it isn't tunable, etc.  Though if
>this isn't a macro, UIO_NAME also shouldn't be (and if it is made a macro
>again, it should be UIO_VERSION, not DRIVER_VERSION).
>
>Does this really need a three-part version scheme?  What's wrong with a
>version of "1", to be changed to "2" in the hopefully-unlikely event that the
>userspace API changes?  Assuming UIO is used for this at all, which doesn't
>seem like a great fit to me.
>
>-Scott
>

As Scott mentioned, the version define as necessity by uio core but actually
useless for us here(and for many other type of devices I guess). So maybe the better
way is to set it optionally, but this belong first to uio core.

For the cache-sram uio driver, I will define an UIO_VERSION micro as a compromise
fit all wonders, no confusing as Greg first mentioned.

>> +static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
>> +	{	.compatible = "uio,fsl,p2020-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p2010-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1020-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1011-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1013-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1022-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,mpc8548-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,mpc8544-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,mpc8572-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,mpc8536-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1021-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1012-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1025-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1016-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1024-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1015-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,p1010-l2-cache-controller",	},
>> +	{	.compatible = "uio,fsl,bsc9131-l2-cache-controller",	},
>> +	{},
>> +};
>
>NACK
>
>The device tree describes the hardware, not what driver you want to bind the
>hardware to, or how you want to allocate the resources.  And even if defining
>nodes for sram allocation were the right way to go, why do you have a separate
>compatible for each chip when you're just describing software configuration?
>
>Instead, have module parameters that take the sizes and alignments you'd like
>to allocate and expose to userspace.  Better still would be some sort of
>dynamic allocation (e.g. open a fd, ioctl to set the requested size/alignment,
>if it succeeds you can mmap it, and when the fd is closed the region is
>freed).
>
>-Scott
>

Can not agree more. But what if I want to define more than one cache-sram uio devices?
How about use the device tree for pseudo uio cache-sram driver?

static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
	{	.compatible = "uio,cache-sram",	},
	{},
};

Thanks,
Wenhu
