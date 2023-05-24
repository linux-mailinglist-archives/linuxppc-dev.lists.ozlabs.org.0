Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24AF710131
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 00:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRRQj50xXz3fD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 08:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YK+qnrCT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YK+qnrCT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YK+qnrCT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YK+qnrCT;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRRPr0fFqz3c7S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 08:56:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684968986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k1Jcq95wsHIqLNg9wbmmJlT15+6EzUdpG8ilf/jMgQ8=;
	b=YK+qnrCTP8ByBFJjvr6gI48dutejVK7ZpLhAb2iwEcqMLQB1NPA6OY39gDHe8CZcc7dcW4
	PTpJnPlW/Skhsn7+A8ILvHzsyvbu71uynHkJl9+Kzwt6IZLwxtkuTMxib8ZF55FVoHLjDI
	0pvY95F6wjl3e9K1B66M1rajjsRM9NE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684968986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k1Jcq95wsHIqLNg9wbmmJlT15+6EzUdpG8ilf/jMgQ8=;
	b=YK+qnrCTP8ByBFJjvr6gI48dutejVK7ZpLhAb2iwEcqMLQB1NPA6OY39gDHe8CZcc7dcW4
	PTpJnPlW/Skhsn7+A8ILvHzsyvbu71uynHkJl9+Kzwt6IZLwxtkuTMxib8ZF55FVoHLjDI
	0pvY95F6wjl3e9K1B66M1rajjsRM9NE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-Gn6-doXvO-GlGjMiRuP08Q-1; Wed, 24 May 2023 18:56:24 -0400
X-MC-Unique: Gn6-doXvO-GlGjMiRuP08Q-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3f6a71e8321so6293091cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 15:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684968984; x=1687560984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1Jcq95wsHIqLNg9wbmmJlT15+6EzUdpG8ilf/jMgQ8=;
        b=UdmpcDOY/Nh0PdGGwNhMmODcH4Kw8+MNZSpFsfX+22j4f25nEa5M8juWr07uxjuQE6
         /CM5ezHzQYqHLndGOSbfgwl1D2T06Wpx7bzvPwXBf6Nlis36agevthtsZF6GTlx5yp1A
         0Po83+Mta8n/QTXytNjY4t+Y6irLGoxSpFRMGsKSeZeBUfgrRW/BdKCFPEdR1g4Cngw5
         CYFvP7D+XAew+/By2TVip1oKFG7qo2kHaMyqP48BFpuf+v1dPdR9AyA08jT9B3kmKSDT
         bKbd5q8HlrmAUnBt5hN1zNZoxri7p2auujgkATNhoDvug2eP9hNQ0A55PMMDQvY5fLrd
         8VRQ==
X-Gm-Message-State: AC+VfDxCrJwZDh5rwBH7zUm01IuBYcoy1gkvGApewXBHuPUUMWrQ4d8C
	kPhGat/LZBubnpIXoKxSkFW/9FtptEBWDVRCkqzTwmUTneXbypO1A+xlFqU7gqTMJEM3TR1k2f2
	8yyMe53+hhUyIT0rpSBWiTlTZtQ==
X-Received: by 2002:ac8:7c54:0:b0:3f6:b7a3:8450 with SMTP id o20-20020ac87c54000000b003f6b7a38450mr11325809qtv.64.1684968984358;
        Wed, 24 May 2023 15:56:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6YIOLa22uHsyvn/hEoIII2YehPLAhvw1u1EoIWqYO1cyYh5aCnNjvQkCcKdtrNBcB8QhnYhA==
X-Received: by 2002:ac8:7c54:0:b0:3f6:b7a3:8450 with SMTP id o20-20020ac87c54000000b003f6b7a38450mr11325796qtv.64.1684968984135;
        Wed, 24 May 2023 15:56:24 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id u7-20020a05622a010700b003f6a8379fa4sm3555602qtw.70.2023.05.24.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 15:56:23 -0700 (PDT)
Date: Wed, 24 May 2023 15:56:21 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v9 1/4] drivers: of: kexec ima: Support 32-bit platforms
Message-ID: <a2dx66ug4gnbokit35in5c2qjsq2fcewtw35bwknnsav4pw2ee@c3s4wsbszeyb>
References: <20230418134409.177485-1-stefanb@linux.ibm.com>
 <20230418134409.177485-2-stefanb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230418134409.177485-2-stefanb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, nasastry@in.ibm.com, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 18, 2023 at 09:44:06AM -0400, Stefan Berger wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> RISC-V recently added kexec_file() support, which uses enables kexec
> IMA.  We're the first 32-bit platform to support this, so we found a
> build bug.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

> ---
>  drivers/of/kexec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> index f26d2ba8a371..1373d7e0a9b3 100644
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
> @@ -250,8 +250,8 @@ static int setup_ima_buffer(const struct kimage *image, void *fdt,
>  	if (ret)
>  		return -EINVAL;
>  
> -	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
> -		 image->ima_buffer_addr, image->ima_buffer_size);
> +	pr_debug("IMA buffer at 0x%pa, size = 0x%zx\n",
> +		 &image->ima_buffer_addr, image->ima_buffer_size);
>  
>  	return 0;
>  }
> -- 
> 2.38.1
> 

