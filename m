Return-Path: <linuxppc-dev+bounces-6656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D085AA4D2A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 05:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6NRk6LrKz2yvj;
	Tue,  4 Mar 2025 15:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741063570;
	cv=none; b=mihtWhO2SuzztBV1VIXezxYdk7BiUkmRdatGsT4Aal4F67SW8oHOjdcfMqOakxVmYQEfQvULhqKGUf+8i3lvHR7OLL3jvVTmLYW2QCpgaxT97/dh4nQu+FuyTO8FgEhKCRQzX+VQWl7lITGBPqlfU2+PdNv9sKOJ1VOJ2d9/5qPSdX30sG0UyVHnrlFgDXxP4i+8EhQx0TK8ABEjLZ3OfE2kelaNVe5KkP/7feuagYwCHXAAEDRqIqkzxcNMWaYY4ZFlOCadvY++McO3vWaIQlFI9FS6QFI2eqV62uzCY/fef7g3HBqJqb85B9ReGKYpLsA57I8scIMYpcrIyZ5ZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741063570; c=relaxed/relaxed;
	bh=2wW4WcOrMiWwVIoahZMyX0rPgAwzLulIDO+CLS1CIds=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=G08yz6nWVRIiL+uh/hJscPI6Yvsy1YyqvnVXxtYSOD6XKXlVnfNgWUeT0jbv2ks0hrXQabLo+wcs4J9kUyxCVMGnqWp6V8Nme33wR1S4/Wrhk0aoosb8ZrDTG1EoWhI0/PyX7krzqMpGhrHAq2q4FLNOTtEhIJBASsVeFKsMbgXbqrqcPDeCZvcI0LtaZI+wSzzi8VuO4jizYr6AKC1TCwUoL4az9EhKfjLMS9AFd8hB/K5swfTSOfkXF6yD07zBBRo05/ZijCk2MwPfoQIfO+K7delr7XctZH3vnE74Fu/IQe3h6xg8hJTOH+3lIt92ZbeuxrQeUlXPOP4XsiuNQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=dF8tbczv; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=dF8tbczv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6NRf35z3z2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 15:46:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A49DEA44E18;
	Tue,  4 Mar 2025 04:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13364C4CEE5;
	Tue,  4 Mar 2025 04:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741063562;
	bh=BIFrLh9/bQIuBnwap0eqz54Lk04kbf4V0DZ+B0m2mNI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dF8tbczvEn6O6hRjSdWKxvQKkGRzNDZEQd6dsg0AiFp2L+F6YCMhGyxTx3ZlL53AI
	 kaXbQDaf9UtJ2eGtPxCyhDiD+/NG8ggB7max5UArq9jsbxOqNhnoi74SE44bszJ2Pe
	 oKDZeMXGXB5LFz8Eg4Vk7YAWHaK0unPGQ7GwUCdU=
Date: Mon, 3 Mar 2025 20:46:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, Alison Schofield
 <alison.schofield@intel.com>, lina@asahilina.net, zhang.lyra@gmail.com,
 gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
 linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
Subject: Re: [PATCH v9 00/20] fs/dax: Fix ZONE_DEVICE page reference counts
Message-Id: <20250303204600.cb49d2d614efcded0b28f8c1@linux-foundation.org>
In-Reply-To: <xhbru4aekyfl25552le5tvifwonyuwoyioxrqxy6zkm2xlyhc5@oqxnudb4bope>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
	<xhbru4aekyfl25552le5tvifwonyuwoyioxrqxy6zkm2xlyhc5@oqxnudb4bope>
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 28 Feb 2025 14:42:40 +1100 Alistair Popple <apopple@nvidia.com> wrote:

> This is essentially the same as what's currently in mm-unstable aside from
> the two updates listed below. The main thing to note is it incorporates
> Balbir's fixup which is currently in mm-unstable as c98612955016
> ("mm-allow-compound-zone-device-pages-fix-fix")
> 

Thanks, I've updated mm.git to this v9 series.

