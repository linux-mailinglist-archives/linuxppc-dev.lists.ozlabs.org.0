Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A779141
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 18:41:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y56W34KFzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 02:41:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="JZjXEn6Q";
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y53p5p5rzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 02:38:45 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id x15so18186298pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+08c+PdXIBVeY6sDHfUjTE9cNjO6KyMEPTgMj7V2IY4=;
 b=JZjXEn6QYGEaImI7V1iUAdLhYZw+xOBslJwMzGz0qIiJ1mxf2/qcPESNBb5IZQ6Zi0
 l0Hvc6j2QUyhIUuWRbNzPSyKiMbLB6WU5H0DWxMm29fVsPXeMsiHs8opmPpQXwdGrT9Q
 e1gVS+ZMXJlJodmV3Wc15altBqNOZou3V7FbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+08c+PdXIBVeY6sDHfUjTE9cNjO6KyMEPTgMj7V2IY4=;
 b=PSSWa9010TN4CIlimrGwvKyAGMG+R6p4fRohsr8jeetEF2m7LTTQKgpaueUUu1A+qy
 BCgmA3B0uKRk5D5j/9bP6ntDAJjRuka+xKbDRQbd3Th6fRNUtAyGc4QbIDaFOZ36OYrd
 EDq6D/MhOJgJSbvOBc2BMjsz1DmDBoOGDFq2xnkGSeZl5dayppPlB9/EyHWwYsElsk0M
 NOVgGqIqOpUEtN3eQBKEDzznsIy7Y5lo5x5KUZg3FpF789JoXUT5YlGIknhPgoifNt/4
 Npd1fbPtiboSczaLLzEX+niCWpaVl+QIuBcTb9r3dPSARwXk9czxQzUsdPzJWHzbJPYQ
 Qagg==
X-Gm-Message-State: APjAAAUskjuRkIdpY7ykc1Go/uCdEViD/cUrMaxYCKGUjeEoENx2IoBA
 kfRbdvV5m6/G55NieElRquyHGQ==
X-Google-Smtp-Source: APXvYqyELyrdfBSbaJc1b/4/p8QGl1qLzaYkHKBSMm8jZldpOoqQAfcTWUmpFaevBfT0PPNVUHwiBQ==
X-Received: by 2002:a63:494d:: with SMTP id
 y13mr106885695pgk.109.1564418324034; 
 Mon, 29 Jul 2019 09:38:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q144sm63458340pfc.103.2019.07.29.09.38.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jul 2019 09:38:43 -0700 (PDT)
Date: Mon, 29 Jul 2019 09:38:42 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] scsi: ibmvfc: Mark expected switch fall-throughs
Message-ID: <201907290938.022D08EA@keescook>
References: <20190729002608.GA25263@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729002608.GA25263@embeddedor>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 28, 2019 at 07:26:08PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings:
> 
> drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_npiv_login_done':
> drivers/scsi/ibmvscsi/ibmvfc.c:4022:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    ibmvfc_retry_host_init(vhost);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/scsi/ibmvscsi/ibmvfc.c:4023:2: note: here
>   case IBMVFC_MAD_DRIVER_FAILED:
>   ^~~~
> drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_bsg_request':
> drivers/scsi/ibmvscsi/ibmvfc.c:1830:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    port_id = (bsg_request->rqst_data.h_els.port_id[0] << 16) |
>    ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     (bsg_request->rqst_data.h_els.port_id[1] << 8) |
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     bsg_request->rqst_data.h_els.port_id[2];
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/scsi/ibmvscsi/ibmvfc.c:1833:2: note: here
>   case FC_BSG_RPT_ELS:
>   ^~~~
> drivers/scsi/ibmvscsi/ibmvfc.c:1838:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    port_id = (bsg_request->rqst_data.h_ct.port_id[0] << 16) |
>    ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     (bsg_request->rqst_data.h_ct.port_id[1] << 8) |
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     bsg_request->rqst_data.h_ct.port_id[2];
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/scsi/ibmvscsi/ibmvfc.c:1841:2: note: here
>   case FC_BSG_RPT_CT:
>   ^~~~
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index 8cdbac076a1b..df897df5cafe 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -1830,6 +1830,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
>  		port_id = (bsg_request->rqst_data.h_els.port_id[0] << 16) |
>  			(bsg_request->rqst_data.h_els.port_id[1] << 8) |
>  			bsg_request->rqst_data.h_els.port_id[2];
> +		/* fall through */
>  	case FC_BSG_RPT_ELS:
>  		fc_flags = IBMVFC_FC_ELS;
>  		break;
> @@ -1838,6 +1839,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
>  		port_id = (bsg_request->rqst_data.h_ct.port_id[0] << 16) |
>  			(bsg_request->rqst_data.h_ct.port_id[1] << 8) |
>  			bsg_request->rqst_data.h_ct.port_id[2];
> +		/* fall through */
>  	case FC_BSG_RPT_CT:
>  		fc_flags = IBMVFC_FC_CT_IU;
>  		break;
> @@ -4020,6 +4022,7 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
>  		return;
>  	case IBMVFC_MAD_CRQ_ERROR:
>  		ibmvfc_retry_host_init(vhost);
> +		/* fall through */
>  	case IBMVFC_MAD_DRIVER_FAILED:
>  		ibmvfc_free_event(evt);
>  		return;
> -- 
> 2.22.0
> 

-- 
Kees Cook
