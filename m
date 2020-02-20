Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8516535A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 01:09:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NFMJ6HKhzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 11:09:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NFKd1wxqzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 11:07:59 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id 77so2004921oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 16:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fs7aFUGuQDQwKtAq2jogalwziBPX7+a0D4piqySvYe0=;
 b=WnbML3NgZuAxmk6DnfkmzOrbHyNKqpK43Z3c+XMzOorcVeV2J4S53Uj4tqhmhrFzb4
 DH66JqaiJ39SkQyszTCHdDads5a4pIjCAIMp6BN/+V+aXICvSURm8imXSByzWPM7gyqd
 XnhqJQyPDzldv1+ffp7kH83Sl3sBv+e+jaoJEJ5QYQ1S64uEFsMYlUlappxFz4jRWMGB
 uy0mFi64+NfIwV72jJoeHWn4FXXLvY8cja6jxqjs/iI2OpoBkmV/rqmy/nI77GTo5P7O
 4inrSGciYeVeVVInNA7HPppwcPCCIttDfDZbjqptYSTZK0LgKs2wJEHehQF0tlbfzhpf
 6M2g==
X-Gm-Message-State: APjAAAWxq6Xu23DacB+eXkWL7LKhMFkUzK9CIkq8QFnx51SxxQiW3z7Q
 JrMS2Hhubs9SJfNSxas20DW7IMwD
X-Google-Smtp-Source: APXvYqwfqEJDZHZsLykyK+9PlJzBZ59IHhLiTE+2jL6fZL7lk5SWQB51VOvY6nzkTHgTgenWVE10qw==
X-Received: by 2002:a9d:7851:: with SMTP id c17mr22051986otm.58.1582157276454; 
 Wed, 19 Feb 2020 16:07:56 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
 [209.85.210.45])
 by smtp.gmail.com with ESMTPSA id n25sm518756oic.6.2020.02.19.16.07.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 16:07:56 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id z9so2012393oth.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 16:07:55 -0800 (PST)
X-Received: by 2002:a05:6830:1c8:: with SMTP id
 r8mr8886101ota.63.1582157275705; 
 Wed, 19 Feb 2020 16:07:55 -0800 (PST)
MIME-Version: 1.0
References: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
 <a46accbc-becf-ad23-8504-70ce619e2b11@oss.nxp.com>
In-Reply-To: <a46accbc-becf-ad23-8504-70ce619e2b11@oss.nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 19 Feb 2020 18:07:44 -0600
X-Gmail-Original-Message-ID: <CADRPPNQ4UK6EvYG6ffdU=dvO-tD7crWJ==diq8ueBBAyCvEdLw@mail.gmail.com>
Message-ID: <CADRPPNQ4UK6EvYG6ffdU=dvO-tD7crWJ==diq8ueBBAyCvEdLw@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: fsl: dpio: Enable QMAN batch enqueuing
To: Roy Pledge <roy.pledge@oss.nxp.com>
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
Cc: Roy Pledge <roy.pledge@nxp.com>,
 Alexandru Marginean <alexandru.marginean@nxp.com>,
 Youri Querry <youri.querry_1@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 6, 2020 at 2:41 PM Roy Pledge <roy.pledge@oss.nxp.com> wrote:
>
> On 12/12/2019 12:01 PM, Youri Querry wrote:
> > This patch set consists of:
> > - We added an interface to enqueue several packets at a time and
> >    improve performance.
> > - Make the algorithm decisions once at initialization and use
> >    function pointers to improve performance.
> > - Replaced the QMAN enqueue array mode algorithm with a ring
> >    mode algorithm. This is to make the enqueue of several frames
> >    at a time more effective.
> >
> > Youri Querry (3):
> >    soc: fsl: dpio: Adding QMAN multiple enqueue interface.
> >    soc: fsl: dpio: QMAN performance improvement. Function pointer
> >      indirection.
> >    soc: fsl: dpio: Replace QMAN array mode by ring mode enqueue.
> >
> >   drivers/soc/fsl/dpio/dpio-service.c |  69 +++-
> >   drivers/soc/fsl/dpio/qbman-portal.c | 766 ++++++++++++++++++++++++++++++++----
> >   drivers/soc/fsl/dpio/qbman-portal.h | 158 +++++++-
> >   include/soc/fsl/dpaa2-io.h          |   6 +-
> >   4 files changed, 907 insertions(+), 92 deletions(-)
> >
> Acked-by: Roy Pledge <roy.pledge@nxp.com>

Series applied with some clean up and typo fix in the title/commit message.

Regards,
Leo
