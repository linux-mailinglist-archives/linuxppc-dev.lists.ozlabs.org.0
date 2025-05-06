Return-Path: <linuxppc-dev+bounces-8345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B01AAC526
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 15:07:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsJZX2rvhz2yYy;
	Tue,  6 May 2025 23:07:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746536820;
	cv=none; b=nl0chzKHlMThg6VkCPC7LABE1eySUi3spnmq49kmRDNAF2C/uedjMQFMDr+BUKMoN2XJXZj66ZxNPiYRBSAPihmjsIwFYiVSvMD79n1n6hZydP0EgnT4yhWNkPid0PNCV/3G481Imoqzm1oZpDKrVqcLfvDoJsT3Vq+evwMTgiTIJFTfZd8Ese7vWFGEq55Z1ROxpxR2aZqczJTIGm3kIoQUtfQRNv7vF0qERKJoo6nk4wRF8HpQu5l+Zafr/xwD10Bsn7ymiwemkK04QJW0Gcl5yF8YrMGZfEaNqwPuWLouBzVXgtdvlcT5x6pC6bhXxnItMi6nf8FW2lFsvPLPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746536820; c=relaxed/relaxed;
	bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ii2mzQN+nAn8jAetjdL5B+ylKqTp62jpBMsgk+Yk9RGa9V/d+S4b5C5bPjBLglUBcgTYaVQFKJ6hSUgt7mZUOm9qqVmbPZowYUrbAbr9Z1k83b0Z7T5uvD2JMAu5gDqQqRf+WDRGPYMGD2Nps0nNYCHq0PVODwWDvIv7vRpd81Anb4VWAARMAHDJctCYDoYShOcVqeFaYiJzmzA+AoPXWUWxky+a1+ZmUVg/y44h2WWyfO9oohZjxuksZgUXmoLc3nAlER+zw4YnOjRtKadhxaBOWBiItIw3d2v8Jq6OSjB918xcV2lP4xQZGqJlzYmaE2EcSowj1DPfKZH/wMdMCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsdILvSC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsdILvSC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsdILvSC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsdILvSC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsJZW2jj0z2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 23:06:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
	b=hsdILvSCUsXWhU1lUrPphphLElHVCxB4FxeBayvB3g8vPROAWkElB1Xs4S1RIvldGz5WBi
	js+kasuKEqhV63UwtEDtCb+Gs2U43aXGbFY/3nVp6YdPoM9+clRgskEioVxJt5evn+/ufR
	AiOss0e4F72/xQ2NrhYuhZT9xmus4Ls=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
	b=hsdILvSCUsXWhU1lUrPphphLElHVCxB4FxeBayvB3g8vPROAWkElB1Xs4S1RIvldGz5WBi
	js+kasuKEqhV63UwtEDtCb+Gs2U43aXGbFY/3nVp6YdPoM9+clRgskEioVxJt5evn+/ufR
	AiOss0e4F72/xQ2NrhYuhZT9xmus4Ls=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-MecTfixfO0ahaJ2JrOXXKA-1; Tue, 06 May 2025 09:06:54 -0400
X-MC-Unique: MecTfixfO0ahaJ2JrOXXKA-1
X-Mimecast-MFC-AGG-ID: MecTfixfO0ahaJ2JrOXXKA_1746536813
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so41433335e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 06:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536813; x=1747141613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
        b=fc6OGfGwLSdQ1tAGyrU3Jf167MYRf1oBino0G5kKXxkmyHAQnJM+vpngIqNYxdrwyD
         TxQiho1qtP1B8+4wH/OY7pb48gMLE2Ohse6KOfBplBNSSXK5cTqimql7z0GLktVtWVCG
         s9UprqGIkdXg7JKAxx8ysWfO0dDHQCDF9dGdlw9ynOuUOGmmspVr5l111lvJkM9Wok67
         TaAlDp9BMuW71hhxRVt19OUh01ddBIiK9bqmZOyomZOVA93bFBpdgoxCvbMtDoB9f4ip
         qUr7kB3pxt0/UJ2rVGjO2lFptSTsip5p479JDM7TA8kpzpHvRglODvRfp1k7C9R1rRhZ
         Q5/w==
X-Forwarded-Encrypted: i=1; AJvYcCXUb6rH9h200hBd3NFKbEPfK50w6v5aDkoaUkllTEvRXsmtcdLQVIUW2VsbzO2JbMpX5icKhOR9YUWWcJo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOMLJ044XEOR+Bfih61bvXVjngvkX89/sEWNMFG82J8bhZyh2W
	/Ka2RTpaLdBkuXi6KzTROJXl23MFYLAtarBBjSzEdDRz6nsbjCyZLAChkdC1eqdK2JX2NXcS6nD
	sIgOECHXisK3lD1isPaR48YrmJdOtILjsmfNNLaLf7KI3rXwN96hn9GLy2bt8aHQ=
X-Gm-Gg: ASbGncuEGTySdwLQI+wognJG9hJbYmBRiDB+Px17CRAR2vc4gCnbgWdIk99E5Xw6oBQ
	f5nFXu6B9n3NoAhQZtW7V1iIeuiZqwwao2DJBcaeG47y3LTLsYdF6RWZYZZpzYuWG9JQaUorFIM
	m2FkHNwLRUh05oEVCS6U3Qd1JSXgYFihGNX6X0Mjx2LTvtjyfeCMxEtrsEq8dxfruoYvceAvKfM
	hPpWaUXnGQM07YaU7BdjcixuANDOTC7z1lVYQIfq27CMyy1PEnRS31Isv5rl+Xu2Ndfi2HivY6v
	B4h1Nv4QByhRpWMK
X-Received: by 2002:a05:600c:870b:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-441c494849emr95875965e9.27.1746536813079;
        Tue, 06 May 2025 06:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKiHs9FSOU2le8jbaL7mKTZ2hCbrm+SIQCEe6ODre4sZLo6XvFEwTUhXm7CFs6cxte9EBTOA==
X-Received: by 2002:a05:600c:870b:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-441c494849emr95873295e9.27.1746536810872;
        Tue, 06 May 2025 06:06:50 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.145.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecc89sm213870385e9.9.2025.05.06.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:06:50 -0700 (PDT)
Date: Tue, 6 May 2025 15:06:22 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Peter Huewe <peterhuewe@gmx.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <pxtojuqebtk7pa5vjbhmiulydmgyutsbgxg2j5b6ziyxzqls35@qmmmcn4uwzie>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-5-sgarzare@redhat.com>
 <aBJGkSil1YAzSXsg@kernel.org>
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
In-Reply-To: <aBJGkSil1YAzSXsg@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VSGH_Xq1j_j9ZVbkIZdtJnXFJZHAMTK5CwJIbiYy3Pk_1746536813
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 30, 2025 at 06:49:37PM +0300, Jarkko Sakkinen wrote:
>On Mon, Apr 14, 2025 at 04:56:53PM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> This driver does not support interrupts, and receiving the response is
>> synchronous with sending the command.
>>
>> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
>> return responses in the same buffer used for commands. This way we
>> don't need to implement recv() op.
>>
>> Keep using the same pre-allocated buffer to avoid having to allocate
>> it for each command. We need the buffer to have the header required by
>> the SVSM protocol and the command contiguous in memory.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
>Similar comments, and a bit redundancy does not matter i.e., they can
>have pretty much the same explanation.

I see, I'll replace the "So we can set..." paragraph with your 
suggestion on the previous patch.

Thanks,
Stefano

>
>> ---
>>  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
>>  1 file changed, 11 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
>> index d3ca5615b6f7..db1983072345 100644
>> --- a/drivers/char/tpm/tpm_svsm.c
>> +++ b/drivers/char/tpm/tpm_svsm.c
>> @@ -25,38 +25,32 @@ struct tpm_svsm_priv {
>>  	void *buffer;
>>  };
>>
>> -static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>  			 size_t buf_size)
>>  {
>>  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>>  	int ret;
>>
>> -	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
>> +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
>>  	if (ret)
>>  		return ret;
>>
>>  	/*
>>  	 * The SVSM call uses the same buffer for the command and for the
>> -	 * response, so after this call, the buffer will contain the response
>> -	 * that can be used by .recv() op.
>> +	 * response, so after this call, the buffer will contain the response.
>> +	 *
>> +	 * Note: we have to use an internal buffer because the device in SVSM
>> +	 * expects the svsm_vtpm header + data to be physically contiguous.
>>  	 */
>> -	return snp_svsm_vtpm_send_command(priv->buffer);
>> -}
>> -
>> -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
>> -{
>> -	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>> +	ret = snp_svsm_vtpm_send_command(priv->buffer);
>> +	if (ret)
>> +		return ret;
>>
>> -	/*
>> -	 * The internal buffer contains the response after we send the command
>> -	 * to SVSM.
>> -	 */
>> -	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
>> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
>>  }
>>
>>  static struct tpm_class_ops tpm_chip_ops = {
>>  	.flags = TPM_OPS_AUTO_STARTUP,
>> -	.recv = tpm_svsm_recv,
>>  	.send = tpm_svsm_send,
>>  };
>>
>> @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
>>
>>  	dev_set_drvdata(&chip->dev, priv);
>>
>> +	chip->flags |= TPM_CHIP_FLAG_SYNC;
>>  	err = tpm2_probe(chip);
>>  	if (err)
>>  		return err;
>> --
>> 2.49.0
>>
>
>BR, Jarkko
>


