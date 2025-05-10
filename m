Return-Path: <linuxppc-dev+bounces-8487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCEAB21B8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 May 2025 09:44:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvdDw20sdz3bm7;
	Sat, 10 May 2025 17:44:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746863088;
	cv=none; b=WZUVf12tshHfCnjx8Jx8Idb+ZXQU8D3YG6Yi9FZVeWq3tr2CgyRY5JmAIpYclPeMk6/3Z38uZeeeYOCYedZYdeM7WVNpqF4OVJL1KW5vckNCT0Ij1AWatd7LSIItqJ3GsEqz6oiWI3rHV5hXWAeJM4PrxzDhughtKDubrHjnN2owgenwfSMzEZQGrt+MWMY7UJ05XHUu7rQlzD+otvi5gyXRIdNBjLPb64wCE2kZfbzSv/It1UlIRZLBNWGvso+xV57dQqOrgKXIfKOSo6yG8iQtDTIe4JSaKCvrHYXa5xCFGaNSljuRezCpW3zvYA1QoOMQla7TumlSZu3CNvvWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746863088; c=relaxed/relaxed;
	bh=br9Y8ByGePUt8hPyQifOh5PlCzWR6zg2I9jLgLrnzj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGAFheRn2a0Qblg3y9grhd95sMInABQ4deC3Z79JyiXahClJTWcEdS5V0TsfvfufYNmfhXzmQ8HkZhdY5WkDxySXu5XU7OW38qtMbKt11PAdXv2IPWesodNHH6sv6+86swPuRdfvdBPMB1H6nb8iOmspTo0BZs+vyTYTBnNeA3FSt28UGCK0kBNFAGDXN6GE7IvJ5VYoMBOxa53eOhywriq8QKDpKE9PfHG6pjIedPkNqepGLz+qyQRMEE881I8Lto9SOIAm0UY7FhtCujtgMqA1oxTpTSXdxUzs1s19IAbItndej338GkxRNxMx/p9m5HVtVHJq9/wjxX0BmbJkdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZRm0JemU; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZRm0JemU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvdDt5TsMz3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 17:44:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0365F614BA;
	Sat, 10 May 2025 07:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CA1C4CEE2;
	Sat, 10 May 2025 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863083;
	bh=bE/SOpoChEP71E9o00tKei1ZQQ2RQ/5dOoWOaqj9An8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRm0JemUldpe+AgpDLQ5gUzWpGiNST07Xb7zIxeqwnu7jsSZr1yS4/lz4mfza2rln
	 G7AyXvCic3ERDJlHJMfN3/S7aWRxrb7rmLDTtta01a79D3ACZLBzNl2+Zd4CVFHMqs
	 quMc08ZsU6wqlDsG6c5lHSD5KEpOOdNF1h70gGSb4W8qvFDaK7kw0dKtNwzqtYeQgU
	 zmm/Yxvof1Ps+yJAHT7+PbjkbgIV7njlN6hU0BumHXRHQ8/Aw16DO7Lf8ciKRklKi3
	 JDoafNUlWi1+P/wswBxr6C1sL3xDClwUVa6Rsq0Wk/bcrQXS2SN5ixpLivo249eC2O
	 Ja0cRETdRmAjw==
Date: Sat, 10 May 2025 10:44:38 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-integrity@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH v4 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <aB8D5syofPSqjzns@kernel.org>
References: <20250509085713.76851-1-sgarzare@redhat.com>
 <20250509085713.76851-2-sgarzare@redhat.com>
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
In-Reply-To: <20250509085713.76851-2-sgarzare@redhat.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 09, 2025 at 10:57:10AM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> Add a new `buf_size` parameter to the `.send` callback in `tpm_class_ops`.
> This parameter will allow drivers to differentiate between the actual
> command length to send and the total buffer size. Currently `buf_now` is
> not used, but it will be used to implement devices with synchronous send()
> to send the command and receive the response on the same buffer.
> 
> Also rename the previous parameter `len` to `cmd_len` in the declaration
> to make it clear that it contains the length in bytes of the command
> stored in the buffer. The semantics don't change and it can be used as
> before by drivers. This is an optimization since the drivers could get it
> from the header, but let's avoid duplicating code.
> 
> While we are here, resolve a checkpatch warning:
>   WARNING: Unnecessary space before function pointer arguments
>   #66: FILE: include/linux/tpm.h:90:
>   +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,
> 
> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v4:
> - rework the commit description [Jarkko]
> ---
>  include/linux/tpm.h                  | 3 ++-
>  drivers/char/tpm/st33zp24/st33zp24.c | 2 +-
>  drivers/char/tpm/tpm-interface.c     | 2 +-
>  drivers/char/tpm/tpm_atmel.c         | 3 ++-
>  drivers/char/tpm/tpm_crb.c           | 2 +-
>  drivers/char/tpm/tpm_ftpm_tee.c      | 4 +++-
>  drivers/char/tpm/tpm_i2c_atmel.c     | 3 ++-
>  drivers/char/tpm/tpm_i2c_infineon.c  | 3 ++-
>  drivers/char/tpm/tpm_i2c_nuvoton.c   | 3 ++-
>  drivers/char/tpm/tpm_ibmvtpm.c       | 6 ++++--
>  drivers/char/tpm/tpm_infineon.c      | 3 ++-
>  drivers/char/tpm/tpm_nsc.c           | 3 ++-
>  drivers/char/tpm/tpm_svsm.c          | 3 ++-
>  drivers/char/tpm/tpm_tis_core.c      | 3 ++-
>  drivers/char/tpm/tpm_tis_i2c_cr50.c  | 6 ++++--
>  drivers/char/tpm/tpm_vtpm_proxy.c    | 4 +++-
>  drivers/char/tpm/xen-tpmfront.c      | 3 ++-
>  17 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index 9ac9768cc8f7..7ac390ec89ce 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -87,7 +87,8 @@ struct tpm_class_ops {
>  	const u8 req_complete_val;
>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
> -	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
> +	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
> +		    size_t buf_size);

I'm sorry but now that I look at this, just for the sake of consistency:

	int (*send)(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
		    size_t cmd_len);

I.e. match the order and parameter names from tpm_try_transmit().

BR, Jarkko

