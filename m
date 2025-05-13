Return-Path: <linuxppc-dev+bounces-8540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66431AB56B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 16:03:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxdVJ6wVCz2yf1;
	Wed, 14 May 2025 00:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747145000;
	cv=none; b=ogbD0ohHKs7mf3vBA9VyA32hzi3gtFSNtnTrLeBtDaGb2oEHUPskqwVFXGpkm12gg/MCvdiwAw/1H+Pha8H4uIBQ/h7dOzJ9qpBrssbyUfWLnykanahLDKGZ1R/otNwtO7T9z3O4YFZYvzZ+OoP2sY58FxQEEfdWeMerilX9wZ5eUIDTDCLLz74+OUewZvSbCW2u+yra+6GirEG+r5LqogUUAc1vdF8Ps980htX3HhwBLQOGOSV3uLLJTSZWk8ukjLAAfrymtEya5zx7lFrTIGr/d6nSY24dpk5IOGgDIFH/JrzeARG3/+U6cKYAwt6+0d26sp+yAJ0uOOC5OZIUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747145000; c=relaxed/relaxed;
	bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Px5H8DIs6xQunzLNZqdJxHFGWCzYSRfKTkpxa/GwtjcLKKqVkrVNP+I7IXmq4CKXEbIceborD/0YkPO18CQl7Z8Q27NYw1B1Eh2btPBk88zNSvHA2VvYZMmd2zYA9JVAvEDXT0SnThFawPhIciRL3kRiy/ggBmSS+vWnQyvW6CGMNHFbh+g5xq+t9D5Imgzu7ii8Nb9A6s5oIVnp5AewPDBn8RV2QCV/HuKyxgl8F4cdm1yFN4F+6gXEwerwumJIh5hJv3co3MwZ8lKpBkx9lnZG4ITXIS0u+FKFwLh3gIfrukKgyyiBsBkUT4cwXXSFZ/eZIKcDP/i6jgYf2Rnp1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1Pz5fr1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1Pz5fr1; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1Pz5fr1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1Pz5fr1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxdVH6zHSz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 00:03:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747144994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
	b=d1Pz5fr1cZoSmiQik4ITXHL6F4DIeBpKHbZDNUwD6V/xsPqLZeRw8EmuUDlmCSLBWTHqxl
	eYjoRA2xAVg+3Fvqgd9SryfM4iY83s/nCqJMlOpz6h852xGdA2d7F/JkTWZPwVfWkTZ/R7
	J+zrxaQdkJ/UjUCeCyedI6gGB1Gb3N8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747144994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
	b=d1Pz5fr1cZoSmiQik4ITXHL6F4DIeBpKHbZDNUwD6V/xsPqLZeRw8EmuUDlmCSLBWTHqxl
	eYjoRA2xAVg+3Fvqgd9SryfM4iY83s/nCqJMlOpz6h852xGdA2d7F/JkTWZPwVfWkTZ/R7
	J+zrxaQdkJ/UjUCeCyedI6gGB1Gb3N8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-Dmacx9vGMGajvJNLpCCVNA-1; Tue, 13 May 2025 10:03:12 -0400
X-MC-Unique: Dmacx9vGMGajvJNLpCCVNA-1
X-Mimecast-MFC-AGG-ID: Dmacx9vGMGajvJNLpCCVNA_1747144991
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so40233775e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 07:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144991; x=1747749791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
        b=gg3nD3zHFq72hq4fJuW4dKKd/bcSJ2uXQS1YGXiK9m1ck/druuwQh/RYo47GFhvQzN
         w2nLOVSyxz/nlN0rL93uSE5SESVWu0bt53ai3R7JIMjgcvEok6BuMbQRN9W/EbijVRC3
         mTvI9HP937LWdQSdi4WLvfj6dQgy1oC23bS4NF7SsKTevBboJnqNvOMEZBSmLozxQMP/
         E6RZ8dclUWH2QSN3AlIveiYBsWiM032MltKmWRygP3t3KDPVeVqQ2RgcmmKrpJPcXzUC
         8ASduLakidICNBN67uOuIAlpealfVkdffs4vMfIVl0htIJ1IeoYGgNhsaQc1169mUZhd
         XTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJruy0tQ2Q5wgO0v/jtl72LDi3oTi1uxB5mar13BFoM+5jUtamHbh6NipzqYAD6+IUmIaf+KgQtMk0h4g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqoHEv88UdKFo0ouajWnWRlo4fk7MtiylsRzioKMUnPx+VK+vk
	U+R3UgDT7uFeXWBfeR6hwieturMI4ud3L3dXmVUfX+JI3n2R9CaIwzdrwfD78vbE6J+CGTO75jh
	l4Bsuj39zr1MlvlyFdOh98tvTYEcJMqeDQuZ0JG6qaT69HTe+OcNT+oOp4kqjjKQ=
X-Gm-Gg: ASbGncvDXtsltLV9ALKNqd7HNc4//uLorM0PoXV8iuhHYxcsaLR3nrlduAVLUZDKfBY
	EO/fWvkKp6VKgihQJntxb2DNu4wf6vZTyn01vmMcEajFcJJFIQbjaVDJXNW/6jnnuS7jSUb9aWj
	QRkPFcI130Mzj8uuXT3tkGpJYnsJdW18cGrV1jeltE3Heupq/pXnMeWFA4D2rhcwuxg4Z7bhlPz
	kql5ghqFj1MtfZmaGfzqZ5m1A5SQaFCztym07/zL5Gxl/fHc+LZ4Mb4Jd+2nh9aU2z1bJ915FY6
	QBjF6aprn+/zd4E=
X-Received: by 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr180192395e9.31.1747144987563;
        Tue, 13 May 2025 07:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8ZEKfjvThnHZ+qakwjJU5Vxx01h+as7nBLYm3yQHV3qHfmOsUVNBWy0KLHWObtc49rSNQEg==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr180190615e9.31.1747144986468;
        Tue, 13 May 2025 07:03:06 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f33b5sm16661205f8f.54.2025.05.13.07.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:03:05 -0700 (PDT)
Date: Tue, 13 May 2025 16:02:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-integrity@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicholas Piggin <npiggin@gmail.com>, Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH v4 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <vasgjrd5s3km4vdhyimcqq6etf7rvi2r54zrajrwioebrxl7o5@xyi5h2yxk36z>
References: <20250509085713.76851-1-sgarzare@redhat.com>
 <20250509085713.76851-2-sgarzare@redhat.com>
 <aB8D5syofPSqjzns@kernel.org>
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
In-Reply-To: <aB8D5syofPSqjzns@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nCHwklqX4uWGVUXhHyZYwDvi6VjJ58nJFCoOmPLMdiQ_1747144991
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 10, 2025 at 10:44:38AM +0300, Jarkko Sakkinen wrote:
>On Fri, May 09, 2025 at 10:57:10AM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Add a new `buf_size` parameter to the `.send` callback in `tpm_class_ops`.
>> This parameter will allow drivers to differentiate between the actual
>> command length to send and the total buffer size. Currently `buf_now` is
>> not used, but it will be used to implement devices with synchronous send()
>> to send the command and receive the response on the same buffer.
>>
>> Also rename the previous parameter `len` to `cmd_len` in the declaration
>> to make it clear that it contains the length in bytes of the command
>> stored in the buffer. The semantics don't change and it can be used as
>> before by drivers. This is an optimization since the drivers could get it
>> from the header, but let's avoid duplicating code.
>>
>> While we are here, resolve a checkpatch warning:
>>   WARNING: Unnecessary space before function pointer arguments
>>   #66: FILE: include/linux/tpm.h:90:
>>   +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>
>> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v4:
>> - rework the commit description [Jarkko]
>> ---
>>  include/linux/tpm.h                  | 3 ++-
>>  drivers/char/tpm/st33zp24/st33zp24.c | 2 +-
>>  drivers/char/tpm/tpm-interface.c     | 2 +-
>>  drivers/char/tpm/tpm_atmel.c         | 3 ++-
>>  drivers/char/tpm/tpm_crb.c           | 2 +-
>>  drivers/char/tpm/tpm_ftpm_tee.c      | 4 +++-
>>  drivers/char/tpm/tpm_i2c_atmel.c     | 3 ++-
>>  drivers/char/tpm/tpm_i2c_infineon.c  | 3 ++-
>>  drivers/char/tpm/tpm_i2c_nuvoton.c   | 3 ++-
>>  drivers/char/tpm/tpm_ibmvtpm.c       | 6 ++++--
>>  drivers/char/tpm/tpm_infineon.c      | 3 ++-
>>  drivers/char/tpm/tpm_nsc.c           | 3 ++-
>>  drivers/char/tpm/tpm_svsm.c          | 3 ++-
>>  drivers/char/tpm/tpm_tis_core.c      | 3 ++-
>>  drivers/char/tpm/tpm_tis_i2c_cr50.c  | 6 ++++--
>>  drivers/char/tpm/tpm_vtpm_proxy.c    | 4 +++-
>>  drivers/char/tpm/xen-tpmfront.c      | 3 ++-
>>  17 files changed, 37 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index 9ac9768cc8f7..7ac390ec89ce 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -87,7 +87,8 @@ struct tpm_class_ops {
>>  	const u8 req_complete_val;
>>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
>> -	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
>> +	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>> +		    size_t buf_size);
>
>I'm sorry but now that I look at this, just for the sake of consistency:
>
>	int (*send)(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>		    size_t cmd_len);
>
>I.e. match the order and parameter names from tpm_try_transmit().

Ah, I see, makes sense, I'll update and send v5.

Thanks,
Stefano


