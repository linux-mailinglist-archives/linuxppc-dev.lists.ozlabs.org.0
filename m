Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2FF6FBCDA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:05:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhMY4789z3fXP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:05:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ook9ibxi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ook9ibxi;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhLd5MXXz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:04:57 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-643a1fed360so2689157b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683597895; x=1686189895;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et7WK1zNMiUUy9M4cv6mBb+YfeaWWBrVlKT+cbPYGR8=;
        b=Ook9ibxiRFK9fRAoDwERlBpbnNE4nC/zhnlQ5EkZPKOO8OWX3U2n/JqKRvDMPbKzXO
         qKa32fOrTXO07CiRafCrQaIFNQxktJxjNfnF57xi/iRV3RQhxyj1DCaRV7LXQRnRk6He
         qrLHwwqLlC0G9L/Dto6AZAbAqKRTcni/P/NvYiqTR4y9+ExJDwRm8LaBpcYleIV4XG86
         sXYdwNcvaNJgywnnHhCpqN7psb+ylyEm3fo2YW+nORn+gyBmNtSCj1cZlLLXoScNL1p9
         qlVo/wM3RL3VzId4FypAq3tUUwUKbXflIAxHnAqY6n537XBFfG1mdk11OnSHZI2gXtvP
         a96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683597895; x=1686189895;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Et7WK1zNMiUUy9M4cv6mBb+YfeaWWBrVlKT+cbPYGR8=;
        b=T4t7VHLO5tHWky9UV4f5+PpEGDBTBIwBcqxK42h/8EnhJlaNGuhFkCdJVk2WahEw5D
         s2nZtVKKsR5HR86t466At7YxDoJEskozV1XsynAbceZGir1wdJDfe4OWte+/r8aoDESr
         v4IJysKVxnwoz10nDPWc0ILO9LvoB+fRC7xHTonOBtoL0nl374xMCycMidSiTM3PpJOC
         +6if34epcjVbe5kJGd6d0aaPUN8kmoMUVmgdplm9xlYxybf2WtCFoEONHeCng4myUPTg
         fy8I9Z+JMbmYJvjhVOfuK3rG1P0GInGiI2uBIjv87pSmev2YouxCwH7k3guzVU/EuoB7
         VZjg==
X-Gm-Message-State: AC+VfDw+nmrPbpLEFIqjkEQJYRyb+yPuOVf/jis4M3/63bIjP5ijGzzg
	mbvXvbtYdbVaHqvkDbupkrw=
X-Google-Smtp-Source: ACHHUZ56wfJQp8l4ikG+OD6XnlnSsMy37uOlOe1elBeAWOAnEQy2dyUztIEDaj4ACKVm0k81DfuYvw==
X-Received: by 2002:a05:6a20:2451:b0:f0:3917:5b19 with SMTP id t17-20020a056a20245100b000f039175b19mr15955946pzc.40.1683597895462;
        Mon, 08 May 2023 19:04:55 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id f8-20020a631008000000b004fab4455748sm145361pgl.75.2023.05.08.19.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:04:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:04:42 +1000
Message-Id: <CSHDN1VV09RD.2UWTR4MET4V2S@wheely>
Subject: Re: [PATCH 03/12] powerpc: qspinlock: Enforce qnode writes prior to
 publishing to queue
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-4-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-4-rmclure@linux.ibm.com>
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
> Use a compiler barrier to enforce that all fields of a new struct qnode
> be written to (especially the lock value) before publishing the qnode to
> the waitqueue.

publish_tail_cpu is the release barrier for this and includes the memory
clobber there. Can we annotate that instead?

Thanks,
Nick

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/lib/qspinlock.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 579290d55abf..d548001a86be 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -567,6 +567,10 @@ static __always_inline void queued_spin_lock_mcs_que=
ue(struct qspinlock *lock, b
>  	node->cpu =3D smp_processor_id();
>  	node->yield_cpu =3D -1;
>  	node->locked =3D 1;
> +	/*
> +	 * Assign all attributes of a node before it can be published.
> +	 */
> +	barrier();
> =20
>  	tail =3D encode_tail_cpu(node->cpu);
> =20
> --=20
> 2.37.2

