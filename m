Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC325773DA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 05:48:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Llrfd6PR0z3c6q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 13:48:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UCc3ZvO4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UCc3ZvO4;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Llrdy3G9Pz2xn6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:47:49 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id q5-20020a17090a304500b001efcc885cc4so9635300pjl.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 20:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to;
        bh=oIB1xNd0eYKHYB+50cyg+iyK7zRMtb+J8nWtfwcjgb4=;
        b=UCc3ZvO4plTnwa9ztalWuq7GFcAlrp0py6UjFuXcUM/hceeMhti/DTkIiIFnbv3yod
         OxcFvRdyro/cJ7YHKF6+Q01xLNmcBHjYCVcAeNtk0zi4iS0ZXW2Qxo5wbQTag5lrYpw6
         z8Eka6tsMEJF8g5UQ5CmhG52aGSCu393OB1RlfLs1tjXvo38FBvHPo66IYmxNn2sLRE8
         geriE0FhQeJdFLCJ6q45xxlFifQADFfBap8yjLsTBXA7LRQ0E6p67dnEW5MF2BU51S0O
         J6oWAKELmLEyluPet7DChvCRskNlmEJWokHLxb0KbwZPqIkLZ/BFGg4qNt6xRlDKeygc
         XNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to;
        bh=oIB1xNd0eYKHYB+50cyg+iyK7zRMtb+J8nWtfwcjgb4=;
        b=ML8g3pv7CEwE7Yxu76ZhpCXHclikIcZJDrbO8w6TcKbxVA9aAxcrDifp56oFq7gZ9B
         XC7V3z2bFpcw625e/xKiRV09fBinztH6Xh/bAbivhZU9lMk9AzWd6xGAHry7HgHTcc7x
         l1dKNSbbXTbmrctv6KM7DDfCyxSKA+lzFuu+jLRdB81ZO95YD1Qj9sia16L8sewYKuje
         vp4HPOd9u+3WnWjm9csEN6noXnvMbQoNH/fc7wwpb27XKu9tGqVPk1GLvC2Dr3S8S7UQ
         9EOwx3YTnSpUFR6clvcbGpFpQiue+HLgZlHhjOZgk5wlNNLogPGocLbVxQ1L5j7nSOKK
         G6HA==
X-Gm-Message-State: AJIora8FwD3UUIkLiAIxGK/BwGltusFaoGg8CtTvkyuNDyLtD5Vh0i5e
	dIOfQF1VVgd98mld/U6ef/8=
X-Google-Smtp-Source: AGRyM1toVRtVZ4bv3A0axkqPKTBaX3/E4Cqd/Kbh3mbK4y95vLAHKrow9jWfQ4RGghxar5xZkxVOag==
X-Received: by 2002:a17:90b:388e:b0:1f0:3d7f:e620 with SMTP id mu14-20020a17090b388e00b001f03d7fe620mr25504494pjb.31.1658029666271;
        Sat, 16 Jul 2022 20:47:46 -0700 (PDT)
Received: from [192.168.43.80] (subs09a-223-255-225-66.three.co.id. [223.255.225.66])
        by smtp.gmail.com with ESMTPSA id a28-20020aa795bc000000b00528c8ed356dsm6761742pfk.96.2022.07.16.20.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Jul 2022 20:47:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------d1lNgC9An0QaQ8fFX48m5OZX"
Message-ID: <0a5968c6-54cf-8054-adac-9485962ab15c@gmail.com>
Date: Sun, 17 Jul 2022 10:47:41 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: next-20220715 build fail due to 579b9239c1f386 (powerpc,
 ps3_defconfig, GCC 12.1.0)
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <YtOBoh6MEtJmJ+g5@debian.me>
In-Reply-To: <YtOBoh6MEtJmJ+g5@debian.me>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------d1lNgC9An0QaQ8fFX48m5OZX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/22 10:27, Bagas Sanjaya wrote:
> Hi everyone,
> 
> I built next-20220715 tree, using powerpc64-unknown-linux-gnu-gcc
> (GCC 12.1.0) and ps3_defconfig. The build errored on W=1 build
> (-Werror=missing-prototypes):
> 
>   CC      arch/powerpc/mm/book3s64/pgtable.o
>   CC      arch/powerpc/kernel/process.o
> arch/powerpc/mm/book3s64/pgtable.c:478:5: error: no previous prototype for 'pmd_move_must_withdraw' [-Werror=missing-prototypes]
>   478 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 

Oops, I forget to attach the full build log.

-- 
An old man doll... just what I always wanted! - Clara
--------------d1lNgC9An0QaQ8fFX48m5OZX
Content-Type: application/gzip; name="powerpc.log.gz"
Content-Disposition: attachment; filename="powerpc.log.gz"
Content-Transfer-Encoding: base64

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
/9OqCemfpOqD/wFVRGjJxRwAAA==

--------------d1lNgC9An0QaQ8fFX48m5OZX--
