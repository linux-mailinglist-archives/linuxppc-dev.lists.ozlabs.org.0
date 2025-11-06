Return-Path: <linuxppc-dev+bounces-13896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A00CC3D117
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 19:25:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Vwk2Rvfz2ySP;
	Fri,  7 Nov 2025 05:25:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762453510;
	cv=none; b=IHlHGIaK1h3D68L+8VUkogFx+E4m1Q9u5HvYc8GVjZ6LcFcQEzc/vGFZayEdZ6XaUQpLx+QwDz4D6IQSYoOK3jJV8YvsNXNs4+T0Ou2U1oRJQXrwqxtngriTjcWZfgv8XI4YHYVLxLG12d0vMSxWvOhW2dLClKDFlEcy2Ic0GZH//OL9nvVvoNSQ1BfBXb/OT+8Ic5ooywvsBcNWtqz3lZ5iJ4JhTEsZgqs4nKyy3QEMwxqwc6fjChXmF8ykiZWK+sqq9CuH7k8rB8ech5PQP2N0hs1NYheO36Qz3J2hVLbMDcAqewMnsoefOJIADpD5vhi7FE5bMEYfYFUrUzDMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762453510; c=relaxed/relaxed;
	bh=qE/gwh02JpgrMrlxY+R8cx6Mq8JbzfPNQpSWv8dq2Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IN2Io5ndihmD9aBqo089w7Fyz7k8acRBjMLGaDMwuekbdTgeqs5BqZLrbhe1o+ZxZgqJgFcWKTZ/bq9hM63/2UwT8CfmvsnMbo6VwiWvbXt580QhrOulYBIwbr30DZt1ni3+rNzBVJQIvKguzWDMWHyLiZ6DKe2r0wPaKl5tXoWCJMib2Y9AQjlnkpDEJSPsMkzufiXv7M6a7FreWpFas8ZjMcWQKfAbPUbwwBbrmSuCDtL8+YXJsrSnnE9+TCs+0ZueN+5AHXBogYq2eOBTsm8oNMMI8oRbOn+qB9qYcA2D3pNqDO7JsvpvMbVtDKBULSbDEEAtKF4p8JbOrUiBCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZXaCgMPH; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZXaCgMPH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2Vwj359vz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 05:25:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4AEA6022D;
	Thu,  6 Nov 2025 18:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FB9C4CEF7;
	Thu,  6 Nov 2025 18:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762453506;
	bh=IO6Ln6PxVJkvupdXH1DzGpt9VjwkaVOtfdDxUcDva38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZXaCgMPHUTgCLcoPL1VLHH2zvP1kf6yjh44zuxcuMdBkdMCa8WghRBtj5MJrCqXBW
	 IAQuQnbUD6UdMgzdBvqrQJauNmmEvn+5rD6qJlOiqnUuIA6UVpSlqCrgXmdxrHZXU5
	 rzXQUw4PzL3fhldQJmoBvY2AfKTfrduZ2a5iWHdzQyr2yQDPzrXgo2+pDTm+nIlaMB
	 MbF+q2IixPQD/F6Xc+kEip6PmOBHTSF5aa3jTiOutj/RIP/5UkSWpbTqRVO0Xj+evJ
	 0VvMp/lgE2a3CDnE8Q8Cya8gAglUbWd6Ao4uLa6c7ZUcvo+VVZWdrSQ5HdlpcfSzDy
	 Oac/hnAuWG2tw==
Date: Thu, 6 Nov 2025 12:25:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"hypexed@yahoo.com.au" <hypexed@yahoo.com.au>,
	Darren Stevens <darren@stevens-zone.net>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Roland <rol7and@gmx.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251106182505.GA1962607@bhelgaas>
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
In-Reply-To: <AS8PR04MB8833068EEAD864886D2C8AA88CC2A@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 08:48:16AM +0000, Hongxing Zhu wrote:
> ...

> I tested these patches on i.MX95 EVK board with NVME storage device.
> Because that i.MX95 PCIe RC failed enter into L2 when one NVME
> device is connected to the port if ASPM L1 is enabled in default.
> 
> These patches work as expected, the l0s and l1 can be disabled after
> adding the following quirk.
> 
> "DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PHILIPS, PCI_ANY_ID,
> quirk_disable_aspm_l0s_l1_cap);"

Thanks for trying this out.

So if I understand correctly, the i.MX95 Root Port has
PCI_VENDOR_ID_PHILIPS, and if ASPM L1 is enabled on its link, the link
doesn't go to L2 when suspending?  But it *does* go to L2 on suspend
if L1 is disabled?

I wonder if the issue is with the RC or with the NVMe device.  The
comments in dw_pcie_suspend_noirq() and qcom_pcie_suspend_noirq() make
me wonder if there's something weird about NVMe and L2.

I assume you don't want to disable L0s and L1 for *all* devices with
PCI_VENDOR_ID_PHILIPS though.  Aren't there endpoints with that ID
that can use L0s and L1?

And I suppose the best thing would be if we could enable L0s and L1,
but turn them off before suspending?  That would require something
different, like something in imx_pcie_suspend_noirq() or a
DECLARE_PCI_FIXUP_SUSPEND() quirk.

