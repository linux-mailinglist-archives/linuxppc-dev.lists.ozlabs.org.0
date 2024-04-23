Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568B8AE508
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 13:56:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WAunevRa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP0v805CNz3vd4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 21:56:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WAunevRa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP0tN31fKz3dDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 21:55:22 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a587fac79e5so69628166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713873316; x=1714478116; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OLs2w5Mb2TuW5IEF0yGhInk4y//qTnl8Y3J8SN796zY=;
        b=WAunevRa2ZBiwP70WMTZWlxPXuOXYV8JCCJQhmWAZY6eVKBYCP4HcGPuLqRhs5ORTd
         bEx8cwhHfZVyam4N/l71vXNYTKlFLa9/vAnOMbLgbtsegcjGarJ62V72XhHjIwwGACdt
         CdRem/mE4zYCxDIUb8C/hvyVQ2COx0dPtB+LMR9Oj8NnnFcqBiJmw7aOmlbYzWhkAYMc
         QA82BUY7uGvRSI1NaPE41mmFxfPRI6L/zgVxhk7AZvwQGKuokxpLS3vCVTnJk/tWTW0+
         Bi4NKTcfmwFJawd5V+zf8V47pQ39za/Mn8mf9ixZM/QZwePJ49mOiVuutQTCkAy8nZl6
         yEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713873316; x=1714478116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLs2w5Mb2TuW5IEF0yGhInk4y//qTnl8Y3J8SN796zY=;
        b=jIrW/EznMACgvMH34KeUdC09a9cKnXilQvQopd3LVVE+r/c9VeBWUYWHqi/5FZ+oui
         xKq0mMlOhU+p6twFPWARjPKxPSdy0ZLXNeD9473HgYbB/MD12HA/gLF0YBtT+740z/cX
         mQfDBysVZEXO3/U0rueb6sAVOf18FYzP9FHPg+oD1RwBD3bDW+bmB7YkOwGvXHnzRnrM
         dgoDMK9c65vjNedSfnAkSkVTIeClc2wtKJDs6tiagabN348FR15noShSy+c+KrxBjrI7
         1AKgayEhBZenJ84HCtkZCh8RGDZD8+1/XnYfPRsaQgyhGWPOWcIvzdDe83sb+7IcHMsf
         Vo3g==
X-Forwarded-Encrypted: i=1; AJvYcCUyLsJVz+WsTyYsMkdIXfzFxdBQZw3ZghJI2YOKcvWUkmpkgJISfEMeHvUzWRXJbUriuSy7uWRPJUKiUtIVbY4fE4UlQGzffF6IwtUQLQ==
X-Gm-Message-State: AOJu0YzqUMIWWc7JBRP6xiggPcT/fuJqKguV1TXg9JeWJIQI0dFmiZ8Z
	WuCrTGhLdz4o+iVOhoCmRAOGWfrz7v+N9w4jZDevJqSHOZOvbkYu9EwPU3Nggdk=
X-Google-Smtp-Source: AGHT+IFZ405qdGxDMkW1+5YC21CzN8lvjF3c9LLGQSea/WcHK3KI0QcB69sFb36UHpXXURv+h98QNQ==
X-Received: by 2002:a17:906:3791:b0:a55:554b:1f5d with SMTP id n17-20020a170906379100b00a55554b1f5dmr7343452ejc.41.1713873316016;
        Tue, 23 Apr 2024 04:55:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qy7-20020a170907688700b00a5887279b8dsm57534ejc.179.2024.04.23.04.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 04:55:15 -0700 (PDT)
Date: Tue, 23 Apr 2024 14:55:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] ibmvnic: Use -EBUSY in __ibmvnic_reset()
Message-ID: <da19d324-3c66-4bb1-8fa2-dc26dbea622b@moroto.mountain>
References: <4cff158d-b5ac-4dca-9fbb-626237c1eafe@web.de>
 <f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>
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
Cc: Nick Child <nnac123@linux.ibm.com>, netdev@vger.kernel.org, Rick Lindsley <ricklind@linux.ibm.com>, kernel-janitors@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Eric Dumazet <edumazet@google.com>, Markus Elfring <Markus.Elfring@web.de>, Haren Myneni <haren@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2024 at 12:54:55PM +0200, Paolo Abeni wrote:
> On Fri, 2024-04-19 at 16:08 +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Fri, 19 Apr 2024 15:46:17 +0200
> > 
> > Add a minus sign before the error code “EBUSY”
> > so that a negative value will be used as in other cases.
> > 
> > This issue was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/net/ethernet/ibm/ibmvnic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> > index 5e9a93bdb518..737ae83a836a 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -3212,7 +3212,7 @@ static void __ibmvnic_reset(struct work_struct *work)
> >  		    adapter->state == VNIC_REMOVED) {
> >  			spin_unlock_irqrestore(&adapter->state_lock, flags);
> >  			kfree(rwi);
> > -			rc = EBUSY;
> > +			rc = -EBUSY;
> >  			break;
> > 
> 
> AFAICS the error is always used as bool, so this will not change any
> behavior in practice. I tend to think we should not merge this kind of
> change outside some larger work in the same area, but I'd love a second
> opinion from the driver owners.

I missed the original patch due to my procmail filters...

You're right that it doesn't affect the behavior of the driver except
for the debug output when we do:

	netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);

But the - was left off uninitentionally so I think we should apply it.

I have been trying to look for similar bugs where the - is left off.
It's a bit challenging because there places where we use positive
error codes deliberately.  But in this case a static checker could
easily detect the bug with a low false positive ratio by saying, "We're
mixing normal negative error codes with positive EBUSY".

regards,
dan carpenter
