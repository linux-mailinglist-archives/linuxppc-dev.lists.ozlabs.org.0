Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC53557DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 17:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFBMd43GRz3bqX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 01:31:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=DVtq8pcz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DVtq8pcz; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFBMC1K1Nz2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 01:31:17 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id g35so5865739pgg.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FVR8clygzLUFKEPmLFMXFMAq/CEtkPBvYlQe7K+S0wM=;
 b=DVtq8pczW0+cPS/j2Z4qsIjU8D6sXeTAZp0sJuYcGT//v+pcWVzgzeggqfSOCHIP7M
 rILDfEGbGmafL7JwZawTzoIZs7GVAmY+weY26PDox6YhskP0OXFCki0ccJxwlH8TV/kx
 mir+4UQvTB5mzWtJmbASNka+wqB5sSusIK8SSFmaMuxMjsxbmqJ6/P1YvUGX2YNhjdJ4
 +lwAkcGy3ZyV76N3M6c36RLCdfpMOi9BXUqRqgDJlyzLGbgYj7Z5IVh1B2jCEBxmDwae
 rqO3dknEyTTrdxNTd/y0KLOMds3UPKl49Q6kTuqMt47SDlIlXVAY5njn5Jwsq2SBTuXN
 UBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FVR8clygzLUFKEPmLFMXFMAq/CEtkPBvYlQe7K+S0wM=;
 b=PFcRV5/iX29d0IlNSQS/QdnoYyvaFjFkuYmSdDTT6bDJV2DKjWx6D01OaDYPJjyVeP
 D8jbiP7s16wWlPMtxdhtJRUGaLv4BxxUqQdCU9wMpuMvwV/hzmznp5w8YZJZbkRAJ5Pa
 rbbRlFsI+gFogHuiLcZO8SAWfWN2d7LUAMX8SonuGXY1E4qr8ccHBziRChzqkwSzVAUZ
 TnXsK3QpVTMJwZ8hb2jcEtNNZSO/tDrPK9Z10qFOxD1VmTUaU+MsW/RDWwaIrCenKcOb
 r0ZCLHqleStaps42X3zV3yIdhHbh1XmeY2tQ35Ttp1NOqNcKNFiCSNnvIbYzRcn4kHID
 +DiQ==
X-Gm-Message-State: AOAM532LvVWfe+1AKPdaD9ZcSfp48KNZYvjLI3MaeYBdtIEqvB9KtSRF
 djV6fS8SQJ6EykYt8BD4pkJn+XFcfNhnSQ==
X-Google-Smtp-Source: ABdhPJwLy6+3XFFIb/kUj2Zi2Kpcjuq1vEVWRCe2DwIsxwTXQsvD7YkWlZhyg7Rnv+jccqvyAm8stg==
X-Received: by 2002:aa7:8d4c:0:b029:21c:104b:f6cb with SMTP id
 s12-20020aa78d4c0000b029021c104bf6cbmr27683675pfe.26.1617723074063; 
 Tue, 06 Apr 2021 08:31:14 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 kk6sm2953044pjb.51.2021.04.06.08.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 08:31:13 -0700 (PDT)
Subject: Re: [PATCH] swim3: support highmem
To: Christoph Hellwig <hch@lst.de>
References: <20210406061839.811588-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <5b1e84c0-afbf-389d-2929-d92e914e2613@kernel.dk>
Date: Tue, 6 Apr 2021 09:31:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406061839.811588-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/6/21 12:18 AM, Christoph Hellwig wrote:
> swim3 only uses the virtual address of a bio to stash it into the data
> transfer using virt_to_bus.  But the ppc32 virt_to_bus just uses the
> physical address with an offset.  Replace virt_to_bus with a local hack
> that performs the equivalent transformation and stop asking for block
> layer bounce buffering.

Applied, thanks.

-- 
Jens Axboe

