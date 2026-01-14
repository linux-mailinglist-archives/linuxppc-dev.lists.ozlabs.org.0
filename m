Return-Path: <linuxppc-dev+bounces-15750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF91D216E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 22:48:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds09b2SSbz2xMQ;
	Thu, 15 Jan 2026 08:48:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768427315;
	cv=none; b=Nuh0Llo+TEUfBMSw6Al4uZJHDvb2KwLWSGcU8VPtnL8NPQdwEtJRcOvJe/ajvRf81CQ4l44EGADpFAP3zcZ3RVqBs/X3mAnwy1ap4VBfZ8M6LcwMpD+HWWTbux2xkRfwhbYpFxKfiPspw0JJc/Y8w+UBLi6MfMaMC4C0al//sP8PoQPP47+CqtGHNbjLgBNCuvKLNyyHHWMA072CaFLRhlVIl4J2Hfpd4kLNfQCfyNsB+7XCGtb6T9nI6PAufQ/Lw7U7c1pb/SIsyLJ6fEqiQhlVkQvRleesurulB9mS8J2Rb3S2i8VgWO4Lb4LShCsvEhbrrlmS0hnNyxgNWEhMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768427315; c=relaxed/relaxed;
	bh=vs+/0N8xgH8/A9zak6RnbC/vymouvc1DzX8sAGTp+9k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=d4vXc3RUH+mhx8LirAILq/7aSZevQkfRGm9Agfoibyt7Z3bFW7TT7OcZ9igaPQhKb1i5W/Da0jNTSyw1SLydbhHUZzpmo2e4p+67sdYBQSlRpjjtUn3kc+MJamoGmwMTxgibN8+flmxsoeCklgZFzFkZSYNZKDdzn6LMbVBkFr9RA5vgA1VZCFFf5d9dau9DoMszA54c/mPSFGZzNqHLKAkn4DVS2JIOqJV7p5Hnn8kK3+VBzldKNj9DSiSEYgxKaD8sVrHowx7yR+5hHf7LUBnXgUW3jA7YBheT1nHSF4/TBYTlesyXVIYNatT9t1De648IIAcVqULqO99yS52LRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=P6vtWoYC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=P6vtWoYC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds09Y5ZwNz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 08:48:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 105006001D;
	Wed, 14 Jan 2026 21:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94455C4CEF7;
	Wed, 14 Jan 2026 21:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768427306;
	bh=sVjE+SfQsdIUMHLLdK2WZZMe9meeOIqp+vLdzF39rao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P6vtWoYCIlr2XYuGHN8Ct1JWv57QVflPPPZ09aqbdSf6sWvv6Psm4BbFl9dEKxvME
	 9IiuEcpRE83qTyXp72NniYCaihdkRtUtnm5MV6es8ZMUNP2zri1F+QO+WeYttAzUaW
	 ul+FCK9Uuub6AWdHHLL0xvAdQEb3R2ZlrFvcN/18=
Date: Wed, 14 Jan 2026 13:48:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Matthew
 Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas
 Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Balbir Singh
 <balbirs@nvidia.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260114134825.8bf1cb3e897c8e41c73dc8ae@linux-foundation.org>
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
	<20260114192111.1267147-2-francois.dugast@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 14 Jan 2026 20:19:52 +0100 Francois Dugast <francois.dugast@intel.com> wrote:

> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.

Thanks.  What are the worst-case userspace-visible effects of the bug?

