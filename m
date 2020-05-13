Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 991301D2100
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 23:27:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mnnz4X3qzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 07:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=RLQfxHVc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MkBt4pB5zDqdv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 04:45:42 +1000 (AEST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6ADF20708
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 18:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589395541;
 bh=y3uf4cDEBcGin/ahVjDWwwqBbdeSBPGoaou/iCBc+Ng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RLQfxHVcrn6lWhWEu0DDrnMIHIoZ+37WfrxEpZxqiKdV1WCyAtQwcUcFu2SvS2080
 VTE5vGbKGPtkrp13IOlhl2+f6sYzR7NeAlwZhvD/+sHUP7ta5YnAY2Vdmt9jo9N04s
 CEpGnXvJbsQIZi+fuoRT8dDY4nvc1HnFSDyGGc2w=
Received: by mail-lj1-f178.google.com with SMTP id l19so697528lje.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 11:45:39 -0700 (PDT)
X-Gm-Message-State: AOAM533mQrkdVb4HmfmuVuyHPElI3tSvbbCReHtA33KW3YBHkDX/mW+A
 EM4JOtjBmNAD9vzYZJGxVprQNCmlPZrNMHUBy5I=
X-Google-Smtp-Source: ABdhPJzyHaUiiK2XwtDLa9MHZHs3wyCWyuE6aX0bNKMPXZmRZyv4SYSAs5m7n5jeU7J7JeAy2/ppnnbYCoByE6/YYa8=
X-Received: by 2002:a2e:9258:: with SMTP id v24mr280263ljg.109.1589395538071; 
 Wed, 13 May 2020 11:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
 <20200508161517.252308-13-hch@lst.de>
 <CAPhsuW6_Y53_XLFeVxhTDpTi_PKNLqqnrXLn+M2fJW268eE6_w@mail.gmail.com>
 <20200513183304.GA29895@lst.de>
In-Reply-To: <20200513183304.GA29895@lst.de>
From: Song Liu <song@kernel.org>
Date: Wed, 13 May 2020 11:45:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6pG+-EAa-FW96r+LEP=j1nWEK0Zqk_fJeaAu2Hn9AqeA@mail.gmail.com>
Message-ID: <CAPhsuW6pG+-EAa-FW96r+LEP=j1nWEK0Zqk_fJeaAu2Hn9AqeA@mail.gmail.com>
Subject: Re: [PATCH 12/15] md: stop using ->queuedata
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 14 May 2020 07:23:54 +1000
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
 linux-nvdimm@lists.01.org, Geoff Levand <geoff@infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Jim Paris <jim@jtan.com>,
 linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
 linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Joshua Morris <josh.h.morris@us.ibm.com>, Nitin Gupta <ngupta@vflare.org>,
 drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 13, 2020 at 11:33 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 13, 2020 at 11:29:17AM -0700, Song Liu wrote:
> > On Fri, May 8, 2020 at 9:17 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Thanks for the cleanup. IIUC, you want this go through md tree?
>
> Yes, please pick it up though the md tree.

Thanks for the clarification. Applied to md-next.
