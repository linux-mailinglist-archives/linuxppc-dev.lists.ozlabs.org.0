Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D4644E6A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 23:14:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRZTH4z1wz3bgk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 09:14:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cyf1Huo8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cyf1Huo8;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRZSN50gWz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 09:13:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D724261929;
	Tue,  6 Dec 2022 22:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB50C433D7;
	Tue,  6 Dec 2022 22:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670364817;
	bh=aaEuMflWG3h9lGdqzzs38XODN98pr4Rxd/gte/nw7TI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Cyf1Huo8bUIvhPTTxdlAnMIoObwq8hm8lFH2xRlU+32//CwMWZoj0N+zd5sa6NwDv
	 3Wq3H0x6TCtNEnXCJONRinvp16pjnlgj6qc1/B0rT9b73MwJwl97YbZgIq359Wl72V
	 XlQH/pu7lDqBjUfTDqHlKDTond8AQy82ghJG5MdF8FLlN9C7x6w98HZGg1oWGgjzS6
	 H2zt7DhAjGDWqAI/vckpY4bDJlfGqQGWhaVCZ7FKsLsEFgQKVOb5tyKa8jxgYaJCiB
	 QH5JUi6AJF6o7qoZ39xzM4QeSa9mKLpufnMdk1KrSZqUajZB2x0AnxT3CuAUy6LlKL
	 dUlHI/RmVZCjg==
Date: Tue, 6 Dec 2022 16:13:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>
Subject: Re: [PATCH v3 4/9] scsi: lpfc: Change to use
 pci_aer_clear_uncorrect_error_status()
Message-ID: <20221206221335.GA1363005@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928105946.12469-5-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[moved James, Dick, LPFC supporters to "to"]

On Wed, Sep 28, 2022 at 06:59:41PM +0800, Zhuo Chen wrote:
> lpfc_aer_cleanup_state() requires clearing both fatal and non-fatal
> uncorrectable error status.

I don't know what the point of lpfc_aer_cleanup_state() is.  AER
errors should be handled and cleared by the PCI core, not by
individual drivers.  Only lpfc, liquidio, and sky2 touch
PCI_ERR_UNCOR_STATUS.

But lpfc_aer_cleanup_state() is visible in the
"lpfc_aer_state_cleanup" sysfs file, so removing it would break any
userspace that uses it.

If we can rely on the PCI core to clean up AER errors itself
(admittedly, that might be a big "if"), maybe lpfc_aer_cleanup_state()
could just become a no-op?

Any comment from the LPFC folks?

Ideally, I would rather not export pci_aer_clear_nonfatal_status() or
pci_aer_clear_uncorrect_error_status() outside the PCI core at all.

> But using pci_aer_clear_nonfatal_status()
> will only clear non-fatal error status. To clear both fatal and
> non-fatal error status, use pci_aer_clear_uncorrect_error_status().
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/scsi/lpfc/lpfc_attr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
> index 09cf2cd0ae60..d835cc0ba153 100644
> --- a/drivers/scsi/lpfc/lpfc_attr.c
> +++ b/drivers/scsi/lpfc/lpfc_attr.c
> @@ -4689,7 +4689,7 @@ static DEVICE_ATTR_RW(lpfc_aer_support);
>   * Description:
>   * If the @buf contains 1 and the device currently has the AER support
>   * enabled, then invokes the kernel AER helper routine
> - * pci_aer_clear_nonfatal_status() to clean up the uncorrectable
> + * pci_aer_clear_uncorrect_error_status() to clean up the uncorrectable
>   * error status register.
>   *
>   * Notes:
> @@ -4715,7 +4715,7 @@ lpfc_aer_cleanup_state(struct device *dev, struct device_attribute *attr,
>  		return -EINVAL;
>  
>  	if (phba->hba_flag & HBA_AER_ENABLED)
> -		rc = pci_aer_clear_nonfatal_status(phba->pcidev);
> +		rc = pci_aer_clear_uncorrect_error_status(phba->pcidev);
>  
>  	if (rc == 0)
>  		return strlen(buf);
> -- 
> 2.30.1 (Apple Git-130)
> 
