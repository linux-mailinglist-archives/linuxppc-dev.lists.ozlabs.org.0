Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0B1996B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 10:18:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450jl64TyQzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 18:18:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=sergey.senozhatsky.work@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pi676OP1"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450jjR1GHszDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 18:16:42 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id z3so2639672pgp.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tmrArLlqX0+g8dO65H9KErVBV4iwBC4vplgVby2I7tY=;
 b=pi676OP1FRhqbBbpb7fOeUNTiVaJG652h+lbTMGFhbLW2aHAPornrN8wTMZXVlgNxl
 W4BB6oJI8eT5ewIiyVGrzKYVuW9DRSSPWxGnbWSW+Ndedu6GJoUyQ3y/PgWW77qlcw6G
 2K3ngsOj1EzudIqLQY3Pv3bW/Uo8QOE0RKDM/G2n2MKLlvq5G32CQmiJ4tJt1eVKKfw2
 FJNt9YkI8VdNggOxd10ie4KY7+2hyQwHe618/y9gJGoXaaVC7tu0mkaM1DcSD7DR1e/1
 pQQgGtrSt/riF+FkuY9LeHLXQkZAa87ftpIW1dZnvIkh0uDIpIWMkZzfDlrKxKmq2uc4
 zYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tmrArLlqX0+g8dO65H9KErVBV4iwBC4vplgVby2I7tY=;
 b=XXwJaPTX3L9b0Q9a9fsocsshkteuv8iGWcL3UIIcs2dYp0QsxhTPfwb4VIW7JlDOiN
 vcNApeyNnp+M/4X1an+HxgTh/V6H8WERQXNFcBwZubEHKWUy7FKVQVAWrZR5N/5fulFu
 2u6uzMaXHtLD0rLkRcJ1GqxcFFr6rpCquPK1PmglHWy7na4D5JCuUBmkk6NZMMY3Is8d
 EA1Ac4G33JQC418K27jDFj4jQOPZaj9Va35QBK0/RwDLru62h3NPk8kK9EEp9+TrrsoY
 syKb4W+gKITLXUyYHPiBfclllc0Mrte2UtuQ0fjrLCU+Yj78tgTbfMBgSBo+bPVsOVri
 WkFA==
X-Gm-Message-State: APjAAAVSGFRDmYOhEoHwBz2WY1oYZf6nbfjo1sk5JjR7IfxB2j63ElVH
 oah9ZURYCwH1weARcWJvrxI=
X-Google-Smtp-Source: APXvYqwOHP1arI/G1HtdqJ0tQ0k3aIkPVbkmDhzh/AFABpPSUF5dUQqIu8sQTWKyE8OeI4KXFIElPQ==
X-Received: by 2002:a63:246:: with SMTP id 67mr11946180pgc.145.1557476199809; 
 Fri, 10 May 2019 01:16:39 -0700 (PDT)
Received: from localhost ([39.7.15.25])
 by smtp.gmail.com with ESMTPSA id h1sm8999019pfq.3.2019.05.10.01.16.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 01:16:38 -0700 (PDT)
Date: Fri, 10 May 2019 17:16:35 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190510081635.GA4533@jagdpanzerIV>
References: <20190509121923.8339-1-pmladek@suse.com>
 <20190510043200.GC15652@jagdpanzerIV>
 <CAHk-=wiP+hwSqEW0dM6AYNWUR7jXDkeueq69et6ahfUgV7hC3w@mail.gmail.com>
 <20190510050709.GA1831@jagdpanzerIV>
 <20190510080602.mdfk54f6lpyg6unw@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510080602.mdfk54f6lpyg6unw@pathway.suse.cz>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (05/10/19 10:06), Petr Mladek wrote:
[..]
> I am going to send a patch replacing probe_kernel_address() with
> a simple check:
> 
> 	if ((unsigned long)ptr < PAGE_SIZE || IS_ERR_VALUE(ptr))
> 		return "(efault)";

I'm OK with this.
Probing ptrs was a good idea, it just didn't work out.

	-ss
