Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A41371F79
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 20:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYrsT0XDjz30D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 04:21:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RsH1aj2S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RsH1aj2S; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYrrx49PJz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 04:21:18 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id a4so6591051wrr.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JH9uEbFZLY261RSwVYxFlsQtuJncx5cqZ11oI51lAM0=;
 b=RsH1aj2SWOf7/OWs6Lj6sH6NuMbg63P1+KsTqkyzR1WEWHEMpxniHYsHrBMf4mwO0S
 aB0cEatMVEkWzFNyCiWSQGetrUetLHNO6RR/K3+JVfZYObmqUE0BBEYnsvCpzUbcHEDP
 eje01Z1hETfrHhLD/G8M3eclFKeJ5rQ5tULTYcAV309yYrdZRlj99WNZEmWETTs3J1oz
 yAKOGjFaRC+9HE9Avcs2txy1M7xdI2mNzzMFLNIYEZ9LjTbqasnlV4pfSTQd+s60nq3W
 HWoQV78p5AsqZ/dQ1L5u313GH94nBiWYZhIAAFX47FDAYShixu6AP6Jvxk9De89/SdY8
 NkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JH9uEbFZLY261RSwVYxFlsQtuJncx5cqZ11oI51lAM0=;
 b=ApdL4Q4TFsnVe7zqsIPQM8g5XzgnFvpixgP5rCnQrpsZ65diUTfkjOOborp7ufTzTX
 MihXIvrKffm6zFD4ECYr3kKZqmkhWoGGJceImYfeX8XdSCsfoN6SNhcILEES6hoi/gY9
 9lSiCln2ec20jtjdcPB6zcsZcsu3iDfyg+xHFIkh1o3H7bqMn+P9CwoX6jrfsGorpaz5
 a0hgSQVD/2i+SnIaOchCCq329JNuike9OcnSXFO0bFMptN3G5LH4y9aJmt14UhOO1Mda
 K5ucokREr/BGnwnArIVf1PbTBNZoqe/2+r1bwa2IozqK+57THcLOlp0+WUWeUHT1MMwU
 Si0A==
X-Gm-Message-State: AOAM533wTqCA2hUM4so1jDJWgcQLVvZJJ+KvDhzHH3m1xlBcVn+zT9RG
 9d5omHeHBHxCwI3Xj3hLOIu2mgwGHtxPU6GG2gA=
X-Google-Smtp-Source: ABdhPJz1nRQ6kJzh7PewOUUDY4/llzeUg1g/85JQFPFE81/cAxRnMCa9uKpEY5nUNYP8vftC4K6q38CMskJBbjTfX2U=
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr26720403wrj.420.1620066072241; 
 Mon, 03 May 2021 11:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210503102323.17804-1-msuchanek@suse.de>
In-Reply-To: <20210503102323.17804-1-msuchanek@suse.de>
From: Lijun Pan <lijunp213@gmail.com>
Date: Mon, 3 May 2021 13:21:00 -0500
Message-ID: <CAOhMmr701LecfuNM+EozqbiTxFvDiXjFdY2aYeKJYaXq9kqVDg@mail.gmail.com>
Subject: Re: [PATCH] ibmvnic: remove default label from to_string switch
To: Michal Suchanek <msuchanek@suse.de>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 5:54 AM Michal Suchanek <msuchanek@suse.de> wrote:
>
> This way the compiler warns when a new value is added to the enum but
> not the string transation like:

s/transation/translation/

This trick works.
Since the original code does not generate gcc warnings/errors, should
this patch be sent to net-next as an improvement?

>
> drivers/net/ethernet/ibm/ibmvnic.c: In function 'adapter_state_to_string':
> drivers/net/ethernet/ibm/ibmvnic.c:832:2: warning: enumeration value 'VNIC_FOOBAR' not handled in switch [-Wswitch]
>   switch (state) {
>   ^~~~~~
> drivers/net/ethernet/ibm/ibmvnic.c: In function 'reset_reason_to_string':
> drivers/net/ethernet/ibm/ibmvnic.c:1935:2: warning: enumeration value 'VNIC_RESET_FOOBAR' not handled in switch [-Wswitch]
>   switch (reason) {
>   ^~~~~~
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---

Acked-by: Lijun Pan <lijunp213@gmail.com>

>  drivers/net/ethernet/ibm/ibmvnic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 5788bb956d73..4d439413f6d9 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -846,9 +846,8 @@ static const char *adapter_state_to_string(enum vnic_state state)
>                 return "REMOVING";
>         case VNIC_REMOVED:
>                 return "REMOVED";
> -       default:
> -               return "UNKNOWN";
>         }
> +       return "UNKNOWN";
>  }
>
>  static int ibmvnic_login(struct net_device *netdev)
> @@ -1946,9 +1945,8 @@ static const char *reset_reason_to_string(enum ibmvnic_reset_reason reason)
>                 return "TIMEOUT";
>         case VNIC_RESET_CHANGE_PARAM:
>                 return "CHANGE_PARAM";
> -       default:
> -               return "UNKNOWN";
>         }
> +       return "UNKNOWN";
>  }
>
>  /*
> --
> 2.26.2
>
