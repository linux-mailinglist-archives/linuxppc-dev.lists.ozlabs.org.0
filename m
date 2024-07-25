Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A45B893C9F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 22:56:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WNGhYjPm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVNTX4Mfhz3dFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 06:56:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WNGhYjPm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVNSt2QsTz3cnK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 06:55:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16F95CE1360;
	Thu, 25 Jul 2024 20:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBE8C116B1;
	Thu, 25 Jul 2024 20:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721940939;
	bh=q/ZVXjVJyqULDlY2L9HHIXXTOO2aCFo8z2iw0QdZvFk=;
	h=Date:From:To:Subject:In-Reply-To:From;
	b=WNGhYjPmjFIvAT1SwaBYZgJcsw62bVFLXBFg+x8q2lERBtNaSTiui+/tQihI+Opd7
	 cbGaKU4Msb/uGrrz3CqBMswJosEe+z9yCIeWn6Jzd6PSm3Birc3c6B4UdnzoFKMmSd
	 TAVbQ39UCJJ+SP6yfu5sq5YyBCLp2GsGIS+lPEEPwNWXa4tgJcbQK+TYj87PL75D74
	 cxskVvi8m/yF4RwCFMfSWtfAVGMcb6wg8/5HusfF2HluDXMO8UgVd+oJk/ge6cWVON
	 a00y2h9dhYeb3VDHsQ0+jJ5dA+88pSqflp/vhLHiGKifhW+/mxb/XH3xIeVXW0b/26
	 cnmvp2sW8L65w==
Date: Thu, 25 Jul 2024 15:55:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lizhi Hou <lizhi.hou@amd.com>, Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-ppc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Saravana Kannan <saravanak@google.com>,
	Vaibhav Jain <vaibhav@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Vaidyanathan Srinivasan <svaidy@linux.ibm.com>,
	Kowshik Jois B S <kowsjois@linux.ibm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Message-ID: <20240725205537.GA858788@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p6cs4fxzistpyqkc5bv2sb76inrw7fterocdcu3snnyjpqydbr@thxna6v2umrl>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 11:15:39PM +0530, Amit Machhiwal wrote:
> ...
> The crash in question is a critical issue that we would want to have
> a fix for soon. And while this is still being figured out, is it
> okay to go with the fix I proposed in the V1 of this patch?

v6.10 has been released already, and it will be a couple months before
the v6.11 release.

It looks like the regression is 407d1a51921e, which appeared in v6.6,
almost a year ago, so it's fairly old.

What target are you thinking about for the V1 patch?  I guess if we
add it as a v6.11 post-merge window fix, it might get backported to
stable kernels before v6.11?  But if the plan is to merge the V1 patch
and then polish it again before v6.11 releases, I'm not sure it's
worth the churn.

Bjorn
