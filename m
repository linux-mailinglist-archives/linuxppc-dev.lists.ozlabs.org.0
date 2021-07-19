Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18713CEB1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 20:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT9p74yTcz3blW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 04:47:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jyr/9Lo4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jyr/9Lo4; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT9nj20rFz3bfh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 04:47:36 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id a80so6337967qkg.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=lJcS5lEZjjAoYShvaryNw6SqSqh0qq9Bkj+sXFi2sZg=;
 b=jyr/9Lo4f72nip7mLbZDDyHNaF0TEL+Wmtrl8CEg4b4in9E3PMKzWylZ8WxiZNUkzs
 F0CSRmrD7wHD9mHI7TJUrrfT4n/oGr+uEAgWdaJDZb2DGbJGKtN1tOAHKCl7+WLtVKqg
 VX1yYvH6UttwWnYTUOp35QdkFkooIwez4xxV6rHyzheNA/mKs0JD2aT3p2C7Q7Ah2BBx
 tAlla36PSJuagFPvxo3PvKiJ7Ag5Jg0YlhWNNlb/55+4pRrYPk3wVsI+kBGYz+zyY87j
 7Doc+b9ldWgJefHMiiLnMRIdhukpYp5NZh5ZLVOs+VoDKZgeVunbmGLuFiHk5h8TinE4
 m8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=lJcS5lEZjjAoYShvaryNw6SqSqh0qq9Bkj+sXFi2sZg=;
 b=l5Soaf1a1SeiiHYIQqndezmirh5AeZIw3HoqGpKHpsvD/qHlla3sHBueaDy6KAsRsP
 BGnmBXxFifz/r26IXBr0J22qnmJHedUcIms76IikX8a3JQRu4SZTVljlV1YzehYj6F0Z
 2Z7YAtyFDLj9NXRVAdMUflvHwbnRvf2TceeXnGlOViyqztGMGixGop91sMJ66i7XazSH
 Y4PYnD5rJJU5Lm3wnDbWsb+H5eJsKe9/awqr9lroakM/b0QetIzQQCXNjxPVEmy2IRWH
 XQzWq90CLiLSXhc6WHxFIkoUGURVwcC7fZWUDogvJIp2tdetMAJncBa//iEGXSNX6WdX
 f7Qg==
X-Gm-Message-State: AOAM5323l5pIdvE6Fp2vZUBqxMGGqnJWfai88CSaMoihU3Bln5/o/ltI
 t4GZ9EFhyd7RdsIJpRwVa+0=
X-Google-Smtp-Source: ABdhPJw4mz753gKXgKu4ViSjC0ATjRPZlo3T2nBCvnJT5DIl2pFp5dFalaWfb4U3+kdaTs7vdCK+0A==
X-Received: by 2002:a37:670e:: with SMTP id b14mr25754880qkc.240.1626720454540; 
 Mon, 19 Jul 2021 11:47:34 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id r139sm3766145qka.40.2021.07.19.11.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:47:34 -0700 (PDT)
Message-ID: <4cbfa11cf8f52d47d6ff0aabe01e4e51918d3c58.camel@gmail.com>
Subject: Re: [PATCH v5 04/11] powerpc/pseries/iommu: Add
 ddw_list_new_entry() helper
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Date: Mon, 19 Jul 2021 15:47:53 -0300
In-Reply-To: <ae8fe44e-24c1-9d5f-70f9-96098167170a@linux.ibm.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-5-leobras.c@gmail.com>
 <ae8fe44e-24c1-9d5f-70f9-96098167170a@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-07-19 at 16:14 +0200, Frederic Barrat wrote:
> 
> 
> On 16/07/2021 10:27, Leonardo Bras wrote:
> > There are two functions creating direct_window_list entries in a
> > similar way, so create a ddw_list_new_entry() to avoid duplicity
> > and
> > simplify those functions.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> 
> LGTM
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 


Thanks!

