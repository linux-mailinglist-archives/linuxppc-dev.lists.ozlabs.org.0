Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7151C162
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:30:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4534W512l7zDqM4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:30:57 +1000 (AEST)
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
 header.i=@intel-com.20150623.gappssmtp.com header.b="ca7lJ9q1"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4534Tl1Z8fzDqGW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:29:41 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id t187so7790555oie.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vL7R6NOOH4/SZmC8qbbcIighH9Rr6CdIXeg8QuQUhw=;
 b=ca7lJ9q1TJHOspurY5SiG+tHkkdWZroHZnYXr6E1fYxTHIglIKUUCOOdV0IxjunZzr
 +zcp8l1ucKONHdlsOcEiB2Zy9W9Pni/ehn3I2g/oEjDJLcZKRAb2UaLPO8k8MQCtRQX+
 ygYmAqQCzVfQKkhtwKl8RVXgOpV9BbBWb1iCf1p9juBMVTtoRq7zo9b79O9kM9J+q+yt
 9KC4mIC5sgRMvbh0rjBGPLV87kAnDQ7Y0Cf+VI9uvMjJjlqzD51foAlUir32+gYxLWsB
 k7wTsfd4zq5WbTXDUqS9sBC7lUUFQo5ZjJZQcy6DReMx5iYolN0vSuVSggR2SNCwWpDB
 R4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vL7R6NOOH4/SZmC8qbbcIighH9Rr6CdIXeg8QuQUhw=;
 b=F/CwHlxYqpRHnguqoLtSNbcnixlRiniQFT636rSQyUaU5p9Sdc2m3Us2i9sVbBeH2R
 MzrjxnBFh+7o6BIPHx3MRfU6MPOaIpDNr25a9G48bRmiQhr5Dy9JTjKGw9AehXWzfMrT
 YkWKn99Q9JOp+BLiqDFTu9PeftpzwRFnWC7XrlGWO3wS3uSwYFaPlahZMERHdcLMO9KN
 l7v3Cv3aG1WK8eo+PciTMdjqNES8BQhYjloVgJCnVxqLBBlvfD5HN3ENjsxbIwAvzxGd
 7DMkTEuup9fkQFUC2mOIJicqQlARAzc7POq9zUR+NvupVIKmlbKpg+e65LMUYsSzz/sv
 vY4w==
X-Gm-Message-State: APjAAAW0ohNiGIpiOGGPsupiQ+Dk6UqANlJCyoBhwWqZA1Mix9+kRW06
 PqIq2EqYijXEF5fcDE6b0wNNIUHXrT8A9QFEsElpcLAu
X-Google-Smtp-Source: APXvYqzLwmq4m9vHhU9l+xYTiYeGeku1c2XDiTm1WK0D+0mp/qoqdLnVFB1/BBjQKk2+37HqJ9cVipeEEeNJglytCCU=
X-Received: by 2002:aca:4208:: with SMTP id p8mr1834968oia.105.1557808179717; 
 Mon, 13 May 2019 21:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190514025512.9670-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190514025512.9670-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 13 May 2019 21:29:28 -0700
Message-ID: <CAPcyv4hgNUDxjgYNkxOXJ9hfLb6z2+E1yasNoZNDKFUxkCzWLA@mail.gmail.com>
Subject: Re: [PATCH] mm/nvdimm: Use correct alignment when looking at first
 pfn from a region
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

On Mon, May 13, 2019 at 7:55 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> We already add the start_pad to the resource->start but fails to section
> align the start. This make sure with altmap we compute the right first
> pfn when start_pad is zero and we are doing an align down of start address.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  kernel/memremap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/memremap.c b/kernel/memremap.c
> index a856cb5ff192..23d77b60e728 100644
> --- a/kernel/memremap.c
> +++ b/kernel/memremap.c
> @@ -59,9 +59,9 @@ static unsigned long pfn_first(struct dev_pagemap *pgmap)
>  {
>         const struct resource *res = &pgmap->res;
>         struct vmem_altmap *altmap = &pgmap->altmap;
> -       unsigned long pfn;
> +       unsigned long pfn = PHYS_PFN(res->start);
>
> -       pfn = res->start >> PAGE_SHIFT;
> +       pfn = SECTION_ALIGN_DOWN(pfn);

This does not seem right to me it breaks the assumptions of where the
first expected valid pfn occurs in the passed in range.
