Return-Path: <linuxppc-dev+bounces-10500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141EB17E01
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 10:06:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btdnf4r99z2ymc;
	Fri,  1 Aug 2025 18:06:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754035590;
	cv=none; b=d5wIZCF9TpB73vCegIdwRTKNdzIAmg0HnszVJUdF1U55B4/OOYLSLyBGNJRdjrC1hQL0gYSLpXjJClH/iEkcDXKOlACedBtLdgowLhD+Fe+KgNJX2VGW6C+bSw6P0gBZJqPk2lDmmJPFu/uZkr3YvDUrMTZHZ037GC/EvkGNrhKmUHJqLT1SPZY6wxlhLFgMP8G4cE0IusxGMvf2LFzP3/+ex8R2u3BgPuM2W+UR7k9BKaLsmSEtPeMPdgSK63tHPWvbIos9Gj9GO55x+sRFW6OhAhbldtZDDc/x9y4GdusA1BxUqy6xmB4TXk3JrxP+apaZHFZzq8NdnHjsM+Y8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754035590; c=relaxed/relaxed;
	bh=HC5FdN+p83TIgj3QdaEXrFkwg6zsrhmSO1nWzeQxiOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGLSwPiGP2GWbck27giKsRPB7ar1iGJh1dkFYJNwn/J4b7/p30PeMrW39DcMRNzCrfhmgfo6NueR1AMlaesXk8HHHNduJ3mb728zhlOwfmoZIbI7To28Lu589wbj+D5WqXpI1E75KUY9UeoN52KkB1Wutig4xiAYaYvU8kmaUi/CAmpbXiu5nXHXWC/KkyVRjiLjBXCoBtAmM+DP6b76kHNamhoOVn1XMz6aOtxdauAK3wZqACKwAAoOpVmPi2tVQRaxRVlgFy2nSJQ4qb77efJQjCiq/JXTrw4CEhlKHKKqfKamofAIC6MBGOZXuJTk0b1IVR0glSt9lyGdU/4A8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E8qniWa6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E8qniWa6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btdnd036vz2yfL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 18:06:27 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4561ca74829so6261765e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Aug 2025 01:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754035583; x=1754640383; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HC5FdN+p83TIgj3QdaEXrFkwg6zsrhmSO1nWzeQxiOM=;
        b=E8qniWa6Kq65x9tIc0IWLssE8/Dc8ukhGVlbJ1Wz6X8EZszISRaqnNDk3sWazVromZ
         zs/uf+IobCcH65UCmi45WtP92FI2oSKz2xqDmUAGSjhkcBXQc/NWqChdXpmwwwWpcXub
         STbGwl45OUcKgnIqRQj+RncK4UyFHzk+UxchqVLM6aEdf+MwT0gqJk9em1aBUWB7Jbym
         oRjJMzy78CCLEnz4gvTgcJFSSrVMwB6TsZQjDbvmhtXHdQe0U9GBiY0KJI22vzIAmgIT
         spDJVUg/8TecWVhRAqi3TLTryKdvgEGZfr3hJS32dJ/gieDs9vzmGA64af7DfbYf5aZe
         x66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754035583; x=1754640383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC5FdN+p83TIgj3QdaEXrFkwg6zsrhmSO1nWzeQxiOM=;
        b=Jt9J8zIyhEkcJrYBUj6+RnIDwqW3OqxObKZchpkRt07Z7WEJw3xF810iSZYkxqFz9Q
         htORbmR7azfOQTWba/H+e+sWZ2kSqJXKyme6WCJ7hyXJA0PaL+1qFwS2JWFl2h1XWtmd
         fq/KD7SZwQLH6u58tjUkpN6q7s7iF8ZXOWRGbgECOSqzueyh2YeNnOPo3wbHWjzInBJt
         FHE8i3bHE4SvqNzjVk8b0AmP/YugIa6QdBxZTGNS66xCU+HVVdD5jbPCOMTNmlajVc1w
         2NcpMWMUl/sQppQfFmKclz4F59F5mpWXfgkFQdAJnzaxzCWk1D3/Kf1QFrGfc7knGmTJ
         VJtg==
X-Forwarded-Encrypted: i=1; AJvYcCV2DubpQKxsVKcYHWjuaKrxiMdSwsUJZu4yEW8ez2f95x3IHW0/giJXpa2rzvLc+Kp8CEYFyyrohC44dhE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzkv3/B4qAMVM+drwDMJGGSjmMs7NdiC0+iHx92RguuZYF7EJ2+
	v4hlTlKWxIb0Ulb4dUS8IPFzEs3dKLya38VBBmVmfDIimsXSRZleH2loWr3hONhBf3o=
X-Gm-Gg: ASbGnctZJ0QhpcdflhUHkc6XxvtUnzHGKUjwO+K/kmRPLRNj97m51jeF33CbLaRoGNW
	zwTayOfy4Nc7afLx1oPeuNQq8MvL2jO+xRvD5DtXZT83eGXwhlfu/Xw8VcFE3wZ3eyijFNlvuua
	bPSvXWHWtIbdTdvW/BUlPdWfNZkhWTWj/JJuP7lyZUCOGZWPiXhXpXMEMMOXn45TScOCivhi11q
	D4TpGZ2YsM6YIYL+4LhAKpPRbUE+q56iI85rgS97E+HTzlZ7JSlhXGL+7c0tQUzsmxjOiAPXs0/
	9CrEKae8jJhNJFvrJ9qpcZomVTffmVJ0zijX9WPUqYMD35FwGGZCKgq3ZBHBIj1K2BOnLrnRRUg
	WGlpl6SFIR6FG8hgtHNpLszsuiUo=
X-Google-Smtp-Source: AGHT+IFZ5j/ri1LSVCrIKHdpKUGNZ4kJZd0EPzHedTGKYZyuiPBOa23Fu0ExGYYHmBSKu3o8jHljdw==
X-Received: by 2002:a05:600c:4f09:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-458b0216ba7mr6486295e9.0.1754035582631;
        Fri, 01 Aug 2025 01:06:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589f0803e9sm56881375e9.0.2025.08.01.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:06:22 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:06:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruben Wauters <rubenru09@aol.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] powerpc/xmon: replace sizeof calculations with
 ARRAY_SIZE macro
Message-ID: <bea4e3d0-78ac-4c96-8d5a-96bef8037839@suswa.mountain>
References: <20250719225225.2132-2-rubenru09.ref@aol.com>
 <20250719225225.2132-2-rubenru09@aol.com>
 <62aa5231-ed31-43e2-84b7-d6b6ec86e78d@csgroup.eu>
 <8381a142d72f3cd0e92de4dac6acfc0241a87365.camel@aol.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8381a142d72f3cd0e92de4dac6acfc0241a87365.camel@aol.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Can't hurt to try at least.

If they don't merge it, then for code where we're not upstream, it's
pretty common to just endure style issues.  I'm thinking of ACPI here.

regards,
dan carpenter


