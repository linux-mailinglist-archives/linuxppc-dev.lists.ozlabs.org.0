Return-Path: <linuxppc-dev+bounces-1667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3224498888B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 17:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFZhR4zg2z3cKQ;
	Sat, 28 Sep 2024 01:51:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727452295;
	cv=none; b=OdJ3NHLwbxYFBSELUTJyhthUJ92GMiVaDMCYsjDiWn0zAD+gQRV9ZE3MthEekr/T3nByH7c8OWQvQoXGLrilQsl5A1lo6n8ehTYz1s/7A/3Pj7kQ4zrzqlg4FGO0W8NbWEKvEkRFbas9ExiWPO7dtVFstN1LuWjB0y2LO8ex78ZRwHn2eQtMHdj5QJMSYb1ULX6fLCL6YouVDM4HZbmJnhO4KXfHgsDIfkjkgYCeQJdpjVs3A8lBbV9eyRgpTWfBOX18/GKmK82Z/9npDm995Y//n2CK2eDN3MDU/iv0XzlG0BnFk5g2/NYQsDRFhFD+2n35pLrgZady/3P9/4ldbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727452295; c=relaxed/relaxed;
	bh=siq7XCFpoWz1j+ij/CuNUWO3s9GtQAEeoPcY53GflA8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=GSdGQw3oyTqc9DrACracMo+ROQb67xKlnjBHxZ8e0DwuAJC8U1cOg8tC0V2WzAp+dkIl1sWH2x8dmXYk7/5/7PZjEVFuDCiVje8ELR7j2DlS+7IuRKXUV7DUO8A4Zb1YZDW14lda83+0bc4tdh518Pj2HJ+CZl+IZC3wkFDpnhf88+mieXZZXMVgnhJiSWOnbFr5+Om7JMuxmu1OKAOp6vaBZUrTxUoyZZWC8mQvtfvKMGGnUm5iXaRXCNoDcIk7RxGW3sEqxQtkWotoqLgimL5MpEnJJne6RFFIfDXdEHOxy1kN8CYEzf4Zoe70a1/qN1B77fLRTiK/hJUsIPfa9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QospUAoH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QospUAoH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFZhR0P3rz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 01:51:34 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20b483f2c4aso5381595ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727452290; x=1728057090; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=siq7XCFpoWz1j+ij/CuNUWO3s9GtQAEeoPcY53GflA8=;
        b=QospUAoHvmLUrJvhvEIP7pMt33Nd128ltYeKGQIhpbpH4NeUujNcfGpwlJAa9MRzq5
         4hYrvgrTvtlmyi3GPwzZAUBWvsOmYt+PgRoL6m5tAd3Iflmh7YrN0MPUDwqdYvMses3F
         H4wHxsBAM7BOT0I30RSRfCEfu4MYc4sUsD0gdK57MHQqnub4JMLuAzwe0puVP2zyEPI7
         cLy11OheZJJTYe4koHql7mi66mYoH4uQqsIeJ89whHLe1unPnpy3GBoiCt63QO/7L7YP
         88V8Nn0MjjJJsXHueJtuosKuGLQymrqjJ4WbZSBgLGEgx6qR1rrSrodRQyJGOlfTEQYv
         v/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727452290; x=1728057090;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=siq7XCFpoWz1j+ij/CuNUWO3s9GtQAEeoPcY53GflA8=;
        b=FWeWNfbQ71Q06cS3ZZ6W1FiE6iey/JOMlkZTuVeuOYJJBrh88PtyjmkOtDwmPc7opc
         Wo4cdgcpl+wGflxYhaq3Z5wckAPrDuRMTnDEgBPn/6zvDF3xCsXRpQpl8HM1FrcmBy17
         9xvrnxSmoPXVlfhqlBGw/cZgy1UGlIbOinNxCsu+6WWu3WFv0XqgX5W/uutEx/CNYEyG
         quZj94VWVJu3FWDn2XM7O5/eudz6akaetZ8IJoD+/18+spTsHdNY71pE5ZhqqQ2zHj3i
         1iWoUPcFHJMnF7/DlXnAGRBC04qXF82rEf82UhAWo3fOYVoNe+ECrlzdWUDZ7ytQhED6
         rZXg==
X-Forwarded-Encrypted: i=1; AJvYcCXyRKjAgFp6c7wEgBraAe2P2+dzUtoQmg+3KNv5mMY31O+li7DrOFZufqxo64gTm7mtSCesso445VPLhMo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwniBwLGSbCsSMEXYPgaABo+VrozQVpSR7FQZa70ZDURp4UpYB4
	gXm58RVyPo2ODffJioKywnL490TLDOZwKI5p99k4lEDsRBbfZ3i5
X-Google-Smtp-Source: AGHT+IHYen+9SCB9zAwc+2YM+I/YJeUCIgN9O5oINntyeB1ech4upS2dfT1q+IPsJIFbM8mIsRWLFg==
X-Received: by 2002:a17:903:11cd:b0:206:96ae:dc57 with SMTP id d9443c01a7336-20b37b912b5mr62267395ad.48.1727452290237;
        Fri, 27 Sep 2024 08:51:30 -0700 (PDT)
Received: from dw-tp ([171.76.86.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37da2667sm15170095ad.102.2024.09.27.08.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:51:29 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, shuah@kernel.org
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: Re: [PATCH] selftests/powerpc: Rm the unnecessary remove function.
In-Reply-To: <20240927043125.8199-1-zhangjiao2@cmss.chinamobile.com>
Date: Fri, 27 Sep 2024 21:15:41 +0530
Message-ID: <87h6a1aymy.fsf@gmail.com>
References: <20240927043125.8199-1-zhangjiao2@cmss.chinamobile.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

zhangjiao2 <zhangjiao2@cmss.chinamobile.com> writes:

> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
>
> Path is not initialized before use,
> remove the unnecessary remove function.
>
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
>  tools/testing/selftests/powerpc/mm/tlbie_test.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
> index 48344a74b212..fd1456d16a7d 100644
> --- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
> +++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
> @@ -314,7 +314,6 @@ static inline void end_verification_log(unsigned int tid, unsigned nr_anamolies)
>  	fclose(f);
>  
>  	if (nr_anamolies == 0) {
> -		remove(path);
>  		return;
>  	}

Nice catch. Indeed the path is uninitialized here. 

However, I believe the above "if" block should come after initializing
the path. The idea is if there were no anamolies noted, then we can
simply remove the log file and return.

Something like below. Thoughts?

diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
index 48344a74b212..35f0098399cc 100644
--- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -313,16 +313,16 @@ static inline void end_verification_log(unsigned int tid, unsigned nr_anamolies)

        fclose(f);

-       if (nr_anamolies == 0) {
-               remove(path);
-               return;
-       }
-
        sprintf(logfile, logfilename, tid);
        strcpy(path, logdir);
        strcat(path, separator);
        strcat(path, logfile);

+       if (nr_anamolies == 0) {
+               remove(path);
+               return;
+       }
+
        printf("Thread %02d chunk has %d corrupted words. For details check %s\n",
                tid, nr_anamolies, path);
 }


-ritesh

