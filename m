Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB135D780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 07:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKF7f0PP9z3bxF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 15:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KsDrrWyj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KsDrrWyj; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKF746dvYz3028
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 15:49:50 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id j7so11884060qtx.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 22:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=mD523XYWL5LGtTDQ6WsvNEB3UAUTtlnCgbVBIrgqbG8=;
 b=KsDrrWyjcDfqTt9qLGi6CF9ba832s3mKKUz+1P2rEs2m6vN8QeoChkPk+aXcqZSx7W
 9jx60anCX/QpYoj8uuTcBKlXujOclgwCBcspwLcnmgvPGDA7xVOa8TBATFaNyr9rnunZ
 adyHg3XDRKEjGToPCoHHSquJqX0nUO1WAcKbVB0rZWzi8aBcM4F+GCd6U+lhgmvBChrU
 JhHEdRUAa92dxGQBiNNjgKnlfUuMA4nBLBArRo9QMYvjFuZX1qh7MiyqthrhfdH799Xt
 vs0aS5G1VebZhuu4xzRl28K/yXzO02N1uOiF2h5GR+VXiDbuQJscIwKZhjst/QGsOtlA
 qygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mD523XYWL5LGtTDQ6WsvNEB3UAUTtlnCgbVBIrgqbG8=;
 b=esN4q1/lOE1LZgSCvdndMAWndFyArKS5tzkhLi4UTQLsmuisXHFz/wHgdsRVE3Ots+
 nal2cOWvsnpMMpBvwejNMxChmozEGa0QqfNReKEW6KyjtlKBo+wMZGbQXHUX/hde8FKm
 m839WQm1apwit0YLtfiT5RQUsgofhGCtBxzn2oJerMi94QTelg8ZIFgRkpeSkwK+8g3V
 h9mPm65xUZP4aKxIpyMp289WKa6s9cePsuRVhA0zZxMcgtpZad/MYIjcVPGlNcX+1gwm
 tOeS6t7gYVf1mbThD9XC0Zgj23TN1mLY4uVzhAGtw06hbblG8r1TSrMhBiptJ+qlD2KC
 51zQ==
X-Gm-Message-State: AOAM533AnBTa5fbjVyr9qAAOcqtgf89Q2uppo4fDv/dU2lDmrxaJkjTQ
 JCgnYAmzwgMBA3E7cJmW5Rk=
X-Google-Smtp-Source: ABdhPJyGdGhUwyzIrHHbNTlfK0RpjG20v5+3IUa5CbV32sqKapA8PG/aJnVd5o7ziiZbmXCR6Avyxg==
X-Received: by 2002:ac8:5f0a:: with SMTP id x10mr7309172qta.143.1618292987022; 
 Mon, 12 Apr 2021 22:49:47 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id q15sm9087079qtx.47.2021.04.12.22.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 22:49:46 -0700 (PDT)
Message-ID: <0c6eef8181aeb69d69ce72ec86c646dfa7591414.camel@gmail.com>
Subject: Re: [PATCH v2 13/14] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 02:49:41 -0300
In-Reply-To: <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-14-leobras.c@gmail.com>
 <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the feedback!

On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> > -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> > +static phys_addr_t ddw_memory_hotplug_max(void)
> 
> 
> Please, forward declaration or a separate patch; this creates 
> unnecessary noise to the actual change.
> 

Sure, done!

> 
> > +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
> > +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
> > +		iommu_init_table(tbl, pci->phb->node, 0, 0);
> 
> 
> It is 0,0 only if win_addr>0 which is not the QEMU case.
> 

Oh, ok.
I previously though it was ok to use 0,0 here as any other usage in
this file was also 0,0. 

What should I use to get the correct parameters? Use the previous tbl
it_reserved_start and tbl->it_reserved_end is enough?

Best regards,
Leonardo Bras
> 

