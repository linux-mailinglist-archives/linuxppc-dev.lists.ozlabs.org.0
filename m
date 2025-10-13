Return-Path: <linuxppc-dev+bounces-12804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7997BD652F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 23:06:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clqdX3nCJz2xWc;
	Tue, 14 Oct 2025 08:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760389568;
	cv=none; b=NVE/wNbZjVjZxv7OaluWCiIhWoseGL/1iMECUDftZrbpTRhExfefnXmJoGxD1Aw2fONBnhnCnLBOTGF5mP9ybxJK4+Yr1Yz9qEmcAe3veLMWMHc6s0JbV4NFtjZOBYfIQyKLBUx/aQmuaeRJGKlK0Ve3hFm6sNf2DAv7I5R2HqE6kZynxqRPjY3RdqjMYSdCCh1OmPZUhWt/zyAI7qu+9aYk40Y4JB17yOcZwQYskRldhg+PekESPXH3lqAGFLBY4VavO0YTcnnCaSgZpsBo/Md0Cz586Dhdy5zbH8sX5Vj/MwwpsPv9Xsg7tUhaoKf+Vs7XL/o1HumKPV4mV1jHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760389568; c=relaxed/relaxed;
	bh=spmi9G6rLszkOy2P+u3UEqUaFqwEz0leram/E7lOhdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lRSNuWuYYlZlIDGGzb5TTYB3Kz8xfVKmlSaG6vO6g/sjgFc+0WWnXpyHt6LZnhKPoCsM81Mx23MO0m7ZnryMl2n3GvjZeTvUA0fcGQa6SI3OxxT5aPddOOSKbfxJ4oOk4lV+/F/VJ+1qwzUVEQdbQ44+/uyXh5r47dnt1InHVeo2MLXFWg7zoKemKRrX13lAOmTEDApkutwyJpmrpVtbLAl9ES2UAB+X0M1+bHQTklSyJYnLX0+dscCDiJBgx0+U9Tx6HBU9jhGReuz3mmWHsEjYIzfvnCVmSxv5W90CAn5AeAY5LnpAtoaNRZXG1LkVA7E5kcPWUi64a4n5CJ5Ikw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u/2LXsON; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u/2LXsON;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clqdV115dz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 08:06:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC84E45A8B;
	Mon, 13 Oct 2025 21:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61775C4CEE7;
	Mon, 13 Oct 2025 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760389563;
	bh=gMimZXT46hTusGjQg/yFAkmHwf6pf0yukMIhp3DOs2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=u/2LXsONWeMP2R8o7bZWhH9Q3uuAAPPdKPvYNpUDOneecaltzuMuzXFL4E6m7ZXxO
	 nB864Z2TSdkOrZdJSHYjZxzwCAzlETz+2jlVI6v/kQ/1bgevxKiH7cvMdSE7+m3a83
	 sIG632DRHu5kae8igKX3UUpcAjdarU1ZgVckLJ5GjFq+RHNXFX9QnBW6FoILU8Cy7v
	 bJe6E8VIO3uLfKjo+qJfq/zsCFKl3dV1A5YcivupeoiFJ0TSdUT9u5BrSKW5HHcwCx
	 jUX35n6WZmN89qcJ5tYAo1y7G3yTgchmiNqT/+aB+WTiOef1FIT7z8VTaBQ3U1B/PO
	 CwAsatACY/+rQ==
Date: Mon, 13 Oct 2025 16:06:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	regressions@lists.linux.dev
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251013210602.GA864364@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[+cc Adrian, Lukas, Mani, regressions]

On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
> Hello,
> 
> Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
> 
> Without the pci-v6.18-changes, the PPC boards boot without any problems.
> 
> Boot log with error messages: https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
> 
> Further information: https://github.com/chzigotzky/kernels/issues/17
> 
> Please check the pci-v6.18-changes. [2]
> 
> Thanks,
> Christian
> 
> 
> [1]
> - https://wiki.amiga.org/index.php/X5000
> - https://en.wikipedia.org/wiki/AmigaOne_X1000
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f2c7254931f41b5736e3ba12aaa9ac1bbeeeb92

#regzbot introduced: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")


