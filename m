Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46B220544
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:42:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B679Y3zTQzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:42:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WTpGJqyv; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B675z5spbzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:39:35 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id x9so1987368plr.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K1kqfp/kSgMwqPN12bKZZ//tfp2BxSTq1mD1swS+LDI=;
 b=WTpGJqyvZjouFkCmi9zC/0IzuJwZoNFGlTzKYuYnoDp3GznjB6msDkhLTTTBu81Esi
 VaiNpYKxJmEPniJqqf09uJdBkXcLEIlWpbN9YChqtejiEx5VVXwlAWq9RvVYA9F10bOq
 Z4rxBdm44p8Cq8K/f5i74jWh1LV9csMsmEbFW+oFQ7/MxGBvm9QESsA11YtoP9tSC7bH
 x1n3ZtXcPmgWKB1GOyjfJWyZgff0uRvK/uNOG0z5TdlWF1Pg47pEK57j4UjItuoeS2h8
 JuwpEwZ9zcTL4k5YVHLs72Ty+YvrUQtNDOpdd243y3StSD5cGBZqDxK0RP+egFp0dBq6
 OIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K1kqfp/kSgMwqPN12bKZZ//tfp2BxSTq1mD1swS+LDI=;
 b=WFiMA8XgsCCRNJ/1GXevVn0/3uYBQBRvQVsQ/fDk4IublDmnqT8R8OGJOHq93x41FK
 VYPBNvmXR+yv5LODj5gU11H0EOC++1vWb7+t7WsTuSTvXmU0Yue2hrtMcYDcrXNIezis
 YH3zhzz1d9KJaW0D2bZx/EIBaqXA7K6GCvqc+CVJuQq57EX1DwrSw5fXygeaTDkjZHeg
 BFePRo/lmC8p0bdjHKE/OUJvS0GCh6st4hqNVadKHkZUmQ/uGz+Uo23QQdD/A79soo9H
 Cg04DZAhBXtyCLBVXOunKfG/gvObHZY5IG+zDmKXSW8qW72Q+c8RQJk+K/WkYbJf7oLr
 pAHA==
X-Gm-Message-State: AOAM532AQG2y2JEja5iyAF40pmiBmgfGqGn5tTXXUrQCbvVFqaN+fMyO
 +lzZbm/eUyXmO/qw/FCUVmkm1Q==
X-Google-Smtp-Source: ABdhPJxLbshzrCuRoNXOv/ZJi7ksi9A0wHLDGdlFvXgLu4FgBdgA0IgbBWVDw+UxdqJZWSCcNXm/wQ==
X-Received: by 2002:a17:90a:368c:: with SMTP id
 t12mr8639149pjb.90.1594795171879; 
 Tue, 14 Jul 2020 23:39:31 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id d190sm1013466pfd.199.2020.07.14.23.39.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jul 2020 23:39:31 -0700 (PDT)
Date: Wed, 15 Jul 2020 12:09:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
Message-ID: <20200715063929.42p5ljlcuwie7pmz@vireshk-i7>
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-6-lee.jones@linaro.org>
 <20200715030706.prxya7fyylscoy25@vireshk-i7>
 <CAOesGMi1dfqPbFJ8YoUoJ75NdU1=XiNoYx+6+JLu44a4LuuYGA@mail.gmail.com>
 <20200715063607.GQ1398296@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715063607.GQ1398296@dell>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15-07-20, 07:36, Lee Jones wrote:
> I searched for "include.*platforms/" in drivers/, and was scared off
> this method since no one else does this.

Yeah its not right for generic drivers, but this is very much platform
specific so it is fine here.

-- 
viresh
