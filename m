Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E247D8551
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 16:56:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=I0UkOpqK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGTPq1tYzz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 01:55:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=I0UkOpqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=8bytes.org (client-ip=85.214.250.239; helo=mail.8bytes.org; envelope-from=joro@8bytes.org; receiver=lists.ozlabs.org)
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGTNw0LhWz3bws
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 01:55:12 +1100 (AEDT)
Received: from 8bytes.org (p4ffe149c.dip0.t-ipconnect.de [79.254.20.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DBB331A6964;
	Thu, 26 Oct 2023 16:55:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1698332103;
	bh=aNMHImipwcFhnEH/KDApHhNmiJl+VZlZ+TvCRT48sTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0UkOpqKluA/YpkdyqQMNKspNDvlR//E6QKQRdsBWvzWfijoeiABw7TzaHmABapyC
	 t/FQp64LQTFfniDnu37MyP4K3Tctgj25VDEAW4H+4pUmVsnGTPTXtqRh3gL/UizXs3
	 CBVrnDduyDWdcTLB0gkl76Jp8Vj7IDqeydQRQ7QzwX+XGbeRQGXD5k5dm2bqXwEvZa
	 qZ0Esy3TFxOjJwSj35Di5Z/4GuIn6aKuHNrYdx90/E7oNHg0Apdmti6Lf9K5AYqp1+
	 5b+BqR5eMBsHR+ANxpXhZ0sKNVxbPUpJZJ6ISJwxvLFD4LR4756KNQuGiT7DkuRP28
	 30cNxjFM90fDA==
Date: Thu, 26 Oct 2023 16:55:01 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 0/9] iommu: Convert dart & iommufd to the new
 domain_alloc_paging()
Message-ID: <ZTp9xVgfz0c1_i2a@8bytes.org>
References: <ZToaD1tuNJ7tra-g@8bytes.org>
 <20F398C2-8F87-4149-9154-44EFF2A966DE@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20F398C2-8F87-4149-9154-44EFF2A966DE@svenpeter.dev>
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>, Janne Grunau <j@jannau.net>, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 26, 2023 at 12:34:54PM +0200, Sven Peter wrote:
> Acked-by: Sven Peter <sven@svenpeter.dev>

Thanks, the Dart patches are now also applied.
