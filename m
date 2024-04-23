Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10218AEB53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 17:42:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HxsLuhhY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP5wY4GFvz3vc8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 01:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HxsLuhhY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP5vq09jVz3cWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 01:41:56 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4155819f710so48087715e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713886913; x=1714491713; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZikBdylglkN8bWBjnrEpahW+0kxCuVDLNcL4eHsNrZ8=;
        b=HxsLuhhY9MMANocKL8LiqD6ONhvE9D7xrPu8Xya9HSpz/K2wuByAzsquCisuSAge9A
         7q3lLwSUj6Q9/YVuroM81qcXlTVF2jfMLsg6zqjQGLr7fqwy176Sucr/dZkIctUJGp48
         hqL8BHyBu89tjdQST4J9Stht4fQJXiCdeGzTLOuBfCidvUOKWLhUOjjOgY4C31lqjElB
         sY9PkLAGlZQe6ugkNFh3iGILz/GFeaLfy41fdVMz1gkmMS20M+tadsb3xYuqG1v2kD7Q
         Xn4wx3zvF47Y3TlNM5OJ45eGKZ3kiRSyyN6rb30pePaoqN0YpDkKkGTzInM3R+RcTVYO
         Zdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713886913; x=1714491713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZikBdylglkN8bWBjnrEpahW+0kxCuVDLNcL4eHsNrZ8=;
        b=dKcs5+BhJlMf1S2kZGnc1pTDxCv1zqD3cBlRi7bWt8lm/apyArXVtOfK7XYHzo5Cpj
         1dAurA91V2bWbmtr7QZ6IuNuxiixcOyjaDsPXcbh5wtHuk7n/Gpxa5Kxd2fgqvR7vSoj
         c4EMgw3doezwVwl89tqQlo2nKsKSrBq7X5Y/Rf5D2j3j1oVi9NDmX07qMaisJacR0TJR
         Q/Lceot3pGqQy52JzG9X0C6PBtmWS/2vZB81WqgGfOiu5fabXwTlTpmPN71jd1JAmwg5
         fNU1VRsWTHGRVQaSnSfXMfENvwfJRl8O52v+gTFfFO7sOh9c+/rSudfMBRpVt/8zAdW+
         PWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVggc3cWQ31ozAZzWd3ffYWFMApxrDJoilz/j9SFCzG83FZy/RZP/TI7m4ApVdG5pOlu1TPu05981ZDJ5LUyIw8g3MpQAjpVCOcnpCreg==
X-Gm-Message-State: AOJu0Yz/8Hq5qpD8H87axND0j/hPJwnO44jsBFogUCAzPS7z/GdxAv17
	H2DOGyoqgBQjjt3esPROtEHU4HOAyoY6ncbob4GIUsG3JJUkKnu6b+OM8KzfLW8=
X-Google-Smtp-Source: AGHT+IFxgKWYTQdFrX3VG4d1eGF6RGQaWSLjzXM57qu9fcpFkJ6JpJK2zYVCn7svqzO1SOa5kWdf9w==
X-Received: by 2002:a05:600c:1d26:b0:418:5e80:b7af with SMTP id l38-20020a05600c1d2600b004185e80b7afmr10107916wms.36.1713886912731;
        Tue, 23 Apr 2024 08:41:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c4e4600b0041ac34cf06fsm2266461wmq.42.2024.04.23.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 08:41:52 -0700 (PDT)
Date: Tue, 23 Apr 2024 18:41:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH] ibmvnic: Use -EBUSY in __ibmvnic_reset()
Message-ID: <ba5e5ccf-59fa-4c7f-b649-97c19b2008a0@moroto.mountain>
References: <4cff158d-b5ac-4dca-9fbb-626237c1eafe@web.de>
 <f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>
 <da19d324-3c66-4bb1-8fa2-dc26dbea622b@moroto.mountain>
 <7e3f43a3-98e0-40ed-8820-2f1eef8742ba@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e3f43a3-98e0-40ed-8820-2f1eef8742ba@linux.ibm.com>
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
Cc: netdev@vger.kernel.org, Rick Lindsley <ricklind@linux.ibm.com>, kernel-janitors@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Eric Dumazet <edumazet@google.com>, Markus Elfring <Markus.Elfring@web.de>, Haren Myneni <haren@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2024 at 09:55:57AM -0500, Nick Child wrote:
> > You're right that it doesn't affect the behavior of the driver except
> > for the debug output when we do:
> > 
> > 	netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
> > 
> > But the - was left off uninitentionally so I think we should apply it.
> > 
> > I have been trying to look for similar bugs where the - is left off.
> > It's a bit challenging because there places where we use positive
> > error codes deliberately.  But in this case a static checker could
> > easily detect the bug with a low false positive ratio by saying, "We're
> > mixing normal negative error codes with positive EBUSY".
> > 
> > regards,
> > dan carpenter
> 
> Hello, small clarification, this patch will not effect the debug print
> statement due to the break statement immediately following:
> 	while () {	
> 		if () {
> 			rc = -EBUSY;
> 			break;
> 		}
> 		netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
> 	}
> Though this return code can be passed to adapter->reset_done_rc, which is
> only treated as a boolean.
> 
> So, the point of the patch not doing any behavioral differences is still
> true.

Ah yes.  You're right.

regards,
dan carpenter

