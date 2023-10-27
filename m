Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5EB7D94EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:14:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jQzILde5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz6p11Cvz3vfN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:14:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jQzILde5;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzR1nw2z3cFh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401299;
	bh=0tSupoaXw3PNm+1ssTFm6jQxgNKdnFhV/B2IybUSobA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jQzILde5pelxgGYr760bO3cfAdt+bZ7Ta907VVMaUe4oT5X9nX+HJlckc9Y0OzbzP
	 YnO2eH/U1i4M9q5jcX9ha4A6bY3JZdaLKhf5tBrNK1g1Yv8eCXDVT4iGkoURtoM/IC
	 KIFs/XBpb7HmmKEDYZtcA1oi4Jypgh2qiaFCjtZh5SkpEa1ABy2Ul+Nx8N8yNpq5iB
	 tpThaHfnLs7N9Jhh+R/Pc6lfYN+ek3YKlmuF8r2fWKYfNfeQV8s1QaDptFeKNhLtDf
	 8EKSSqN9VAMzsPiETBkpfbWXnQcC0P23vgLs8xDqZj/pgcBpmOIvA3W1hZTGFXDXhZ
	 tDBLeYbijpsJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzR0XgGz4xWf;
	Fri, 27 Oct 2023 21:08:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <20231003030802.47914-1-gbatra@linux.vnet.ibm.com>
References: <20231003030802.47914-1-gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/iommu: enable_ddw incorrectly returns direct mapping for SR-IOV device
Message-Id: <169840079678.2701453.14213017318168478377.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 02 Oct 2023 22:08:02 -0500, Gaurav Batra wrote:
> When a device is initialized, the driver invokes dma_supported() twice -
> first for streaming mappings followed by coherent mappings. For an
> SR-IOV device, default window is deleted and DDW created. With vPMEM
> enabled, TCE mappings are dynamically created for both vPMEM and SR-IOV
> device.  There are no direct mappings.
> 
> First time when dma_supported() is called with 64 bit mask, DDW is created
> and marked as dynamic window. The second time dma_supported() is called,
> enable_ddw() finds existing window for the device and incorrectly returns
> it as "direct mapping".
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: enable_ddw incorrectly returns direct mapping for SR-IOV device
      https://git.kernel.org/powerpc/c/3bf983e4e93ce8e6d69e9d63f52a66ec0856672e

cheers
