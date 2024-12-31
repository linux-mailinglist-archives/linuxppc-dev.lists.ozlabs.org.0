Return-Path: <linuxppc-dev+bounces-4542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A99FEBCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Dec 2024 01:24:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMYcm5K4Jz2yRZ;
	Tue, 31 Dec 2024 11:24:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735604664;
	cv=none; b=QfuHBLrcCNQDKGYTT4tcnKN/stQIBJxIgjTj72DYPg5+uapbT+cVVPE03Vn/Z+bXjDttHO/RWh444NiiApusJ8Z4FfLQ3MhuVzyqVuuia86A7ga5rUr9n8IHchQiO7LIeeBy1yATECb4OtfytDjHD23B9N73U4FxQmwsCOAD7/KdWJMFLFnIlq7LGJjYWYsrsckYdi5l3vbMmCPsLVboUdsfq65jcTwyw+ZNr32GZXnbq/csJEzOaFiirtgFYgdFJ10UXbCKtjBAnBiMVYOfLA4NL18c+PoHkZ7xeoRny8L2u6+m2b41oxax/oSgIIL7NZtBPTFbmRMiVL9b4qeotw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735604664; c=relaxed/relaxed;
	bh=jynuZ6RqW0K2fp3acwqYJBGI67T695Su3/atzM2yXCw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Y8Wb8oUPBlbgk30weBcKwdvIzkqw6oQ+/hwVyG8gbQXkcm5DyHv+L2fY3y2+iWJohoAwt5c5jaSYGHPlsc2TeXsTXtJ+gyazGw2IPfNIRJ2t5G75jGbBjmK7//sO66pac1lelejXxQJY8+43SIJYSLc6FiPaEMmh7ayV/lmLUdizX27+A332wptPm//udFFjDBxiMIy/26EKSHK1FNhiLer4tIJzpl8YUtDbStancyC28AGLnQFIyb7DBCy8WBfwvXeH8jsE9UPTmb1xxNRxBxAY3QgsSjVG+SLN3fqpQY0ShEaQxbOB8F1xWZ6qZCS7h2IIwxD6CTYwzECfXnlYMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=e1svhMQU; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=e1svhMQU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMYck7149z2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 11:24:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 222ECA40FC4;
	Tue, 31 Dec 2024 00:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97495C4CED0;
	Tue, 31 Dec 2024 00:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1735604657;
	bh=2Z/3V1q46cErKadoV3y8VtC0UOopLVjvmzLFmpjI5ZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e1svhMQUmdhMgcQjt88gUZcpq5ze2FpENDmeroTm5j525bnUbXasg93NeBqNAKuwX
	 4zTZ6tN5Yr2qdY61qOZxnyRQ1159nEMzAQ1YQfsHm2DW8ARwWXBuvfim5detOnI3XI
	 EB0PhrLFTgZnLoKq75DG+Xuc3x8ekQPiOw33OnkY=
Date: Mon, 30 Dec 2024 16:24:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 palmer@dabbelt.com, tglx@linutronix.de, david@redhat.com, jannh@google.com,
 hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
 will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH v4 00/15] move pagetable_*_dtor() to
 __tlb_remove_table()
Message-Id: <20241230162416.da83460318c4726f65fb4e3b@linux-foundation.org>
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 30 Dec 2024 17:07:35 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> Changes in v4:
>  - remove [PATCH v3 15/17] and [PATCH v3 16/17] (Mike Rapoport)
>    (the tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are intermediate
>     products of the project: https://kernelnewbies.org/MatthewWilcox/Memdescs,
>     so keep them)
>  - collect Acked-by

Thanks, I've updated mm.git to v5.

