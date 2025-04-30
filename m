Return-Path: <linuxppc-dev+bounces-8194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C45AA5092
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 17:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnhHz6Dh5z3bmS;
	Thu,  1 May 2025 01:41:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746027711;
	cv=none; b=JrbOoMZUf5CPOqdpxR/RVsmLXB7LHLzPLi8vD1Cx54DeQTxeWLojq8B1fOLA/Xsm1F3WbB5fY24G7L+Ia0hiatDWkAxXgHj5qZXJ0YvOu2t/dHZixPBSBF96ZqRh+Q9gZqhQ1aeiOx14dW8h6b+dlzaiZOb+ouLWtO6qFo5lb0Y7YEMjw+9kX0/3JQ7A1Boqsr1rDzR40c8/lbBPS4ngShjMKGpkcnk5CdvQFzu0EypMFm6svKlRuV7CXlxNe26JUE4TSIh0QlDt4WCH63c7BrSNqW4X+GJf23d4ahNavS1rh89+lk21DTkhbjZ+Eh7jOGixK14XaWQevnyaLBKC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746027711; c=relaxed/relaxed;
	bh=J9mUzm0OMaK26vcTcId8UypTlcCR4Q4d++0Ws1yzE8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt76jHcBiKKykoBarB1Q0BNc/OsHsZYWhgMDO0Ufd2kfaDB68HslA4+KVTeKKv3Xd3PW0DCJQxRkykaxR7DOecNmWIV5yZiZpDPSJ1Faj8Eeh5HYMlCQLq0J7Lfv4Hm7ed9Q4eWdipttzzHxLs05OlEWQ2MLE+v581a4C/T1e46XmaHMsoB2bO19RQCpG8TLBEJ81r+2FKGB+/seKkffzwwJ9vC/NwQTthGlcupLrbOLt625+9FlRSLFW7DeYzToxfFxO3v4G7WIO8uU+Zcf4k8s0qJVTsCKMD4h8LFPg5Uiizjzq47h10xD6s6e5yUA42bMseI/KNfi8yyie4vJiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sYMmM/96; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sYMmM/96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnhHz057Cz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 01:41:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BEF8A4AA41;
	Wed, 30 Apr 2025 15:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B85AC4CEE7;
	Wed, 30 Apr 2025 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027707;
	bh=t3Uy1BtGwRmWTleefFwzwLEd+DTXVI1qrt1CFuU5vhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYMmM/96Ea5WB/UvivqqMgPKi50QLTkUGDOlUIy8mwSv8AYlnTHcebGdMJlGrm5I6
	 poHKYrdkKnHyAYuUBE7nu1gKhpcHTZbAs1Y1YVsulkzKbrBRtnijB/6VXXw1PYtAzA
	 VnhHz91fh02nYKhlA7IAwQGMLluYkCOJunjViNaP/RcSDb8vEV+RwQcZKG56FgPGwL
	 ZO+FnTUv8Zu59RED36Xj/HRIUw+0S2GL8BAJqk0CO/XglbIgvlCPGyvepALRhEMi01
	 A29hzM7jzpG0WVStsQYbvZtWvcFXpsm9Wes9S3rIStawxDCGKm+Jx+IyXowYzzzPAL
	 yt4MFdxt2J5WA==
Date: Wed, 30 Apr 2025 18:41:43 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 2/4] tpm: support devices with synchronous send()
Message-ID: <aBJEt41g_T7Thm6s@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-3-sgarzare@redhat.com>
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
In-Reply-To: <20250414145653.239081-3-sgarzare@redhat.com>
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 14, 2025 at 04:56:51PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> Some devices do not support interrupts and provide a single synchronous
> operation to send the command and receive the response on the same buffer.
> 
> Currently, these types of drivers must use an internal buffer where they
> temporarily store the response between .send() and recv() calls.
> 
> Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
> If that flag is set by the driver, tpm_try_transmit() will use the send()
> callback to send the command and receive the response on the same buffer
> synchronously. In that case send() return the number of bytes of the
> response on success, or -errno on failure.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v3:
> - fixed comment style [Jarkko]
> - renamend `out_send_sync` label to `out_sync` [Jarkko]
> ---
>  include/linux/tpm.h              |  1 +
>  drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index 2e38edd5838c..0e9746dc9d30 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -350,6 +350,7 @@ enum tpm_chip_flags {
>  	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
>  	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
>  	TPM_CHIP_FLAG_DISABLE			= BIT(10),
> +	TPM_CHIP_FLAG_SYNC			= BIT(11),
>  };
>  
>  #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> index 3b6ddcdb4051..3dc06836f932 100644
> --- a/drivers/char/tpm/tpm-interface.c
> +++ b/drivers/char/tpm/tpm-interface.c
> @@ -114,8 +114,19 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  		return rc;
>  	}
>  
> -	/* A sanity check. send() should just return zero on success e.g.
> -	 * not the command length.
> +	/*
> +	 * Synchronous devices return the response directly during the send()
> +	 * call in the same buffer.
> +	 */
> +	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
> +		len = rc;
> +		rc = 0;
> +		goto out_sync;
> +	}
> +
> +	/*
> +	 * A sanity check. send() of asynchronous devices should just return
> +	 * zero on success e.g. not the command length.
>  	 */
>  	if (rc > 0) {
>  		dev_warn(&chip->dev,
> @@ -151,7 +162,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  	if (len < 0) {
>  		rc = len;
>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
> -	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
> +		return rc;
> +	}
> +out_sync:
> +	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
>  		rc = -EFAULT;
>  
>  	return rc ? rc : len;
> -- 
> 2.49.0
> 

I think this is ok.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

