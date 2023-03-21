Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 632AB6C266A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 01:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgXn01PLGz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 11:39:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hlX+WuWF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hlX+WuWF;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgXm3752nz3byj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 11:38:59 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id s8so7919605pfk.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 17:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679359135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLfNMIdfmWa7uxic4s3XFQUgdy9GXPiHgpuDGt8m5xw=;
        b=hlX+WuWF7iamBEHMLyEdDQrY1f8O96E9dvQT8w3R57CdTQ0u12saWrnuYqx2CDoJou
         dnUUgEIgNqx3L6YkufrRp2vopty/zRsucsVaA9ef7rP0PPRWkGxs37nBZ5se8b2Gh6bm
         Kb41wkj5f88nWFRb/0hO8WRGoHnLA+ZSp91p6qbujiljmucqgDwTMJ51sQCkSk64/pkn
         DxJcH/Kctvn4j3q7Ssmy9bFSyeDZYmfj5R6sjrNS4DDvWuvNR27vOlnOS4ol9YsyQkVc
         nAsow+J3/lwjWKYvyklhL+1aegOdz7P1lxysA5vHUHFM4NFHOxpvE/9y5+ewNNCxUpoW
         mKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679359135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fLfNMIdfmWa7uxic4s3XFQUgdy9GXPiHgpuDGt8m5xw=;
        b=moG3F1jWVeppupyWj8WUcWAsQTkZ8L3FrCFFc+gpmiZzZRdXwmeK8eJY7ny9zAnnxm
         9kEubol5XyA+AhMFvJC5q+ImfHh/JNeBVUb5MZNPJJcRI/k8gv5Ksf9zYu0lvONxffZH
         QXHCfjQ5wN7xUi4g2zeyPrB0nIUjsUH6nvD3dalhzAoRYqmqMCDAPxC3AAzlX4dlsnQn
         ApPFlB5V/jGHu62E3vHuzcDOy9lybMUm13sPJ/MRxUq83rxGxgCtG0YP+kyczTrXu7Wi
         nEe6VtX+5UOVNH/dnx5eIHoQQCHKGp+dQJNOoBiTa8z3BzkiZ26VOmDFrTme1IXz+eaO
         Vpzw==
X-Gm-Message-State: AO0yUKXq3K1UIclHEXzxXQRGQ/ILzmWsh/0Ws5U6uC+bfAHSg12SwXr9
	NlzvEK4ikllzt5DycLJqk9M=
X-Google-Smtp-Source: AK7set/NLIOTg6o36oQto++fvyXfjMMmrz/WAktHFWcJd1CpavWF+Ld/7hpo/VPy0VYbXkzossulPA==
X-Received: by 2002:a05:6a00:4e:b0:626:2199:7bca with SMTP id i14-20020a056a00004e00b0062621997bcamr624238pfk.31.1679359135524;
        Mon, 20 Mar 2023 17:38:55 -0700 (PDT)
Received: from localhost (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id c27-20020a634e1b000000b0050be57d7ec0sm6558964pgb.67.2023.03.20.17.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 17:38:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Mar 2023 10:38:49 +1000
Message-Id: <CRBN4LSJ14G2.6N0CI165ZTJN@bobo>
Subject: Re: [kvm-unit-tests v2 09/10] powerpc: Support powernv machine with
 QEMU TCG
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-10-npiggin@gmail.com>
 <62fc117d-45a2-9aea-1a2f-973181395430@kaod.org>
In-Reply-To: <62fc117d-45a2-9aea-1a2f-973181395430@kaod.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Mar 20, 2023 at 7:47 PM AEST, C=C3=A9dric Le Goater wrote:
> Hello Nick,
>
> On 3/20/23 08:03, Nicholas Piggin wrote:
> > This is a basic first pass at powernv support using OPAL (skiboot)
> > firmware.
> >=20
> > The ACCEL is a bit clunky, now defaulting to tcg for powernv machine.
> > It also does not yet run in the run_tests.sh batch process, more work
> > is needed to exclude certain tests (e.g., rtas) and adjust parameters
> > (e.g., increase memory size) to allow powernv to work. For now it
> > can run single test cases.
>
> Why do you need to load OPAL ? for the shutdown ? because the UART ops
> could be done directly using MMIOs on the LPC IO space.

Don't really need it but I thought it would be easier to begin with, and
then I thought actually it's nice to have this kind of test harness for
skiboot as well. So I would hope to keep the skiboot bios option even if
a no-bios version was done.

[...]

> >   void io_init(void)
> >   {
> > -	rtas_init();
> > +	if (machine_is_powernv())
> > +		opal_init();
> > +	else
> > +		rtas_init();
> >   }

[...]

> > @@ -195,6 +197,8 @@ void setup(const void *fdt)
> >   		freemem +=3D initrd_size;
> >   	}
> >  =20
> > +	opal_init();
> > +
>
> This opal_init() call seems redundant with io_init().

Oh you're right good catch, that might be an old piece before I cleaned
it up. I'll have to fix that and re-test it.

Thanks,
Nick
