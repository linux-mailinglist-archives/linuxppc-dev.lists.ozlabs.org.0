Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAEAC8799
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 13:52:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jvcx62VczDqXW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 21:52:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::144; helo=mail-lf1-x144.google.com;
 envelope-from=urezki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NKTwvoIx"; 
 dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jvZs33JQzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 21:50:12 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id r22so12530233lfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ERYCwhz2Jv8a2PVju4gxqh772VeR3/dOesngu7HPYnA=;
 b=NKTwvoIxQtQKHiWFgsb0Dr5MXuoTKgm2v5uaWdQsgbZAg65hZVIWoISq3wolvdEAAR
 FxxPvE8dnm3bANECmAtFuazY5ZXEviGexcvyvzpErii7cWM6uZL9mg7hf34049JsB6Xd
 9pdqnmVmk3p9j35vtwN2sO6IdAtnyUzWR2KGUJYmodCR4iKYYOJciJLMQvdug4MZiuiP
 2nVI7cs8AKCxchOuVfkGDUxzjr811bGzOImlN4hKtKc95U20sJvHz2INXyyvmn5DwPiA
 EMZGI36ZasVGpNtA/WWHXlYBBHpqp6CBBdyKCDD3XPuR7/zujFdCdXJsKCuL7H54F0Yt
 UMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ERYCwhz2Jv8a2PVju4gxqh772VeR3/dOesngu7HPYnA=;
 b=HP50ayjEl6FYNoYBgxO/q+SPnbg2IFrTgsQC6VCd0uze/6AI+fyuz4xqQit8+sA2nD
 qJGj+IV5ooRnWfKnQPa3epXaj0GrI2RlZC5Ec5+D2/t3Hj1KR4cz3WzJEt42C45N0mXo
 H/spJtkzDESVsdiP023ZX2RzCWmJ0BH+u+eON6b4IhnuslV87mKK3wPXHYdqsCJb+7Di
 bscp3/PSrVAA8Eu/ucBAEull4eCq4p54gZzgBxogIFzg1+zZdr06YE7GTj452tekPqN7
 K6N55FbEIjjNdOuQbyZPJhoG/VEuQ3ACMekw39jQ2cLn2B6i0FpuR+6Aw/juQsCspRu+
 Siwg==
X-Gm-Message-State: APjAAAWnU9cgoodSjI6QeiLRoBaVd2ghTYKO3yTWzVE33H1YGSzNgpxY
 K6pcdK9UuxLJ/LJ0lbgEW8I=
X-Google-Smtp-Source: APXvYqzmBtraLl7Fkhb/mX+JH5ZW8CPDsl554EacBpP42KpX5nl7Qc54pEaK0EtGedCJwAONbblaZg==
X-Received: by 2002:a19:8c14:: with SMTP id o20mr2075568lfd.158.1570017005189; 
 Wed, 02 Oct 2019 04:50:05 -0700 (PDT)
Received: from pc636 ([37.139.158.167])
 by smtp.gmail.com with ESMTPSA id x76sm6142064ljb.81.2019.10.02.04.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 04:50:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 2 Oct 2019 13:49:52 +0200
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
Message-ID: <20191002114952.GA30483@pc636>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <20191001101707.GA21929@pc636>
 <87zhik2b5x.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhik2b5x.fsf@dja-thinkpad.axtens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, gor@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Uladzislau Rezki <urezki@gmail.com>, glider@google.com, luto@kernel.org,
 aryabinin@virtuozzo.com, linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 02, 2019 at 11:23:06AM +1000, Daniel Axtens wrote:
> Hi,
> 
> >>  	/*
> >>  	 * Find a place in the tree where VA potentially will be
> >>  	 * inserted, unless it is merged with its sibling/siblings.
> >> @@ -741,6 +752,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
> >>  		if (sibling->va_end == va->va_start) {
> >>  			sibling->va_end = va->va_end;
> >>  
> >> +			kasan_release_vmalloc(orig_start, orig_end,
> >> +					      sibling->va_start,
> >> +					      sibling->va_end);
> >> +
> > The same.
> 
> The call to kasan_release_vmalloc() is a static inline no-op if
> CONFIG_KASAN_VMALLOC is not defined, which I thought was the preferred
> way to do things rather than sprinkling the code with ifdefs?
> 
I agree that is totally correct.

> The complier should be smart enough to eliminate all the
> orig_state/orig_end stuff at compile time because it can see that it's
> not used, so there's no cost in the binary.
> 
It should. I was more thinking about if those two variables can be
considered as unused, resulting in compile warning like "set but not used".
But that is theory and in case of having any warning the test robot will
notify anyway about that.

So, i am totally fine with that if compiler does not complain. If so,
please ignore my comments :)

--
Vlad Rezki
