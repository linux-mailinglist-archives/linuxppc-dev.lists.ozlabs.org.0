Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A8310F10
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 18:49:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXNFt3sJLzDwlp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 04:49:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=2Nd371ZR; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXNDG51t5zDwl1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 04:47:36 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id y8so9752137ede.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 09:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xTcvmR9l8LCQBXYg8Iamhidu+elg0BguOpYiNarlS1o=;
 b=2Nd371ZRFVQhcLDBl+lgRXyePXWtyxYWOJdoibdtLDcVEPAclIT57bv/pttx+PCAXR
 hBmJqxqgfkeJaWMPk9JEWID8W0MRGpAu8y556s92b8BOiCmeYQ6ZGW0sLzda8+8lkAbp
 REgbCb3PieFZYRK20QJtBpT5y9Gn2ftYABRS3BLWsPMs8l2VQ97KjoeIOTWmjieqzD3b
 LEeBHKLecTpcdbD+HURjvm7ywhsihC8aaKh3ZPEkc3zgMRIWk2Ul9f2HlG26KsUDHAcS
 1YNsz3o+EivN53VES30cyx/UUga7OecedJiS53u8xBsqu/Mo1pb+A85aYj/4cOJ5B1fU
 7Akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xTcvmR9l8LCQBXYg8Iamhidu+elg0BguOpYiNarlS1o=;
 b=Iy/eqbjY1zUfxQqd/SHCsm47DygXGBN4H4F1nPlopOeUXY6mtMx+rK3MyMPXm+uoZL
 Ap6tkSOtKJRQvhq0b+DCCtBEvhHOauLuxjx4LJ9ywaGPuhgEvI1uzyEwBcvM5Hcw8UZr
 TKWEy5VpdFNuHF5JIID26JtASlLkzk2eVe4docfpPvBweUPwsGLlAcncGtdoL03qMg94
 6BMdTnrXae+JnlvIsxjUiTlPTLYGv+hDSzsZ7ih+3mFStl8ZikCxfaYdLOa8ZXL4qmXV
 KWUFSboP7tV6woCL+D7szRb6Ez/KxeDhe2Jgloxyc8ElCRmXJT1Zg566DJGOmRcwhRgo
 L3TA==
X-Gm-Message-State: AOAM532aHglDHDfU+lkoLDR4A31KjC6obFdOvAhZuANBOLg9jCUBr5Y6
 sn1Iyqv844sXc7OS8hupM80uWcbolJeJ/2ZhgIpCAA==
X-Google-Smtp-Source: ABdhPJwQ2HYUuz3zhFYfjA72qO6TZMVhKCjykClJyTdj6jByOo8Ou3oLUV5Ufxp7SoTjx4LgEXWEPC1cSmHtgRC1EyI=
X-Received: by 2002:a05:6402:3585:: with SMTP id
 y5mr4539433edc.97.1612547251549; 
 Fri, 05 Feb 2021 09:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20210205023956.417587-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210205023956.417587-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 5 Feb 2021 09:47:32 -0800
Message-ID: <CAPcyv4ghvBwKa6pCfqLxUU9UhK9R3HY4tNrNO115QN00A8zMRw@mail.gmail.com>
Subject: Re: [PATCH] mm/pmem: Avoid inserting hugepage PTE entry with fsdax if
 hugepage support is disabled
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ add Andrew ]

On Thu, Feb 4, 2021 at 6:40 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Differentiate between hardware not supporting hugepages and user disabling THP
> via 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
>
> For the devdax namespace, the kernel handles the above via the
> supported_alignment attribute and failing to initialize the namespace
> if the namespace align value is not supported on the platform.
>
> For the fsdax namespace, the kernel will continue to initialize
> the namespace. This can result in the kernel creating a huge pte
> entry even though the hardware don't support the same.
>
> We do want hugepage support with pmem even if the end-user disabled THP
> via sysfs file (/sys/kernel/mm/transparent_hugepage/enabled). Hence
> differentiate between hardware/firmware lacking support vs user-controlled
> disable of THP and prevent a huge fault if the hardware lacks hugepage
> support.

Looks good to me.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

I assume this will go through Andrew.
