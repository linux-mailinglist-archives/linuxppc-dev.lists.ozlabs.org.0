Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3AC84AA5C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 00:13:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bag10mqg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTMcc3HS7z3c75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 10:13:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bag10mqg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTMbp083Zz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 10:12:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DAB03612B7;
	Mon,  5 Feb 2024 23:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C61C433C7;
	Mon,  5 Feb 2024 23:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707174753;
	bh=OqDQTVaTAC7P8L+gci1WqEUJDMaXntqkOBZoBUDrdLI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Bag10mqgJTqDDZ2nf/rhFKcRX46JasJnfMnqmkVPvxLV0Z9VtKH/VnN5cSPWYAUH1
	 vS9wtjSuSeG54Ovqhes4aNpS+JMvTymxRgkpM15XDK8WL8gNq69HF4DltQUt39KNHl
	 JmXk2S1NAMN5SDpCacdseKINzcA9VVg15H0Vkejx9uz5FcDhBqBN77cFIN5ucOyBFR
	 QGiB0godWa6MmqczYSOEzz/43UqpTUoTuCF/IX9UkSHRfP94WiQMGmhbfKMKeQmHYP
	 vZFqE4lHtwzWpRD1z1/w/GppnhyKJIz3o7b2WRFCrQctk1h1l6482/+QoFoHfiaGLj
	 mHo2ki2u8ezcg==
Date: Mon, 5 Feb 2024 17:12:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Subject: Re: [PATCH v2 1/4] PCI/AER: Store more information in aer_err_info
Message-ID: <20240205231231.GA830643@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125062802.50819-2-qingshun.wang@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, qingshun.wang@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonk
 ar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 25, 2024 at 02:27:59PM +0800, Wang, Qingshun wrote:
> When Advisory Non-Fatal errors are raised, both correctable and
> uncorrectable error statuses will be set. The current kernel code cannot
> store both statuses at the same time, thus failing to handle ANFE properly.
> In addition, to avoid clearing UEs that are not ANFE by accident, UE
> severity and Device Status also need to be recorded: any fatal UE cannot
> be ANFE, and if Fatal/Non-Fatal Error Detected is set in Device Status, do
> not take any assumption and let UE handler to clear UE status.
> 
> Store status and mask of both correctable and uncorrectable errors in
> aer_err_info. The severity of UEs and the values of the Device Status
> register are also recorded, which will be used to determine UEs that should
> be handled by the ANFE handler. Refactor the rest of the code to use
> cor/uncor_status and cor/uncor_mask fields instead of status and mask
> fields.

There's a lot going on in this patch.  Could it possibly be split up a
bit, e.g., first tease apart aer_err_info.status/.mask into
.cor_status/mask and .uncor_status/mask, then add .uncor_severity,
then add the device_status bit separately?  If it could be split up, I
think the ANFE case would be easier to see.

Thanks a lot for working on this area!

Bjorn
