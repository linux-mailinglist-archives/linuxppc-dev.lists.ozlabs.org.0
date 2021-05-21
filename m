Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D438CC24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:29:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmtrK2VrRz308N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 03:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.48; helo=mail-pj1-f48.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmtqy4HsKz305w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 03:28:45 +1000 (AEST)
Received: by mail-pj1-f48.google.com with SMTP id kr9so3258547pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 10:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B30rffgHFLYBI6xwi77IEdIESyslCgwa8HluqL6arQs=;
 b=XWppWywbOuN8mRgCa8blE9LAix2Z4rf8lAxBEVnDrqFq8CcSPT/eoy/lncD/cSgWqn
 mp2ktZZvqk403pJQBfzZiFXVVopzc8GxXVEUsfso1zSeubAD9NDLL6ayrcFlU2NhckV/
 ZtF6Q+OB0hD7oC7BHv0sXYkIbuP6BIpZyU1s1AeSTBnz8kUBa5D7OdkN6NtFt43Ilx8o
 BaeZuwJmbkfjsDpA3BsrSIkzyZSPOnOvul1sWHKjP9fOqyYKyVmvNBxGh/6pzn9BDLa4
 JQTb1Z2YVz3pWkHRw6WN6BmfxMlylNFTAyAQeB7DxtmZQ1yfRIqv0CUY20Cc7XI2MYWM
 5UZg==
X-Gm-Message-State: AOAM530ETN79RfvptiGNr6JSAnkKE2SdDvbVix66S3m7kT2XJTpf3FgY
 Cx4TlrbDpQOzbDxFRMpzRSY=
X-Google-Smtp-Source: ABdhPJyrNWjuuiPeUt5pQpc8nPl0WeqbdGuJLCj1G2mOrwbN4glaACuKyX0vSa0sudDl68ZR50luTQ==
X-Received: by 2002:a17:902:e8c8:b029:ee:f249:e416 with SMTP id
 v8-20020a170902e8c8b02900eef249e416mr13149158plg.3.1621618124047; 
 Fri, 21 May 2021 10:28:44 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id p19sm2008772pgi.59.2021.05.21.10.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:28:42 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 77877423A3; Fri, 21 May 2021 17:28:41 +0000 (UTC)
Date: Fri, 21 May 2021 17:28:41 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 04/26] block: add a flag to make put_disk on
 partially initalized disks safer
Message-ID: <20210521172841.GA25211@42.do-not-panic.com>
References: <20210521055116.1053587-1-hch@lst.de>
 <20210521055116.1053587-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521055116.1053587-5-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Mike Snitzer <snitzer@redhat.com>, linux-m68k@vger.kernel.org,
 linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
 dm-devel@redhat.com, Joshua Morris <josh.h.morris@us.ibm.com>,
 linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matias Bjorling <mb@lightnvm.io>,
 Nitin Gupta <ngupta@vflare.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Alex Dubov <oakad@yahoo.com>,
 Heiko Carstens <hca@linux.ibm.com>, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
 Jim Paris <jim@jtan.com>, Minchan Kim <minchan@kernel.org>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 07:50:54AM +0200, Christoph Hellwig wrote:
> Add a flag to indicate that __device_add_disk did grab a queue reference
> so that disk_release only drops it if we actually had it.  This sort
> out one of the major pitfals with partially initialized gendisk that
> a lot of drivers did get wrong or still do.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
