Return-Path: <linuxppc-dev+bounces-10317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C9B0A0AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 12:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bk5cJ0ZzSz2xfR;
	Fri, 18 Jul 2025 20:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752834528;
	cv=none; b=KXmPMnma2IAB5KWif5cJkSd/8QH80EndSrA9SNTfSymN3n5CvmGTqPhuEIZmsa4lV1c/T3tOlnO2Y248+4H5gmgS5ilm8fkQ4G1s1kc85Q1i5VS3z2JKRSHWzCHyvmPUssl81M1yn7nffYDEKwZ6kTUnYMMud4+MrxMGLJHrUhq6R1sCoizjhycaEeEtNxfz+J29NRiekdpr9ZuAdip2yDFa14ypKuzPIO2728bUfP9BTkBzQBpBFpyHNR4cGP8eyqySejOadDtZjrlrDTjNyU4ZgeAHDrYb+Mzxs0crqfGbn8DQVSXjb8jpu1tMCOPPeUjit/whTUJdN/EX30B3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752834528; c=relaxed/relaxed;
	bh=pEhV/mUmrICwn6T/3PQwvhiiBlNrc+Ut0MkzHcldE84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHPDbGzcYk9/QZp3aoT/CGKaK84kyrKkHZfjpSDBPPdkoc8Ig14uq0zwwWadfn+abPsRY/Yng9ppdPFwxEJKPOV0dZus7REEjScGx7rKbIBREN9ZcFnuDeFr6RjLTiKutFajwsrVqWjgsLs0m/09WbqEUTW0l7zuoTslpFtTdOiSGE7Ij+R8ot7K27jP0P5qVgNktgBNEvx4bDLw2qREHA5zZNqmjCw0hUqBSL2brfUwdB4NdF3KUtm6dECD7SQZ84OA7fYb7PjknYrzgsd722zysECR8VBL6RILP5WdEZ6r6bk3FS8Y3/ujlEHkRMsIx6lu7+xvktTMSy8Hx0U2Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eOF4Nqqm; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eOF4Nqqm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bk5cG5dfhz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 20:28:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B7EB5C5C60;
	Fri, 18 Jul 2025 10:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F19AC4CEEB;
	Fri, 18 Jul 2025 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752834524;
	bh=mLEIXOd7eZdISffuLnCpahYVvfWHAggJn8bBD65Jk+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOF4Nqqmy62wOTE6iyDUN+If8Qx8CfTpC+N5PVoQWCe5WQhj+WWHU6Tyv3hi9eNhr
	 FIoXTkuUWVi3cRj6W8FENzyay4s+zTghm5Vc8MYJeCWKF0Bw2h413GvxFcYuAR9NAR
	 AsrElcNhPyoTnVlsCVCrQaopu97MxZTemFopAhXFV4BOoUGeXjbUQVsadiEe+JLuav
	 yW4WCznBsJ0bxTwTsqy3Tg/wFN93AxwPEFWVFLdH8LZz/8Qm3JTU1utMKG2qb9dBji
	 6qVErsWOPsaWploLev2unOE7h5UtBN5Bu1SJAkGsv/Rx6PACnsIUF3Gl6VH3Kjssvn
	 2XjO0g8ZNrKhw==
Date: Fri, 18 Jul 2025 12:28:37 +0200
From: Niklas Cassel <cassel@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aHoh1XfhR8EB_5yY@ryzen>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
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
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Testing
> -------
> 
> I've lost access to my test setup now. So Krishna (Cced) will help with testing
> on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
> platform. For the moment, this series is compile tested only.


Since this patch series implements two things:

1) Testing sysfs initiated reset:

selftests before sysfs initiated reset:
# FAILED: 14 / 16 tests passed.

# echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset

[  145.567748] pci-endpoint-test 0000:01:00.0: resetting
[  145.638755] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
[  145.639472] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
[  145.640063] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
[  145.682612] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
[  145.683162] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
[  145.810852] pci-endpoint-test 0000:01:00.0: reset done

selftests after sysfs initiated reset:
# FAILED: 14 / 16 tests passed.

(Without this patch series: # FAILED: 7 / 16 tests passed.)

So for this part:
Tested-by: Niklas Cassel <cassel@kernel.org>




2) Testing link down reset:

selftests before link down reset:
# FAILED: 14 / 16 tests passed.

## On EP side:
# echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
  sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start


[  111.137162] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
[  111.137881] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
[  111.138432] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
[  111.139067] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
[  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
[  111.255407] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
[  111.256019] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
[  111.383401] pcieport 0000:00:00.0: Root Port has been reset
[  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
[  111.384582] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
[  111.385218] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
[  111.385771] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
[  111.390866] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  111.391650] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01

Basically all tests timeout
# FAILED: 1 / 16 tests passed.

Which is the same as before this patch series.

So AFAICT, this part does not seem to work as advertised.

Instead of quickly stopping and starting the link, I also tried to reboot the
EP board, which does the configfs writes and starts the link automatically on
boot, but that had the same result as quickly stopping and starting the link.


Kind regards,
Niklas

