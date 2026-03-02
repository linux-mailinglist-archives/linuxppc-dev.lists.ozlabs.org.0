Return-Path: <linuxppc-dev+bounces-17512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHlGFPZvpWlXAgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 12:09:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082261D7396
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 12:09:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPbmf31szz3bW7;
	Mon, 02 Mar 2026 22:09:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772449778;
	cv=none; b=QNrOoaoj7t+bvUXIuDCqGjGQLvyA6lu9vRUuNb7nuJJOt7uz0YL55t3IlWZQ9WHjTWXz/PeKzWFeKO7L/eRlFh1Y4F0o9NmPbmP4DNoYhXhbnNThKp0hXZojbcd6QGb3+SoKXI338vZGGA/0oelukdO5Hg/KpnzrteZk/nCtHOPJyVeNREhajMadTfWz8bD5boLkPLFeTubUnwOnF+SW8x/izHgUZTWuzErZp4exleaq6Whp21VTz1HoQodg/ni40AavkdA5qDaeaAUXhn8/M1tujVz6s9kDCgtDA5Qr51u75avb+kdBTACmgI9dS7EHWZIQGsaeDcCqtFiZ/+cdig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772449778; c=relaxed/relaxed;
	bh=ALgtyZvM7U+ADKVcCq+vWsLwr98RElyoZqbUR3DonCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCkfluu/xj4rjjcZv/rtI/jxDc1N7/gENmrC/3chORwxg1GwM2W4WFcS/TQzUjl6f6FhiUfPX8Z4hAwrsaRUuHXgiYfqiH2m8JIAaw4EwEj2seOUyu1yK42IVpTJGtuWxK9Mt96Vhj3XIRgmxF+MWB2uhIHJagN6iDv8+GOmr5LkThd9VfXieJ4UTzuuFn5IDU6k4embZhQChgK8/iS5I7IGGmYGcWaNLMJeZMBGKAEOImAkMK4ZbgGQKuOLQRAVa6XXnYODHoEE/BbETfyrg0Ks/qVGMlu3A9zYwicFSX7llJcwdJqZvXZWYalUgKVN8iNGRmGid8jZrIyvu3j1Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eHpzqh4T; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b5; helo=out-181.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eHpzqh4T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b5; helo=out-181.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [IPv6:2001:41d0:203:375::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPbmX4rhBz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 22:09:30 +1100 (AEDT)
Message-ID: <d8771807-c85b-48f6-b5a3-a7f167cc9494@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772449740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALgtyZvM7U+ADKVcCq+vWsLwr98RElyoZqbUR3DonCk=;
	b=eHpzqh4TQFq6GsbuPnCpe5jSVHJ3YXMxlPIIhBK0jXo03V3jnRz3qkm5dHB/xKaM1ACva+
	2Y8OdZXsjeij5zDj3tbrLBIE+QRNrcPXZM4UgCJcT9WztqxJP4KNtYkPpB8oLLxlIXXWk+
	kq5Y65mqoE25P4/NF5WJQn/9mPcWqZU=
Date: Mon, 2 Mar 2026 11:08:52 +0000
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
Subject: Re: [RFC v2 00/21] mm: thp: lazy PTE page table allocation at PMD
 split
Content-Language: en-GB
To: Nico Pache <npache@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 lorenzo.stoakes@oracle.com, willy@infradead.org, linux-mm@kvack.org,
 fvdl@google.com, hannes@cmpxchg.org, riel@surriel.com,
 shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, dev.jain@arm.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, linux-s390@vger.kernel.org
References: <20260226113233.3987674-1-usama.arif@linux.dev>
 <CAA1CXcAYt3OfW_uBTYZgr-dBhg99x=5pUs5uvqtpg+PNJ1KxGQ@mail.gmail.com>
 <1d3a4e8e-9ea0-42e7-b8e7-d92fb27f80f4@linux.dev>
 <CAA1CXcCygvA9uUJjB-+2J00srnHbiNGwbvcbqpRer8Vy8QBxWg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <CAA1CXcCygvA9uUJjB-+2J00srnHbiNGwbvcbqpRer8Vy8QBxWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17512-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 082261D7396
X-Rspamd-Action: no action


>> Thanks for the build and looking into reviewing this. All comments
>> and questions are welcome! I had only tested on x86, and I had a look
>> at the link you shared so its great to know that powerPC and s390 are fine.
> 
> Good news: as you noted all the builds succeeded, and the sanity tests
> dont show any signs of an immediate issue across the architectures.
> I'll proceed to debug kernels, and then performance testing. I will
> try to start reviewing the actual code changes in depth next week :)

Thank you!!

