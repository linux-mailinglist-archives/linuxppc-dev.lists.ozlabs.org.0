Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6F211BE5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 08:17:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y7DD3lcCzDqvj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 16:17:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=yItMbcct; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y79L5BmPzDqtR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 16:14:46 +1000 (AEST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47A0420A8B
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593670483;
 bh=TRjOq0ioBsI/lLgnqh3WHyq3NuAIqhAPdkGT9KrgKH8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yItMbcctXfs5o3K3a0Uwam0VmikvvsUcR4rDa/JwGQwZB8Uz/Yhp2jGzCMiYmIUEm
 4zPuCUnKKcbVFIxEfBWBqPKPHn5qsYIgU9hyGcq8vCgJNY75/6RU7God1Ttp8qeL9G
 H4psw2naqAuo1p/prO5iO6oUyZzGm17MB9ZSYIN4=
Received: by mail-lj1-f178.google.com with SMTP id t25so25646097lji.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 23:14:43 -0700 (PDT)
X-Gm-Message-State: AOAM532CtwtB4WvD3ATT1vhmbkLnnZb3PuKQ8CwOgWuzJsl3M6tsJz9S
 Nlkis1iTL8Nzg9YJ1HVctGS/pIdq9W+aX+FOb3s=
X-Google-Smtp-Source: ABdhPJyW7ZQG/gxodV+UBsSp8muv8lWxec/bTY9tvW0qqCeZQo8oSQL9G2bg+h67AMeeX8NyXrYP1bqMgId6X08X7/E=
X-Received: by 2002:a2e:88c6:: with SMTP id a6mr11256607ljk.27.1593670481513; 
 Wed, 01 Jul 2020 23:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de>
 <20200701085947.3354405-13-hch@lst.de>
In-Reply-To: <20200701085947.3354405-13-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Wed, 1 Jul 2020 23:14:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5=055Eo-b3fjC_b-nJz-fg1FGwy_aqrNNtHm-U8vut-A@mail.gmail.com>
Message-ID: <CAPhsuW5=055Eo-b3fjC_b-nJz-fg1FGwy_aqrNNtHm-U8vut-A@mail.gmail.com>
Subject: Re: [PATCH 12/20] block: remove the request_queue argument from
 blk_queue_split
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

On Wed, Jul 1, 2020 at 2:02 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The queue can be trivially derived from the bio, so pass one less
> argument.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[...]
>  drivers/md/md.c               |  2 +-

For md.c:
Acked-by: Song Liu <song@kernel.org>
