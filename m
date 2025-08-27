Return-Path: <linuxppc-dev+bounces-11397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D1EB38A31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 21:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBvf90yVfz2ySY;
	Thu, 28 Aug 2025 05:26:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756322785;
	cv=none; b=lK7QGIUlkbnh26ZZsQdZtSR8DmNs0nwSQDDavhpFNVd/401dbk30ltSLRtGCXFmuTzPprAN3ABQSQp4xkQB0aWRYaNSdlptaedj2OkELdsEkcNvMJRJ248rQDWLrm4ZDm0aR7g0vlUHxZznfWTwYK8w6FGF45ZYCOlh9qKN0H8gx+EbpDL1T6VbolU/l/PgzZ4+VMvOu44nDKfhiJiC/S2Ah5LA7ajbjuFNE333dCZGr/PDYCnlYzm9xQ0+HAKkYDuXXtPjdmqhZYtVnhYvWjBdLILLkLA4km5GiNviT5fxKe9oCqddb5w3DnBnqpGy9Q1hF+MntE/0we9Qo3c/fQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756322785; c=relaxed/relaxed;
	bh=H3NeMFUnRkllOvPvrjofVEtM9cSDk69ZXyDlfd/aBD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jkYnBH5/r4p6LFqJR1ESESqhsRemAB37hzbPKrY/l45DgBFpJKjtH7Y11zfB7hmAcKtU/9++7+03GKZ++l+YNnRG1iVVUpPV3aChhQlcz5sqNsM0yjvxojEDosY8YQ0U2AJxQgj2S66lYWbtUya5l9X1tO7GHfBe9B4llMSSUVl1Mva74I3xGvggNXgJLgWcCtNow6hepQ7W+0mLLCgzAxabK0SisC560QFhRcb3f9SE9bLGpvf/BqmiCANy+8Ddb8znB6f3almaITnO8vgXlIxaQ4OaZVcpsGWaRKwZM7DsR1lXDm1Jh96w6xoHUZI6eNbpa0IOZxu9RwMZwAOApg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mrMRCa8B; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mrMRCa8B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBvf76NvWz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 05:26:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6244A43A16;
	Wed, 27 Aug 2025 19:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20924C4CEF4;
	Wed, 27 Aug 2025 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756322781;
	bh=LsA7ZOxoBvYSNrrcpvDmb056rLUcRAIeEvgBLT/jOP8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mrMRCa8BgGthZWppKJVQhU2g5bmIIf9uvfJelrBiPml0sWYGWybHeNVkKKUMFTeWb
	 3jhF9XvQmLNoj81iZ7AysmkLVtmehHGU6s2CbtcFvsgPeo+KGQ5QPxKEZeTLqmI8AT
	 w6/hWGAasWUszW3G85lzIdpn1NvTp4cn6CTm2aiouIZfuFou7iD3QgAEuy9tg2QLIE
	 YU25hLJz7beNnwaaUo2mtLd6smZ7w9ysYG+w6P3O1Aachxs58HUCZ6lMDAFQeJmhL6
	 XmZTe30eLCnmsAJrTsg26IZID9NlOi7PZ9pUKbuL13S8JRzMH2Bew8CQl6vCxb+W8A
	 NDPdu3rwJlQcw==
Date: Wed, 27 Aug 2025 14:26:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI/AER: Support errors introduced by PCIe r6.0
Message-ID: <20250827192619.GA896720@bhelgaas>
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
In-Reply-To: <21f1875b18d4078c99353378f37dcd6b994f6d4e.1756301211.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 27, 2025 at 03:41:09PM +0200, Lukas Wunner wrote:
> PCIe r6.0 defined five additional errors in the Uncorrectable Error
> Status, Mask and Severity Registers (PCIe r7.0 sec 7.8.4.2ff).
> 
> lspci has been supporting them since commit 144b0911cc0b ("ls-ecaps:
> extend decode support for more fields for AER CE and UE status"):
> 
> https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/commit/?id=144b0911cc0b
> 
> Amend the AER driver to recognize them as well, instead of logging them as
> "Unknown Error Bit".
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: stable@vger.kernel.org

Applied to pci/aer for v6.18, thanks, Lukas!

> ---
> Last amendment of aer_uncorrectable_error_string[] was in 2019 for an
> error introduced in PCIe r3.1, see commit 6458b438ebc1 ("PCI/AER: Add
> PoisonTLPBlocked to Uncorrectable error counters").
> 
>  drivers/pci/pcie/aer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c19..15ed541 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -43,7 +43,7 @@
>  #define AER_ERROR_SOURCES_MAX		128
>  
>  #define AER_MAX_TYPEOF_COR_ERRS		16	/* as per PCI_ERR_COR_STATUS */
> -#define AER_MAX_TYPEOF_UNCOR_ERRS	27	/* as per PCI_ERR_UNCOR_STATUS*/
> +#define AER_MAX_TYPEOF_UNCOR_ERRS	32	/* as per PCI_ERR_UNCOR_STATUS*/
>  
>  struct aer_err_source {
>  	u32 status;			/* PCI_ERR_ROOT_STATUS */
> @@ -525,11 +525,11 @@ void pci_aer_exit(struct pci_dev *dev)
>  	"AtomicOpBlocked",		/* Bit Position 24	*/
>  	"TLPBlockedErr",		/* Bit Position 25	*/
>  	"PoisonTLPBlocked",		/* Bit Position 26	*/
> -	NULL,				/* Bit Position 27	*/
> -	NULL,				/* Bit Position 28	*/
> -	NULL,				/* Bit Position 29	*/
> -	NULL,				/* Bit Position 30	*/
> -	NULL,				/* Bit Position 31	*/
> +	"DMWrReqBlocked",		/* Bit Position 27	*/
> +	"IDECheck",			/* Bit Position 28	*/
> +	"MisIDETLP",			/* Bit Position 29	*/
> +	"PCRC_CHECK",			/* Bit Position 30	*/
> +	"TLPXlatBlocked",		/* Bit Position 31	*/
>  };
>  
>  static const char *aer_agent_string[] = {
> -- 
> 2.47.2
> 

