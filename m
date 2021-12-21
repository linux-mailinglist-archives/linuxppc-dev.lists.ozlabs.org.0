Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9395F47B6B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 02:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHz4W3D63z3bsp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 12:14:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VLRYoqQp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=VLRYoqQp; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHz3r5HzSz2xWl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 12:13:26 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id n15so11583742qta.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 17:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ImhGZNgWQ6RSPs0/MNgkgB9bxoki7Hld1WRDVZLnPFc=;
 b=VLRYoqQphPkZHC7/mVdrVwi4JRSSX4/EcZlF/HwnA+2dvfr3EppJPZ0e75yD6cqvEi
 eOOQayG7v6CLJSO53F9A8v4Beerdugi4zsWwEkWCVp+xAlxnAkkspTMCvrUz76/T6Zs+
 fpFvNNWUkhq3CV0yI7aAkxmYtxbTVL+jvEjbZrT+D/4sT/o85ScW0wzk69lPb7ReIPAn
 eDC7+AxN83mEdK/4zPzRTGcyBGPMEaWrGVvLD0wwyUil1aii0qxF1Hty6R7Jn5cwydtA
 SNtMHDoxHQN6uHtWj9SKDLtXPDB5YielKtH/KMqWLBH+2xVv5wFuCBXfq2FxvLRwf12Q
 FL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ImhGZNgWQ6RSPs0/MNgkgB9bxoki7Hld1WRDVZLnPFc=;
 b=hGPgm1b4q8mxrHifrJEqo/ZlMzGgfZ+QKEetu2iaccJ3vjQ+19zVVh11ymcjrWICDd
 zyo6SuA7eZMn+afTo7nQNiWEHH85pn1XNcoNcfvSd0sN+ChZq61esQXf3D2WmA3k0x+n
 geqMFPZIw2aGqLoR1sKA2KNOR5jbZB0TbqxmYiNWQuTj2KMYNB/bfO2AKzGHf0V2H4i4
 c54xmnQPrOMtBk8GKvu3wA4T/rRvZvDGASB0qtYwGQsjyNPWG6dpn4m/nFrNEWf7DFff
 NeEcAFpJ2Jjt+59YijVe2ti6VYlZG6vcHktUvEOnj72UbAgMYCHF+rGF0Acl8WxH1mQa
 Tw0g==
X-Gm-Message-State: AOAM533hPc5k6HxEvKK2E2YZ7/uSabN+s5hOKR0yFGGQEBemWUa04i/w
 iarVOKHS9NzZutu2Xp+dm3uO1Q==
X-Google-Smtp-Source: ABdhPJw+4sRAzJSi3LnPVoLw1Dt7Bkx+hmVXajl3aaZlbjv5jLRVbLeuQXoICu0pNeKnjSZ3FNLWJw==
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr621640qto.112.1640049202009; 
 Mon, 20 Dec 2021 17:13:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id b9sm15854858qtb.53.2021.12.20.17.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 17:13:21 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mzTiS-006yyf-C9; Mon, 20 Dec 2021 21:13:20 -0400
Date: Mon, 20 Dec 2021 21:13:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH] tpm: Fix kexec crash due to access to ops NULL pointer
 (powerpc)
Message-ID: <20211221011320.GM6467@ziepe.ca>
References: <20211212012804.1555661-1-stefanb@linux.ibm.com>
 <1052cd36-1b85-5d36-045f-5c5bf9f0fc4e@linux.ibm.com>
 <d9eafa8f-4006-4bc2-c09b-6b02a14c6ef3@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9eafa8f-4006-4bc2-c09b-6b02a14c6ef3@linux.ibm.com>
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
Cc: Korrapati.Likhitha@ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 pavrampu@in.ibm.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, jarkko@kernel.org, gcwilson@us.ibm.com,
 peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 20, 2021 at 08:05:58PM -0500, Stefan Berger wrote:

> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> index ddaeceb7e109..4cb908349b31 100644
> +++ b/drivers/char/tpm/tpm-chip.c
> @@ -473,15 +473,8 @@ static void tpm_del_char_device(struct tpm_chip *chip)
>         mutex_unlock(&idr_lock);
> 
>         /* Make the driver uncallable. */
> -       down_write(&chip->ops_sem);
> -       if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> -               if (!tpm_chip_start(chip)) {
> -                       tpm2_shutdown(chip, TPM2_SU_CLEAR);
> -                       tpm_chip_stop(chip);
> -               }
> -       }
> -       chip->ops = NULL;
> -       up_write(&chip->ops_sem);
> +       if (chip->ops)

ops cannot be read without locking

Jason
