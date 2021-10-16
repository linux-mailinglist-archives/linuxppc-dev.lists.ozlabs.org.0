Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F942FF62
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:14:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWNtV2rl1z3c9r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 11:14:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=22FCMxDj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=22FCMxDj; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWNsp6Xdhz2yns
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 11:13:59 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id y7so9666696pfg.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 17:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQCqnCKj+Qob3RGhvKowF7vjQkMvz3jzVYQ6ojJDBgk=;
 b=22FCMxDjuptu5z2WXUhWAGeGxsQDD/V8j37BH7gzChQavhMTsYfwOs16+0368VAEwm
 H9Kn5GtjOlGOoLtQHyP63Q2TpGtOd+bYEeoJ7yrQrZF8Gd5SjSTBe4bjtPPHCkHVAMnX
 IKOrAb7pR6jb0J/r9z7kk4abkd4nzTZJqkNyspbONodFaBFVZGgHceRMhIUL1AnjE8EE
 QtZ+EolKR2dxl4bSkgWIlNfGf3FEfjjORJKFElmg1CgQAa4omqi87tX+bb0lzqw7atj/
 9H8nfrhpQOc6LGhupM+SVewu7XdQegTluU6pnHJSo4uAockAmkpsZzfTuVIRBEfs5F0h
 AY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQCqnCKj+Qob3RGhvKowF7vjQkMvz3jzVYQ6ojJDBgk=;
 b=wocHACwans0LTxT80TFotFgdQ2h9az0W9AMZ9lLhk3UGBl6GT7kQrbJJqiMOTlMMla
 u6GCFFE9fWoezTls5WmznbfjsjVySgZzb62TIkXR+vSpFyX/JAAGkXYD+92SmicmDqEk
 s/YAW+M9w3xdKIjegqXrkVT1xGHiksnQ1AY00a5ryxjQD6qu0HbfQrWoSLetrPmuf1ZA
 D0CY3SN2k+L5l1qhs/KQkVmvMDLOL7tl+owTEjtBd9UgErVIUF0Tl1UCTeCPBREGz38P
 6IZ9SgkkRBMlmtjWseCfJono40cngf36EUFbalp+kJz3QBVIK6NOw9ICU6Lc4JoUUVo2
 qTfw==
X-Gm-Message-State: AOAM531SjBiHKiPCDd1fF8d6A3aYexz1RixZlryltKIRTeQaDgdhgkui
 t3AIgoM37G0pbPAl9VXMjUveKYyM+oUhFyjz7ZhuNQ==
X-Google-Smtp-Source: ABdhPJyHjqiChiYGgEV/QjEsOo/jEjfBLMsWIS4VVM51yMBTI+afNI+/nTgDPsjRchZ2uu+6VeHhZ/gjMvW7ySA684s=
X-Received: by 2002:a63:6bc2:: with SMTP id g185mr6607076pgc.356.1634343237273; 
 Fri, 15 Oct 2021 17:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-7-mcgrof@kernel.org>
In-Reply-To: <20211015235219.2191207-7-mcgrof@kernel.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 15 Oct 2021 17:13:48 -0700
Message-ID: <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
Subject: Re: [PATCH 06/13] nvdimm/blk: avoid calling del_gendisk() on early
 failures
To: Luis Chamberlain <mcgrof@kernel.org>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, vigneshr@ti.com,
 linux-nvme@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 miquel.raynal@bootlin.com, "Weiny, Ira" <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Dave Jiang <dave.jiang@intel.com>,
 Sagi Grimberg <sagi@grimberg.me>, Minchan Kim <minchan@kernel.org>,
 Vishal L Verma <vishal.l.verma@intel.com>, Nitin Gupta <ngupta@vflare.org>,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Paris <jim@jtan.com>, senozhatsky@chromium.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> If nd_integrity_init() fails we'd get del_gendisk() called,
> but that's not correct as we should only call that if we're
> done with device_add_disk(). Fix this by providing unwinding
> prior to the devm call being registered and moving the devm
> registration to the very end.
>
> This should fix calling del_gendisk() if nd_integrity_init()
> fails. I only spotted this issue through code inspection. It
> does not fix any real world bug.
>

Just fyi, I'm preparing patches to delete this driver completely as it
is unused by any shipping platform. I hope to get that removal into
v5.16.
