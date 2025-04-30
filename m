Return-Path: <linuxppc-dev+bounces-8193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9099AA5089
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 17:40:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnhG01Tczz2yw7;
	Thu,  1 May 2025 01:40:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746027608;
	cv=none; b=LArLhs2sUBDC+djHS8wKpdbncNpLx3Vrqnn0+s7vZ2KBGwrZ1n4Af3F8dST7kFZIB1EGSJkvBlSifN6Lu1jhnWPhtTmM/wfN0N1n12VzFJLrAjhWLDivVfucspD6RHDqQm3AEVuChmaiHIUKloWZzygTv3sV7dpeb+45ukiwovnhsfQqy0E7jbHPjgKtaP4TZMBrp5Et6ZnaCipVxQhuXYsh6KuP0VIh0JRc0PjwSXNLbF1jVbtFA2ysyEf3zPy2AywB+YBNeS7rNDI2mPoaGQmtSYcdVogs6swt1QkYI2Fq5SLqmqHSzdO3Q5Z/oTxL9D0V97ib+3GnbNHdHoyb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746027608; c=relaxed/relaxed;
	bh=PjStz8UoJAuHD7kcHn9l987/eUyxb44ZOc6rEs9YXgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/m960hg39F3quF2u/l8xkt+nwVXEdGsaMOj9svCmygN2FwWeZJ8NXRVNid8Z5Gb++QUkMf7Zapdupsu8+Rl+JSfH3IyXaq/x227+qUI9wR73y3IerzggkmV46PNn+lI4+9gYi7pQaU0K2pLB4WVOBB/N3gXB3ckf43+HBrNZfg1VmnuQcMc0EE5Cl+8X5GiaFQcODCknDmB9V9kyLZr3L4ZYiXWC+lmE/PGDqgeG2hV39nvvRYlJw2xqm8Is3FMeV36G1Cxlz+Eb17oIwO+wCv4/ONncjnk4i+SuGnMf8G4uQ0JJNolojSK2ggeX2i6fxrCoKEtKJqgxyV+NSVlrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V/kuRSiz; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V/kuRSiz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnhFy3LHlz2xS0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 01:40:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BB45445AA;
	Wed, 30 Apr 2025 15:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8902C4CEE7;
	Wed, 30 Apr 2025 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027603;
	bh=uD8rrVbhfOxc6Zq80n/5G77oPTQHSFcCYmdBexqyPls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/kuRSizVyCL8ZTxH/dWAkon+SAnt5M1pha2tN5p4buoNKJzFGUMqvcBynYTKQpue
	 WV96le3hQThBYOAFZFQa6/c7pjWqYVsQPnoKBCJ3OxqKhcckA1AYiUVMWIkpzvGSli
	 8seU11jdCX9dSNL2/nqunpGvugO1aYvqqQYdvDurAzbYbgwXZ+MfCnmRiRvovRqlRQ
	 qaBcgW4eczrXS2T73mJptKOFvkIqNmtcMRImW/xKgUOTgl+Kj/3eVEOmikUBW/Eo7L
	 iEld1vCqyAlNEzWa2cMt9p7C8OihuI6bhjLT05jzlAj1KzCSsqIh1dakW0NfIhL/CK
	 /O9jDsBldoiPg==
Date: Wed, 30 Apr 2025 18:39:58 +0300
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
Subject: Re: [PATCH v3 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <aBJETstuSlBUMwj1@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-2-sgarzare@redhat.com>
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
In-Reply-To: <20250414145653.239081-2-sgarzare@redhat.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 14, 2025 at 04:56:50PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> In preparation for the next commit, add a new `buf_size` parameter to
> the `.send` callback in `tpm_class_ops` which contains the entire buffer
> size. In this patch it is pretty much ignored by all drivers, but it will
> be used in the next patch.

So instead "in preparation for the next commit" just plain say why it
will be needed. "next commit" is a fuzzy reference :-)

Same goes for "next patch". Neither can be used to query any possible
information. That sort of makes the whole paragraph useless, once it
is in the commit log.

> 
> Also rename the previous parameter `len` to `cmd_len` in the
> declaration to make it clear that it contains the length in bytes of the
> command stored in the buffer. The semantics don't change and it can be
> used as before by drivers. This is an optimization since the drivers
> could get it from the header, but let's avoid duplicating code.
> 
> While we are here, resolve a checkpatch warning:
>   WARNING: Unnecessary space before function pointer arguments
>   #66: FILE: include/linux/tpm.h:90:
>   +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,
> 
> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
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
> index 6c3125300c00..2e38edd5838c 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -87,7 +87,8 @@ struct tpm_class_ops {
>  	const u8 req_complete_val;
>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
> -	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
> +	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
> +		    size_t buf_size);
>  	void (*cancel) (struct tpm_chip *chip);
>  	u8 (*status) (struct tpm_chip *chip);
>  	void (*update_timeouts)(struct tpm_chip *chip,
> diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
> index c0771980bc2f..3de68bca1740 100644
> --- a/drivers/char/tpm/st33zp24/st33zp24.c
> +++ b/drivers/char/tpm/st33zp24/st33zp24.c
> @@ -300,7 +300,7 @@ static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
>   * send TPM commands through the I2C bus.
>   */
>  static int st33zp24_send(struct tpm_chip *chip, unsigned char *buf,
> -			 size_t len)
> +			 size_t len, size_t buf_size)
>  {
>  	struct st33zp24_dev *tpm_dev = dev_get_drvdata(&chip->dev);
>  	u32 status, i, size, ordinal;
> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> index 8d7e4da6ed53..3b6ddcdb4051 100644
> --- a/drivers/char/tpm/tpm-interface.c
> +++ b/drivers/char/tpm/tpm-interface.c
> @@ -106,7 +106,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  		return -E2BIG;
>  	}
>  
> -	rc = chip->ops->send(chip, buf, count);
> +	rc = chip->ops->send(chip, buf, count, bufsiz);
>  	if (rc < 0) {
>  		if (rc != -EPIPE)
>  			dev_err(&chip->dev,
> diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_atmel.c
> index 54a0360a3c95..5733168bfc26 100644
> --- a/drivers/char/tpm/tpm_atmel.c
> +++ b/drivers/char/tpm/tpm_atmel.c
> @@ -148,7 +148,8 @@ static int tpm_atml_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>  	return size;
>  }
>  
> -static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count)
> +static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count,
> +			 size_t buf_size)
>  {
>  	struct tpm_atmel_priv *priv = dev_get_drvdata(&chip->dev);
>  	int i;
> diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
> index 876edf2705ab..38f765a44a97 100644
> --- a/drivers/char/tpm/tpm_crb.c
> +++ b/drivers/char/tpm/tpm_crb.c
> @@ -426,7 +426,7 @@ static int tpm_crb_smc_start(struct device *dev, unsigned long func_id)
>  }
>  #endif
>  
> -static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len, size_t buf_size)
>  {
>  	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
>  	int rc = 0;
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> index 53ba28ccd5d3..637cc8b6599e 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -64,12 +64,14 @@ static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>   * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
>   * @buf:	the buffer to send.
>   * @len:	the number of bytes to send.
> + * @buf_size:	the size of the buffer.
>   *
>   * Return:
>   *	In case of success, returns 0.
>   *	On failure, -errno
>   */
> -static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +				size_t buf_size)
>  {
>  	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>  	size_t resp_len;
> diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
> index d1d27fdfe523..572f97cb9e89 100644
> --- a/drivers/char/tpm/tpm_i2c_atmel.c
> +++ b/drivers/char/tpm/tpm_i2c_atmel.c
> @@ -37,7 +37,8 @@ struct priv_data {
>  	u8 buffer[sizeof(struct tpm_header) + 25];
>  };
>  
> -static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +			  size_t buf_size)
>  {
>  	struct priv_data *priv = dev_get_drvdata(&chip->dev);
>  	struct i2c_client *client = to_i2c_client(chip->dev.parent);
> diff --git a/drivers/char/tpm/tpm_i2c_infineon.c b/drivers/char/tpm/tpm_i2c_infineon.c
> index 81d8a78dc655..25d6ae3a4cc1 100644
> --- a/drivers/char/tpm/tpm_i2c_infineon.c
> +++ b/drivers/char/tpm/tpm_i2c_infineon.c
> @@ -514,7 +514,8 @@ static int tpm_tis_i2c_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>  	return size;
>  }
>  
> -static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +			    size_t buf_size)
>  {
>  	int rc, status;
>  	ssize_t burstcnt;
> diff --git a/drivers/char/tpm/tpm_i2c_nuvoton.c b/drivers/char/tpm/tpm_i2c_nuvoton.c
> index 3c3ee5f551db..169078ce6ac4 100644
> --- a/drivers/char/tpm/tpm_i2c_nuvoton.c
> +++ b/drivers/char/tpm/tpm_i2c_nuvoton.c
> @@ -350,7 +350,8 @@ static int i2c_nuvoton_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>   * tpm.c can skip polling for the data to be available as the interrupt is
>   * waited for here
>   */
> -static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +			    size_t buf_size)
>  {
>  	struct priv_data *priv = dev_get_drvdata(&chip->dev);
>  	struct device *dev = chip->dev.parent;
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
> index 76d048f63d55..660a7f9da1d8 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -191,13 +191,15 @@ static int tpm_ibmvtpm_resume(struct device *dev)
>   * tpm_ibmvtpm_send() - Send a TPM command
>   * @chip:	tpm chip struct
>   * @buf:	buffer contains data to send
> - * @count:	size of buffer
> + * @count:	length of the command
> + * @buf_size:   size of the buffer
>   *
>   * Return:
>   *   0 on success,
>   *   -errno on error
>   */
> -static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
> +static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
> +			    size_t buf_size)
>  {
>  	struct ibmvtpm_dev *ibmvtpm = dev_get_drvdata(&chip->dev);
>  	bool retry = true;
> diff --git a/drivers/char/tpm/tpm_infineon.c b/drivers/char/tpm/tpm_infineon.c
> index 2d2ae37153ba..7896fdacd156 100644
> --- a/drivers/char/tpm/tpm_infineon.c
> +++ b/drivers/char/tpm/tpm_infineon.c
> @@ -312,7 +312,8 @@ static int tpm_inf_recv(struct tpm_chip *chip, u8 * buf, size_t count)
>  	return -EIO;
>  }
>  
> -static int tpm_inf_send(struct tpm_chip *chip, u8 * buf, size_t count)
> +static int tpm_inf_send(struct tpm_chip *chip, u8 *buf, size_t count,
> +			size_t buf_size)
>  {
>  	int i;
>  	int ret;
> diff --git a/drivers/char/tpm/tpm_nsc.c b/drivers/char/tpm/tpm_nsc.c
> index 0f62bbc940da..12aedef3c50e 100644
> --- a/drivers/char/tpm/tpm_nsc.c
> +++ b/drivers/char/tpm/tpm_nsc.c
> @@ -178,7 +178,8 @@ static int tpm_nsc_recv(struct tpm_chip *chip, u8 * buf, size_t count)
>  	return size;
>  }
>  
> -static int tpm_nsc_send(struct tpm_chip *chip, u8 * buf, size_t count)
> +static int tpm_nsc_send(struct tpm_chip *chip, u8 *buf, size_t count,
> +			size_t buf_size)
>  {
>  	struct tpm_nsc_priv *priv = dev_get_drvdata(&chip->dev);
>  	u8 data;
> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> index 4280edf427d6..d3ca5615b6f7 100644
> --- a/drivers/char/tpm/tpm_svsm.c
> +++ b/drivers/char/tpm/tpm_svsm.c
> @@ -25,7 +25,8 @@ struct tpm_svsm_priv {
>  	void *buffer;
>  };
>  
> -static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +			 size_t buf_size)
>  {
>  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>  	int ret;
> diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
> index ed0d3d8449b3..5641a73ce280 100644
> --- a/drivers/char/tpm/tpm_tis_core.c
> +++ b/drivers/char/tpm/tpm_tis_core.c
> @@ -580,7 +580,8 @@ static int tpm_tis_send_main(struct tpm_chip *chip, const u8 *buf, size_t len)
>  	return rc;
>  }
>  
> -static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +			size_t buf_size)
>  {
>  	int rc, irq;
>  	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
> diff --git a/drivers/char/tpm/tpm_tis_i2c_cr50.c b/drivers/char/tpm/tpm_tis_i2c_cr50.c
> index 3b55a7b05c46..1914b368472d 100644
> --- a/drivers/char/tpm/tpm_tis_i2c_cr50.c
> +++ b/drivers/char/tpm/tpm_tis_i2c_cr50.c
> @@ -546,13 +546,15 @@ static int tpm_cr50_i2c_tis_recv(struct tpm_chip *chip, u8 *buf, size_t buf_len)
>   * tpm_cr50_i2c_tis_send() - TPM transmission callback.
>   * @chip:	A TPM chip.
>   * @buf:	Buffer to send.
> - * @len:	Buffer length.
> + * @len:	Command length.
> + * @buf_size:	Buffer size.
>   *
>   * Return:
>   * - 0:		Success.
>   * - -errno:	A POSIX error code.
>   */
> -static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +				 size_t buf_size)
>  {
>  	size_t burstcnt, limit, sent = 0;
>  	u8 tpm_go[4] = { TPM_STS_GO };
> diff --git a/drivers/char/tpm/tpm_vtpm_proxy.c b/drivers/char/tpm/tpm_vtpm_proxy.c
> index 8fe4a01eea12..beaa84428b49 100644
> --- a/drivers/char/tpm/tpm_vtpm_proxy.c
> +++ b/drivers/char/tpm/tpm_vtpm_proxy.c
> @@ -322,11 +322,13 @@ static int vtpm_proxy_is_driver_command(struct tpm_chip *chip,
>   * @chip: tpm chip to use
>   * @buf: send buffer
>   * @count: bytes to send
> + * @buf_size: size of the buffer
>   *
>   * Return:
>   *      0 in case of success, negative error value otherwise.
>   */
> -static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count)
> +static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count,
> +				  size_t buf_size)
>  {
>  	struct proxy_dev *proxy_dev = dev_get_drvdata(&chip->dev);
>  
> diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
> index 80cca3b83b22..66a4dbb4a4d8 100644
> --- a/drivers/char/tpm/xen-tpmfront.c
> +++ b/drivers/char/tpm/xen-tpmfront.c
> @@ -131,7 +131,8 @@ static size_t shr_data_offset(struct vtpm_shared_page *shr)
>  	return struct_size(shr, extra_pages, shr->nr_extra_pages);
>  }
>  
> -static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
> +static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
> +		     size_t buf_size)
>  {
>  	struct tpm_private *priv = dev_get_drvdata(&chip->dev);
>  	struct vtpm_shared_page *shr = priv->shr;
> -- 
> 2.49.0
> 
> 

BR, Jarkko

