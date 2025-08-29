Return-Path: <linuxppc-dev+bounces-11489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F213B3C065
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 18:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD3Hd5PtFz2yqm;
	Sat, 30 Aug 2025 02:14:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756484061;
	cv=none; b=UGbSzFtY2Rmo+ARZ0MBDbjzYen6SWYW6ackRUU1B4Klt7yuCa1BsmqbKG6CJYb9liUGxB7WnbdE/WHDpz6oYbJDRrDYePsMRCbd4KDJGrah1Rv3E1MYhpGeipToiym+eYeGwftTyPj06iuPqFaekKqaKrzw0YSfJqj7O1O118nk3Igu8bhHCQWfhj96q/MbiSztfWy8wQelQPdYFTYybeOoshkXQ1bRpK2cUCHeshG7mgNRzRVjlkUP3+8Y/cXfcHEzitslQH6Imo2ec3K1Y/IQOM3O3M1fNrtfQSBRQyiN/p2MbzlVZyNpIhFdLi3p0EXZwsNNS+rxStBg3mt1xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756484061; c=relaxed/relaxed;
	bh=L3316HzmhHkmk9hKvXvEDln2bo796IPL6VBsugzS4/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNcBuBq6SmlKdjaTvs1/CC1CStoy/2ZtC6kgc4aQgj+FZJoOWS+nIYo/B2cTFLAjpEjRz5oo5yvZ48m+oTdCP16UNtD1v2nIr02rk+QEYfneQTzgNBibcTg8ZxpY1IIrB/fcz6qHHA5p7FFKVy8ZAAWAUU0ERGa3cGwCPU1k2tb5c7V0ccQAM1COpRAu2oNBPYBKzZnzb6aTMiYOMlhazhzq8YcEcHkVhUA2xKmasHWqkI68geU6OHu1s/3NtbQHxtXEqpDegoSfU6JUrWWAZ0jBhk2p20o+CY7Z1sB87pp1bjI9DFNuGxogolwooWlff1f4+HFjygBk0uvzWYr14Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiD2cadK; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiD2cadK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD3Hc5G9Kz2yqc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 02:14:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0BF543B1D;
	Fri, 29 Aug 2025 16:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E018EC4CEF0;
	Fri, 29 Aug 2025 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756484058;
	bh=9/2QQ3RiREaiSyUiO5ececD/jqVoWkLkjCUAA6bmPFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiD2cadK21kq8/1+HU/s47ctfSPLku5kGvKTU7+gDfo/gUItwd4dziv5/tFHyDjA3
	 dACICfHN5ycuJ0zCVyJEGvOUCEHo//mnsfRwQ0n8QYvaRL+jNuTCE0uxiPycoOxfKJ
	 Rc2x7zplfineGU0ObrNOZgLV2N4Sh3IaCMgloqtMAMIQrcMYD0+vOso4yZir1v0vsn
	 aIPXp3BW/jRTHj7UtQZMK2uucxb/dAmf7R2VDOHrWTFipB+9j+an/6BSfP8W67y0y6
	 DvOdYSsic046Ef3N9iAMNudz19ePRAzBC5VHmfwZrqilD+dK33LmRJ99TJKxjMskcQ
	 dOzixjq9Ekf4w==
Date: Fri, 29 Aug 2025 21:44:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <lakgphb7ym3cybwmpdqyipzi4tlkwbfijzhd4r6hvhho3pc7iu@6ludgw6wqkjh>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
 <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
 <aJ743hJw-T9y3waX@ryzen>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ743hJw-T9y3waX@ryzen>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 15, 2025 at 11:07:42AM GMT, Niklas Cassel wrote:
> Hello Mani,
> 
> Sorry for the delayed reply.
> I just came back from vacation.
> 
> On Thu, Jul 24, 2025 at 11:00:05AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Jul 18, 2025 at 12:39:50PM GMT, Niklas Cassel wrote:
> > > On Fri, Jul 18, 2025 at 12:28:44PM +0200, Niklas Cassel wrote:
> > > > On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > > 2) Testing link down reset:
> > > > 
> > > > selftests before link down reset:
> > > > # FAILED: 14 / 16 tests passed.
> > > > 
> > > > ## On EP side:
> > > > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> > > >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > > > 
> > > > 
> > > > [  111.137162] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
> > > > [  111.137881] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
> > > > [  111.138432] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
> > > > [  111.139067] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> > > > [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> > > > [  111.255407] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
> > > > [  111.256019] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
> > > > [  111.383401] pcieport 0000:00:00.0: Root Port has been reset
> > > > [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
> > > > [  111.384582] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
> > > > [  111.385218] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
> > > > [  111.385771] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
> > > > [  111.390866] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> > > > [  111.391650] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> > > > 
> > > > Basically all tests timeout
> > > > # FAILED: 1 / 16 tests passed.
> > > > 
> > > > Which is the same as before this patch series.
> > > 
> > > The above was with CONFIG_PCIEAER=y
> > > 
> > 
> > This is kind of expected since the pci_endpoint_test driver doesn't have the AER
> > err_handlers defined.
> 
> I see.
> Would be nice if we could add them then, so that we can verify that this
> series is working as intended.
> 
> 
> > 
> > > Wilfred suggested that I tried without this config set.
> > > 
> > > However, doing so, I got the exact same result:
> > > # FAILED: 1 / 16 tests passed.
> > > 
> > 
> > Interesting. Could you please share the dmesg log like above.
> 
> It is looking exactly like the dmesg above
> 
> [   86.820059] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
> [   86.820791] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
> [   86.821344] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
> [   86.821978] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> [   87.040551] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
> [   87.041138] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
> [   87.168378] pcieport 0000:00:00.0: Root Port has been reset
> [   87.168882] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
> [   87.169519] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
> [   87.272463] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
> [   87.277552] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> [   87.278314] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> except that we don't get the:
> > [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> > [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
> 

Ok, thanks for the logs. I guess what is happening here is that we are not
saving/restoring the config space of the devices under the Root Port if linkdown
is happens. TBH, we cannot do that from the PCI core since once linkdown
happens, we cannot access any devices underneath the Root Port. But if
err_handlers are available for drivers for all devices, they could do something
smart like below:

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index c4e5e2c977be..9aabf1fe902e 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -989,6 +989,8 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 
        pci_set_drvdata(pdev, test);
 
+       pci_save_state(pdev);
+
        id = ida_alloc(&pci_endpoint_test_ida, GFP_KERNEL);
        if (id < 0) {
                ret = id;
@@ -1140,12 +1142,31 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, pci_endpoint_test_tbl);
 
+static pci_ers_result_t pci_endpoint_test_error_detected(struct pci_dev *pdev,
+                                              pci_channel_state_t state)
+{
+       return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
+{
+       pci_restore_state(pdev);
+
+       return PCI_ERS_RESULT_RECOVERED;
+}
+
+static const struct pci_error_handlers pci_endpoint_test_err_handler = {
+       .error_detected = pci_endpoint_test_error_detected,
+       .slot_reset = pci_endpoint_test_slot_reset,
+};
+
 static struct pci_driver pci_endpoint_test_driver = {
        .name           = DRV_MODULE_NAME,
        .id_table       = pci_endpoint_test_tbl,
        .probe          = pci_endpoint_test_probe,
        .remove         = pci_endpoint_test_remove,
        .sriov_configure = pci_sriov_configure_simple,
+       .err_handler    = &pci_endpoint_test_err_handler,
 };
 module_pci_driver(pci_endpoint_test_driver);

This essentially saves the good known config space during probe and restores it
during the slot_reset callback. Ofc, the state would've been overwritten if
suspend/resume happens in-between, but the point I'm making is that unless all
device drivers restore their known config space, devices cannot be resumed
properly post linkdown recovery.

I can add a patch based on the above diff in next revision if that helps. Right
now, I do not have access to my endpoint test setup. So can't test anything.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

