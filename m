Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DAD25A28F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 03:10:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh5Tn6csdzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 11:10:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TAeyufl1; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh5Rm3vxdzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 11:08:52 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id d11so4217158ejt.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 18:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJmsjMjQXD9euSDFDAcpYgZuaejqzhy2qITfzbgNpKE=;
 b=TAeyufl1suFcqLh+QauL42AgfbkE13Sa2w2NWZJ/rEDu8d08pjJyzxTeVnwh2WEcnD
 sTrtJLhT1iBSQ1cPak0dvNxTUTN96v6br9TBPWGGoWA1DO6ELlZ+3ap486eedQZV7nLb
 r88wUh9wtr/7MUzyFRxearWkGGjRFhRcol/IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJmsjMjQXD9euSDFDAcpYgZuaejqzhy2qITfzbgNpKE=;
 b=RducQKVXuxhz7c40jVZsuk1LejWduvOH53+LeeAvvo/A6I5gXRq/tPQeoyKeGdYoBh
 aLwmF8ykMeVVLQR0T/w6VkubEd/WCJmgHnUDV/SiVjker4ouQXA7w5wgPfoZkDHDa9+s
 P+ihqsw6Qt8cxTNzdT4vyyJL8A2xZ/VwlthajFwdp6mSLdqE/5yQZL8IGKQGclaoa8eB
 RF/COJxbh+AN/dxyI4zbRrhaAdXixgf6ApQJN/1n7wPj58eCbT/BCaN4qYj8YTuhm/N+
 QjdxpENcsdQQRdODKZkPFaePvox0esPj9RW7UsCnfQvzwBeQPLkQFjIVGr8WpvGQco3p
 JX8Q==
X-Gm-Message-State: AOAM533WuISVJcQynqJ9GkhriRmGI/0VIs5yB9gSginmliuoKNhj5oVy
 rUg38DdM7lcU+gakDFUj6SkgbajgYTq6+2x5Oec=
X-Google-Smtp-Source: ABdhPJzT3Dik4BO60pm+fdl9vlDHqT+pk5zT0GT/JkiiAEnkjOqWwch8KcIADNWOBsQFD2hK/CkwbOXoIgzgO75LL1Y=
X-Received: by 2002:a17:906:c351:: with SMTP id
 ci17mr3945397ejb.266.1599008928180; 
 Tue, 01 Sep 2020 18:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <1598969293-29228-1-git-send-email-ego@linux.vnet.ibm.com>
In-Reply-To: <1598969293-29228-1-git-send-email-ego@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Sep 2020 01:08:35 +0000
Message-ID: <CACPK8XfZdnKusEuu8i=-aH=Wfr6X6sMrvX=btFq9PtnXJ2w-SQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle-pseries: Fix CEDE latency conversion from tb to us
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Sep 2020 at 14:09, Gautham R. Shenoy <ego@linux.vnet.ibm.com> wrote:
>
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>
> commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> of the Extended CEDE states advertised by the platform. The values
> advertised by the platform are in timebase ticks. However the cpuidle
> framework requires the latency values in microseconds.
>
> If the tb-ticks value advertised by the platform correspond to a value
> smaller than 1us, during the conversion from tb-ticks to microseconds,
> in the current code, the result becomes zero. This is incorrect as it
> puts a CEDE state on par with the snooze state.
>
> This patch fixes this by rounding up the result obtained while
> converting the latency value from tb-ticks to microseconds.
>
> Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> CEDE(0)")
>
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Should you check for the zero case and print a warning?

> ---
>  drivers/cpuidle/cpuidle-pseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index ff6d99e..9043358 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -361,7 +361,7 @@ static void __init fixup_cede0_latency(void)
>         for (i = 0; i < nr_xcede_records; i++) {
>                 struct xcede_latency_record *record = &payload->records[i];
>                 u64 latency_tb = be64_to_cpu(record->latency_ticks);
> -               u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
> +               u64 latency_us = DIV_ROUND_UP_ULL(tb_to_ns(latency_tb), NSEC_PER_USEC);
>
>                 if (latency_us < min_latency_us)
>                         min_latency_us = latency_us;
> --
> 1.9.4
>
