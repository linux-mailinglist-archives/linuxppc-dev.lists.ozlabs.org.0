Return-Path: <linuxppc-dev+bounces-17902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JE+GcbOrmnEIwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:44:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E65239EC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:44:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTytB36nrz3bnm;
	Tue, 10 Mar 2026 00:44:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773063874;
	cv=none; b=ou8t0MVj7kkgTvIdk5y2JZocnKX4xZ4AHEiBuJR2enqUf/5tGRRx2SgHDetUD5V9jolMz0zAjnt04ccH8sYvB6CDWGL87iq9jx0jer0v/oYGKfJPQybkUc5K3Y2shAoBJdFXxwYxcx/+aTrflyvli1nsbiwrfb0cU1s2/Ht7opUnLiimy20Ms6KO/1gGqJnnZWXtiVTtgekR9dIB0F19mcfxkB6mPeREY5gtGEf8990aP6npKMAEP0KtnS/25Li48pgGcXqNeO6e8Aqfey8a7tFbJOgnuB0sKs8zAO5BvDaQJHBY/ep8XxK5zdLYTms39h8OSXzPSK8llhNyufqKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773063874; c=relaxed/relaxed;
	bh=uff3YTCVgqsL1iOsrMf8mkfHZ5TV2mh1epm2NrmtkBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdPNyM6Yunda7HdNrVOH1pkWbOLP0XNC7gj4zA9kACcIfvaPjhWZLZ1fl2vZTV5mQYJAPfZSbPjtdIJ2Jp1iDxJi6s8GRxx+6oeK7xmktPJby8hZqcsZJ+XOfLUauiCRggBS4UXOvTm7PBwuyBxUqWOG9a0hUhsS+YfAKRybZqMrh+Uc72DGbS2Re1JGUWCsMuvY0QWj+G3AYh5qT1byZLYQ6oOcwxKUzRlMzyOTTCTCDC41flHkql9gKHZUHl933PzNqfjnuiqXs1LCXhoEaKO6HiCXK7nE3XYxMs6Gyvl19Tt2hwey/3lNIyFrrdfnJc+e79piNJxwv+qtZuK3yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ktkuMurA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ktkuMurA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTyt95jN9z2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 00:44:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6E7943AA0;
	Mon,  9 Mar 2026 13:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0E8C4CEF7;
	Mon,  9 Mar 2026 13:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773063871;
	bh=uff3YTCVgqsL1iOsrMf8mkfHZ5TV2mh1epm2NrmtkBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktkuMurADMf50LRwnbfN1+AJYnRdWEKFnD0sMhwDV9Qk044EpO1RsQJsCoizrusOH
	 29xj82RiF2RGwBmdLo0pT1VS7qJ3vVYUADrzug3p/vxCwbDuYsVlwT/lBGSbDErk6i
	 jQQ7gSkUXIIKvzOHZvXIfbiAnGOw0RzQuf5WfliG+/4nCwo0/ZTHFwAxYz7AVV9zfS
	 cytQdTnyw2vmLaFn52/q2fbpgQx2Xo/cj564DX6jwd7rYX7iewz6O+qlDY4gqp3XCw
	 y+PT9/CRU6M4iy9jhNd7YbUOjYayHZY8BYlakH7GFo0MVgJRM/PgAPyZ4xzCMcAdOE
	 WqUuFknTpY37Q==
Date: Mon, 9 Mar 2026 13:44:27 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/4] mm: move vma_kernel_pagesize() from hugetlb to
 mm.h
Message-ID: <27d52c59-e68f-4369-b133-4db71e1de0c6@lucifer.local>
References: <20260306101600.57355-1-david@kernel.org>
 <20260306101600.57355-2-david@kernel.org>
 <833950ef-e01d-4914-b5f9-bc1f6261b184@lucifer.local>
 <729e14d4-6949-4d46-9380-12331b5ad363@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <729e14d4-6949-4d46-9380-12331b5ad363@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 62E65239EC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17902-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:25:51PM +0100, David Hildenbrand (Arm) wrote:
> On 3/6/26 12:07, Lorenzo Stoakes (Oracle) wrote:
> > On Fri, Mar 06, 2026 at 11:15:57AM +0100, David Hildenbrand (Arm) wrote:
> >> In the past, only hugetlb had special "vma_kernel_pagesize()"
> >> requirements, so it provided its own implementation.
> >>
> >> In commit 05ea88608d4e ("mm, hugetlbfs: introduce ->pagesize() to
> >> vm_operations_struct") we generalized that approach by providing a
> >> vm_ops->pagesize() callback to be used by device-dax.
> >>
> >> Once device-dax started using that callback in commit c1d53b92b95c
> >> ("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
> >> it was missed that CONFIG_DEV_DAX does not depend on hugetlb support.
> >>
> >> So building a kernel with CONFIG_DEV_DAX but without CONFIG_HUGETLBFS
> >> would not pick up that value.
> >>
> >> Fix it by moving vma_kernel_pagesize() to mm.h, providing only a single
> >> implementation. While at it, improve the kerneldoc a bit.
> >>
> >> Ideally, we'd move vma_mmu_pagesize() as well to the header. However,
> >> its __weak symbol might be overwritten by a PPC variant in hugetlb code.
> >> So let's leave it in there for now, as it really only matters for some
> >> hugetlb oddities.
> >>
> >> This was found by code inspection.
> >>
> >> Fixes: c1d53b92b95c ("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
> >> Cc: Dan Williams <dan.j.williams@intel.com>
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > LGTM, but you need to fix up VMA tests, I attach a patch below to do this. Will
> > this resolved:
>
> Thanks!
>
> I assume that should go into patch #2 instead?

(Sorry missed this on first reply)

It doesn't matter too much from compilation point of view but thought it made
more sense as this is where you pull vma_kernel_pagesize() in? But I'm fine with
either!

Cheers, Lorenzo

