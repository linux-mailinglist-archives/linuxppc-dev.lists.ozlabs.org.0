Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FD9499E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 23:08:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TQNSmjLV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdm9r1GLVz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 07:08:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TQNSmjLV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wdm983QtDz3cQH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 07:07:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBF9960FB2;
	Tue,  6 Aug 2024 21:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1E8C32786;
	Tue,  6 Aug 2024 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722978455;
	bh=fwy/hFuEzc/8Djy+Yqlwe2rdhsajP4MpZ0SQI/SH38o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TQNSmjLV9JusVY9BAK1XSqpIeWuKGPVP9IGCewCt86QoQkJy0SMvCieLUPsEiKNwG
	 x6IGRHo3Zz3xXO+ElaOyoSweVfgQhrZSNyOovkneSRvFWkrv7IX1p4G55FTovFyVMn
	 ak+DI8NztxMCkJJfUxuMZzg71/8S2fwBLhK3Q2Bjh0GLO6jB/WUmI3H2llIrxP6Iwl
	 lw+K0hwVklH0+khWFk/KdYJsDFwUw1jljbOTZckcn+rLJZntKSB3xGsAJt/qX3RhFy
	 DMuwErwo8lOHv46XQo66rGJDbKYkSFai3cHNuO/rBLdCzrjgog2Uql+cKUCSoLqLTQ
	 /wyN9P0HynyHQ==
Date: Tue, 6 Aug 2024 16:07:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: Re: [PATCH 1/2] ACPI: extlog: Trace CPER Non-standard Section Body
Message-ID: <20240806210733.GA78095@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527144356.246220-2-fabio.m.de.francesco@linux.intel.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-acpi@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2024 at 04:43:40PM +0200, Fabio M. De Francesco wrote:
> In extlog_print(), trace "Non-standard Section Body" reported by firmware
> to the OS via Common Platform Error Record (CPER) (UEFI v2.10 Appendix N
> 2.3) to add further debug information and so to make ELOG log
> consistently with ghes_do_proc() (GHES).
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/acpi_extlog.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index f055609d4b64..e025ae390737 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -179,6 +179,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			if (gdata->error_data_length >= sizeof(*mem))
>  				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>  						       (u8)gdata->error_severity);
> +		} else {
> +			void *err = acpi_hest_get_payload(gdata);
> +
> +			trace_non_standard_event(sec_type, fru_id, fru_text,
> +						 gdata->error_severity, err,
> +						 gdata->error_data_length);

Kudos for making these two paths more similar.

Not specific to *this* patch, but it's annoying to try to find
tracepoint implementations.  I guess it's
TRACE_EVENT(non_standard_event, ...) in include/ras/ras_event.h.

This has the same prototype as log_non_standard_event(), so
could extlog_print() be made a little bit more like ghes_do_proc() by
using log_non_standard_event() instead of trace_non_standard_event()
directly?

Bjorn
