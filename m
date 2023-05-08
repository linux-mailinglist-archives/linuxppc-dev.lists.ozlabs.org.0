Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C47E6FB155
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 15:21:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFMP62f1Sz3fKF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:20:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NYtl9s3L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NYtl9s3L;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFMNF31yQz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 23:20:12 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6438d95f447so3015904b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683552009; x=1686144009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5gcBvfYJlzZmMkTxk2h2j2g6ckvX/k2lViWHLDwGtw=;
        b=NYtl9s3Ld1fQJDR+VrYeqdM2/sUlMS9Qek93q4zCpHDFzmXlDZze41R4MCnunwL0PD
         GPXbuIHTdgT7BctFzxcrzNgO+vZO4LFiHDK58LsQRltboAbY7mkFUR+cW2CK4izooreA
         +NTGlQHkbKM+BZ+n6oGfXfP0pPyOptBZfSlmzwMw3HC/z5ikPR86P3vOOpd7jlz5dE8d
         14W7o8PhsGZBW38rYX0mIY936DgDGu56c53RFsgUY08zIg+QD3f7TmTzfRJ7k5NjOBgh
         DSDf460W23FXIY0vTOAphRDaCTyS2Lam9N/SmNll7nZG6J+cWYLZRh1uPA/BqDhrSMoa
         2Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683552009; x=1686144009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5gcBvfYJlzZmMkTxk2h2j2g6ckvX/k2lViWHLDwGtw=;
        b=W/Q3FYgMzOEwLJSSJWIllJ+BBIL6eFLXcc8A0kdFtM0ZVvbDc+iAsPCervfFFhNfp4
         xlNOW82KJzqNYECx4mOnFGvjJCv7xc2f1Dr0HLihgNsZuZbiPeQL/IAv8Uh6R0leY+Pv
         KXhtHiinR9+86rFA7tMAYHYIB/mHGuTG2ocjJKdzTI7hakvTYZd3quPKXgxIRGBL1rW1
         4nmquftvBq7pIZyBt/IxhVU+c6Ce2LpoiEOwmsAWioHX++9VpH7Pf6swqlQOt3A65sbJ
         i2ZdRR1Q0U/ERksGPvd1x80IV0sXRG6N+kGo6AKdcZFFOnSw0L8HNvHtXPiwkuuzJwqH
         Pipg==
X-Gm-Message-State: AC+VfDz9WIzVc1+KFWw8R5eLpWUhaVKBVP+AnWV5Zg9TEoH+9y77JVMZ
	Gm/p1dBXO+lUUpKUS0DVhZua7CdqM0Q=
X-Google-Smtp-Source: ACHHUZ58r+AP9tUQfy2pmFlw+UCdJJdya/1z0EdBVs+Edz0Om2vXLSJ+k7kmdVXeKyHFrkKKkx6xKg==
X-Received: by 2002:a05:6a00:1a46:b0:641:d9b:a444 with SMTP id h6-20020a056a001a4600b006410d9ba444mr12336588pfv.31.1683552009437;
        Mon, 08 May 2023 06:20:09 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-47.three.co.id. [116.206.28.47])
        by smtp.gmail.com with ESMTPSA id c1-20020aa781c1000000b0062e0010c6c1sm6052062pfn.164.2023.05.08.06.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:20:08 -0700 (PDT)
Message-ID: <85ca82b1-8a53-c0d7-e1b6-93288a6e129c@gmail.com>
Date: Mon, 8 May 2023 20:20:03 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
 <ZFjx31Rw79GF+E7p@debian.me>
 <fa6de026-1444-7beb-197c-d6a637eef86e@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <fa6de026-1444-7beb-197c-d6a637eef86e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/8/23 20:17, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Why and how can you conclude that the culprit is e4ab08be5b4902 ("powerpc/isa-bridge:
>> Remove open coded "ranges" parsing") rather than powerpc PR merge commit
>> 70cc1b5307e8ee ("Merge tag 'powerpc-6.4-1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux")? 
> 
> I looked at the thread and noticed it was mentioned later (
> https://lore.kernel.org/all/3fa42c8c-09bd-d0f0-401b-315b484f4bb0@xenosoft.de/
> ).
> 

Oops, I wasn't seeing the whole thread. Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

