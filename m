Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A3A639FF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 04:08:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL9Qv3j3bz3cMP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 14:08:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a5QcPpyA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a5QcPpyA;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL9Pz71Pkz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 14:07:49 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 82so1304576pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 19:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Blx4MlPNPegLHnPnA7gc3koH6rK2jAq1aTbh4+gJM0E=;
        b=a5QcPpyAdP4Wnokix8nCNnQ+hcsQcHfZmUMQOp2UZXua595zctsJJetZjlOwYz6moA
         mPIwZ3DGTdCetQaiIPpEBYVFaISGk7p4dGS6PyFdUnSJUkNKcWarfW/Q2t8WXaS60kq6
         /RRZ5lisg0hNzqNLvA46b235y7ESL2uyhKmR0nYHp+6qWT4LeE0UfEHS0Z1EI2j0jwaq
         KD7yZOLxApsmYc8rFe0g5SiYBvt9+Vpx0qXMkKQFgggv9/GjcwQv62ej3X8aZGNmOUR+
         Tn0jiSnBv9UdF0Yx3z3g35XCHHnVQoNJV/vcdQCsaWwWuYxsMtSOgIu4g2Zofc70xv+J
         PVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Blx4MlPNPegLHnPnA7gc3koH6rK2jAq1aTbh4+gJM0E=;
        b=bWqD/OZOhrlyXp6rQzZLtssx1k7kUGXvVWOuandtLx9AVboIYSMkTmOeg3TZ1xKssq
         KHJHjHcO0NCYI/1OYwxrEeeDRh2klEh50CZOs1de04+Lh24XU+3DqaA1J3XYseZXFhaD
         Km35D9I/E8lBso2MYmE8bNzDJAY8E9pTV3BRvIxZhwI3s/qvW141F9VWTlo3oB2rXyNc
         tQ09nVyJfIMR4q0O3WozpLlLRqsPWMVpBF4XRVDKYKW44F42jnwtaineIwSCb+VjPmwf
         Kfue1WZFkbogesVbmHfAofoeUY0te5Tb66+7wlXlKmUvXoKIyFVNUPunxbhpy2Z9gNM6
         Ubgg==
X-Gm-Message-State: ANoB5pk5gkNQ9vkuKiF4VF1U0xs+OrxWT1UB13JOlzWhbidBAB5JrjeP
	iGXr7WdERvEVUNfDtez0zUw=
X-Google-Smtp-Source: AA0mqf73o4KtjZbDowgNal58f0WFDUlXe2YzdYV76kMCtN6lLEp8DVLF7nTbU10vGnXUCMvLB/tzCA==
X-Received: by 2002:a65:6c0d:0:b0:470:7886:e200 with SMTP id y13-20020a656c0d000000b004707886e200mr32318156pgu.111.1669604866904;
        Sun, 27 Nov 2022 19:07:46 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ecc900b001886ff82680sm7537024plh.127.2022.11.27.19.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 19:07:46 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 13:07:41 +1000
Message-Id: <CONLJ0VXR77H.JM4D75GQAF62@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 13/13] powerpc/rtas: place tracepoints in
 do_enter_rtas()
X-Mailer: aerc 0.13.0
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-14-nathanl@linux.ibm.com>
In-Reply-To: <20221118150751.469393-14-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
> Call the just-added rtas tracepoints in do_enter_rtas(), taking care
> to avoid function name lookups in the CPU offline path.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 198366d641d0..3487b42cfbf7 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -38,6 +38,7 @@
>  #include <asm/page.h>
>  #include <asm/rtas.h>
>  #include <asm/time.h>
> +#include <asm/trace.h>
>  #include <asm/udbg.h>
> =20
>  enum rtas_function_flags {
> @@ -525,6 +526,7 @@ void enter_rtas(unsigned long);
>  static void do_enter_rtas(struct rtas_args *args)
>  {
>  	unsigned long msr;
> +	const char *name =3D NULL;
> =20
>  	/*
>  	 * Make sure MSR[RI] is currently enabled as it will be forced later
> @@ -537,9 +539,30 @@ static void do_enter_rtas(struct rtas_args *args)
> =20
>  	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
> =20
> +	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
> +		/*
> +		 * rtas_token_to_function() uses xarray which uses RCU,
> +		 * but this code can run in the CPU offline path
> +		 * (e.g. stop-self), after it's become invalid to call
> +		 * RCU APIs.
> +		 */

We can call this in real-mode via pseries_machine_check_realmode
-> fwnmi_release_errinfo, so tracing should be disabled for that
case too... Does this_cpu_set_ftrace_enabled(0) in the early
machine check handler cover that sufficiently?

Thanks,
Nick
