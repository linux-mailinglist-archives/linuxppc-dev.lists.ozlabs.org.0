Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B53E87FF4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 15:05:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNAeT70P;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNAeT70P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzYQT27GPz3vXV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 01:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNAeT70P;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNAeT70P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzYPj1q00z3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 01:04:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710857075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8w0eeleNwYf+7p/hWMlw61q+s/j0K+e36TEHXQ6sQvU=;
	b=UNAeT70P6dWCHTAtRa1DRYA3iIbyZjtwpT/Jq7RnlaAoqDAzpK9HtBUkjVMuucrG+RrlEc
	JZklrnpLniS8X8mnnArWzFZYIuCFLjilxfIxpXvwPOv6+d1I1n4m5nuVqTRepvH93M/YsL
	7i/We1qwLx0rF/ss+KEG2Lc2vPaGB6g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710857075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8w0eeleNwYf+7p/hWMlw61q+s/j0K+e36TEHXQ6sQvU=;
	b=UNAeT70P6dWCHTAtRa1DRYA3iIbyZjtwpT/Jq7RnlaAoqDAzpK9HtBUkjVMuucrG+RrlEc
	JZklrnpLniS8X8mnnArWzFZYIuCFLjilxfIxpXvwPOv6+d1I1n4m5nuVqTRepvH93M/YsL
	7i/We1qwLx0rF/ss+KEG2Lc2vPaGB6g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-26Ly8pCfPEydSPBL4azZ0g-1; Tue, 19 Mar 2024 10:04:33 -0400
X-MC-Unique: 26Ly8pCfPEydSPBL4azZ0g-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78a0e8a60f8so17972085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710857073; x=1711461873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w0eeleNwYf+7p/hWMlw61q+s/j0K+e36TEHXQ6sQvU=;
        b=EVdjWpDO2O/mydwRPmcM1/kchknxxGr4tw8rx4fv9Yf0t4EgXipndr0xnvRsGJC0XA
         222ZP45pHOyuiWb2IdbBoC2LQXSZHDqoFlAqFfZyAucBHHxBkrbid5nyTMr2M5uDC+iW
         tRfIYjBNk0BSonFvNhgJjYO5r/iG5jr6AQqwxKitdu27nWZG3VnpC/C+FurCBzBgyrox
         1Uz+eFh3ET/l5cpO2BWCGkzNTMDhC8voSssynO3wii9ODFBFD0ZO3G3jWS6xIZN64qf6
         E7SebEVCQaG/3Z+RkBx4Q/VFGSrxmRiINMysJ5kBXycKvIZT4F6zuCTerf54SsZaBvUL
         pj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVictGc1q0RGQWvV2JI5s9kzUnQlXe+WfOsMHFFGZJCjLsKa5T011VpaPoAsp3/I3uGNSr0t1j4Pdi3yFs3N7SbhyTM+9DO0PPZhQ82jw==
X-Gm-Message-State: AOJu0YwP76ZheFivd7NfvMhTlkww93pHM5ZN1ONXJUPinJ9uDZ0hQpdy
	BlACK/zpMx6VPDblDs3p8zjqSZ0I8/u9F3EJezQKJAQ+Hh/wHsNtapZVc4iDenQ/xYyfGO805Ny
	qgKJEvFcqUb5spkn+dJtLIxVncA2XWp3DvfmKKOJ6do4nvqeowLXTgY+OLOM8O1Y=
X-Received: by 2002:a05:620a:1911:b0:789:ea58:d3b1 with SMTP id bj17-20020a05620a191100b00789ea58d3b1mr2518355qkb.4.1710857073245;
        Tue, 19 Mar 2024 07:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2woW7UEchY2IkBVWYzgRK0KWJ4spUtcTxNI2cDq95Ac2i5H9cK+iTpsS+AG/gM2n1vRK6zQ==
X-Received: by 2002:a05:620a:1911:b0:789:ea58:d3b1 with SMTP id bj17-20020a05620a191100b00789ea58d3b1mr2518292qkb.4.1710857072670;
        Tue, 19 Mar 2024 07:04:32 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ye1-20020a05620a3b8100b00789e1874eccsm4708269qkn.41.2024.03.19.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 07:04:32 -0700 (PDT)
Date: Tue, 19 Mar 2024 10:04:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v2 05/14] mm/sparc: Change pXd_huge() behavior to exclude
 swap entries
Message-ID: <Zfmbb82ErXU8WXt3@x1n>
References: <20240318200404.448346-1-peterx@redhat.com>
 <20240318200404.448346-6-peterx@redhat.com>
 <744C19CB-4AE0-472B-ABD8-2064EB04FDA0@linux.dev>
MIME-Version: 1.0
In-Reply-To: <744C19CB-4AE0-472B-ABD8-2064EB04FDA0@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: linux-arm-kernel@lists.infradead.org, Andreas Larsson <andreas@gaisler.com>, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 19, 2024 at 12:25:39PM +0800, Muchun Song wrote:
> > @@ -409,14 +409,12 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
> > 
> > int pmd_huge(pmd_t pmd)
> > {
> > - 	return !pmd_none(pmd) &&
> > - 	(pmd_val(pmd) & (_PAGE_VALID|_PAGE_PMD_HUGE)) != _PAGE_VALID;
> > + 	return pmd_leaf(pmd);;
> 
> There is a redundant semicolon in the end.

Will touch it up, thanks.  PS: This will be dropped as a whole in patch 12.

-- 
Peter Xu

