Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F2DBC74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 07:09:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vYxF68kTzDrPS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 16:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Or1S1NJB"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vYtc25DdzDqjj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 16:07:17 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id t10so2248946plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 22:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BN38U1tWSQycIwUtKvgVS41nw2Y5xmAR6qADXcgIN/E=;
 b=Or1S1NJBS21mZ3T0kRuw3+pg9/9vA19tlOBKzPCu+VJOzUGorap9nhyIFOs7X2qgrg
 zvJDJQwIS1BW+6v7Hpb7lsxv4M+N1QE5YfJhC/1Fj5/SMhEmHI+miSmHuYfJPzUy6eFa
 GC0iDI+pBneF36jZra4sKjv7DLrI/2YleI/qLkqhHXu5iCL7IzKssn9od150fmLSzfsz
 LCOOYySKfikf3B2ZqQcd/I/6X7u97Zel3TIjOM8ZSAJdp2jpXC24fyV1GimkEn+jQcpD
 jBnPpOKMTIiYCrVbDyuUNr2v1+bDc60g12qFOhDG8ORiKRo/fqfAbqCIaTrPDAbvhTUO
 GGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BN38U1tWSQycIwUtKvgVS41nw2Y5xmAR6qADXcgIN/E=;
 b=TAG+iw4OSc9OpjCKuPlvwSLoI0vTpQhNhzpV1vBe+9ul2d2Ck1gBwGN0/U5h0mCXGZ
 i20F2G5z69K9oG5sRPzKLopYq7SQyM9oyZoMkOyMIS1gid7++ZNDDsKcJawHX9dp1mx2
 MnqVSUJeDfy7jmGqK72NykgU8Eb/7X3/P44IESqB4URbcM44ambvmMOcBFIBOa5mXH4q
 +uEsLIkcL+TjGfkEYLtvOeN74z6BnK1ROWgcuZpcix3HHv6mhEMiLlNTaizkZBiVw6Q5
 M+rym5jlC39qGJUe+C4LO7QYsG3Fqf8HO4Noxa1m/fdEqE3QcNfX2+jKFiVGKs46nXm1
 symw==
X-Gm-Message-State: APjAAAVsVHV6RcD/kGLDug+vVh9YlEBzc09Vrs0hX7YTE8IHSnHQfQV4
 45DTx9GdMElGIcJf+Lsuh2dS4Q==
X-Google-Smtp-Source: APXvYqzkRC1EwPpxmXJHKXXdNdXNMqjA0MEl0CEAzz/4I6yX9UtNA1XEwdpB6tAX43Fk+9Ejz7Ry3Q==
X-Received: by 2002:a17:902:904b:: with SMTP id
 w11mr7882591plz.182.1571375235738; 
 Thu, 17 Oct 2019 22:07:15 -0700 (PDT)
Received: from localhost ([122.172.151.112])
 by smtp.gmail.com with ESMTPSA id 74sm4821485pfy.78.2019.10.17.22.07.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 22:07:14 -0700 (PDT)
Date: Fri, 18 Oct 2019 10:37:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2] cpufreq: powernv: fix stack bloat and NR_CPUS
 limitation
Message-ID: <20191018050712.qr2axffmbms5h4xb@vireshk-i7>
References: <20191018045539.3765565-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018045539.3765565-1-jhubbard@nvidia.com>
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
Cc: linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
 Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17-10-19, 21:55, John Hubbard wrote:
> The following build warning occurred on powerpc 64-bit builds:
> 
> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> This is due to putting 1024 bytes on the stack:
> 
>     unsigned int chip[256];
> 
> ...and while looking at this, it also has a bug: it fails with a stack
> overrun, if CONFIG_NR_CPUS > 256.
> 
> Fix both problems by dynamically allocating based on CONFIG_NR_CPUS.
> 
> Fixes: 053819e0bf840 ("cpufreq: powernv: Handle throttling due to Pmax capping at chip level")
> Cc: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: linux-pm@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> Changes since v1: includes Viresh's review commit fixes.
> 
>  drivers/cpufreq/powernv-cpufreq.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
