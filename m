Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0645734D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 17:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwjC050Y9z3c5w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 03:42:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SJ/5hd7o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=SJ/5hd7o; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwjBH4xngz2yb3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 03:42:13 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id b11so8518086pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6usG8MiQSxUWW8t4LIS6CwwnjV4gadMypuBMhJfOTXg=;
 b=SJ/5hd7oOStu335XYv6nQAV6FVZqLIf9hAnFjiCDZVNARjObPclqPpfkPEbcoEKEcw
 UL7tgGQ7+lX1lEDpzzXPu1KfbxDez6M63n1J7dtwKmWViDnGvVnQc++e3Ymsvm2kDgpJ
 Vk6m5PtLG9oteHM0/wRxT6/CxDWmhUxiO3Bjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6usG8MiQSxUWW8t4LIS6CwwnjV4gadMypuBMhJfOTXg=;
 b=A0UVIZqRXLKoXBV42+sJDVdRoGnpEmdzbu1mVPuaG8wuZuhqPREhQh+JlFDpYbfDKS
 N/tjFbCFPkU/PlnZf+KIX0dUeif47EqAtvlgL8PS416acTflyC7Y9qZ0sMWkz49zE3OJ
 QGVBhm5EcEJ4kCjsHuBIwV5hfiUKNgKZGQQmZNg8PgJsrd718i93swTYqZu7TRs463mg
 lTNBe2oM+9dR1lFidtDN44aiKjZ5K4i2oqXPkzBuN0x1gMpQ6UxdsbPvNG+95mFC6gs0
 k8f58O0oPyyilmNO2P02bF6MezX9SYk4MGIVzn5oFlvUBrA9Cq7DEHgVUD0VaJs/Yf4U
 tGBA==
X-Gm-Message-State: AOAM533gloVRqyWMMe0PQnXY4R7XhLKvlnVxvIhXC12UX4rqnPjbxx96
 71cOdMxJr3NrROBn1qL7rpjuyQ==
X-Google-Smtp-Source: ABdhPJxJ0yfws7sNNKBoF+QxKvxIZXPDJEJBvkkmJPuM3LXNvCkaPrbM3z7R/EkI+PBoP+BKqrRXXA==
X-Received: by 2002:a17:902:cb8a:b0:141:f601:d5f1 with SMTP id
 d10-20020a170902cb8a00b00141f601d5f1mr79797842ply.77.1637340131104; 
 Fri, 19 Nov 2021 08:42:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t12sm11083635pjo.44.2021.11.19.08.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:42:10 -0800 (PST)
Date: Fri, 19 Nov 2021 08:42:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Message-ID: <202111190839.B6EC699B1@keescook>
References: <20211118203604.1288379-1-keescook@chromium.org>
 <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
 <202111190824.AEBBE1328@keescook>
 <7f4e7d24-6eb0-5ecf-3497-61c3633046bd@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f4e7d24-6eb0-5ecf-3497-61c3633046bd@csgroup.eu>
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 19, 2021 at 05:35:00PM +0100, Christophe Leroy wrote:
> Neither do I. I was just scared by what I saw while reviewing your patch. A
> cleanup is probably required but it can be another patch.

Heh, understood! For my end, my objective with the fortify work is to
either split cross-member memcpy() calls (which is usually undesirable) or
add a struct group so it can be seen as a "single member" memcpy again
(and usually results in 0 differences in binary output). :)

-- 
Kees Cook
