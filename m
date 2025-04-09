Return-Path: <linuxppc-dev+bounces-7558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB544A81EF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Apr 2025 09:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXb2Q1B5Pz30HB;
	Wed,  9 Apr 2025 17:59:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744185582;
	cv=none; b=KDQhHLn43uBElBN0IByMLDh+J5GXvpA0m3BXe7DmaF+cwqntuz1tR+U9wdtc0h+TA4FTpH3CSvPP4jwyzOcvVUCL4eYupuszI/XwW2tHnnlTwxFGM8BwitoqZl6iTl0U3D54o97ILJKPDminyGDfzwjeA/hDQfqVgI6HgYuEDHP1ggaHyH6zt5gaHErQiddQW/02TLd5owPu5g7yb8TMfJ22iMFTUEJlg3WB8aibiESqRUB3UQzv9g4k5pU5EuC4lQ6GEpqPH20aoAyozSEq7/3sCiVBFDpQwc4NXUsAGtv/4s3kn9u0qRdKhCRzlz1qXYUqsTFwDdQazjJvX71WrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744185582; c=relaxed/relaxed;
	bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Bmb+vazFvwX6xK5Dqa6gBOP84eHUWTCX4BkuSSVlD+f4GMe8bZ78IdLycCSp05PZaKQwrLtysT0gpbE597LD+EL8DzNNykdgLpYv//3n8Xr2J4U1F0DlAenFOEBl6o5dJEVSlrwh8AFZnirs67k+Kh4gWJ/8e/ffT7FTO4foHQDNYm1bNCz8+E4ZQDUhaCXrk+WRe3uvqUail7A0mqw6AmZKbnWsRmKnXPKQGwVjUNj+4pFFqh4i521Vo0jEq/WSnSsEJIlZImaqUlJjOxgiTFX9rqOHBjTtGcshbiQodYK0rbI9IPHYurODq8D+t51P09B+LgN0RiqcMaWgnFg2Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O++mKewz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O++mKewz; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O++mKewz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O++mKewz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZXb2N6NJDz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Apr 2025 17:59:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744185575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
	b=O++mKewzRp4OfcVuA6/hoouzBp1YlRoVKpYaEQhBu55tuD8y2QvlNo4eovafs/LU4WGZtk
	8deg0ldsD2kaqs59jpeyfLQIwBhM9MK2Z+KyPq/1lmX1MJkYVUtnBBIjiw/KpGtF41oT1K
	ePgpXCrd69I2oUMh7Sq4t6PMrCAA5wg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744185575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
	b=O++mKewzRp4OfcVuA6/hoouzBp1YlRoVKpYaEQhBu55tuD8y2QvlNo4eovafs/LU4WGZtk
	8deg0ldsD2kaqs59jpeyfLQIwBhM9MK2Z+KyPq/1lmX1MJkYVUtnBBIjiw/KpGtF41oT1K
	ePgpXCrd69I2oUMh7Sq4t6PMrCAA5wg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-hf0f2ogMPhWbf-HbBGmlUQ-1; Wed, 09 Apr 2025 03:59:34 -0400
X-MC-Unique: hf0f2ogMPhWbf-HbBGmlUQ-1
X-Mimecast-MFC-AGG-ID: hf0f2ogMPhWbf-HbBGmlUQ_1744185573
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac804089b99so47250466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Apr 2025 00:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185573; x=1744790373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
        b=K0g6iqapM/FCFGiAnYNReHDpHkgXAJquE/KZPtcEjGqgZPN/Hx3GK5r04WaMaz7+On
         d+TBROVj/iuHM34uQpb4kU6EGtYJWsJ0tZdASveCVUMpLhF26Xkyd0kkCRfGMONKTV6O
         Rw2KOYZtE8laU7U8Gy2EvKdI4BNz6HBJI/wF3Js6bpcKa6Q18GUklvAd4cjFzWT2y19m
         H7miSGNdET2aEhpIvYdAXPlJ97imqc8j90nRxea/cxn30rOtz8drFidIW5pqvvnshKJh
         InV+llKfDRwrh73kRk+CkZSktiNy79QV8XQo3SrPC01V7v7+XRtVibS3Q64c8z794G3Q
         Ov2g==
X-Forwarded-Encrypted: i=1; AJvYcCXrgFZRidpo9nqZYw6PoHlLYJrC99urQu2i1IzLwbtsgE3TQZ2rUvIPwfQWxo7FzbhOR0Z9ANYqv96n2rM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHtQXUmujSzP0uAkJUdOPqtUFfBMLhEFXEQ34PnYSlF9luCLSu
	DQhjnVROVETAaZuOhWrxet4PBVvJ49Ow/Nf8uXhMmJGTS5tzHnu/ipRLdJ+Aub4vxu23NvmCEQP
	E7dHEWrkVIbTkCF1GBC+CnOA4y3FcdJsKhiUpicihY7JCrBqAik+28aIKgA+5rSE=
X-Gm-Gg: ASbGncsgqM1MLL9UT4r+QHtvg1dvbmP1oWXBZfnQPF3Q1nCruOh/3Lh4Q1I9g66h4F1
	yp98mGZf4H3C5KhSuotHyII2rlxRJ2I3LwuK/QCwygOvH27bpHZjjJZHN/80gBiA3CPIx6y1Cfr
	RUyq8elNsGdOSZcDfRFHHxZV85Lw7mMb6PjwPq++L7TlQeLSowQQ7TyydzrfdXzAIfi9TYiy8Ju
	iA0Ksw0VtcY5F8ULyNs+py7fug3JB99URhG0PRTfU4sMPoYXHEpvmMwKROx78w1vLI5ISvuFxkI
	ekKOJsU9EXvO2FumKNKsV7mIw1UZbVOZBFcbmBZ0zTVH3b4+KERXO2xTcIw8
X-Received: by 2002:a17:907:2d89:b0:aca:95ed:b9d1 with SMTP id a640c23a62f3a-aca95edc220mr253162466b.21.1744185572792;
        Wed, 09 Apr 2025 00:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDGZE5I848zF3RheNhsp0sylIGxiaPLv5p9KJ9kMUR0mVwOrwhhqxo8Y8n3wVy8ROJPh9oSw==
X-Received: by 2002:a17:907:2d89:b0:aca:95ed:b9d1 with SMTP id a640c23a62f3a-aca95edc220mr253159466b.21.1744185572086;
        Wed, 09 Apr 2025 00:59:32 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7322sm50505266b.164.2025.04.09.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:59:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 09:59:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, 
	Jens Wiklander <jens.wiklander@linaro.org>, linuxppc-dev@lists.ozlabs.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Sumit Garg <sumit.garg@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-integrity@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v2 2/4] tpm: support devices with synchronous send()
Message-ID: <uhqvn5w5ziuzvp3u72kztkfbtkrb2g6ieejup4e2ufun4ywtko@4hcytxdrfues>
References: <20250408083208.43512-1-sgarzare@redhat.com>
 <20250408083208.43512-3-sgarzare@redhat.com>
 <Z_VBUozuHvbxdyB3@kernel.org>
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
In-Reply-To: <Z_VBUozuHvbxdyB3@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t4WJKoVPHde_-LiTkXQXUvuE0BmCJXzgfm5wq0Yde7k_1744185573
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 08, 2025 at 06:31:30PM +0300, Jarkko Sakkinen wrote:
>On Tue, Apr 08, 2025 at 10:32:06AM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Some devices do not support interrupts and provide a single synchronous
>> operation to send the command and receive the response on the same buffer.
>>
>> Currently, these types of drivers must use an internal buffer where they
>> temporarily store the response between .send() and recv() calls.
>>
>> Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
>> If that flag is set by the driver, tpm_try_transmit() will use the send()
>> callback to send the command and receive the response on the same buffer
>> synchronously. In that case send() return the number of bytes of the
>> response on success, or -errno on failure.
>>
>> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
>> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  include/linux/tpm.h              |  1 +
>>  drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index 2e38edd5838c..0e9746dc9d30 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -350,6 +350,7 @@ enum tpm_chip_flags {
>>  	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
>>  	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
>>  	TPM_CHIP_FLAG_DISABLE			= BIT(10),
>> +	TPM_CHIP_FLAG_SYNC			= BIT(11),
>>  };
>>
>>  #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
>> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
>> index 3b6ddcdb4051..9fbe84b5a131 100644
>> --- a/drivers/char/tpm/tpm-interface.c
>> +++ b/drivers/char/tpm/tpm-interface.c
>> @@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  		return rc;
>>  	}
>>
>> -	/* A sanity check. send() should just return zero on success e.g.
>> -	 * not the command length.
>> +	/* Synchronous devices return the response directly during the send()
>> +	 * call in the same buffer.
>> +	 */
>
>Nit:
>
>/*
> * ...
>
>It's wrong in the existing comment.

Yep, I'll fix.

>
>> +	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
>> +		len = rc;
>> +		rc = 0;
>> +		goto out_send_sync;
>> +	}
>> +
>> +	/* A sanity check. send() of asynchronous devices should just return

And I'll fix also this of course.

>> +	 * zero on success e.g. not the command length.
>>  	 */
>>  	if (rc > 0) {
>>  		dev_warn(&chip->dev,
>> @@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  	if (len < 0) {
>>  		rc = len;
>>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
>> -	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
>> +		return rc;
>> +	}
>> +out_send_sync:
>
>out_sync would be sufficient

sure, I'll fix in v3.

Thanks,
Stefano


