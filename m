Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDF212C4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yRNB1hPVzDr24
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:25:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=OoegUq2L; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRK05hLhzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:22:28 +1000 (AEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43C2920885
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593714145;
 bh=2Ob+guxRY0fDcRz+P555VDdl6+UEf5NKd/ZEgEjmyqA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OoegUq2L0uxSt3rrR3lcoqsDAOAxdO0rE6tlewRsGb9eiQzLEa9GcLv3f53+JJtIq
 Tu4dmdJlB98mXwT/7grCGi1Eg4sXkxKx8O4HxETnxcls0gt5Kok143rso1DF1RnUs7
 J+0BQhidD4fUWOWUJ491VzOjYlY2TbrXcU05LAhg=
Received: by mail-lj1-f176.google.com with SMTP id s1so33463189ljo.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:22:25 -0700 (PDT)
X-Gm-Message-State: AOAM532szcxTy8qs11metvf+EYCBf/XIWf1eRckY9ktNaTiJWV6RvwBr
 w+UJBCrLfjm4r5l3L0U3LrdbAvP5beWg2WtvfUQ=
X-Google-Smtp-Source: ABdhPJwzHQSAgDG5LZKrrq4sCwOryNIpxeUx+J+pLZvaBWcsyRJefETEyU+mlLl9hUoA9U/QBDPE51PBpf0COAdEZgQ=
X-Received: by 2002:a2e:9901:: with SMTP id v1mr17432874lji.41.1593714143665; 
 Thu, 02 Jul 2020 11:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de>
 <20200701085947.3354405-18-hch@lst.de>
In-Reply-To: <20200701085947.3354405-18-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Thu, 2 Jul 2020 11:22:12 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4=eiN2-_cy5vCn_RGwmYRf37jOX4DWTvUCDWAqRzU+pw@mail.gmail.com>
Message-ID: <CAPhsuW4=eiN2-_cy5vCn_RGwmYRf37jOX4DWTvUCDWAqRzU+pw@mail.gmail.com>
Subject: Re: [PATCH 17/20] block: rename generic_make_request to
 submit_bio_noacct
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
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>,
 linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
 linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 1, 2020 at 2:01 AM Christoph Hellwig <hch@lst.de> wrote:
>
> generic_make_request has always been very confusingly misnamed, so rename
> it to submit_bio_noacct to make it clear that it is submit_bio minus
> accounting and a few checks.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[...]

>  drivers/md/md-faulty.c                        |  4 +--
>  drivers/md/md-linear.c                        |  4 +--
>  drivers/md/md-multipath.c                     |  4 +--
>  drivers/md/raid0.c                            |  8 ++---
>  drivers/md/raid1.c                            | 14 ++++----
>  drivers/md/raid10.c                           | 28 ++++++++--------
>  drivers/md/raid5.c                            | 10 +++---

For md part:

Acked-by: Song Liu <song@kernel.org>
