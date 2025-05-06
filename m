Return-Path: <linuxppc-dev+bounces-8344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6175AAC50D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 15:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsJWZ32GTz2yGN;
	Tue,  6 May 2025 23:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746536666;
	cv=none; b=gcwXjrkxGxIxQ7J+Cx2sMDsQj+6rtF19kWkOY6iuYXr+osB+/Y0I1CAkJ9TnGK1FLDv5rOISiM6+Q0VCqBPyhudZN7Jmf0ZkrJhJ2MO9nB1trQHTLmGZ1pJY8eY8zXd4eBH0ajjYo48xotxd3PC1ghVGz62YJhitEnZUPmNouH0ONyma/4SYZh0v6URXFhaXd/PQVcVTEzCw65Zx00UJIp7ehsI51/dX7VKtYj1BAxF4T582zBODzXxFK19I0VlIEAfJktFGBhXsac0IDM1TXIEfDAr2+97IK5txjbeNS0g6nbCALu3JWs9iEl7T52W7wOzHi2iYAGMO5C2tLkfZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746536666; c=relaxed/relaxed;
	bh=lKbAvF7va5UdESVOfamVcDXW2ol3BOhQMwi8AC9a1lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=no4e0z2hOhqueJS6szN1L/eBujHfFjL0Bopzs7wdzL4YIDfxvInPHxKMFn3IP4JSs7cRzZDPbIuzGXNylZ2KT46zSTY4ejCRAkdRc3HUe+UZkI3/LN+eiQN/3wa7Q9RasFpWXmS1yXvvG9Va1l2dicZCrtkRAOtl8HtfLUINllx3ws1iHUc08yro5IdRBwNFIF6lMIdePy3+CQ3RaBHx8b2k4NiJTeh6/tgoqXI4/meBd41ryICQz/AE32YHEmKGTOkEmtwEExiJ3e57AuUZbteXaLdiS6P/dJaNIWbUxmd9DEySWOgLPSnCcIHv7UyC/WeNjaRWNKiW0S6HDfiWwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GTyFE2Zu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XGzE/iuA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GTyFE2Zu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XGzE/iuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsJWY0Pvsz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 23:04:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKbAvF7va5UdESVOfamVcDXW2ol3BOhQMwi8AC9a1lU=;
	b=GTyFE2ZueSAOtiL9SIMZK67W1dLCq3DigRd971VAVAGFHOLPpJzJUbjlzgO9Wt4hMSTDVq
	Eq5ExKrEqHDqgXyYpiPnNW2+U+yQhrRWzoY/WLI8wNxhmy0K8jklYMqog0hg1vfWuVQhux
	sk65U1ar/udJPD1pbOpKWD7DScGu+F0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKbAvF7va5UdESVOfamVcDXW2ol3BOhQMwi8AC9a1lU=;
	b=XGzE/iuAa6294Z2hJCbkASKrT9rBtvu1y3Lyv0bzTKXtV2axi34cQxHbWzTx8fsMXCqxhp
	xMvM6/MdY79g06ePmokw8dO7CZiYp63Zq2jsdyj0ARnXAFX5PiLqUI7ZE0UhGpgwVySofE
	S9Ap//udNf03TZyOVdzakwMAJDplUGw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-jAzXrBzvPGWB53KwokVx8Q-1; Tue, 06 May 2025 09:04:17 -0400
X-MC-Unique: jAzXrBzvPGWB53KwokVx8Q-1
X-Mimecast-MFC-AGG-ID: jAzXrBzvPGWB53KwokVx8Q_1746536656
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so1811456f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 06:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536656; x=1747141456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKbAvF7va5UdESVOfamVcDXW2ol3BOhQMwi8AC9a1lU=;
        b=VVnLfWFK5+SqMCF+7WbeSbv6Fsg5LeIuJQWAem6khEhabDlEbcfpBBrG8fjZX54SbY
         bsHFrUJYIOmqtK7vw4hEaLkh0kZKTpqcbK7NBaOQKz+rG/43rYB/wDBUZX4pFDVCFbIV
         5YMiK/CGMceYLuNDfXpd6x4A/jPmZKcWbjCFWwDzuYQHpGtnp6+XK6cbJbh1RPhUX3Pe
         klVmiE3lM3+iJJ+kX/BjyKizN6cLRs8+XfM8/5h4NzbsKApfWBCJqGzNhhZ5eObT7v6H
         WNpYpvE9yARxh7M4uu+bU0rUktrOgQMkCrKCbXyCn4C3mLT+fs0nLIxKKcbmmUDfnJq0
         Z3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVpiG79EdgPoHahS3zPfoG+LcR6bLpgZK1MSgPSUePVVsYymK/1neCrTQa1QEZcI1cub6wMSnzESYlDtaI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVZjXj4lJ6lXNcBXPALJfyd83BQKwtLyTNPhozd4JtxLEPbtyP
	WmOtgusWX5BzNjqmlHjdSmaehzRcMq/GlmvIBQh2dOCtaiz4N0O1VUmLjlQknAmbbfmlhKQhF2F
	XDnL2Uj0YTx1UIwIsS6mQ90gQJeOnWfDvLFTPS88/OatJu8aDIzdja23NUr/KKzs=
X-Gm-Gg: ASbGncsbpmuKPUyeGYFcHGErYdHyr5SonU+bLIc8FtHaL6bNL9geeAV3BNErYCoe5eT
	aE8z/E4S7GU5sKcTTT/oLMbHtxFAtwlgvQkMjexJ0t0Naovq7v/wsjp4e0GMket1bVF8ugKE+mT
	mXQvCgOSUiblrqa0QbzmI1YgQErns4WQvkmS2tZNQb2IRl0f0hTn55tvIXrEcktRsUdnva2Hm3X
	jSF1U4tt57NRWetR2R7E+TStkroTcBxm9SsobfmREZ+/Xq0cw58pjTj9dLxEsNcLmcMNdO4BYwy
	/uyi4j3pPJFMyJKW
X-Received: by 2002:a05:6000:1449:b0:3a0:b334:6a9f with SMTP id ffacd0b85a97d-3a0b3346db1mr336488f8f.58.1746536656202;
        Tue, 06 May 2025 06:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE370Uz9IXnYFrfg17BGYXqNHxKng1dMfBfML6vrtdO2n/0WVte8MSeTEzuWOfdUnMD7wyr2w==
X-Received: by 2002:a05:6000:1449:b0:3a0:b334:6a9f with SMTP id ffacd0b85a97d-3a0b3346db1mr336409f8f.58.1746536655578;
        Tue, 06 May 2025 06:04:15 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.145.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3c1fsm13748091f8f.37.2025.05.06.06.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:04:14 -0700 (PDT)
Date: Tue, 6 May 2025 15:03:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, g@sgarzare-redhat
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Peter Huewe <peterhuewe@gmx.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Message-ID: <gnbagkqjrfvqqhfpl2yt6xougl3wws4h4actl6scotv4xbrqde@czy5dz4l25ui>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-4-sgarzare@redhat.com>
 <aBJGJwVyp3pvRlqE@kernel.org>
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
In-Reply-To: <aBJGJwVyp3pvRlqE@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QbqBX_GGKDCaDulQBZRPirbbcSpRLsEp7RuRaPR2cQE_1746536656
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 30, 2025 at 06:47:51PM +0300, Jarkko Sakkinen wrote:
>On Mon, Apr 14, 2025 at 04:56:52PM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> This driver does not support interrupts, and receiving the response is
>> synchronous with sending the command.
>>
>> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
>
>"Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
>->send() already fills the provided buffer with a reponse, and ->recv()
>is not implemented."
>
>So, instead of jargon it is better to explicitly state what the heck
>is going on.

Ack, I'll replace with your suggestion.

Thanks,
Stefano

>
>> return responses in the same buffer used for commands. This way we
>> don't need the 4KB internal buffer used to cache the response before
>> .send() and .recv(). Also we don't need to implement recv() op.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v2:
>> - set TPM_CHIP_FLAG_SYNC and support it in the new send()
>> - removed Jens' T-b
>> v1:
>> - added Jens' T-b
>> ---
>>  drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
>>  drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
>>  2 files changed, 19 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
>> index e39903b7ea07..8d5c3f0d2879 100644
>> --- a/drivers/char/tpm/tpm_ftpm_tee.h
>> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
>> @@ -22,16 +22,12 @@
>>   * struct ftpm_tee_private - fTPM's private data
>>   * @chip:     struct tpm_chip instance registered with tpm framework.
>>   * @session:  fTPM TA session identifier.
>> - * @resp_len: cached response buffer length.
>> - * @resp_buf: cached response buffer.
>>   * @ctx:      TEE context handler.
>>   * @shm:      Memory pool shared with fTPM TA in TEE.
>>   */
>>  struct ftpm_tee_private {
>>  	struct tpm_chip *chip;
>>  	u32 session;
>> -	size_t resp_len;
>> -	u8 resp_buf[MAX_RESPONSE_SIZE];
>>  	struct tee_context *ctx;
>>  	struct tee_shm *shm;
>>  };
>> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
>> index 637cc8b6599e..b9adc040ca6d 100644
>> --- a/drivers/char/tpm/tpm_ftpm_tee.c
>> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
>> @@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
>>  		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
>>
>>  /**
>> - * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
>> - * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h.
>> - * @buf:	the buffer to store data.
>> - * @count:	the number of bytes to read.
>> - *
>> - * Return:
>> - *	In case of success the number of bytes received.
>> - *	On failure, -errno.
>> - */
>> -static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>> -{
>> -	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>> -	size_t len;
>> -
>> -	len = pvt_data->resp_len;
>> -	if (count < len) {
>> -		dev_err(&chip->dev,
>> -			"%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
>> -			__func__, count, len);
>> -		return -EIO;
>> -	}
>> -
>> -	memcpy(buf, pvt_data->resp_buf, len);
>> -	pvt_data->resp_len = 0;
>> -
>> -	return len;
>> -}
>> -
>> -/**
>> - * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
>> + * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
>> + * and retrieve the response.
>>   * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
>> - * @buf:	the buffer to send.
>> - * @len:	the number of bytes to send.
>> + * @buf:	the buffer to send and to store the response.
>> + * @cmd_len:	the number of bytes to send.
>>   * @buf_size:	the size of the buffer.
>>   *
>>   * Return:
>> - *	In case of success, returns 0.
>> + *	In case of success, returns the number of bytes received.
>>   *	On failure, -errno
>>   */
>> -static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>  				size_t buf_size)
>>  {
>>  	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>> @@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  	struct tee_param command_params[4];
>>  	struct tee_shm *shm = pvt_data->shm;
>>
>> -	if (len > MAX_COMMAND_SIZE) {
>> +	if (cmd_len > MAX_COMMAND_SIZE) {
>>  		dev_err(&chip->dev,
>>  			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
>> -			__func__, len);
>> +			__func__, cmd_len);
>>  		return -EIO;
>>  	}
>>
>>  	memset(&transceive_args, 0, sizeof(transceive_args));
>>  	memset(command_params, 0, sizeof(command_params));
>> -	pvt_data->resp_len = 0;
>>
>>  	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
>>  	transceive_args = (struct tee_ioctl_invoke_arg) {
>> @@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>>  		.u.memref = {
>>  			.shm = shm,
>> -			.size = len,
>> +			.size = cmd_len,
>>  			.shm_offs = 0,
>>  		},
>>  	};
>> @@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  		return PTR_ERR(temp_buf);
>>  	}
>>  	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
>> -	memcpy(temp_buf, buf, len);
>> +	memcpy(temp_buf, buf, cmd_len);
>>
>>  	command_params[1] = (struct tee_param) {
>>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
>> @@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  			__func__, resp_len);
>>  		return -EIO;
>>  	}
>> +	if (resp_len > buf_size) {
>> +		dev_err(&chip->dev,
>> +			"%s: resp_len=%zd exceeds buf_size=%zd\n",
>> +			__func__, resp_len, buf_size);
>> +		return -EIO;
>> +	}
>>
>> -	/* sanity checks look good, cache the response */
>> -	memcpy(pvt_data->resp_buf, temp_buf, resp_len);
>> -	pvt_data->resp_len = resp_len;
>> +	memcpy(buf, temp_buf, resp_len);
>>
>> -	return 0;
>> +	return resp_len;
>>  }
>>
>>  static const struct tpm_class_ops ftpm_tee_tpm_ops = {
>>  	.flags = TPM_OPS_AUTO_STARTUP,
>> -	.recv = ftpm_tee_tpm_op_recv,
>>  	.send = ftpm_tee_tpm_op_send,
>>  };
>>
>> @@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
>>  	}
>>
>>  	pvt_data->chip = chip;
>> -	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
>> +	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
>>
>>  	/* Create a character device for the fTPM */
>>  	rc = tpm_chip_register(pvt_data->chip);
>> --
>> 2.49.0
>>
>
>BR, Jarkko
>


