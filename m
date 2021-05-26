Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D313911FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 10:08:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fqk9M4zJbz302y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 18:08:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=woqt8Bnx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::929;
 helo=mail-ua1-x929.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=woqt8Bnx; dkim-atps=neutral
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqk8t3Jc1z2xvC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 18:08:11 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id z14so299625uan.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GrfL+UvsoUYJEVH3FOBXMPqeLzeAwHNpUWgDzMspWKw=;
 b=woqt8BnxKZukeBLeJd4w4lKnQ3cKCzoRk7QnVN0RWefRH0Lak2HbQbLhx/frNziCrW
 vzOd63E9Idh6uhMeJbijddzANEGlwhq2a94sp+UT6X33w/HJrP0R4Xxsur3qtd3UJ9V3
 RXhO2WmDqsPWGOOFe4Z1vXtU3Ajlf9H69hO1WGEkh2/q7XWi3knfCY64J+SzmkNKOe36
 kp6uvOs+ndgfRymDdtUOUv9NQPYP8RiXXMABsN8MVSRmmehasPQ8UDsDcWRSt1e77qBG
 1jHw1+BN8mfEhYZIvRTg/wyYkLYEyw3TBricpiOdb+JF5bZQWiaQ0RSSDpINkEteioTM
 z8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GrfL+UvsoUYJEVH3FOBXMPqeLzeAwHNpUWgDzMspWKw=;
 b=dIblZDEF4Ne4UCP8c8THivLAVDb3caz4KdG/x/5ULyMJdpOEicEkPp2qIfOJ4TItTi
 ds03x6jdCclK168Cu8A5a2zAmlAtcPQuYBJPElyiRLfIsfu0GUd1jxbtfGZlTXC8JR6O
 vR4KpUq0ioW7VPxK3XrIEEQYCOqm8LjsT1kbg/pjmrrHDj2zEdfz3g/u0KOLqk7KpYu1
 +JxiM1RujwV8vmmnVcvP9KHcSAPV0h2x+Li+I/nFD3iB5FxbHoxzPO0whU6EtD/Z1WnO
 Vm2Hfrom78GRIiurlDoXJ95ui6K/FeEjENUlzE9C6oiUjcEIQcy6g1M4Y0EqaJ3p/pcK
 /YiA==
X-Gm-Message-State: AOAM531FcU0GIZJv6DXMQg9cNxnFgFnUVm1lmBT1RNiJ40RUTVcTNbCB
 NOe38abwOTC29W0qu5MwmubX+EEX4/HEh4Umch7j9A==
X-Google-Smtp-Source: ABdhPJxEKZ+yyN+wbXXVH9CKQ94TxTUrIX6SVT7ztQ9Bwftr62IUqVIB3GNBh5QlN3mdzVdDkjsC7QK+8McmDny5XO0=
X-Received: by 2002:ab0:3351:: with SMTP id h17mr31776765uap.15.1622016487939; 
 Wed, 26 May 2021 01:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210521055116.1053587-1-hch@lst.de>
 <CAPDyKFpqdSYeA+Zg=9Ewi46CmSWNpXQbju6HQo7aviCcRzyAAg@mail.gmail.com>
 <20210526044943.GA28551@lst.de>
In-Reply-To: <20210526044943.GA28551@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 26 May 2021 10:07:31 +0200
Message-ID: <CAPDyKFpR0maO_Dj6bxWSLvh_jcGnrcZ=na42atXfNdkmMkmdig@mail.gmail.com>
Subject: Re: simplify gendisk and request_queue allocation for bio based
 drivers
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
 dm-devel@redhat.com, linux-bcache@vger.kernel.org,
 Joshua Morris <josh.h.morris@us.ibm.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matias Bjorling <mb@lightnvm.io>,
 Nitin Gupta <ngupta@vflare.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Alex Dubov <oakad@yahoo.com>,
 Heiko Carstens <hca@linux.ibm.com>, Coly Li <colyli@suse.de>,
 linux-block <linux-block@vger.kernel.org>, linux-m68k@lists.linux-m68k.org,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Chris Zankel <chris@zankel.net>, linux-raid@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 May 2021 at 06:49, Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 26, 2021 at 12:41:37AM +0200, Ulf Hansson wrote:
> > On Fri, 21 May 2021 at 07:51, Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Hi all,
> > >
> > > this series is the first part of cleaning up lifetimes and allocation of
> > > the gendisk and request_queue structure.  It adds a new interface to
> > > allocate the disk and queue together for bio based drivers, and a helper
> > > for cleanup/free them when a driver is unloaded or a device is removed.
> >
> > May I ask what else you have in the pipe for the next steps?
> >
> > The reason why I ask is that I am looking into some issues related to
> > lifecycle problems of gendisk/mmc, typically triggered at SD/MMC card
> > removal.
>
> In the short run not much more than superficial cleanups.  Eventually
> I want bio based drivers to not require a separate request_queue, leaving
> that purely as a data structure for blk-mq based drivers.  But it will
> take a while until we get there, so it should not block any fixes.

Alright, thanks for clarifying.

>
> For hot unplug handling it might be worth to take a look at nvme, as it
> is tested a lot for that case.

Okay, thanks for the hint.

Kind regards
Uffe
