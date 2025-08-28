Return-Path: <linuxppc-dev+bounces-11443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1ACB3AC03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 22:52:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCYVt1H4Dz2yDH;
	Fri, 29 Aug 2025 06:52:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756412720;
	cv=none; b=W3KfmC62lJXO/QxsxBvuaV8Wq5AumQQn9ZLH0Q79I8ssIZxOB4yeBFCbLm0Z7zMu7OPPSVGDMOgW3Met8uCk9QF0Gbo7Q8FnFBiIPaUsIMTRbx+FqynZazn1tEUsk21FFFi6eYelpSS4xGTtCao2FqS3YJ5v9afGnikzqwtZ9itUDo4FYzYwQMLGuejRSyqTmMmvGKSMGwQ0XmB7lellmUAMMjZeTRA6vevEnNv7XlnoR81fXsRk9QxQ6IQN9ft4alKMoLIEe7F5qtMueEweTgvpmBAc31zggQF8YLoF3fFvEQBMHUtRwxvWhQZ4nl/GwWdfl2LxG9/UATCm7X0vZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756412720; c=relaxed/relaxed;
	bh=526DZvOdfFdWnRr7VLIYoJ9rOuKdtRXZH6VtJYFQMAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP0c6D8b6qjQh3IPPckXlEam1Ucj+8ZMZ4CRyum5ub7wgMfPMGjyV5S/exYT3tkTWzi7crgjHHhpjVjJ/naYgu30ZaCpnd80UA2p6C2J/ZITZpuoFYYUxUHHiSO66iFXT2KIOUX1mnuOsdcWYEZfWYhHYqrGCl3vZMTwAP1Q9FUYG0qirkK8CTnkGrkUU99dWj4mV5EwI4Vn3vP0Ic3PaEPyqcc0tVzBGMEpwAd11Ei48w1iqZ4kFcS1LeAiE3BDv3fzMhKxVnG2UOdyxo3/xvVq6njRpc8pApoUS9SLYeJtKBU8QtvpMh9Vyb8O13RhteVtC2TOuDYJRHjTap9fjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NWXFH5J6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NWXFH5J6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCXvd6yn9z2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 06:25:17 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso1189513a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756412715; x=1757017515; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=526DZvOdfFdWnRr7VLIYoJ9rOuKdtRXZH6VtJYFQMAI=;
        b=NWXFH5J6VyurAYfJ7xrXXjsdKfevAD1uZB6AWNN3pzlueUq7e6baXnqd/tEZ2I2o6d
         B05OyzgyPI6C9IMEpRO6f8FwPvo5qxNpUOFI7+ixzHJuw2SQyOzrBy3zlwMopUPUPTeF
         5egBEDMN8jcQnpVkQtq6UWjYfyI8wqVia2Xv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756412715; x=1757017515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=526DZvOdfFdWnRr7VLIYoJ9rOuKdtRXZH6VtJYFQMAI=;
        b=V75Txbp9nnAlqFqF/csgLR0Crt8Gs2vpx3ZwO7JurhCFkhXk51FdPyv27s0eCtinBR
         QauaRnTBw+ZWJZ3cujgl0ow1u8sRTv7W9jh/KgOXCeI+lpsZoy5wpWc4WpZ8ssClPC/v
         FL+/rxrbmhSG9tFUyqG5Q2Tpnp8oRnBfUu/Hby2JI2ANW5cdgjUhEodq1r0h77O80LlP
         d2Xn6nSHeZBlaJFl/I3k7Brl7W0hok2UjPWyWyDtWUkmmGMyrDdvf9/D6it5FuTzg+Dx
         +LiQE6X4XAS6oAGB8E5tQsYC1cpDPvvXNx6DkAtd0FThpbs846AZb2p+LlL7NGyD/cpl
         9YGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZHbWN3nmFg+bS2GrWI20fa8h6gMYHXkN7rD9FxcpsvwT1D2U3ffi0lN7OKcbeBzkF+Qu16eV/muK0ypU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygXEvkFhfAM01T2yznUt9fYpW7Z1dbsD3ct7YGf4jAAUSat/8L
	xnBzGrT6AZM5RLj6jShB2LeD/NHNRWnDWLcb9LJVM7b+g/oDzN0zrMNd7wpUGtfZHg==
X-Gm-Gg: ASbGncuV02XhfffX1lYx6JTc9KTufKEvSXfbqDKFOdrWDUVjI0wrL/r7AwFYYFwCEoq
	kFRUFqFxCt9hsl8beTTMd+c/rUEEZq06j7u5hxTzpuCWgJh6Cw+ZQFUh9f9tT6DAfAevZ+KLMS0
	8lAdUQ11DPTZxyUowR6kjM8vnMAkHfSXozcSKRgYNzXqRO8ymxH6Fxh29ydmGRqsQ50GH6ioI38
	3OL9R8Ma6SU/Xgyq7zTHr0cCUwvcgsdoEQn9Rr53gwx2D3bSziyUxR5i9Xs2KPD5qVkg1qJPC8/
	+/QB1/3c3p9rdTDMQATd4mMc8hcBKkwFXWOoHVOJQ7rL7MEWfV2VDErZI+nF5m+v5Dp+T0BRVvS
	BcAoidfqrRHKB+kGp5cBbxwBKRV16tOmPdm0PnC1olX9GpO7lYWfXqRU++y9tzEFb26lBlxU=
X-Google-Smtp-Source: AGHT+IGZpPB1acpeu6npCjJnCfSo43c/nVfDcPN4PgeohagoMI2YXoVU4nxMTi/b5qaB6M6hyplRlg==
X-Received: by 2002:a17:903:1b65:b0:246:b1fd:2968 with SMTP id d9443c01a7336-246b1fd2ab8mr192079555ad.9.1756412715244;
        Thu, 28 Aug 2025 13:25:15 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:2893:df0f:26ec:df00])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24905bb28d4sm3845375ad.92.2025.08.28.13.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 13:25:14 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:25:12 -0700
From: Brian Norris <briannorris@chromium.org>
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
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 2/4] PCI: host-common: Add link down handling for Root
 Ports
Message-ID: <aLC7KIoi-LoH2en4@google.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <20250715-pci-port-reset-v6-2-6f9cce94e7bb@oss.qualcomm.com>
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
In-Reply-To: <20250715-pci-port-reset-v6-2-6f9cce94e7bb@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I've been testing this out with various endpoints (both upstream and
not...), and I have a question that intersects with this area:

On Tue, Jul 15, 2025 at 07:51:05PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> The PCI link, when down, needs to be recovered to bring it back. But on
> some platforms, that cannot be done in a generic way as link recovery
> procedure is platform specific. So add a new API
> pci_host_handle_link_down() that could be called by the host bridge drivers
> for a specific Root Port when the link goes down.
> 
> The API accepts the 'pci_dev' corresponding to the Root Port which observed
> the link down event. If CONFIG_PCIEAER is enabled, the API calls
> pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
> will result in the execution of the AER Fatal error handling code. Since
> the link down recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First, the AER error_detected()
> callback will be triggered for the bridge and then for the downstream
> devices.

I've been trying to understand what exactly the .error_detected()
involvement should be here (and what it actually does, despite the
docs), and especially around its return codes.

Specifically, I'm trying to see what's supposed to happen with
PCI_ERS_RESULT_CAN_RECOVER. I see that for pci_channel_io_frozen, almost
all endpoint drivers return PCI_ERS_RESULT_NEED_RESET, but if drivers
actually return PCI_ERS_RESULT_CAN_RECOVER, it's unclear what should
happen.

Today, we don't actually respect it; pcie_do_recovery() just calls
reset_subordinates() (pci_host_reset_root_port()) unconditionally. The
only thing that return code affects is whether we call
report_mmio_enabled() vs report_slot_reset() afterward. This seems odd.

It also doesn't totally match the docs:

https://docs.kernel.org/PCI/pcieaer-howto.html#non-correctable-non-fatal-and-fatal-errors
https://docs.kernel.org/PCI/pci-error-recovery.html

e.g., "PCI_ERS_RESULT_CAN_RECOVER
Driver returns this if it thinks it might be able to recover the HW by
just banging IOs or if it wants to be given a chance to extract some
diagnostic information (see mmio_enable, below)."

I've seen drivers that think they want to handle stuff on their own --
for example, if they have a handle to an external PMIC, they may try to
reset things that way -- and so they return PCI_ERS_RESULT_CAN_RECOVER
even for io_frozen. I'm not convinced that's a great idea, but I'm also
not sure what to say about the docs.

On the flip side: it's not clear
PCI_ERS_RESULT_NEED_RESET+pci_channel_io_normal works as documented
either. An endpoint might think it's requesting a slot reset, but
pcie_do_recovery() will ignore that and skip reset_subordinates()
(pci_host_reset_root_port()).

All in all, the docs sound like endpoints _should_ have control over
whether we exercise a full port/slot reset for all types of errors. But
in practice, we do not actually give it that control. i.e., your commit
message is correct, and the docs are not.

I have half a mind to suggest the appended change, so the behavior
matches (some of) the docs a little better [1].

Brian

> Finally, pci_host_reset_root_port() will be called for the Root
> Port, which will reset the Root Port using 'reset_root_port' callback to
> recover the link. Once that's done, resume message will be broadcasted to
> the bridge and the downstream devices, indicating successful link recovery.
> 
> But if CONFIG_PCIEAER is not enabled in the kernel, only
> pci_host_reset_root_port() API will be called, which will in turn call
> pci_bus_error_reset() to just reset the Root Port as there is no way we
> could inform the drivers about link recovery.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

[1]

--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -219,13 +219,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	pci_dbg(bridge, "broadcast error_detected message\n");
 	if (state == pci_channel_io_frozen) {
 		pci_walk_bridge(bridge, report_frozen_detected, &status);
-		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
-			pci_warn(bridge, "subordinate device reset failed\n");
-			goto failed;
-		}
 	} else {
 		pci_walk_bridge(bridge, report_normal_detected, &status);
 	}
+	pci_dbg(bridge, "error_detected result: %d\n", status);
 
 	if (status == PCI_ERS_RESULT_CAN_RECOVER) {
 		status = PCI_ERS_RESULT_RECOVERED;
@@ -234,6 +231,11 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
+		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
+			pci_warn(bridge, "subordinate device reset failed\n");
+			goto failed;
+		}
+
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);

