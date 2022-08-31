Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37705A8AD5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 03:35:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJ3X82ZTGz3cBk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 11:35:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.51; helo=mail-ej1-f51.google.com; envelope-from=breno.debian@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHq9M2Lppz3bcc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 02:18:29 +1000 (AEST)
Received: by mail-ej1-f51.google.com with SMTP id nc14so24492069ejc.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 09:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=hs27A97tiJvrzqLEY67+ba99paoViVve8c+DJ3f+Pqg=;
        b=hpHEuUNoqFUliujH7xn6ixVeFrGUykq65QMSuXjsgszRjbU7deefrF8qkGxX44k3oX
         0yeqmMgxmYvERgHnKlAW2yRcZ44Zp9cv/jYs5EQcEStr6fqnzSvDWTY13pHDiLzPPoqA
         pXWogygOPcb2BkE6zAirj2TQ62sw8y4aLUqfLOB0Wj2EHECujPPEUqumvC9pC8JKQWrP
         4skUbJeTHmlABNxk2gj+L145U1uLUzItYukuQzmi2JRd2gjpAx2s/5IiTQVc6SBmJLwv
         Ua+VED7IEkwqi32C0l6xA/DV3CS403AcW9CaAKgsbPpjcb+0Uo2dtkLZhS4NF5b0WWLH
         9X4A==
X-Gm-Message-State: ACgBeo0FqtP1LVB7lEuuz2x+PUkWvnsWyeIr+0+i3CFsXiYqfqT1dYPV
	oPDI33DLvrfdYeBwvVvCN9Y=
X-Google-Smtp-Source: AA6agR4HjXreg6GyPP2faOYPhvdwYt88YzaoF1YZO04ge0M4cM8Jr+yewDGui8ztp5XOVATFMO0Dpg==
X-Received: by 2002:a17:907:2cd1:b0:730:a980:d593 with SMTP id hg17-20020a1709072cd100b00730a980d593mr20741096ejc.48.1661962704855;
        Wed, 31 Aug 2022 09:18:24 -0700 (PDT)
Received: from gmail.com (fwdproxy-cln-022.fbsv.net. [2a03:2880:31ff:16::face:b00c])
        by smtp.gmail.com with ESMTPSA id z63-20020a509e45000000b004478fdbe190sm9242412ede.10.2022.08.31.09.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 09:18:24 -0700 (PDT)
Date: Wed, 31 Aug 2022 09:18:18 -0700
From: Breno Leitao <leitao@debian.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH linux-next] crypto: nx: remove redundant variable rc
Message-ID: <Yw+JysFvbmW0yJL8@gmail.com>
References: <20220831140248.303940-1-cui.jinpeng2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831140248.303940-1-cui.jinpeng2@zte.com.cn>
X-Mailman-Approved-At: Thu, 01 Sep 2022 11:35:16 +1000
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
Cc: herbert@gondor.apana.org.au, Zeal Robot <zealci@zte.com.cn>, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, pfsmorigo@gmail.com, npiggin@gmail.com, Jinpeng Cui <cui.jinpeng2@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 31, 2022 at 02:02:48PM +0000, cgel.zte@gmail.com wrote:
> From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> 
> Return value directly from set_msg_len() instead of
> getting value from redundant variable rc.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
Reviewed-by: Breno Leitao <leitao@debian.org>

> ---
>  drivers/crypto/nx/nx-aes-ccm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/nx/nx-aes-ccm.c b/drivers/crypto/nx/nx-aes-ccm.c
> index 3793885f928d..c843f4c6f684 100644
> --- a/drivers/crypto/nx/nx-aes-ccm.c
> +++ b/drivers/crypto/nx/nx-aes-ccm.c
> @@ -134,7 +134,6 @@ static int generate_b0(u8 *iv, unsigned int assoclen, unsigned int authsize,
>  		       unsigned int cryptlen, u8 *b0)
>  {
>  	unsigned int l, lp, m = authsize;
> -	int rc;
>  
>  	memcpy(b0, iv, 16);
>  
> @@ -148,9 +147,7 @@ static int generate_b0(u8 *iv, unsigned int assoclen, unsigned int authsize,
>  	if (assoclen)
>  		*b0 |= 64;
>  
> -	rc = set_msg_len(b0 + 16 - l, cryptlen, l);
> -
> -	return rc;
> +	return set_msg_len(b0 + 16 - l, cryptlen, l);
>  }
>  
>  static int generate_pat(u8                   *iv,
> -- 
> 2.25.1
> 
