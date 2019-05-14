Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC31C121
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:00:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4533qV1QG4zDqLw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:00:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="A2pj2SEK"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4533pD3J0rzDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 13:58:53 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id u199so11074572oie.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdKct2xWm3ro0UBx8IVBS27dWaO8IEoUZaes/VXIAl4=;
 b=A2pj2SEKTSfipz0FKt48998bkaQjibSO0LrmPxJdhCviFLeLqezE2NwsTX4vLH0VNN
 7xPjJIoF74QtRsYvEoXUHinuYdzzF5t1YPQzLcoSf1zZyfajYgYJytcipJK5FUl4Mlny
 oviyWw8fv6yYkIB25nhyDFRvcpnhzsjlwirqdt/oOQWZcHncrbGzYhiTtAjHM/VwdoEx
 Z465FZGgCDqTJ0zF4ouRHd18tdhCEBUne41N5akjLyQ8er4GGX4sekH7adfb/pd/UYoX
 0JlPQOYpuryFUc7/W+CvrWhxds7OkTfp/G5tbIeQgp+qUrgpiMmQ0vY4MNA4R4UcIx9f
 VCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdKct2xWm3ro0UBx8IVBS27dWaO8IEoUZaes/VXIAl4=;
 b=CYj5DAUwTzSinqsnp8QQdJplSvI5wpRmSQSznXWDuzl+9KRF+id2e36L4yPnR78paX
 pRGU5PncPHkwYLwqTGJ8renZbwt9r+3PboW1fXbbW0K8cT3C8jCkAvwYgZ226WJypGdY
 /+cXFPGMO2Nu7GgIb5usQqAkiv98Lft2TUEKFgpto5WEGm3cOzRRPI63KrjJWuLYksMH
 QR6eIxtobX1bppd6fECqur3io9JfDWuotwkKDPIApaoEd5NhNUMRKHrF7FlodmQubzoW
 cRpntIooC/zYFU9PSTgJHOhQ6pzKNZc/bdULNqqnOpHz2Go14svju+4TiFYgspw+ohDM
 CHew==
X-Gm-Message-State: APjAAAXLDz/yr8fZmIw0onoJDCRKR7DIoSFLYmTBzLIF9OfVQ7ARf/o7
 REH9SD3Bmnmcxl/IRMapFE4XMP3DXLwVQz7CL2Qw3ILo
X-Google-Smtp-Source: APXvYqyCSekgO8kXJLyc6cL4sAJ4FYAjlvDT7H8G1xatSOxF0udFUauTtFneyF1PCwUl001x8VvXU+z2TeI3qINqNDY=
X-Received: by 2002:aca:ab07:: with SMTP id u7mr1650949oie.73.1557806330382;
 Mon, 13 May 2019 20:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190514025604.9997-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190514025604.9997-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 13 May 2019 20:58:38 -0700
Message-ID: <CAPcyv4iNgFbSq0Hqb+CStRhGWMHfXx7tL3vrDaQ95DcBBY8QCQ@mail.gmail.com>
Subject: Re: [PATCH] mm/nvdimm: Use correct #defines instead of opencoding
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
Cc: Linux MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 7:56 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> The nfpn related change is needed to fix the kernel message
>
> "number of pfns truncated from 2617344 to 163584"
>
> The change makes sure the nfpns stored in the superblock is right value.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/nvdimm/pfn_devs.c    | 6 +++---
>  drivers/nvdimm/region_devs.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index 347cab166376..6751ff0296ef 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -777,8 +777,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>                  * when populating the vmemmap. This *should* be equal to
>                  * PMD_SIZE for most architectures.
>                  */
> -               offset = ALIGN(start + reserve + 64 * npfns,
> -                               max(nd_pfn->align, PMD_SIZE)) - start;
> +               offset = ALIGN(start + reserve + sizeof(struct page) * npfns,
> +                              max(nd_pfn->align, PMD_SIZE)) - start;

No, I think we need to record the page-size into the superblock format
otherwise this breaks in debug builds where the struct-page size is
extended.

>         } else if (nd_pfn->mode == PFN_MODE_RAM)
>                 offset = ALIGN(start + reserve, nd_pfn->align) - start;
>         else
> @@ -790,7 +790,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>                 return -ENXIO;
>         }
>
> -       npfns = (size - offset - start_pad - end_trunc) / SZ_4K;
> +       npfns = (size - offset - start_pad - end_trunc) / PAGE_SIZE;

Similar comment, if the page size is variable then the superblock
needs to explicitly account for it.
