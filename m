Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556C24D399
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 13:13:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXzQM1T6GzDr7Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 21:12:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=raPLPjcf; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXzNd6Rq1zDr7m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 21:11:27 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id j21so839658pgi.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=O0JOI3uzd7ucCmR5qeZbGG+pRLYOys3ZnqIcbO7aSA8=;
 b=raPLPjcfRS5fGs6GsJeKHoRE7KZtMB/Kmt/+3TpNhYGZEkTmc9rqs5EaeEt2jXkwmR
 Pjke8YLKuCt52Qjfrrzo1cjJGbM51qa/lguoTsbuRVTntBeFV6YmmbbY91kIBTfhraZt
 ep/meXsgBak78BLiUDvktrLgzmxL4hY2nlMLVL2+jskO41rg2XgfixV0JeShCBEwUwgm
 Yfwnv4PKI0n4/IwHrjUQClJ3xVdb5ixzGgAZH867Y6KYjBhurxhwLe5fjo/8pWJU+JOg
 50NpKfxgOc2nACLFdQ9cfs9a4AaFxhk/lnmJj9JSeIi1b8zizgfXdoE1Obx8JMc2l11N
 2ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=O0JOI3uzd7ucCmR5qeZbGG+pRLYOys3ZnqIcbO7aSA8=;
 b=gsGpz/E3zYMQk7Bt7XaZ89KjgsKFc2v2k2dVHvpwMKI8sxrXQ7MA7kyzv9LPo0qU8V
 oQD1t1wXeDdtvxQ2ay+krGlSscveyoR/imK/vkjpoL2SKH4n1HHnWOGsD12Aow+4Rv6G
 VFrYF1LwL8NMySwMGacvXkodIguhaWsHfCB6Z5/wJabeyClunYLqRwE5nzD6b3oH3uWr
 nUAnyUC3X70+tiUVPIMUMQu9BcGEhTbUa9QvpfJNsoCYNBnkTEkK0WHDw4tCXOOJ0KYW
 cN2Vl3zltP6hlq1P3XfVfM+2nCCQMwzhE/uK1OnmMe7Y8CwKoFh9nXnu/phxRKAGp7PT
 CVJg==
X-Gm-Message-State: AOAM532sy8QUJGKZDEoO8kir1MiYaZf1eQa7QqRpmg5tZM6gPUa+06V+
 P3sq6Z8wdeet6fdZ16QA5ns=
X-Google-Smtp-Source: ABdhPJyN95KoCLSGpi+TFBy6i2yfFQWUvteLJM7qPop/EXa6ZcjYNEgf2G5C1Xl8hpt0GydW8Ox0Hw==
X-Received: by 2002:a65:6287:: with SMTP id f7mr1981459pgv.307.1598008285896; 
 Fri, 21 Aug 2020 04:11:25 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id o7sm1613042pjl.48.2020.08.21.04.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 04:11:25 -0700 (PDT)
Date: Fri, 21 Aug 2020 21:11:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 0/8] huge vmalloc mappings
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
References: <20200821044427.736424-1-npiggin@gmail.com>
 <bc7537f4-abc6-b7cc-ccd3-420098fec917@csgroup.eu>
In-Reply-To: <bc7537f4-abc6-b7cc-ccd3-420098fec917@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1598006399.kdw772nr6n.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of August 21, 2020 3:47 pm:
>=20
>=20
> Le 21/08/2020 =C3=A0 06:44, Nicholas Piggin a =C3=A9crit=C2=A0:
>> I made this powerpc-only for the time being. It shouldn't be too hard to
>> add support for other archs that define HUGE_VMAP. I have booted x86
>> with it enabled, just may not have audited everything.
>=20
> I like this series, but if I understand correctly it enables huge=20
> vmalloc mappings only for hugepages sizes matching a page directory=20
> levels, ie on a PPC32 it would work only for 4M hugepages.

Yeah it really just uses the HUGE_VMAP mapping which is already there.

> On the 8xx, we only have 8M and 512k hugepages. Any change that it can=20
> support these as well one day ?

The vmap_range interface can now handle that, then adding support is the
main work. Either make it weak and arch can override it, or add some
arch helpers to make the generic version create the huge pages if it's
not too ugly. Then you get those large pages for ioremap for free.

The vmalloc part to allocate and try to map a bigger page size and use=20
it is quite trivial to change from PMD to an arch specific size.

Thanks,
Nick

