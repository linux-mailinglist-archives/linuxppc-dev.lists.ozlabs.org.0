Return-Path: <linuxppc-dev+bounces-9133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D798ACD64F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 05:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBsvV5sGWz2xJ8;
	Wed,  4 Jun 2025 13:07:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749006454;
	cv=none; b=eZfvz8mm+RpHI6zaG78EyS3vXQNp7hlnHlhsi2gAX1WNYrt2eUrZoAVPtUeIEz5OmHtQQlewy+cp06hG4rR01CTxptqg8gfQb7u7XOrJA+LcPGM13pZY2VvRYCuxacR/jljFRiUBFEo/T8DhReZJrSUZf0haItI/9bH8m3qvOsqE84a3DkDf113QuQrQeLboaAhRmvDgJ6jxN8uovOQXfvSGdNDe9Wo1A/IKsuJK65XL+KOahDFxeVWHoDKfNSCE/U4w1lzeyOxO66v0z/5U7FNMTNcH67c20wKK+5M10yuMqEUzqnR+1PzWGVFYo2L6ks8gntEPm9YYeLz8lDOKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749006454; c=relaxed/relaxed;
	bh=w6xzfdXatxWXQR5gl0U94QVIsTupasEti2hXgjbub4U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZuMJMNfRii7lQ0qnUP/3homMbLKu5y9PC370zevNS9lDTIJinW6cYm63Hoj57eahR4AP6oVe9sBApO1+uJqJhjDk5d06zb5GRjRRNA5u7k6JlggnXa9BxMZLlxHwpprdAR2SdDFHdOrrM8xqLU05bnqWMqOEB6CX6EVtqDjT2yGTOlR9PWDdoupyU/fThXp0EH0OF0YqWyY4/NTdZEic3B3fa1hoNipW09ZaT5ccGtYcbZtUa9OThxqqiX+7m6JFXBK+pWYfIpUnBOqaNrjAV4heVV8/nVOOVxcnjh2SP4bCLkGeSRDT3azRe3YjgXQC4qWIju7a1nex6S7DFkPz7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rG424Uyp; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=rG424Uyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBsvT5jr7z2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 13:07:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 225DA446BE;
	Wed,  4 Jun 2025 03:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9EBC4CEF0;
	Wed,  4 Jun 2025 03:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749006451;
	bh=4L02KqkBjtPqz2j+xGRxG5TpnC1OGm39+e357gBUzxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rG424UypwnW9ci0sSAea8e7oQ9B3GNjYJpiK2e9ykhPW3p+Tcn2UPk/Yz3XKvVlxp
	 Q0iLBMjS2yIPgH0wT8VCEigaLvdnS0JNyZ4PMuQjEUGFsX8lwngT0hbJ71rKGwe3cX
	 KIw3MqQ8wzuE7YcVFobSRpXCa2/AY1SKbR3VjWoM=
Date: Tue, 3 Jun 2025 20:07:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ritesh Harjani
 <ritesh.list@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Alison
 Schofield <alison.schofield@intel.com>, Yury Norov <yury.norov@gmail.com>,
 Dave Jiang <dave.jiang@intel.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
Message-Id: <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
In-Reply-To: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com> wrote:

> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data

It's quite unconventional to omit the [0/N] changelog.  This omission
somewhat messed up my processes so I added a one-liner to this.

>
> ...
>
> Test Results on My system with 32TB RAM
> =======================================
> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
> 
> Without this patch
> ------------------
> Startup finished in 1min 16.528s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 17.236s (kernel) - 78% Improvement

Well someone is in for a nice surprise.

> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
> 
> Without this patch
> ------------------
> Startup finished in 28.320s (kernel)

what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
faster.



