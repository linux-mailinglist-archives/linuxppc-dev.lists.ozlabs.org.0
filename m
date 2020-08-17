Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4B2475F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:31:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVkgV2TypzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 05:31:34 +1000 (AEST)
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
 header.s=google header.b=lfkmiNvf; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVkbn3SsqzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 05:28:18 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id ep8so8133392pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 12:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/K/jgK8f2b3gfIxZCz2aodMs51/j1UmWIbA0xQ4Rg4o=;
 b=lfkmiNvf7aWyMq4W/ABS66AbSGwPDK4/gSe7KpUo1u+V3ZDzJYaa4SZCJM35LFoSeq
 uypWUeCVnbtPuTlC6Lv32YnGX41etwb0Tro5sTqJv62MgvvHNClJfRyjsQ85Ou5LahfA
 L3x2mLvPon1Pa5RiuLmxjerV4ytCXX9sKlZ2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/K/jgK8f2b3gfIxZCz2aodMs51/j1UmWIbA0xQ4Rg4o=;
 b=G0NS8ahNfIFckn5OcDfB6kP7LqNbMB5IubUtGU8hxdqcbbxL9kTo2aZFeRfryDD0/p
 m6F4UQ7ey9nm92ldmLBIdquHtSqN1Yl55PAEpdDGKXr/nxQaNYm5IfBKPwHLJGCFcuvy
 mX+67WcTesGx2fEsjVZ7E9Q6vRk4lGhqZTpeghT0C5AV1O5UXWJc55Wk5OfJJIiyeuJN
 VwLaWM8Vw6NDBkhmJfl0sWvFwrJ6+Id2c4uD+8lJLBfqeXCYWIcqQIFR00jpITi191cl
 +Y6Ys6MiNw/54EK/WthKcMN2anpWtV6a/ohOnKwgxsAd3yi91zxlv8q8PQ8mFSuKM4qB
 +T/A==
X-Gm-Message-State: AOAM530MpdSWX1wipPvPgr/JhbKxQUHrY8lJMOT4CWlwJUc2fN75WHTv
 Beh6Z9AHp1T/YG9sxHTobGMbVg==
X-Google-Smtp-Source: ABdhPJxQXWN+Ph7ND4lvHYfqN6PVhgPAKtkPfn8HjEia6Dm6hV0gw3K3eYh80/xzuqoQhRxCjmbyAw==
X-Received: by 2002:a17:902:8210:: with SMTP id
 x16mr12901228pln.166.1597692494753; 
 Mon, 17 Aug 2020 12:28:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b25sm20700960pft.134.2020.08.17.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 12:28:13 -0700 (PDT)
Date: Mon, 17 Aug 2020 12:28:11 -0700
From: Kees Cook <keescook@chromium.org>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH 0/8] scsi: convert tasklets to use new tasklet_setup()
Message-ID: <202008171227.D3A4F454D8@keescook>
References: <20200817085409.25268-1-allen.cryptic@gmail.com>
 <1597675318.4475.11.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597675318.4475.11.camel@linux.ibm.com>
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 shivasharan.srikanteshwara@broadcom.com, linux-kernel@vger.kernel.org,
 kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 Allen Pais <allen.cryptic@gmail.com>, target-devel@vger.kernel.org,
 Allen Pais <allen.lkml@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 07:41:58AM -0700, James Bottomley wrote:
> On Mon, 2020-08-17 at 14:24 +0530, Allen Pais wrote:
> > From: Allen Pais <allen.lkml@gmail.com>
> > 
> > Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
> > introduced a new tasklet initialization API. This series converts 
> > all the scsi drivers to use the new tasklet_setup() API
> 
> I've got to say I agree with Jens, this was a silly obfuscation:
> 
> +#define from_tasklet(var, callback_tasklet, tasklet_fieldname) \
> +       container_of(callback_tasklet, typeof(*var), tasklet_fieldname)
> 
> Just use container_of directly since we all understand what it does.

But then the lines get really long, wrapped, etc. This is what the
timer_struct conversion did too (added a container_of wrapper), so I
think it makes sense here too.

-- 
Kees Cook
