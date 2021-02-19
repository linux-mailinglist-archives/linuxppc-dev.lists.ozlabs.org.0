Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E251631F56D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 08:46:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhkD06pPCz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 18:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jkCRi8fw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jkCRi8fw; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhkCY3vJYz30RR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 18:46:00 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id r2so2899883plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 23:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NT29Aq6GZEcythHq+8xV0bdKo/+iRT415c6oc0P2LMM=;
 b=jkCRi8fw6mKJu2CJVxprPAlpsVPevMqO82EY4jJLdgDTuZVfK+cFcf6N04sds0NWIG
 g2K1qEcDYGaCPVIaLUOUvFJqshuJWH95kgkNAkrvgEs9e3AxnBKZNkPl91O2qJXxKjtO
 39m5bumf3eoBQIysURVFRtASsCZ7sosNd81cNGCEUVrYEUAJaZyoY2NXj24lt4HGE8tN
 ym0U7IgAW/twVDi+kzmRkoHgE12bfG7UHtNzC6rzQG2kloxXSg6vqv8gJ5tdPgUPi76K
 WrowOqaj63HjnTxD6sVIqhcTwM8N0Tey4EJtf8NuluPptIh4PZJJWvBFTWLSVQBMVgFz
 4u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NT29Aq6GZEcythHq+8xV0bdKo/+iRT415c6oc0P2LMM=;
 b=eoNP5AEda4HLAFUHxUfmCdfSQFnCy00ZeM/qh3rjUko/gZdCAbytABZH6L1wrbNos+
 S9eZxNTV+suNFvdfgAfpFh0istfz5wC6b7Julxbw3mgUiyW9ZrQjWdGNlIYSKOuxeclm
 UtmNIy+ylllVpWV8gXgVbbvdIqvLKiQHr1zcK8XEMV7zFGtafvLH9da9a9gA8aRjXdDj
 K2GXdWiLEVq6rWAmpb6tf7Sd9tAwQdTZtVFQm2LfTX4/KxKaluvWHGqgjkh71NU8DWmj
 sfyzoEDjYjlq+VhIjzpSdGr76g6GELC2SA9Fs+rjVy8iVN1y1H/b5/MLQx7dwg6XU8zv
 269g==
X-Gm-Message-State: AOAM533mIRJHAlT8mAl5+1TLzrmZiokWo3ZJSUw8DoT9mFN1Sl3RaN6A
 5wRp1hScnXRCrHXtLQGy2Wg=
X-Google-Smtp-Source: ABdhPJw+jFkauS9YW6sy6aFIkTwI+asLmyHYBTpOgq6M/ukmSzhFYihO1OShoOb3e1vitsi8p7WftA==
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr712101pll.0.1613720758458; 
 Thu, 18 Feb 2021 23:45:58 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id 184sm9079328pfc.176.2021.02.18.23.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:45:57 -0800 (PST)
Date: Fri, 19 Feb 2021 17:45:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v12 13/14] mm/vmalloc: Hugepage vmalloc mappings
To: Andrew Morton <akpm@linux-foundation.org>, Ding Tianhong
 <dingtianhong@huawei.com>, linux-mm@kvack.org
References: <20210202110515.3575274-1-npiggin@gmail.com>
 <20210202110515.3575274-14-npiggin@gmail.com>
 <e18ef38c-ecef-b15c-29b1-bd4acf0e7fe5@huawei.com>
In-Reply-To: <e18ef38c-ecef-b15c-29b1-bd4acf0e7fe5@huawei.com>
MIME-Version: 1.0
Message-Id: <1613720396.pnvmwaa8om.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ding Tianhong's message of February 19, 2021 1:45 pm:
> Hi Nicholas:
>=20
> I met some problem for this patch, like this:
>=20
> kva =3D vmalloc(3*1024k);
>=20
> remap_vmalloc_range(xxx, kva, xxx)
>=20
> It failed because that the check for page_count(page) is null so return, =
it break the some logic for current modules.
> because the new huge page is not valid for composed page.

Hey Ding, that's a good catch. How are you testing this stuff, do you=20
have a particular driver that does this?

> I think some guys really don't get used to the changes for the vmalloc th=
at the small pages was transparency to the hugepage
> when the size is bigger than the PMD_SIZE.

I think in this case vmalloc could allocate the large page as a compound
page which would solve this problem I think? (without having actually=20
tested it)

> can we think about give a new static huge page to fix it? just like use a=
 a new vmalloc_huge_xxx function to disginguish the current function,
> the user could choose to use the transparent hugepage or static hugepage =
for vmalloc.

Yeah that's a good question, there are a few things in the huge vmalloc=20
code that accounts things as small pages and you can't assume large or=20
small. If there is benefit from forcing large pages that could certainly
be added.

Interestingly, remap_vmalloc_range in theory could map the pages as=20
large in userspace as well. That takes more work but if something
really needs that for performance, it could be done.

Thanks,
Nick
