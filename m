Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6D63A043
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:01:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLBbH1GLMz3cNJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:00:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fscuiW38;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fscuiW38;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLBZJ3H6hz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:00:07 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so9016051pjj.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 20:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNoQfisyqzfXvDu6yA2/74I5te0d5SbusWUdYHs5KkQ=;
        b=fscuiW38OIrP2P3JgL8s6C5QknYjVY17svbMO4p+b2DePk/KoUfCdV9I9P901Y8q4S
         QkZAjlDR9dlmj7jhgwoteW3R3Z4ogVFs9/kCzjEpUSjs9wjRFQylO5iYeL1GclCZTlRl
         9nCMXKf1z2wfxfrxkGABab1dCuxHfsjhUAShqZsmW0z8F3woUD34rmW5urqphxRyZd5j
         23d6NS0uBc7eevFsZ6pTRNC7HY4pplpVIlLDBCe1SQ8pb8jXB9MQSoDKjI7KPB/SXbM3
         c/xwk9JC1K5FsxjdmEmTZKFhSi+8+IyrltIgUbQ6ccukva4f5cwnSU5pf6pk1JBTn+OB
         C4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNoQfisyqzfXvDu6yA2/74I5te0d5SbusWUdYHs5KkQ=;
        b=TFZ6oV6oSkfbeBu+vUZ7+BBjy72ZsOoodFazRy6TFrT7bTmn4gzt5CYXE1qLpclMl0
         HtH/Ryvof/O/3au/MAmk12QjuMr0s2tcC8T/pPOBZ0Uooe+De+aKbQ9KWkX0TcQN/PxO
         rMNDhz6UqYwcEkBuYxGnTKMA73oUdJwpTyJR/Mpr4Ylr0CyAmkxG9mW4mxOF+70APHWm
         fPEUTEbzPVOfVELpie84txUMSASi+N3/ZVin7e6TfvXzL0mh6DyK8pzDDrHvaKtoH2Kh
         4zH6pJ/z75NBzSe5A/DFFIS7Oe7bUNOBG7XtjSoDwwq8C7yXdz2H4gdpjgPYLd7/TQMO
         PxhQ==
X-Gm-Message-State: ANoB5pmSorOANc/7TttUROtsnLor3Ny/3r/SnupbkLDKpUBfZQmX0O9V
	CnPKoUphdXmgWfhh0mqmIEY=
X-Google-Smtp-Source: AA0mqf4u1LLFibCmITlWTEnt8g53v1RotdatjJ1S1iehKgb8RFtfK9w0IwGH/JR0u59EVV5T7y0gfw==
X-Received: by 2002:a17:90a:d598:b0:218:7734:499 with SMTP id v24-20020a17090ad59800b0021877340499mr52601396pju.2.1669608004544;
        Sun, 27 Nov 2022 20:00:04 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a0d5000b00218d894fac3sm8655829pju.3.2022.11.27.20.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 20:00:03 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 13:59:59 +1000
Message-Id: <CONMN2ANFF1X.32AFVTS82UR2X@bobo>
Subject: Re: [PATCH] pseries/mobility: reset the RCU watchdogs after a LPM
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Laurent Dufour" <ldufour@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>
X-Mailer: aerc 0.13.0
References: <20221125173204.15329-1-ldufour@linux.ibm.com>
In-Reply-To: <20221125173204.15329-1-ldufour@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Nov 26, 2022 at 3:32 AM AEST, Laurent Dufour wrote:
> The RCU watchdog timer should be reset when restarting the CPU after a Li=
ve
> Partition Mobility operation.
>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

Looks okay to me. xmon touches the softlockup watchdog explicitly but
is that for architectures with unsynchronized clocks maybe.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/platforms/pseries/mobility.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/pla=
tforms/pseries/mobility.c
> index 634fac5db3f9..9e10f38dd9ad 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -636,8 +636,10 @@ static int do_join(void *arg)
>  	}
>  	/*
>  	 * Execution may have been suspended for several seconds, so
> -	 * reset the watchdog.
> +	 * reset the watchdogs.
>  	 */
> +	rcu_cpu_stall_reset();
> +	/* touch_nmi_watchdog() also touch the soft lockup watchdog */
>  	touch_nmi_watchdog();
>  	return ret;
>  }
> --=20
> 2.38.1

