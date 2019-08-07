Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FD84331
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 06:15:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463J7f5X0dzDrB0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 14:15:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Sos6KU0E"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463J5d3YyQzDqgw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 14:13:22 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id j19so22335733otq.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=53CVu6nkMcwWcWethACyNRgLyQL3v5f91offjpqNJ2Y=;
 b=Sos6KU0EByI+GdIj+zesAaN4T1xT+u5KZY3x1MZuvFnbDecWHCrxPBWzAMmRncYYiB
 t0wR9Txjs90Hqk78b3/9UQW2y1mWsiuqJTzWDrrxFLz9ukseyaOnBLdzWq8n3M1txp8j
 JXCyJd4TPKXXsqaEKix1njwuMq2tUDZR+pSQEQ+FHDQ2RJUzzUxRrHHW1cODRiyqqrZw
 F+CInaxhlavYCALv/jyTHv47GT7hYk0A/Mo/iY8jgYJs4lFYuS+Bl6aS32V+MAS9Z8U9
 KZX7cC3tPP3dLDepxHZbpDGO2KHhMeavs4d665Zem6KyiUDbHoMN62JmrAFf6wotSzOw
 ImEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=53CVu6nkMcwWcWethACyNRgLyQL3v5f91offjpqNJ2Y=;
 b=IdSNcJBNjZCg6iKzG4lApwiCr1mGbe0DSKfsZm0mJCciPR0LofwZU4eMDTWJiSQsiD
 Q9YB7k9qwIvpUz/w/+9ZgoyPoIgKpxTL1LrABZWLwtUZ94d+vavie6EC2lSvEZs1E5AA
 zg4bLAqzrjxBBEziP1pJGZw0MKts/zVBopJps+uDs+A5/TDwwVqKCZeFDSuSWS0WWwBV
 4r6/Cx9Dw+zJkOjPBblN5n21sUDUojUTVaQ60U9ODNJNXH34UIwQF5Pb9W6GfU7v/K02
 Andcmz2B4wg1JkkE2JU3XJbzpKrNCDQaxHGZANYUj0F2b3lJXAoOtQQ7fGBGwdDZ6RoO
 NVFA==
X-Gm-Message-State: APjAAAVQOVmN5PhQvoQjyWjd6QBAwfpAI5Tf6GCuTYio5gNRx28LQAx0
 IVyyzp+sJsaOqEm2QWwaHrLrK18qCUBUJ346tZ22CQ==
X-Google-Smtp-Source: APXvYqw2kdbG+cFiOIZegAx1eXDK/tUf/N7gRvYUA6TNNQFIGvh+9mEAG9J7TCpBWEvv/cr+etN0lMV78VVIsK/sqC4=
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr5762903oto.207.1565151197271; 
 Tue, 06 Aug 2019 21:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190807040029.11344-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190807040029.11344-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 6 Aug 2019 21:13:06 -0700
Message-ID: <CAPcyv4haXOjn7K-HgPV_WLqbfqRQbbiq=LvLt5Ue=OPAaBWN6A@mail.gmail.com>
Subject: Re: [PATCH] nvdimm/of_pmem: Provide a unique name for bus provider
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 6, 2019 at 9:00 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> ndctl utility requires the ndbus to have unique names. If not while
> enumerating the bus in userspace it drops bus with similar names.
> This results in us not listing devices beneath the bus.

It does?

>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/nvdimm/of_pmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
> index a0c8dcfa0bf9..97187d6c0bdb 100644
> --- a/drivers/nvdimm/of_pmem.c
> +++ b/drivers/nvdimm/of_pmem.c
> @@ -42,7 +42,7 @@ static int of_pmem_region_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         priv->bus_desc.attr_groups = bus_attr_groups;
> -       priv->bus_desc.provider_name = "of_pmem";
> +       priv->bus_desc.provider_name = kstrdup(pdev->name, GFP_KERNEL);

This looks ok to me to address support for older ndctl binaries, but
I'd like to also fix the ndctl bug that makes non-unique provider
names fail.
