Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70205949876
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 21:37:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J6U4GKhQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdk8Z2p64z3cy9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 05:37:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J6U4GKhQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wdk7v3MwCz30Wd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 05:36:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADABD61057;
	Tue,  6 Aug 2024 19:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19283C32786;
	Tue,  6 Aug 2024 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722972984;
	bh=sc3W7vyVOLMiqCp+8siDA6OhvxTfa07DqrM7vyqqtQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=J6U4GKhQHq2r95nPZIN9AKQw9uIc/m8Px1mUUL+OGd4whSuOa5T4JhCQQRm7ykbds
	 m+dtVS1i8WQG+TsI3DraVl4ByJpQn4qZfG2tdczdw7QF175p2sPq0TL0IG5rtNiLgv
	 I6A156sj3pWp9tXQ9yH941Y30ueG3eFuVRJqThW5DtwMhrs8uOf9JiJMuGMqZoSkBx
	 DmaR8SZRW5ioUcan5fjVwDeJM4IwrR8Fw5NGU+JfMQrrpSwVmCvngbvdrD3Wmij3yy
	 fW1S2QapgzIzfvg5fNgpETIZjQ1erBNGLbPSkFNo18oxxMMk4lyZ5fStAxuMSpGU9C
	 tjIdDX5I4WsuA==
Date: Tue, 6 Aug 2024 14:36:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Matthew W Carlis <mattc@purestorage.com>
Subject: Re: PCI: Work around PCIe link training failures
Message-ID: <20240806193622.GA74589@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806000659.30859-1-mattc@purestorage.com>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, saeedm@nvidia.com, linux-kernel@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org, pali@kernel.org, davem@davemloft.net, macro@orcam.me.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 05, 2024 at 06:06:59PM -0600, Matthew W Carlis wrote:
> Hello again. I just realized that my first response to this thread two weeks
> ago was not actually starting from the end of the discussion. I hope I found
> it now... Must say sorry for this I am still figuring out how to follow these
> threads.
> I need to ask if we can either revert this patch or only modify the quirk to
> only run on the device in mention (ASMedia ASM2824). We have now identified
> it as causing devices to get stuck at Gen1 in multiple generations of our
> hardware & across product lines on ports were hot-plug is common. To be a
> little more specific it includes Intel root ports and Broadcomm PCIe switch
> ports and also Microchip PCIe switch ports.
> The most common place where we see our systems getting stuck at Gen1 is with
> device power cycling. If a device is powered on and then off quickly then the
> link will of course fail to train & the consequence here is that the port is
> forced to Gen1 forever. Does anybody know why the patch will only remove the
> forced Gen1 speed from the ASMedia device?

Thanks for keeping this thread alive.  I don't know the fix, but it
does seem like this series made wASMedia ASM2824 work better but
caused regressions elsewhere, so maybe we just need to accept that
ASM2824 is slightly broken and doesn't work as well as it should.

Bjorn
