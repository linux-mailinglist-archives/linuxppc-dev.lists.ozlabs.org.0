Return-Path: <linuxppc-dev+bounces-11742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77415B43DF9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 16:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHh6G04Ldz2xlM;
	Fri,  5 Sep 2025 00:03:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756994629;
	cv=none; b=c+EAx5iklh0eVT+Hy6G3MqEvzwqCJeosWrbpCFrdoKKvM9dNpMUBdTtfxelKojxJyo8BYuZ9idxTZHMaLj3JOF+Zg09xe3TnbEomenk4kFZfudw1da/VjeYXaHwXt0LARiYuL2HTwYUHDl6JPb5IPozrQs9QZjSQAbzcsj/qiN29yWip69TD2vJOKA91wggJ8vKdaSzusyQ3gWyZRnCyC+JiE0Z054qxKM59b28X/+HwgE6Hy6BLoewudSUHsqXuA56MkcFMQTBr69yhLjByhL0I3uMh9ouzcwwIj5SBMCCym677xnP1zha8wriACdbsHOMOVg8BNbkBFlawnl4j3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756994629; c=relaxed/relaxed;
	bh=4zy5l8eFFMF0aUoyAy0bt7SnpxYRV0uRa+VleoKKZoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq6NUub8SE5eODDKGNxRBTU8TJKzhKWvNM6KIvlAZxLSw88WuTlQw3EVBezNcr5RHEBcBVVLlMGxkdXS4y49lL8AwpV4ZcHxbrPqbMHWFDUBvs/Hwh3TTNkd0/cd9fQ+oMIkZdEdotJxg12yddBMB/c0kXVexvfH77/zyvSIOBYDBjRvJ0FKVqAe2YPO7sSIY9XBGMw0jtypYR90jfc7DApdxXCk1oXfQQwfL9mFUsPWQ8Ingf0N3EaKkAC/uyfwEEjI2Z9zBfm3IC8pckxhvByAk/YHvT0qtSguPVqB2hKXoJUYfQHts5y9QRZVZMy03EIZGXvBj1xJIYTbTJfpRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QC/MO2Y2; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QC/MO2Y2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHh6F0Z89z2xSd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 00:03:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B088D601AD;
	Thu,  4 Sep 2025 14:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879F7C4CEF5;
	Thu,  4 Sep 2025 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756994626;
	bh=R15ptoc9ZlyJDelkbhGWd7+PsXr/DbQC7TFvXfTYnKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QC/MO2Y21Nvl8IUs+sKbBsur180b4DnqC1iRGs4cDEmtA2dB/F/DnTrHtME+ejmVt
	 Luw0G/b7TvS7mgqn4/WGSz4oN0IxJL4Qp4DYbP1QiYIZ6dJC+aYOy016xPny2cLPdp
	 qXCYd3SoXMaiy6V8e+4y/EWctLTx89eNUWbPQlzkcICrdqPWKjBZ5cM+cm2gN0i5to
	 2uHoLd86exMI9vMi6Eaz9JWEuNZ+hMpteDcLawe2q2LzBrnzIqS75vGOlEqBd9cdCI
	 5172NQ1AECfMvUm+FZS/Svpc+N9NQOhz7vDTOR9r2AfIE9ewQk1UYNlx+Ffe+LAe7R
	 1esFMTJP1dR+Q==
Date: Thu, 4 Sep 2025 16:03:39 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
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
Message-ID: <aLmcO8ukT-CDZMuT@ryzen>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
 <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
 <aJ743hJw-T9y3waX@ryzen>
 <lakgphb7ym3cybwmpdqyipzi4tlkwbfijzhd4r6hvhho3pc7iu@6ludgw6wqkjh>
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
In-Reply-To: <lakgphb7ym3cybwmpdqyipzi4tlkwbfijzhd4r6hvhho3pc7iu@6ludgw6wqkjh>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Mani,

On Fri, Aug 29, 2025 at 09:44:08PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Aug 15, 2025 at 11:07:42AM GMT, Niklas Cassel wrote:

(snip)

> > > > > ## On EP side:
> > > > > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> > > > >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > > > > 
> > > > > Basically all tests timeout
> > > > > # FAILED: 1 / 16 tests passed.
> > > > > 
> > > > > Which is the same as before this patch series.
> > > 
> > > This is kind of expected since the pci_endpoint_test driver doesn't have the AER
> > > err_handlers defined.
> > 
> > I see.
> > Would be nice if we could add them then, so that we can verify that this
> > series is working as intended.

(snip)

> Ok, thanks for the logs. I guess what is happening here is that we are not
> saving/restoring the config space of the devices under the Root Port if linkdown
> is happens. TBH, we cannot do that from the PCI core since once linkdown
> happens, we cannot access any devices underneath the Root Port. But if
> err_handlers are available for drivers for all devices, they could do something
> smart like below:
> 
> diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> index c4e5e2c977be..9aabf1fe902e 100644
> --- a/drivers/misc/pci_endpoint_test.c
> +++ b/drivers/misc/pci_endpoint_test.c
> @@ -989,6 +989,8 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
>  
>         pci_set_drvdata(pdev, test);
>  
> +       pci_save_state(pdev);
> +
>         id = ida_alloc(&pci_endpoint_test_ida, GFP_KERNEL);
>         if (id < 0) {
>                 ret = id;
> @@ -1140,12 +1142,31 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, pci_endpoint_test_tbl);
>  
> +static pci_ers_result_t pci_endpoint_test_error_detected(struct pci_dev *pdev,
> +                                              pci_channel_state_t state)
> +{
> +       return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
> +{
> +       pci_restore_state(pdev);
> +
> +       return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static const struct pci_error_handlers pci_endpoint_test_err_handler = {
> +       .error_detected = pci_endpoint_test_error_detected,
> +       .slot_reset = pci_endpoint_test_slot_reset,
> +};
> +
>  static struct pci_driver pci_endpoint_test_driver = {
>         .name           = DRV_MODULE_NAME,
>         .id_table       = pci_endpoint_test_tbl,
>         .probe          = pci_endpoint_test_probe,
>         .remove         = pci_endpoint_test_remove,
>         .sriov_configure = pci_sriov_configure_simple,
> +       .err_handler    = &pci_endpoint_test_err_handler,
>  };
>  module_pci_driver(pci_endpoint_test_driver);
> 
> This essentially saves the good known config space during probe and restores it
> during the slot_reset callback. Ofc, the state would've been overwritten if
> suspend/resume happens in-between, but the point I'm making is that unless all
> device drivers restore their known config space, devices cannot be resumed
> properly post linkdown recovery.
> 
> I can add a patch based on the above diff in next revision if that helps. Right
> now, I do not have access to my endpoint test setup. So can't test anything.

I tested your patch series + your suggested change above, and after a:

## On EP side:
# echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
  sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start

Instead of:

# FAILED: 1 / 16 tests passed.

I now get:
# FAILED: 7 / 16 tests passed.

Test cases 1-7 now passes (the test cases related to BARs),
all other test cases still fail:

# /pcitest 
TAP version 13
1..16
# Starting 16 tests from 9 test cases.
#  RUN           pci_ep_bar.BAR0.BAR_TEST ...
#            OK  pci_ep_bar.BAR0.BAR_TEST
ok 1 pci_ep_bar.BAR0.BAR_TEST
#  RUN           pci_ep_bar.BAR1.BAR_TEST ...
#            OK  pci_ep_bar.BAR1.BAR_TEST
ok 2 pci_ep_bar.BAR1.BAR_TEST
#  RUN           pci_ep_bar.BAR2.BAR_TEST ...
#            OK  pci_ep_bar.BAR2.BAR_TEST
ok 3 pci_ep_bar.BAR2.BAR_TEST
#  RUN           pci_ep_bar.BAR3.BAR_TEST ...
#            OK  pci_ep_bar.BAR3.BAR_TEST
ok 4 pci_ep_bar.BAR3.BAR_TEST
#  RUN           pci_ep_bar.BAR4.BAR_TEST ...
#      SKIP      BAR is disabled
#            OK  pci_ep_bar.BAR4.BAR_TEST
ok 5 pci_ep_bar.BAR4.BAR_TEST # SKIP BAR is disabled
#  RUN           pci_ep_bar.BAR5.BAR_TEST ...
#            OK  pci_ep_bar.BAR5.BAR_TEST
ok 6 pci_ep_bar.BAR5.BAR_TEST
#  RUN           pci_ep_basic.CONSECUTIVE_BAR_TEST ...
#            OK  pci_ep_basic.CONSECUTIVE_BAR_TEST
ok 7 pci_ep_basic.CONSECUTIVE_BAR_TEST
#  RUN           pci_ep_basic.LEGACY_IRQ_TEST ...
# pci_endpoint_test.c:106:LEGACY_IRQ_TEST:Expected 0 (0) == ret (-110)
# pci_endpoint_test.c:106:LEGACY_IRQ_TEST:Test failed for Legacy IRQ
# LEGACY_IRQ_TEST: Test failed
#          FAIL  pci_ep_basic.LEGACY_IRQ_TEST
not ok 8 pci_ep_basic.LEGACY_IRQ_TEST
#  RUN           pci_ep_basic.MSI_TEST ...
# pci_endpoint_test.c:118:MSI_TEST:Expected 0 (0) == ret (-110)
# pci_endpoint_test.c:118:MSI_TEST:Test failed for MSI1
# pci_endpoint_test.c:118:MSI_TEST:Expected 0 (0) == ret (-110)
# pci_endpoint_test.c:118:MSI_TEST:Test failed for MSI2
# pci_endpoint_test.c:118:MSI_TEST:Expected 0 (0) == ret (-110)
# pci_endpoint_test.c:118:MSI_TEST:Test failed for MSI3
...


I think I know the reason.. you save the state before the IRQs have been allocated.

Perhaps we need to save the state after enabling IRQs?

I tried this patch on top of your patch:
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -851,6 +851,8 @@ static int pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
                return ret;
        }
 
+       pci_save_state(pdev);
+
        return 0;
 }


But still:
# FAILED: 7 / 16 tests passed.

So... apparently that did not help...

I tried with the following change as well (on top of my patch above):

+static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
+{
+       struct pci_endpoint_test *test = pci_get_drvdata(pdev);
+       int irq_type = test->irq_type;
+
+       pci_restore_state(pdev);
+
+       if (irq_type != PCITEST_IRQ_TYPE_UNDEFINED) {
+               pci_endpoint_test_clear_irq(test);
+               pci_endpoint_test_set_irq(test, irq_type);
+       }
+
+       return PCI_ERS_RESULT_RECOVERED;
+}

But still only:
# FAILED: 7 / 16 tests passed.

Do you have any suggestions?


Kind regards,
Niklas

