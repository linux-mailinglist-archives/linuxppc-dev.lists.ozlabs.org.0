Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68079434B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 11:38:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Pdvq4tDfzDqwt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 19:38:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.dk
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.b="gcm4y7Z5"; 
 dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdSp5YhzzDrMJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 19:18:11 +1000 (AEST)
Received: by mail-yb1-xb43.google.com with SMTP id p8so7530705ybo.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rWRYQfTQ2CGUN47KzzewtdkARkI8D2HQXHjNEPkT2fM=;
 b=gcm4y7Z5tiPt34XEseRf897HHaBYWht5YRdwUUXywf4/NMVLTaAkyJ3n9FN2e07T56
 laSscI/KiTjgDi9+Ak7fL1bHEUjGp4LNidEU20YZo0bXBLnFEtVwDbBw0MGXFo1hK67g
 d8yMOD8UvmXaeXYxmBae+8Tb5N+eJKiAXsYMprxMEd/l34UB11BagkeyLTyBfRXzgtiC
 LLDYsxuFGNJ5750N2+Zm+b8U54INv1gx9EJpypgasTP0xGE/8DkDz7Vmxz8mKxizdkzB
 5d0Txz/8dStSmlUiNZja16qapSSOcVwr8kNLYUxyX3bPjortqwPPzrh++lshI0gqbvYf
 WRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rWRYQfTQ2CGUN47KzzewtdkARkI8D2HQXHjNEPkT2fM=;
 b=BDvk7Tm2EutDjImsSiUughakP788k6Kpeqm+lBacJ2CjsoEWN5STjDkPsGavFif9mD
 PwQnyvf+qx91LlYdoGXJ7jV4orX2w2/U78oAkA8FLNFiAUwIYKHDlsdK935GdH8uBDIA
 3rYeEN3xFjoTMdTPoYS/ka2cWjPOO1EeVGqGfm8gJ5n5jgnweMTtE4yEjQHu0hPTv6yj
 mm6PdCXpt7f7UzPoTvzUMgrSKSf5Et6J1zG6v0SweeAzNwRh56bDrW5gYE8pre2aivwn
 UdJI8DSV2hffb+EXeW74L71uIHsCYzLNRdCaeW1yY10xHaCAj8XBLrvsS6yhR5Wt+Rlu
 h2kQ==
X-Gm-Message-State: APjAAAVo6gUQT0owpY5atNOvdoWNphrZTE05uEU5z2d9KtEbhsYmXCNK
 ae3KcJi8cErnzxl6rEzKGdw5gA==
X-Google-Smtp-Source: APXvYqxLGysOgdpeENWfSfydoLuDyyMBrKZQKgBENiQq24AdUBHUlZN8NTSTBAgmInA19Qv2H7zdFw==
X-Received: by 2002:a5b:412:: with SMTP id m18mr44123343ybp.497.1560417488445; 
 Thu, 13 Jun 2019 02:18:08 -0700 (PDT)
Received: from [172.20.10.3] (mobile-166-172-57-221.mycingular.net.
 [166.172.57.221])
 by smtp.gmail.com with ESMTPSA id l14sm625653ywb.59.2019.06.13.02.18.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 02:18:07 -0700 (PDT)
Subject: Re: [PATCH] block/ps3vram: Use %llu to format sector_t after LBDAF
 removal
To: Geert Uytterhoeven <geert+renesas@glider.be>, Jim Paris <jim@jtan.com>,
 Geoff Levand <geoff@infradead.org>, Christoph Hellwig <hch@lst.de>
References: <20190613073006.13459-1-geert+renesas@glider.be>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <da98e8b2-8abf-77c1-ac98-6b164ebf9d34@kernel.dk>
Date: Thu, 13 Jun 2019 03:18:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613073006.13459-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/13/19 1:30 AM, Geert Uytterhoeven wrote:
> The removal of CONFIG_LBDAF changed the type of sector_t from "unsigned
> long" to "u64" aka "unsigned long long" on 64-bit platforms, leading to
> a compiler warning regression:
> 
>      drivers/block/ps3vram.c: In function ‘ps3vram_probe’:
>      drivers/block/ps3vram.c:770:23: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 4 has type ‘sector_t {aka long long unsigned int}’ [-Wformat=]
> 
> Fix this by using "%llu" instead.

Applied, thanks.

-- 
Jens Axboe

