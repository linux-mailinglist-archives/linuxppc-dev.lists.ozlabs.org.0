Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC0534A0C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:08:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F693y264Kz3c07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:08:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=pbtMnjCG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=pbtMnjCG; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F693Y23msz30GW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 16:08:22 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so5038324pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=t3Vz1DNN/DHoh2CZjLnX3X8cFqPZaAphuGqCqL7Zx98=;
 b=pbtMnjCGhkDhR19+oZWLz5/B02OypboZhdFMbOtPIvS2pw1zrbYUtCFvW9LzCWdzhp
 8/8d57T9EUokUZg+6ovNrDuE2Nos+ejaNl7Wlrfl21p8P53D73Sg070st5DKmsO3TLCM
 3Lo+/LzpBcFlQyoBRACTOReOfWpl3UBw65Juk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=t3Vz1DNN/DHoh2CZjLnX3X8cFqPZaAphuGqCqL7Zx98=;
 b=Xu6CCvKMlFd2ibs+rydEqMGelWqpE6jnx0yTs7tXVeajSnjET6sU6qo4eqe1l0LcO5
 pqVUQMeJAqmHB0bw6BBJbaSKSRvEQk5fHWu9WwKF4XxhaOlvXpSYp6sAU/BRIU9Jps7+
 NXcSwA22a4m1jvOb4FPLLQyGfboUlrAFqnerW8sTWfVjtV53Q3VWSKfs/6IZDzT53uTR
 JNRlU18SaMviZiHl06zEOQu8IHxUnFmlCx9PVtxTqq2s99q4YY9rWc7XCp+R/+dHh60D
 FzFGVfqeO/a0GsVqRU4FYkuAfBh1IMrt3O92oxopLPunCd7SfLUUZqO4fr90C9y2eYGP
 NTUg==
X-Gm-Message-State: AOAM53115mCfSJ4ppvZyUb33761vCuG8Cpvc45h9n9ENolextz1IN2r+
 EptE6mQD5qTwd/UfGrMWgMqvvA==
X-Google-Smtp-Source: ABdhPJxGiUoXiax+af4oqEeYZNTpxf07cPtfl19WQJmQl1KpMADWoL8+VMJyUt6eQD50p0f3OotOYw==
X-Received: by 2002:a17:902:106:b029:e7:32bb:fd6a with SMTP id
 6-20020a1709020106b02900e732bbfd6amr1044243plb.2.1616735298091; 
 Thu, 25 Mar 2021 22:08:18 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id h15sm7697503pfo.20.2021.03.25.22.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 22:08:17 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: YueHaibing <yuehaibing@huawei.com>, ruscur@russell.cc, oohall@gmail.com,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH -next] powerpc/eeh: Remove unused inline function
 eeh_dev_phb_init_dynamic()
In-Reply-To: <20210324140714.19612-1-yuehaibing@huawei.com>
References: <20210324140714.19612-1-yuehaibing@huawei.com>
Date: Fri, 26 Mar 2021 16:08:14 +1100
Message-ID: <874kgy8ptt.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> commit 475028efc708 ("powerpc/eeh: Remove eeh_dev_phb_init_dynamic()")
> left behind this, so can remove it.

I had a look: the inline that you are removing here is for the
!CONFIG_EEH case, which explains why it was missed the first time.

This looks like a good change. Out of interest, what tool are you using
to find these unused inlines? If there are many more, it might make
sense to combine future patches removing them into a single patch, but
I'm not sure.

checkpatch likes this patch, so that's also good :)

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
