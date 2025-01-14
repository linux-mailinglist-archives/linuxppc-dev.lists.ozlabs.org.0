Return-Path: <linuxppc-dev+bounces-5260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70170A1105B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 19:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXdH46840z3bZq;
	Wed, 15 Jan 2025 05:40:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ad"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736880032;
	cv=none; b=D3rnAfnSFjYVhovudBNEDi5MJ8EJacS/Ou8gtivB/N1HMdIUy59Fw/MZDi9aUucFD9fS04XaWomhd0x+Y62LyvGQFgU4rO4PQI+t4Djb3D1OI9gg8dqRjBTiCpjlKlBVnYpbF04P4gtBoxfXJhnIKgZzF2l0nhqX++GBsD0Hdj9SJY8h4ryu6C3cuNqcfZVyy/qdGcORCxIROLQtJ22TV+I5aWrGh15Eb2m34TsWq5mAQ8pP5oQWd/MsPbd1PuAd+axq7yOka1ogy/1I2cCPMq1zK/m6t7U94IiL2g54A0bqwqDqxdvt8ZLGA3JtDl5nCfEXN0mmbvPlpstS/yK6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736880032; c=relaxed/relaxed;
	bh=97WDxuRYiWyXD8yAfu0zZqcacG47H/1aDD9ac4aHZlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUMAWmJ5JjoR2rPMXMxc7AHG1DoQpygHaVZsZHnevijhfeQicC6ODn7U1/z8s3Q+bl934wT449bqjpAPyGqi9cxAAH+4dgd7XoBBBK0/QEarykM8qsWwRLtCafUPOScLguS2q4hgwBey0O/QjJAGxBPxFSUg0D1pNKdAxxuGUoNoXDuRUluSDmSUkFkfejwYZBi1UHHPB6dkC97p/HT/WuWHN+cveCNJ7oHM7pv7IBCt2EMdEXKbJJdVBsn7pB9Udd9UBM9Fwl6H3gSXgyyYPGVcN7s96MWR0P+ky2wkVG999MXralwSZ8jooO1CMhBr3qM3nzdh3NntGCGLOh9NVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::ad; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ad; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 98291 seconds by postgrey-1.37 at boromir; Wed, 15 Jan 2025 05:40:25 AEDT
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [IPv6:2001:41d0:203:375::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXdGx0qYJz3bZR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 05:40:21 +1100 (AEDT)
Date: Tue, 14 Jan 2025 19:39:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736879995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=97WDxuRYiWyXD8yAfu0zZqcacG47H/1aDD9ac4aHZlM=;
	b=LuUcJe8N3NNsLgNnpBIEndO1e8RFDX3UzQ60SV9T974sgFU7FKx6PrAoiVi+cMOHyqjTX3
	+O7D88uR48oFxr5fTzbpYw0WUbRmzLezjmsAJthOY9lo5+6xPs/UhdtRlFWndrGVmWDiEj
	JrN7xiQADyTXP/lFRwjSge76XevVY7U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <20250114-10fb4c9302167ef202e98713@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
 <20250113-0fe04c6089726d1d06a254ec@orel>
 <Z4aY2AKSaxKDY5Hq@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4aY2AKSaxKDY5Hq@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 05:03:20PM +0000, Alexandru Elisei wrote:
...
> diff --git a/configure b/configure
> index 86cf1da36467..1362b68dd68b 100755
> --- a/configure
> +++ b/configure
> @@ -15,8 +15,8 @@ objdump=objdump
>  readelf=readelf
>  ar=ar
>  addr2line=addr2line
> -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> -host=$arch
> +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> +arch=$(echo $host | sed -e 's/aarch64/arm64/')

Sure, or avoid the second sed and just do

host=$(...)
arch=$host
[ "$arch" = "aarch64" ] && arch="arm64"

Thanks,
drew

