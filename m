Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D638C213
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 10:38:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmg483Qcxz3bw6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 18:38:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.170;
 helo=mail-vk1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmg3m185xz2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 18:38:11 +1000 (AEST)
Received: by mail-vk1-f170.google.com with SMTP id 15so3902185vkn.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 01:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RVHzs0poOF+hVS1v1BAW6iRpurNI2FLCHK2qQooBQc8=;
 b=Iki779ZX4RjB1KvgirwbBeJqTf1dYLy746AT3Un3LQyVJSNypmCPAKnOsFSS4MvpHz
 ObHuCAEv8FWNsmB2qD0WKGLGesdvvpPTcMfrSxZunmIsfsfvrjLQtWvGWUpMU6KQt+C/
 e0583t22GdmZW9lDUmk7yMYr2/EVjWaJFCGa+Q/KkXQ3iasLcrZKcak9NzbYbdAgHUWS
 LAsmBftQh4Mg74xg7g53wYYIPy1vYFk8cHw8wRY6jveNVNsUeljdoqBY2dox4A5xe7w/
 0rl/Nr3ZBK20LwQmv/4lAwDZxcHkAlvm0+1pFYetXd/aqwb7ukFMW63IKJJ0Ps5HVWzF
 sC9Q==
X-Gm-Message-State: AOAM530dTOHccxbdCsSfxhfN7g5vhPNrq0SWbvsaQSjz2MuzPDdtY987
 qMENPphuBBdDbX4rbGPU4QV6yZAfJ0O10rkE1p4=
X-Google-Smtp-Source: ABdhPJzGTg0SxZhAyS6W3ANe8pj0R0i+6+zDbI/+BVCcJpHhTvw5AwmdUSLpxqeMfSWaogZWi2MJbcqhNDfvoXw93hU=
X-Received: by 2002:a1f:2504:: with SMTP id l4mr9071521vkl.5.1621586288105;
 Fri, 21 May 2021 01:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210521055116.1053587-1-hch@lst.de>
 <20210521055116.1053587-20-hch@lst.de>
In-Reply-To: <20210521055116.1053587-20-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 May 2021 10:37:56 +0200
Message-ID: <CAMuHMdUReZCGwii_rJuOOag+jmn4E3yfH+=P3a=5bJDf8CJvrQ@mail.gmail.com>
Subject: Re: [PATCH 19/26] nfblock: convert to blk_alloc_disk/blk_cleanup_disk
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
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-bcache@vger.kernel.org,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Lars Ellenberg <drbd-dev@lists.linbit.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Matias Bjorling <mb@lightnvm.io>, Nitin Gupta <ngupta@vflare.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Alex Dubov <oakad@yahoo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Chris Zankel <chris@zankel.net>, linux-raid@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 7:52 AM Christoph Hellwig <hch@lst.de> wrote:
> Convert the nfblock driver to use the blk_alloc_disk and blk_cleanup_disk
> helpers to simplify gendisk and request_queue allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
