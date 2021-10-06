Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F642482C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 22:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPmfN6nDQz30JK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 07:44:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QT+moIpp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QT+moIpp; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPmdj2fGyz2ygF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 07:44:07 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so5310569pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uukXjZUQ/w+EOWxXqSK1+sdvRdmpSRZkmYypGawzIsM=;
 b=QT+moIpptwRsvjJhH6SoVjzQTZZ76DE7Nw9kqS29J/CEKIqSBkKNAPsy0jT6+cMT5r
 0B+0+QxpzmLLa3r7jEXnwxbIQgJkwMi/us4S+81A070jhHgCr7uQ+fbqDmEae7tJyZrW
 KXcNV8SnxYIgrHqlro0WODjOtXLW8X88ZHdiubGxyQ6s4VSefvMST/UT52GjNmBirP7J
 vPJrn4/h0HeMwFA9oFdn+ECv8WDQE4jLb4GwOzBBu4isPwb9sn2ye3J8U1vaLKqwIt6z
 g4sBC+3kK0eokeo5x1JO49TmdiQsp14FxekFKZ6n9Z+Jk+BJ4arhTM0CkIcl8c56mqWF
 a5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uukXjZUQ/w+EOWxXqSK1+sdvRdmpSRZkmYypGawzIsM=;
 b=OUavWcVhZHJDfc59z/E2hDgXVvzUuGJMaN1QHZnEHGoojAyJK95PAOIzXf38V2u7mp
 2FLNZrgEgdiXf6Qk4WQ1GGuwVwIV76DFFC1mAvMPTG7CYsXHvToquYlBPDf5m0A5zePD
 ZpyzQ/nVpXp/Htdqw2k1oBUimUFFxWuoynYJ9Cey5hGZdwS8h10McjKfghXW1Q2EHd8H
 Ycd29G0UEVdbJBZeH518aGR4vLwT1E4EokzhE7zZihSnR9U3D0/FvrXn1zfaBRZOsiZa
 HaDe2PTpKl0Wxue5bIIjlL88ySTecMhIPT8eRPXUzjFRPx7WriZGSRQt+bzSBSxeIbT1
 jh3A==
X-Gm-Message-State: AOAM532s/fAz3Tam9mLRbXxZiFSYv665xZMyF6mWDDQ7O49Og7+5KbiA
 KgliOu7gLa+MfvWg/nEXNjE=
X-Google-Smtp-Source: ABdhPJxbN+u6234S13N4970pWpeBYhU6hjO3nALy/nZjNDvGJdvqZ+ABgTpyG64/0LL2Z6QM8DUU9w==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr328965pls.17.1633553043180; 
 Wed, 06 Oct 2021 13:44:03 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id q8sm5806904pja.52.2021.10.06.13.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:44:02 -0700 (PDT)
Date: Thu, 7 Oct 2021 05:44:00 +0900
From: Stafford Horne <shorne@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <YV4KkAC2p9D4yCnH@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-7-robh@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 11:43:26AM -0500, Rob Herring wrote:
> Replace open coded parsing of CPU nodes' 'reg' property with
> of_get_cpu_hwid().
> 
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: openrisc@lists.librecores.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/openrisc/kernel/smp.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> index 415e209732a3..7d5a4f303a5a 100644
> --- a/arch/openrisc/kernel/smp.c
> +++ b/arch/openrisc/kernel/smp.c
> @@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
>  	u32 cpu_id;
>  
>  	for_each_of_cpu_node(cpu) {
> -		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
> -			pr_warn("%s missing reg property", cpu->full_name);
> -			continue;
> -		}
> -
> +		cpu_id = of_get_cpu_hwid(cpu);

You have defined of_get_cpu_hwid to return u64, will this create compiler
warnings when since we are storing a u64 into a u32?

It seems only if we make with W=3.

I thought we usually warned on this.  Oh well, for the openrisc bits.

Acked-by: Stafford Horne <shorne@gmail.com>

>  		if (cpu_id < NR_CPUS)
>  			set_cpu_possible(cpu_id, true);
>  	}
> -- 
> 2.30.2
> 
