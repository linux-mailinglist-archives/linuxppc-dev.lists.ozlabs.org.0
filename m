Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DA7FFD50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 22:13:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aYQmjOSN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh87Z1fZkz3d87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 08:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aYQmjOSN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh86h4c8Kz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 08:12:58 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cf7a8ab047so13127715ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701378769; x=1701983569; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMtD4zdAr6X+H2Qpe4emJrdJbxSyHd1ONAvar3QH9oM=;
        b=aYQmjOSNbGiKjdLjTvMy3jEEt6VMK7Aj4rPJv7IXpLy2qe6S0q+KrfUPBhyAGnKxL2
         4BTdfjID9y8llk3iKWSvsbmcLXngA1hh0C7jUXASvp8QTvVylSE8KXZDwSoPgbzbw4nu
         5aBZ+dbuODlLKjNSO7QKSU/1VNf6a/GD2lGXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701378769; x=1701983569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMtD4zdAr6X+H2Qpe4emJrdJbxSyHd1ONAvar3QH9oM=;
        b=J4OFEPSutNYOwdmYD6wvDQ/X8kXqz75f2XHCOQKJUooNh0AnVmkvocLEVataULvvwj
         mWTVzxTjyPw2vlcs8Mgg80eRygqmmcar3/kDPpHps8VWZKidAGOaVdv+fQNNjIQMC8bx
         C/NiB6e3REZc9XnJcKQP9hhYN7WZXJqPnGxUiGOwQMCMiZ1Zj6XyuFd7vLYC9vC0Ibz+
         wpktOKAkFd9HSDaFcP+y2qLX72WprEfhSe7BIRAi/+hXcl1G85yfX7wVHGmWiGeArIP1
         Efd0VCWVjWvutKIwaSb+v+z1bwGpM8Qrx5KlPjkRuROWHoRoiS5AeiRNF8hxXdG/1LOy
         LXfw==
X-Gm-Message-State: AOJu0YyxNlvISTYaKJvBffHJBRZKBq+O25RJyWfHoSk3apBHXxjEIZdl
	ckEvNFHGKv15xEaXVUpYafmQ4A==
X-Google-Smtp-Source: AGHT+IHMg694k+Ua8hT0yYfpkQVJFEGdgYslaiV8JFgLgJF7PWf5jrslfVimHv+aZAMpIBLCJYRxCQ==
X-Received: by 2002:a17:902:7409:b0:1cf:a2e7:f851 with SMTP id g9-20020a170902740900b001cfa2e7f851mr23180716pll.32.1701378769265;
        Thu, 30 Nov 2023 13:12:49 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y9-20020a170902b48900b001bf044dc1a6sm1867755plr.39.2023.11.30.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:12:48 -0800 (PST)
Date: Thu, 30 Nov 2023 13:12:48 -0800
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] scsi: ibmvfc: replace deprecated strncpy with strscpy
Message-ID: <202311301311.717549FB@keescook>
References: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvfc-c-v1-1-5a4909688435@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvfc-c-v1-1-5a4909688435@google.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023 at 07:04:33PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We expect these fields to be NUL-terminated as the property names from
> which they are derived are also NUL-terminated.
> 
> Moreover, NUL-padding is not required as our destination buffers are
> already NUL-allocated and any future NUL-byte assignments are redundant
> (like the ones that strncpy() does).
> ibmvfc_probe() ->
> |       struct ibmvfc_host *vhost;
> |       struct Scsi_Host *shost;
> ...
> | 	shost = scsi_host_alloc(&driver_template, sizeof(*vhost));
> ... **side note: is this a bug? Looks like a type to me   ^^^^^**

I think this is the "privsize", so *vhost is correct, IIUC.

> ...
> |	vhost = shost_priv(shost);

I.e. vhost is a part of the shost allocation

> 
> ... where shost_priv() is:
> |       static inline void *shost_priv(struct Scsi_Host *shost)
> |       {
> |       	return (void *)shost->hostdata;
> |       }
> 
> .. and:
> scsi_host_alloc() ->
> | 	shost = kzalloc(sizeof(struct Scsi_Host) + privsize, GFP_KERNEL);

As seen here. :)

> 
> And for login_info->..., NUL-padding is also not required as it is
> explicitly memset to 0:
> |	memset(login_info, 0, sizeof(*login_info));
> 
> Considering the above, a suitable replacement is `strscpy` [2] due to
> the fact that it guarantees NUL-termination on the destination buffer
> without unnecessarily NUL-padding.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Yeah, this conversion looks correct to me too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> Note: build-tested only.
> 
> Found with: $ rg "strncpy\("
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index ce9eb00e2ca0..e73a39b1c832 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -1455,7 +1455,7 @@ static void ibmvfc_gather_partition_info(struct ibmvfc_host *vhost)
>  
>  	name = of_get_property(rootdn, "ibm,partition-name", NULL);
>  	if (name)
> -		strncpy(vhost->partition_name, name, sizeof(vhost->partition_name));
> +		strscpy(vhost->partition_name, name, sizeof(vhost->partition_name));
>  	num = of_get_property(rootdn, "ibm,partition-no", NULL);
>  	if (num)
>  		vhost->partition_number = *num;
> @@ -1498,13 +1498,15 @@ static void ibmvfc_set_login_info(struct ibmvfc_host *vhost)
>  	login_info->async.va = cpu_to_be64(vhost->async_crq.msg_token);
>  	login_info->async.len = cpu_to_be32(async_crq->size *
>  					    sizeof(*async_crq->msgs.async));
> -	strncpy(login_info->partition_name, vhost->partition_name, IBMVFC_MAX_NAME);
> -	strncpy(login_info->device_name,
> -		dev_name(&vhost->host->shost_gendev), IBMVFC_MAX_NAME);
> +	strscpy(login_info->partition_name, vhost->partition_name,
> +		sizeof(login_info->partition_name));
> +
> +	strscpy(login_info->device_name,
> +		dev_name(&vhost->host->shost_gendev), sizeof(login_info->device_name));
>  
>  	location = of_get_property(of_node, "ibm,loc-code", NULL);
>  	location = location ? location : dev_name(vhost->dev);
> -	strncpy(login_info->drc_name, location, IBMVFC_MAX_NAME);
> +	strscpy(login_info->drc_name, location, sizeof(login_info->drc_name));
>  }
>  
>  /**
> 
> ---
> base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
> change-id: 20231030-strncpy-drivers-scsi-ibmvscsi-ibmvfc-c-ccfce3255d58
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
