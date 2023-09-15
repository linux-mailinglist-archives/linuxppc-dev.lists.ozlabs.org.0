Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA17A1C8B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 12:42:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OqGPtx9r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn9kP1Prgz3cSR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 20:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OqGPtx9r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=herbertx@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn9jW0Cn1z3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 20:41:49 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a9f87adfe1so1234741b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694774507; x=1695379307; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gzWd4qQtjOfUKs0FGdp1XK/HuGB/Tuv7F6Nb03IR5k=;
        b=OqGPtx9rcCV1DRaWZGlSPlq2o2t79odzAQLSKKPMd0q1IeP+CA9UHOByoi/wwzXsSw
         QxlVt/LzDlI55utc2IsZr11giCfo2DVxcBU+i5XgZh1G5ZzRMa9t1UlLp9z7yo0IipUL
         vp6M5Ny/56lXcFTMyP/qfnY7b2orlwM+6Eq9QXW4txA3WGPSQqMTFmxsAphEGXPNrpeP
         9sJEb+Q9E19N5fvFp47VTa0QejHD38bo8iV2r9E7voQMjzKsszKKVFyLYTCqkEZbZwZl
         y7A9XJuOt4f6Io7W20NxlJ0/vF5GwkP0eNip/yeFz6l2HQqGfkvWpMZh0RH1ioVtYUwf
         Llmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694774507; x=1695379307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gzWd4qQtjOfUKs0FGdp1XK/HuGB/Tuv7F6Nb03IR5k=;
        b=T5nZ1W54ctrJT/EnY0VJre4QMpFTIR6MSj5i/A71okraVi9PRvyMn5dpdltTUZgWdR
         w9Wc8k8rzhlRgFeMVFVVoWGlBCZGiXAP9yaZpA8bcL08XetJ66E4Byd6upjkHj7LNBhE
         ReFcYdcHEJGnfkPoY41yL2Z3DmuEF21NwVaQ4hESQGQ/JF2GRjF4CxVnQ2uEUDmkVMh8
         yfIr42v65/WaLlLVOStB8DhKKOaUHqsidV0VipBZiCy8CiKMy/HYarv2/AtpUUB8BGzS
         csNfmzEuBllanE/GlQTOHeOGG1UmB6FPVsXoqTlKUxiye7M6oLH2Rh/pEzIhRBULiETT
         zN0Q==
X-Gm-Message-State: AOJu0Yx5yCNqyOZ+bdJWvDABOR7J2ln470ngeq5eh0Z9tJ8A5g0JT13S
	/4cjAmq14c4anBf2Ew+6UWo=
X-Google-Smtp-Source: AGHT+IFpe8AfKuunKz52MX2dRnnLDy5CuQB9pEFA4YsZtIk2oHpgiy3Q5oOFA1QV6fA7kOMFhhXn4w==
X-Received: by 2002:a05:6808:3bc:b0:3a9:3079:9547 with SMTP id n28-20020a05680803bc00b003a930799547mr1223527oie.30.1694774506732;
        Fri, 15 Sep 2023 03:41:46 -0700 (PDT)
Received: from gondor.apana.org.au ([2404:c804:1b2a:5507:c00a:8aff:fe00:b003])
        by smtp.gmail.com with ESMTPSA id e5-20020a62ee05000000b006889664aa6csm2734052pfi.5.2023.09.15.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 03:41:46 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:41:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH v2] crypto: vmx: Improved AES/XTS performance of 6-way
 unrolling for ppc.
Message-ID: <ZQQ06U7LEgoZMSY6@gondor.apana.org.au>
References: <20230830134911.179765-1-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830134911.179765-1-dtsen@linux.ibm.com>
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
Cc: dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, linux-crypto@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 30, 2023 at 09:49:11AM -0400, Danny Tsen wrote:
> Improve AES/XTS performance of 6-way unrolling for PowerPC up
> to 17% with tcrypt.  This is done by using one instruction,
> vpermxor, to replace xor and vsldoi.
> 
> The same changes were applied to OpenSSL code and a pull request was
> submitted.
> 
> This patch has been tested with the kernel crypto module tcrypt.ko and
> has passed the selftest.  The patch is also tested with
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
> 
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  drivers/crypto/vmx/aesp8-ppc.pl | 141 +++++++++++++++++++++-----------
>  1 file changed, 92 insertions(+), 49 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
