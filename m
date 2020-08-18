Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0C248EFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:46:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWLyd3PbmzDqCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:46:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=gNipVl2c; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLvD1YhMzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:43:51 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id c10so110562pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=07d8bMVK8nskANdMOYMjUqMmsVvTMTJi5HKNDrCq6hQ=;
 b=gNipVl2c+/nOxG5DyICzsidC3YlLij/C0CSl9peKhMSGPdUxsXnT2I6jx1kAORkjSM
 C4tUBV/kkenul4r6W7N5KQ16Bh0uIaoVMq7cUDJ6zjUKb+A1eOTZL2eQQRD/BSFPFViq
 XVn0GEFQYbcbug0N+pnDa6t3XX6fNZsvlwQbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=07d8bMVK8nskANdMOYMjUqMmsVvTMTJi5HKNDrCq6hQ=;
 b=IfyH+qmYJW+zPrJmegodvGAHR4NUmgT89/uvwGeNnEfHpnlcAahNBw+Elwb79B8JgU
 YueZtK/+hgEnpxr6u0iEHvXxQ1e/n2jy+gCIm2LA0D9Ukrun8Few3Oc0iORuKFmkcUZv
 lAuyt0gX9eX9GqXdD+qsuGq8q9c0cxblOULeQFUpmwTfljQKSj4I8GC17FBceTEujw6d
 zuwPRveYzGH6/uBVFAPX+guipOsov0QiKbNMQ5JpBaIp0V+wVboVAV2YjrHbP0TYedBp
 G9C0wHZY5NVGH17ZXjHIeAtxxtgTOFLB2sbSVVKEl/kWyUT8rZfXkURCrKyQo060+BcR
 rytQ==
X-Gm-Message-State: AOAM532Y8yJ+6IwK+cqCJdU7t7LmrdZkaZCYJo3LprHHX5JY/gYSN9JA
 uw+YYS0QU44v2SdxvhhrFR1Ukg==
X-Google-Smtp-Source: ABdhPJy2gMhr8aECJvzZ3Ns6OMWEcvMDndJrwdoYkKTN1hLvIYEOowwCdxTiZwMiBrBTpO1TDIVE1g==
X-Received: by 2002:a17:90a:5298:: with SMTP id
 w24mr1102634pjh.221.1597779829365; 
 Tue, 18 Aug 2020 12:43:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y1sm27334312pfr.207.2020.08.18.12.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:43:48 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:43:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/11] test_bitmap: skip user bitmap tests for
 !CONFIG_SET_FS
Message-ID: <202008181243.162DE4D@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-6-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 09:32:06AM +0200, Christoph Hellwig wrote:
> We can't run the tests for userspace bitmap parsing if set_fs() doesn't
> exist.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
