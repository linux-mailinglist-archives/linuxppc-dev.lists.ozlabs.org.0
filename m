Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB991D2209
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 00:28:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mq885W8WzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 08:28:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=qnuaqcZy; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mq6Q65qtzDqHf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 08:27:01 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id o10so965563ejn.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 15:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5gtvWq/MeF/6oEmnw1qXQmZlv3KNk4h6BjoEUKhO/AI=;
 b=qnuaqcZyt8F/fu6JacXR348SsoSa3Tm7AzZNuvdyRoTov1keyBvQu8pXUwf75HxiOf
 Kp75KOKoGDVG9AVOlHoBHnEOZ+aGnlYmnNxamZckzNM5gr/kauOLnvq8RbJVSj57g1cw
 9NN4htlh7EN6fcqVbepwUivXJDqDlyuHYUdtHPY21wxmzjXy/ZgI5w7jQM2uM22NfFtA
 q8lS8JkKuJziplyt33amkKJeLTRetS+ezNJTjHtj9SEkChz+0OHqn2TMVceqrJ2eD/4/
 0tsEvnEt2hykkPAkDhJ48WHxBHzBhAZBdTwTt86tywE0BQeuxSyyhNQdkXE9MGPz7xQ5
 Snkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5gtvWq/MeF/6oEmnw1qXQmZlv3KNk4h6BjoEUKhO/AI=;
 b=cthpphpb/4yXbUpS28/iRi905UCRfU44yDz8iq2n/aQkWCZb/UcrTTtqwkreCJVhHd
 uBjcLAdTpEBiybdbJfH/HDOkxNrmb6qwCiBTNMZwDoeHNp0Tno3ckl53AyvFCI6Wsl5/
 BYZeumsbeMi3lfYMdANSM2k8YxRmy2nWZdBosthEQhiddhJCUTYN59mucrlprny9qVHq
 NVATxgptWcgdRatESgHFHMU55LJ7RWRBpJPATOlqENIwKKA3vPQj6N7fLTsehULvw6ly
 F+O1xHynXrQLZNNfGDgzogeJQ5RnuFErCvG76QWh0LN57T4iiY7qFp+nM1MOB+/olnAU
 3tNg==
X-Gm-Message-State: AOAM532/2tyYqeONzyntc3t8bknJrAlOk5AoVRAl7GihXQ1b2sas1YTD
 3jUP0LIW+yaBCItBxrjJBZnDCcF4I1JvN7IJvEA0hQ==
X-Google-Smtp-Source: ABdhPJz1YkZyiu1OaSAVXpO2AAQnxlh/qNnka1A5+jaiVwuM2r/ADoB+8k1+qusteX+AGprilg7rK2SWSnm96LhSDK4=
X-Received: by 2002:a17:906:1f8b:: with SMTP id
 t11mr1180169ejr.201.1589408817417; 
 Wed, 13 May 2020 15:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
 <CAPcyv4j3gVqrZWCCc2Q-6JizGAQXW0b+R1BcvWCZOvzaukGLQg@mail.gmail.com>
 <20200509082352.GB21834@lst.de>
 <CAPcyv4ggb7_rwzGbhHNXSHd+jjSpZC=+DMEztY6Cu8Bc=ZNzag@mail.gmail.com>
 <20200512080820.GA2336@lst.de>
In-Reply-To: <20200512080820.GA2336@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 May 2020 15:26:45 -0700
Message-ID: <CAPcyv4iWB=ZMmpc1aWfpJabSbCdvB28dCeSp_xj7AZMfbF_rjg@mail.gmail.com>
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

On Tue, May 12, 2020 at 1:08 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, May 09, 2020 at 08:07:14AM -0700, Dan Williams wrote:
> > > which are all used in the I/O submission path (generic_make_request /
> > > generic_make_request_checks).  This is mostly a prep cleanup patch to
> > > also remove the pointless queue argument from ->make_request - then
> > > ->queue is an extra dereference and extra churn.
> >
> > Ah ok. If the changelogs had been filled in with something like "In
> > preparation for removing @q from make_request_fn, stop using
> > ->queuedata", I probably wouldn't have looked twice.
> >
> > For the nvdimm/ driver updates you can add:
> >
> >     Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> >
> > ...or just let me know if you want me to pick those up through the nvdimm tree.
>
> I'd love you to pick them up through the nvdimm tree.  Do you want
> to fix up the commit message yourself?

Will do, thanks.
