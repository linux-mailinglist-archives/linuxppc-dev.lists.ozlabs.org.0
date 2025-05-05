Return-Path: <linuxppc-dev+bounces-8297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45168AA96E4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 17:05:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrlFY5x4Sz2xWc;
	Tue,  6 May 2025 01:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746457521;
	cv=none; b=GPHISNiYLmiiMTRus2zhwRBe7hyc4eNsm7f1smGs3AX3TLJ5264VU0jB4JAQIlzPt9EhoUhZaOOjm9XRdGxADJP6m5v+6lWjJ7H/lEkWlw9lPBjM5bqq/q5qmBDgrialOE6206Fuxo7Pl8uD2BBfR4xzLOxpf5Qu2B9Z2Y6jey6fmvU4aWbJJ+R8HWGeOdWz8u0nOaQL8KQb5MgHjJRGShgQHdCdZiTgkFgeXxzZFaEfARroVeN/nOE7OaNq5bqqavS5/itTJ+DmEHwnJO5kOOeej7mAooINMqqNb5lrMZ7W3KgKxcAlOrx0V3H1ZQSsnp4tWgTxdnsoQ8UEvxwVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746457521; c=relaxed/relaxed;
	bh=T+qXACh+orFstyMcko98tuRTzfxhHQyvvDnRU8Dpz2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B91Z08i4ZgP+CT9DN7vVjwGV38V20/rCjB2Wkj8DnuWqKNDHR/HraYbXApjVW+w2Q6Wo8RvYqyuv07t7eyqnKksqAhAFUHCFWX5H5MpUbz6OXRmFHXB8H+eMGPxDzWfJbgzuDmJ6kfAsKJ4ysBfoND9taDJECNVuuOJJQJ6x2kjC+lA/iP3EwGcR4ZiWSZAp2xaO7quXP0IZTD+QCw0ljLcjfvDEbgm7Xb+JnYgbM8EScj0vTeRlU+yY7ntydAQz9PIykgiLUS/ZDe/0rea6bjzpY5Q/pFm98Ka4SFTRswfGcQuf63LzkGAngqfqTfttolEVZ7lG69h2X2EEglIxJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GBSqCk/x; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GBSqCk/x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrlFX5Kqhz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 01:05:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 693C94A738;
	Mon,  5 May 2025 15:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F76CC4CEE4;
	Mon,  5 May 2025 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746457518;
	bh=tVwY1GhHmqP4tNt6PF7NZ89nMFSpxg7uRS+j8Qo6g3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBSqCk/xbHGCM6+NNMlpLQtOhHa+ERjy2QkOGRQzAhDpyDdOUa/ne7UZQ4uiH2bGy
	 utwN7dvaElYocZWWZ8zV+ilIOEUxgzRxIYWDmAyZwGFBzppVTztXR2ITc7/LUHeVaD
	 l8t58dkIeX9CikCl4ZG3QKczALeaRoEermE6CuDbOzrQ4HKmDj1iZ0sm/egm+N6XFR
	 2ZagUpMpX52vB/uJ/qVM5cSMENXexwQ60phGkPFo5OGKJ3RyTCmFWi3RjWqZ94j+u1
	 8s48ANOuF7cnPTaPjlyFVTKMGhFYvV9JmRJLZ482FwgaxRJO6Qa/cJWEc4cH3jxkQq
	 TN1/EnXSDIdkg==
Date: Mon, 5 May 2025 17:05:10 +0200
From: Niklas Cassel <cassel@kernel.org>
To: manivannan.sadhasivam@linaro.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <aBjTpglI5_P2Q3Aa@ryzen>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
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
In-Reply-To: <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Mani,

On Thu, Apr 17, 2025 at 10:46:31PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> @@ -1571,6 +1652,9 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>  		pci_unlock_rescan_remove();
>  
>  		qcom_pcie_icc_opp_update(pcie);
> +	} else if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> +		dev_dbg(dev, "Received Link down event\n");
> +		pci_host_handle_link_down(pp->bridge);
>  	} else {
>  		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
>  			      status);

From debugging an unrelated problem, I noticed that dw-rockchip can
sometimes have both "link up" bit and "hot reset or link down" bit set
at the same time, when reading the status register.

Perhaps the link went down very quickly and then was established again
by the time the threaded IRQ handler gets to run.

Your code seems to do an if + else if.

Without knowing how the events work for your platforms, I would guess
that it should also be possible to have multiple events set.


In you code, if both LINK UP and hot reset/link down are set,
I would assume that you driver will not do the right thing.

Perhaps you want to swap the order? So that link down is handled first,
and then link up is handled. (If you convert to "if + if "instead of
"if + else if" that is.)


Kind regards,
Niklas

