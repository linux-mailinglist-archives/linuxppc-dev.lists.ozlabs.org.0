Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800562D003
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 01:46:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCLnh2wmWz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 11:46:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NKUDG6/H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NKUDG6/H;
	dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCLmm1q8Gz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 11:45:27 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id g10so230410qkl.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 16:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HEOs2OljVpzFekHebtNmxJNTS1biZDzbDC+7E+gbGXE=;
        b=NKUDG6/HRBHYArrki2ErKlKAFAloDP3syGXEvUqNJ9D2fVrZim0dI4zYfgnJWEKy+2
         eIgPOs+mttvXhYUIJL/UppN4gHtQqcQpWlrONSgHhATtfRfLqa70r2Y5AFUtDhoXumLz
         QwAO0SpqErl+SpXb2isD+wqK260zhrI3m0OcjGKZmRIuadG54e+ieDR5HURAecTq4gww
         +4XuPNBvBD2G5dec/bz8Eh9V9EDh1RbiHGn8GIrcO4V8END9r1k5y0xfRAbT/lxmG9Cm
         d4SXiY9+ZupOQT/Gb+ZePnA6lwtOPkxvxI9tRVsC2WHBPZX7s+xnX8nZsTymxhqmYSZB
         7vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEOs2OljVpzFekHebtNmxJNTS1biZDzbDC+7E+gbGXE=;
        b=7HU5/Kt59l8MIXt691ZisnZzjdyPx3TxZ+a0bJjm5Ccvs4PuhEKa+7SquUiBPq01Cz
         Gi8ZyqMZdfq9eNisCXBpMW5hK7DPHI7nB9QtaxOcbZNy65tUr12jMhHCZv44zF/CsWz3
         8bBjVuW7bOojxQdC9mHuth+PSp9Nw36hBFF4AcsD3NMas0kaynm671CqtNtp0saoPSK9
         05VGamM+rHz+HalOpfCEfnZDvqRXBsjwc7OOb4jI1SY0z89NXTeQdyQYIhexIzhxJHSV
         TcVL5BVRB+aHPjaV7f8kIMc5S6Q4sb++15hdpE40rngg65NeRB8QDhmyCgrDPwmNeFcE
         BDYw==
X-Gm-Message-State: ANoB5pm9RvKtCHYjR+qSXltQmk86FuiwgWln/q/tprQINBdzDrE53abj
	fXwVNNq1QMq337kEzy5uJaTsWA==
X-Google-Smtp-Source: AA0mqf7xjJLeTnaPhhrans4JhE0iVba1LlwPzkyl9vYE07B6pyjsI7ODbIFQEN1WHHyVUFKfNxMUWg==
X-Received: by 2002:a05:620a:1455:b0:6ee:80b5:32d3 with SMTP id i21-20020a05620a145500b006ee80b532d3mr22079595qkl.237.1668645923644;
        Wed, 16 Nov 2022 16:45:23 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id n7-20020ac86747000000b00399ad646794sm9480378qtp.41.2022.11.16.16.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:45:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1ovT1t-0066TN-E8;
	Wed, 16 Nov 2022 20:45:21 -0400
Date: Wed, 16 Nov 2022 20:45:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 10/20] RDMA/umem: remove FOLL_FORCE usage
Message-ID: <Y3WEIVROhUPTtaeQ@ziepe.ca>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-11-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-11-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, lin
 ux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Leon Romanovsky <leonro@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 11:26:49AM +0100, David Hildenbrand wrote:
> GUP now supports reliable R/O long-term pinning in COW mappings, such
> that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
> far in one corner case (DAXFS file with holes), which can be ignored
> because GUP does not support long-term pinning in fsdax (see
> check_vma_flags()).
> 
> Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
> for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
> using FOLL_FORCE, which is really only for ptrace access.
> 
> Tested-by: Leon Romanovsky <leonro@nvidia.com> # Over mlx4 and mlx5.
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/infiniband/core/umem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
