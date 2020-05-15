Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA461D5A6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:55:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NzfS26mtzDr82
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 05:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=WOdBZxkO; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nzch578ZzDr42
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 05:53:53 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 145so1468173pfw.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5qtf7blhXztbp1/La11Bf9xlOpWMwbs2y8ergkt/b1Y=;
 b=WOdBZxkO9ZlChGU9oTzTvFnzf5mUvWnxclG7T4JezJMXnEFbeWIBYnzv0c5jwu2xR9
 Ua3N7q+nFby1Wl8Ij1gOb/0WxV2Lt/MvTh2s4lrob2lxAcR9KO41fQ13sdSZlN1Y3XVh
 OTL4s6x9aG0YSd9i9ndrZNnBrE8K6mg0Mxnms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5qtf7blhXztbp1/La11Bf9xlOpWMwbs2y8ergkt/b1Y=;
 b=XtzV9uUjWQwAtEeiq4SAYm6Jo27mvHETRP447H4lS536x0jGfzzRNZeyfw0dP+Yyty
 ShbXuGJ2fg03LQviVsgr+QvK2dTapZkMlG+dU+eCnUD2fKU0TwHUYN2d4+wMwoisodSQ
 8rvxhcCPoygwddF/p1jIxGA6Imxflwrs8xhd9I9RJl7drlvSxU2jRCgAxracgsXhX4L1
 nh+s8DZIoI+V5MHhzOIgIvk2Cdkg8HvxPLcowf3Ne0psoWwyJhOpOu0bkeD3n0CbxYQ9
 s3maJ75f5Eg+NzQiCD4qc2Dj2FPT4DGwA87RP1J8rLURz6hplyJwbBba4jne32l0WiUr
 p8vA==
X-Gm-Message-State: AOAM531M9FWqFFP167xJvyF90tLVmoI/TXmQSV9ZaKaX2/WebpihuQMQ
 ahs4i1SFcLZbmz00lDorjgH6bw==
X-Google-Smtp-Source: ABdhPJwUJ8/mvnjZpuvFRvd7Z7fsk0iW3ySHXxxVPnmOTQBwN+vIWkdIBNf95F25TgFzeLZ3qRQIkg==
X-Received: by 2002:aa7:9a4c:: with SMTP id x12mr5517509pfj.263.1589572432046; 
 Fri, 15 May 2020 12:53:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h13sm2560838pfk.86.2020.05.15.12.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 12:53:51 -0700 (PDT)
Date: Fri, 15 May 2020 12:53:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert
 dump_oops
Message-ID: <202005151253.AF4AC00@keescook>
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-6-keescook@chromium.org>
 <CA+CK2bCbAb1EN6xa9a-DRfan6Cv3YgZgPJ1buwUaej7jBRv=Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bCbAb1EN6xa9a-DRfan6Cv3YgZgPJ1buwUaej7jBRv=Kg@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 15, 2020 at 03:40:14PM -0400, Pavel Tatashin wrote:
>  pdata.dump_oops = dump_oops;
> > +       /* If "max_reason" is set, its value has priority over "dump_oops". */
> > +       if (ramoops_max_reason != -1)
> > +               pdata.max_reason = ramoops_max_reason;
> 
>  (ramoops_max_reason >= 0) might make more sense here, we do not want
> negative max_reason even if it was provided by the user.

Yeah, that's a good point. I'll tweak that. Thanks!

-- 
Kees Cook
