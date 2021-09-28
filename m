Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B073D41B555
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 19:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJmzV3y9Tz2yyh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 03:42:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=bA7yAxAI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=bA7yAxAI; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJmys1sZdz2xY5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:41:40 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id r2so21972139pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WkidfBLNDflGiXs0oP3mDBZ5il/79hD91IY+k5Xsxuc=;
 b=bA7yAxAI4PivPTDL2tmtUWSug8cFLm+Lp/M/J8tWpOX7VThwyhD1uHRnHWyn1gypjz
 /XzmjC9sfErVDuGFsyJvSSHvvhu9nQ7Kso3E+RGxpZnlV1rpwx4LYj/P5l6Z38Y/UEfp
 dNeWL6kK9unlsA8wG5GEhkIZ+4tvRDOMk+TJy7HzL9rdoix0FJNsfZcPFnfoMkxbst93
 a/G0KXVU8o79EfFIKtiBKh5+QiY7b/PJds1zfTAHCkczgYa7RB5dkQrraBWKo6v3QHEl
 TcfvQ5mM+1T1aqcT9TKMJNtVWXVgUrfew9Eem3OwSym9y2/TAeOib1Yk9gpHI3xIahD9
 clDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WkidfBLNDflGiXs0oP3mDBZ5il/79hD91IY+k5Xsxuc=;
 b=XPl1abJQ1Wg0g4vn/74C0qtEmVuMvFG3EVAfiRNPp0WP3IIhn15B41PVx++b/3wvfg
 Yokke3jQkFQj3y9QNj/pQnti5ypHr0B1+SQhzplbBDr1OHJY5Sxdv80ZuuDz2bifkCfC
 8Hu4KbmlpDyaBJjp4t7Y93Z54+0YPoa081nLZdx6uFiVHaK0WOg/Ciue2a5pJW2oou0g
 CdYV2DdpG3tXoXQZYXq6Sh5Yc8leJGrGyrt8QbgSJ8AER6WXlYKY3SY2bdbb/Ms+eYDY
 03VfBQ0l7dLKjKSovPUiaJZy6wJfk2ccR8TT0Qkv7qi0Ic7CiXrjXElOnKJCad2Xtn9/
 hQ/w==
X-Gm-Message-State: AOAM531qH1EW5chLzYSkK/g2If7C0mQkITYPOKJkglSpSJCQ8xfLgo9w
 8GcCQB8XrHPDscQ8gx57GibVlIaZAlF5POqCkf5Q8Q==
X-Google-Smtp-Source: ABdhPJxE685ihjSuTSw0+w9d2q6ixqqWA3MsNeG+SfMab1LeeuIrmS8uWL0F1Ylm1UNzWyahPTQwxwoyCoYk+d5LLKY=
X-Received: by 2002:a63:1e0e:: with SMTP id e14mr5684055pge.5.1632850896968;
 Tue, 28 Sep 2021 10:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-6-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-6-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 28 Sep 2021 10:41:24 -0700
Message-ID: <CAPcyv4j5aRTEX=FDjYv21J0uDWbP66j-xaDPkvjmwdnKmvAWDA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] cxl/pci: Make more use of cxl_register_map
To: Ben Widawsky <ben.widawsky@intel.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Linux PCI <linux-pci@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-cxl@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 23, 2021 at 10:27 AM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> The structure exists to pass around information about register mapping.
> Using it more extensively cleans up many existing functions.

I would have liked to have seen "add @base to cxl_register_map" and
"use @map for @bar and @offset arguments" somewhere in this changelog
to set expectations for what changes are included. That would have
also highlighted that adding a @base to cxl_register_map deserves its
own patch vs the conversion of @bar and @offset to instead use
@map->bar and @map->offset. Can you resend with that split and those
mentions?
