Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D691CB6F2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 20:17:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jdpp49hRzDrDm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 04:17:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=VLfu18xv; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JdXX03wbzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 04:05:06 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id r7so1943534edo.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 May 2020 11:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vtj9kAvnXfdA0IFN6kkpOkjHUwpRBJt7518BSBQldY=;
 b=VLfu18xvdyYvX+V3um74QbEgFlho/gmsdlebCehHgRC64LZ2LrwpLSPmFXlKyiifMG
 /2mXN3cYmzMOG97rtljf0sT2QTUcVKx0FHG3wqHOn7YZJCXdCNGibohHbksMUKyWKlmI
 u1s1YRJzpU1L2la8Jh5ttA2RLPctTxbiNdxv5J+1g/qta/vl3/3fnC/sNfCJYpUd8mBU
 rhA0RJUtnY0TDMxjb+AxGbqdOAZaUfuuGplRawkJdhwtGOz/RRQ8kRykAiOe7EfzaLOX
 DLh537yRKgaNM5aAIB51dRs9O5e+S0jhrluFx3rLNSiCGFuLiqA0Hj3QpKIo8KItLtbA
 P4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vtj9kAvnXfdA0IFN6kkpOkjHUwpRBJt7518BSBQldY=;
 b=VBddnuwZT0Q8BGSpXZdEX5PI0oHUZlWA0q6luzAXnjfAFL2TWlGREbVGDTRmhZovgy
 rsaJC7NIWv++HCa7WmXyWcXsEYQtEkCCtUDtYWrTOLU9H4uu7ZAsqg6L1OSc1yL9cdGg
 0Nbbv6KxLKnrVJ8Z7WUrKhr/Ktt/Z9ZkAOQIhApE67jJGI+yocdTiLcGt360W8+tyfxL
 w1ZjxRoH/7//3yRNegFkJeYozx8cmRdqF1Keoi+HFzyeJDW4Nse6jjaKiFdAJNouW/py
 87g32oNENav26RRiWXz+gf2HGGeKSkcuCQpnI8iSvLG7DbnujeBJJ/KlTtakUsNiSWFf
 EBfg==
X-Gm-Message-State: AGi0PuaVWtqcSDPNdfGXOHkEry/4IsM9eYRaVDhhcju9Ut294b4MJYGM
 GEPhxJaBBj8eEpOdVyTwN65ENC97SrXOzY13PYdeHQ==
X-Google-Smtp-Source: APiQypLP4j4lAauikZOSYW9imDv/qSFGiWgh0ghiKFKN6QKIltyJGJv056sHO7WKbYwrvEJrNoRF76BYTsHSimP70IA=
X-Received: by 2002:a50:c3c2:: with SMTP id i2mr3146588edf.93.1588961096815;
 Fri, 08 May 2020 11:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
In-Reply-To: <20200508161517.252308-1-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 8 May 2020 11:04:45 -0700
Message-ID: <CAPcyv4j3gVqrZWCCc2Q-6JizGAQXW0b+R1BcvWCZOvzaukGLQg@mail.gmail.com>
Subject: Re: remove a few uses of ->queuedata
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
 linux-raid <linux-raid@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Paris <jim@jtan.com>, linux-block@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Philip Kelleher <pjk1939@linux.ibm.com>, linux-bcache@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Morris <josh.h.morris@us.ibm.com>, Nitin Gupta <ngupta@vflare.org>,
 drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 8, 2020 at 9:16 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> various bio based drivers use queue->queuedata despite already having
> set up disk->private_data, which can be used just as easily.  This
> series cleans them up to only use a single private data pointer.

...but isn't the queue pretty much guaranteed to be cache hot and the
gendisk cache cold? I'm not immediately seeing what else needs the
gendisk in the I/O path. Is there another motivation I'm missing?
