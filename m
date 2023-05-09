Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C66FBD49
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:32:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhyZ4Vf7z3fQ2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:32:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nl7NAz0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nl7NAz0Z;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhxg5hDdz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:31:51 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-643995a47f7so5205168b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683599509; x=1686191509;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHJtftwXob+gAHIf0UanzgkjjX97bhOqhU/icw6bdcA=;
        b=nl7NAz0ZByUAm52ILo71NCHkxKDVNbqgb7NQuvFzMmSVV1qgY6XCdIsmNSHcuKkWsv
         bfR25FzW4Bd8XebEJMHM2OMfHhDOZZt0YjkUh1SG1iFht8RJdRpHeTdgr+Rt3+DpQEfB
         Igm+z6ON7R3Gg048rt+bLTZ+qWOA//iNN7yg+Ns97r1aI6V/M5jkEDt5VDfU9ia56LpK
         CQfeTwcfKkQNviKGorkPd4HlaoKFLIWFObJXE+SQ914Ag9HxB815kP2lsW6hOy2w1DAU
         g/WomJYZWM4Zj+72C/mZBXW4I1PjW7lLkfScEB/8xZ7LQfEIWsDxgdxcapEaMfRiHD2b
         foGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683599509; x=1686191509;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MHJtftwXob+gAHIf0UanzgkjjX97bhOqhU/icw6bdcA=;
        b=ZLSZiJKehNJLTEeZhExgaTT4yzjs/HxxhpYG6bBhadLTuQ6MQ4suIHkh89jr95S5pP
         /bo9AfuUE7mTKxH59HrNC3RgGo+4759pbzLY1PVfUnFXFnbE5VIcNCX1yLpoTSL7fxwa
         q9X+5MsE6F9pgI1+MQEKQt+d33Jj2C2DTkS9xcQNTBt/aspLRh3B1lnmw1Qb01dYi68s
         SgMCgiUeSTBntfSEaPWmbv5a41TuCGjGJQ/uoN8bEKdvPMp1czEGpTyj2N13NcS9Gl6w
         +xtun1UIwRKbsJPSU3OEjFix+o2BVsOqROlWtrpPu0QY/dNSGQdcOQUQ0w1ds9HrgJtw
         kSGA==
X-Gm-Message-State: AC+VfDy9knG2BK9uo/c/5A5+rvni+XuESJ0EUcjmUymF72fyEa1SYe0q
	uclCCABDaZUloqEThlH7+s4=
X-Google-Smtp-Source: ACHHUZ5iUu+1RLeR53H8c6/JqlNbIy8+c/QTQ0hk3Jy8CXcffoxWPA8xvC9At6PqKz3wJg/+gaIjLg==
X-Received: by 2002:a05:6a00:989:b0:62d:d045:392 with SMTP id u9-20020a056a00098900b0062dd0450392mr18089411pfg.32.1683599508637;
        Mon, 08 May 2023 19:31:48 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78686000000b00640ddad2e0dsm627457pfo.47.2023.05.08.19.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:31:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:31:43 +1000
Message-Id: <CSHE7QBXHRLG.3TGXICMADVMJV@wheely>
Subject: Re: [PATCH 10/12] powerpc: powernv: Annotate data races in opal
 events
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-11-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-11-rmclure@linux.ibm.com>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> The kopald thread handles opal events as they appear, but by polling a
> static bit-vector in last_outstanding_events. Annotate these data races
> accordingly. We are not at risk of missing events, but use of READ_ONCE,
> WRITE_ONCE will assist readers in seeing that kopald only consumes the
> events it is aware of when it is scheduled. Also removes extraneous
> KCSAN warnings.

This code is fairly crap, which I can say because I wrote it :(

But this at least is an improvement. Thanks.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-irqchip.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc=
/platforms/powernv/opal-irqchip.c
> index d55652b5f6fa..f9a7001dacb7 100644
> --- a/arch/powerpc/platforms/powernv/opal-irqchip.c
> +++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
> @@ -59,7 +59,7 @@ void opal_handle_events(void)
> =20
>  		cond_resched();
>  	}
> -	last_outstanding_events =3D 0;
> +	WRITE_ONCE(last_outstanding_events, 0);
>  	if (opal_poll_events(&events) !=3D OPAL_SUCCESS)
>  		return;
>  	e =3D be64_to_cpu(events) & opal_event_irqchip.mask;
> @@ -69,7 +69,7 @@ void opal_handle_events(void)
> =20
>  bool opal_have_pending_events(void)
>  {
> -	if (last_outstanding_events & opal_event_irqchip.mask)
> +	if (READ_ONCE(last_outstanding_events) & opal_event_irqchip.mask)
>  		return true;
>  	return false;
>  }
> @@ -124,7 +124,7 @@ static irqreturn_t opal_interrupt(int irq, void *data=
)
>  	__be64 events;
> =20
>  	opal_handle_interrupt(virq_to_hw(irq), &events);
> -	last_outstanding_events =3D be64_to_cpu(events);
> +	WRITE_ONCE(last_outstanding_events, be64_to_cpu(events));
>  	if (opal_have_pending_events())
>  		opal_wake_poller();
> =20
> --=20
> 2.37.2

