Return-Path: <linuxppc-dev+bounces-7655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE52A88619
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 17:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zbr7M1Ky3z30HB;
	Tue, 15 Apr 2025 01:00:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744642815;
	cv=none; b=Fqmb7rMiIBqPkI0ugj7ttpvfzQu9Ltr/o2zDS41ubwG9LarmFiw5blSiOLuwIl87t+xQQRVi55MkKRC7eCyaevmQVR51r9piSzb4WnYpvsERr/qBee74VVVQWtC1piZ3o0XyaPctiK/K3OQRxrDVNDZ8yfCELCt8w0D12Uijbq1bIe3FcfcIMuTpktJsiC/FCjJJ8W03x40XAsO/BdBc1mQpclmmPt19X2TWE7R3RYk7dpFNlo8OXIGUckVsXw36BwXcazGvHkAIDPFQhcrJct8/bP4b6rpdsGvjx303C6F0ZmjKmAy9uE5OLczMsO7JXfVe5kVheaSD0JZXgGhlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744642815; c=relaxed/relaxed;
	bh=PiBcwGEvq2PhJfASxrOHAGOy8gVOP2qSKhUxi65Uo4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eziP2ae6CFmJY/Fbss1mgBwIk11XU3W6UFcqNmCTAcdbag14wT9mftAjlcAkN5XAjyBqjPXC4GS2+W8DReAlRBdmRK087ut+ybdlrOr+KYhwdlzfgoIyvhwwKWevn+knf33XhaxMxBvDLCeox4us5fP/PucXsq6qOoY1KRaui+OTHpiCNv9N/Z3IaYByBhnhoivIfoIeWHxDrr5ubzx/Q+ZoDKJp+dPbxYOcANybzzva0yz2E0jJxyh4E4CIOQcfDl7cnrtt9Vmd5n8RRLav8WIpT9+/xdNIP1xTqTGy6u4W9+t6UqbtjlxIVJ9Ja+yZQ+qap1ohoWxsg4ZX0g/svw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSqlZEKs; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=azNUmWSG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSqlZEKs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=azNUmWSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zbr7L28Htz306S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 01:00:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PiBcwGEvq2PhJfASxrOHAGOy8gVOP2qSKhUxi65Uo4U=;
	b=FSqlZEKsHxZUjypmlxyqpibo2a4xTWxUGXoIv/0QwQinD33Ojuhn5aK+bhZthNFPq3mnv5
	0eMtMq/is+er+fYIduxEfDna1/fz9Mxrn1ZGX7sUCXl7thSRWZ+NHUsc2+EUAS/cdKSllq
	gC1/wMO7pi8DBRj9ci7HJbORuhkQu3w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PiBcwGEvq2PhJfASxrOHAGOy8gVOP2qSKhUxi65Uo4U=;
	b=azNUmWSGWyIrpWcRUQCbcra0kEF/f1AEi8B6evC5VNmbbm1oOh7d489E2FKDvMt3dQtE3H
	BmpbeYZ5VmAsLy1bFChV0najQZA64UOQxmzNXs+/qGJ+36mdVzFC8WHL8Zeh/6mcODddGf
	pUZ4fnYz86MPN8xAIb3X7kmhVlrllZY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-uY4_F-2uMeCHIVp4zdn-og-1; Mon, 14 Apr 2025 11:00:02 -0400
X-MC-Unique: uY4_F-2uMeCHIVp4zdn-og-1
X-Mimecast-MFC-AGG-ID: uY4_F-2uMeCHIVp4zdn-og_1744642801
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d22c304adso23343605e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 08:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642801; x=1745247601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiBcwGEvq2PhJfASxrOHAGOy8gVOP2qSKhUxi65Uo4U=;
        b=ul1cA8ZzFXjEWAmum99nKEPACbDYYuwueTQur9VSh/B1FkFWaT7iX6kukRkfF1nqbR
         zDTDbPNm94KxJAIlJm17IkxQQc/2CY2O9i0M6i0720Y/53ot7s9Z+ZdmnLBqH6iRpxRo
         m31MTvTxxqLM+Kpy4RJVVyBZeOzU6wNgbT/DixJQ1NShOpw98qYW0rLmQIsXKbakerCS
         fh3IwqSKnNkpcpPy8MvOfT6zYPN7BzCLmDfULH2bktuQOrCOKzgVSUE/B0ctov16+2y7
         6+SpSgGijkI895EW2TNMybmrovr7p5KEpleCH82bMjYTl3KBqPGs2iGXHHedlG75V094
         F+4w==
X-Forwarded-Encrypted: i=1; AJvYcCWtDbsH2WpjB8a9jgf+oWAOppQbV9TO7YUSW1qLLk4wfqRcj4ZOJ5laXy9HOrmpXy6h/hyR48V/np+43J4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/Tcst11J6P/JBVGrcfMbA2fRJiY/Hkf0nqKierN4fcEaEEFC2
	2pV5cljbUTD7Ai36OYe5unegSphynm4E2oTCKmxawgqTUXN2zhKo7xUCOS+eAxwm7Nmk8aYiAy3
	DjaXoTqAEgUKyf6yuNRy3Pn0GmE6pmt9HuEe9bhQk9pM2BfrE3XZ2DuVUBnTuFO+63MXNd8CFSz
	Rsj/cb/a13VaY54rLvZmyeLu2lvNPDvsrnvjVDDQ==
X-Gm-Gg: ASbGnctavOq0fsZ40ZAmxQ8jd92FpmPhTVSGdsPa8bbQJ0Xl3GRiLX5FbDbhVmkLBMX
	afj7V/a7Kmy8WVB0Cw7PVL7z4/DrtZeystAOWuYdcNbmnwUYV0vqcFLqc/9jArDkyWcff3g==
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr156859895e9.7.1744642800765;
        Mon, 14 Apr 2025 08:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBw02L0rMKAm8Z+1nOktn69htJsdj/Jz1OK8Cyd/Ml4PZuhztd9KZNvdjVRlhSdTo1NUKpE0xXzvNiaYGSRZU=
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id
 5b1f17b1804b1-43f2ea651bcmr156859495e9.7.1744642800128; Mon, 14 Apr 2025
 08:00:00 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250414145653.239081-1-sgarzare@redhat.com> <20250414145653.239081-4-sgarzare@redhat.com>
In-Reply-To: <20250414145653.239081-4-sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 14 Apr 2025 16:59:47 +0200
X-Gm-Features: ATxdqUGzkoR7R29rCyZrs6HYZjyVNgh9a1johmj3oUpZ98_9R4aglRHe8KpEBvQ
Message-ID: <CAGxU2F5SJ9nQfAV-D1WKjsUow_01xjGBRXP4d+q4T=5Bw=yaOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
To: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Peter Huewe <peterhuewe@gmx.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cFQZb8J0TWqGyXF9OAWfWUuKsMraZpMJzstareW2BNg_1744642801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 14 Apr 2025 at 16:57, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> From: Stefano Garzarella <sgarzare@redhat.com>
>
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
>
> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
> return responses in the same buffer used for commands. This way we
> don't need the 4KB internal buffer used to cache the response before
> .send() and .recv(). Also we don't need to implement recv() op.
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v2:
> - set TPM_CHIP_FLAG_SYNC and support it in the new send()
> - removed Jens' T-b

@Jens @Sumit can you test/review this patch again since from v1 we
changed the core a bit adding TPM_CHIP_FLAG_SYNC instead of
send_recv() op?

Thanks,
Stefano

> v1:
> - added Jens' T-b
> ---
>  drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
>  drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
>  2 files changed, 19 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
> index e39903b7ea07..8d5c3f0d2879 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.h
> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
> @@ -22,16 +22,12 @@
>   * struct ftpm_tee_private - fTPM's private data
>   * @chip:     struct tpm_chip instance registered with tpm framework.
>   * @session:  fTPM TA session identifier.
> - * @resp_len: cached response buffer length.
> - * @resp_buf: cached response buffer.
>   * @ctx:      TEE context handler.
>   * @shm:      Memory pool shared with fTPM TA in TEE.
>   */
>  struct ftpm_tee_private {
>         struct tpm_chip *chip;
>         u32 session;
> -       size_t resp_len;
> -       u8 resp_buf[MAX_RESPONSE_SIZE];
>         struct tee_context *ctx;
>         struct tee_shm *shm;
>  };
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> index 637cc8b6599e..b9adc040ca6d 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
>                   0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
>
>  /**
> - * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
> - * @chip:      the tpm_chip description as specified in driver/char/tpm/tpm.h.
> - * @buf:       the buffer to store data.
> - * @count:     the number of bytes to read.
> - *
> - * Return:
> - *     In case of success the number of bytes received.
> - *     On failure, -errno.
> - */
> -static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
> -{
> -       struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> -       size_t len;
> -
> -       len = pvt_data->resp_len;
> -       if (count < len) {
> -               dev_err(&chip->dev,
> -                       "%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
> -                       __func__, count, len);
> -               return -EIO;
> -       }
> -
> -       memcpy(buf, pvt_data->resp_buf, len);
> -       pvt_data->resp_len = 0;
> -
> -       return len;
> -}
> -
> -/**
> - * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
> + * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
> + * and retrieve the response.
>   * @chip:      the tpm_chip description as specified in driver/char/tpm/tpm.h
> - * @buf:       the buffer to send.
> - * @len:       the number of bytes to send.
> + * @buf:       the buffer to send and to store the response.
> + * @cmd_len:   the number of bytes to send.
>   * @buf_size:  the size of the buffer.
>   *
>   * Return:
> - *     In case of success, returns 0.
> + *     In case of success, returns the number of bytes received.
>   *     On failure, -errno
>   */
> -static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>                                 size_t buf_size)
>  {
>         struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> @@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>         struct tee_param command_params[4];
>         struct tee_shm *shm = pvt_data->shm;
>
> -       if (len > MAX_COMMAND_SIZE) {
> +       if (cmd_len > MAX_COMMAND_SIZE) {
>                 dev_err(&chip->dev,
>                         "%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
> -                       __func__, len);
> +                       __func__, cmd_len);
>                 return -EIO;
>         }
>
>         memset(&transceive_args, 0, sizeof(transceive_args));
>         memset(command_params, 0, sizeof(command_params));
> -       pvt_data->resp_len = 0;
>
>         /* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
>         transceive_args = (struct tee_ioctl_invoke_arg) {
> @@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>                 .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>                 .u.memref = {
>                         .shm = shm,
> -                       .size = len,
> +                       .size = cmd_len,
>                         .shm_offs = 0,
>                 },
>         };
> @@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>                 return PTR_ERR(temp_buf);
>         }
>         memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
> -       memcpy(temp_buf, buf, len);
> +       memcpy(temp_buf, buf, cmd_len);
>
>         command_params[1] = (struct tee_param) {
>                 .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> @@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>                         __func__, resp_len);
>                 return -EIO;
>         }
> +       if (resp_len > buf_size) {
> +               dev_err(&chip->dev,
> +                       "%s: resp_len=%zd exceeds buf_size=%zd\n",
> +                       __func__, resp_len, buf_size);
> +               return -EIO;
> +       }
>
> -       /* sanity checks look good, cache the response */
> -       memcpy(pvt_data->resp_buf, temp_buf, resp_len);
> -       pvt_data->resp_len = resp_len;
> +       memcpy(buf, temp_buf, resp_len);
>
> -       return 0;
> +       return resp_len;
>  }
>
>  static const struct tpm_class_ops ftpm_tee_tpm_ops = {
>         .flags = TPM_OPS_AUTO_STARTUP,
> -       .recv = ftpm_tee_tpm_op_recv,
>         .send = ftpm_tee_tpm_op_send,
>  };
>
> @@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
>         }
>
>         pvt_data->chip = chip;
> -       pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
> +       pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
>
>         /* Create a character device for the fTPM */
>         rc = tpm_chip_register(pvt_data->chip);
> --
> 2.49.0
>


