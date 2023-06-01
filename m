Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B9B7197A2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 11:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX1Yy31Kjz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 19:49:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=mB3vC+pw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=8bytes.org (client-ip=2a01:238:42d9:3f00:e505:6202:4f0c:f051; helo=mail.8bytes.org; envelope-from=joro@8bytes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=mB3vC+pw;
	dkim-atps=neutral
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX1Y34SmBz3cfJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 19:48:39 +1000 (AEST)
Received: from 8bytes.org (p200300c2773e310086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:773e:3100:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E21BC224B45;
	Thu,  1 Jun 2023 11:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1685612910;
	bh=pF+Egy6iA+ZwOAT2x7ihrgeZOqh087YTNMbwRgLqIrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mB3vC+pwm0gNIHj16iWUa8xaiGMgDqLBsonBEt0bR2i6c3Gj8AcexkJ7yUrYSNA3w
	 KEiqT1Qw0trrIgUfCGsGnW/wqeLG8GFvD30obSwCK6ZwdtYa7a9v2IRwbp5crOtmc4
	 vTXd/gbCY7Bg6X0DG85NUNT1cXHMO/pc9Mi6cuEVUOc8/P+ODqg1uYIEOfj0XTqvis
	 WNXuAtqFhpzAfIctVhU4efMJkNj6bhYGwPNHXq6MvMewx7fKV7Xi9YegB1emIHG2NP
	 C9uDFpyqCtJhJq+0FFu75tjTxOAKkIfzStjIh23RITIRnyukWelkf2GOQq4Q4kxkTS
	 yopqBe1wBMjTA==
Date: Thu, 1 Jun 2023 11:48:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 0/3] Remove iommu_group_remove_device() from fsl
Message-ID: <ZHhpbAqrIPp33iit@8bytes.org>
References: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
 <ZGxcmJ3vH0Smqqxu@8bytes.org>
 <ZHP1zv48iZUV5Ypj@nvidia.com>
 <87leh658ly.fsf@mail.lhotse>
 <ZHX9nu234ehZWVwU@nvidia.com>
 <87leh5yobf.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leh5yobf.fsf@mail.lhotse>
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
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Li Yang <leoyang.li@nxp.com>, iommu@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 31, 2023 at 05:04:04PM +1000, Michael Ellerman wrote:
> Great, yep consider it:
> 
> Tested-by: Michael Ellerman <mpe@ellerman.id.au>

Alright, applied them for 6.5.

