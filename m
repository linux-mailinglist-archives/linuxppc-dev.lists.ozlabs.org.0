Return-Path: <linuxppc-dev+bounces-2376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D369A4337
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 18:07:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVV2f742qz3bpp;
	Sat, 19 Oct 2024 03:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729267626;
	cv=none; b=FehLPedS4Ztu91UBIT02FiwTU9KDVI2aVYoJ745c9aqB5SFtkkkxd7Wg1ClQRJ+NAV5X+ntiWfotHC39TTb6d3RBZX2JYKXML98AvpDjSuL6weu13Ix1jMhnU1ZbfFhXeYzlmtmArSbZ95VHyhoJxdvB0sgcrpl8RPGtVrVS8vT/36WaRCZI0kZ+9k6uB+W2HIMuujMLHPA20Hut6//OCPX2CLSyMZweLw8YpHP/UOIBLXSWvEZ2ncvR988YZFjPwrCSCDYqrlHun+RfIymfX/RCBxDEx8L/DN4Aciml1XDz1S60qaKJzLaflWP19Cn/bApWdn4g2fwvHzBLkJ6b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729267626; c=relaxed/relaxed;
	bh=2oxb/SAQUrEM+BNO0w0IMGwQpA+53ixNq+VSmsiWddk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=CmNqr18dVHgscWl/b7AwJjkH6mwgXiI+6Opja2THyqoydP+f/xygWgQ+MvA6cVT3zxhDJnEVthPG/7DFk104m9lBb1vA/c/M+NE0pIysbWctUyrFhqMp0HJ0e+e7yAs8nst6wyGZGj2CrTo5wGoPjEeUgjxn1+VKEwX9iYDIrn/yd499r48FUQZVOK1Ls8/A3sRYE8HDskehVuv+cEBxkiJ//Dqr7gXTD4NV8xOxwAzNDK65IL0bg5FKzRY+VuGK26E/Xcegb28gjG/Z1yo6t7PwIQKui3HNHPQDyJ1MfWBS5OC5bTNdNF87ZO6uQ0RYynrl36aEU7u2BwhD0iTS9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bz7vFkmw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bz7vFkmw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVV2c6yhGz2ywq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 03:07:02 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20cf6eea3c0so18755505ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729267618; x=1729872418; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2oxb/SAQUrEM+BNO0w0IMGwQpA+53ixNq+VSmsiWddk=;
        b=bz7vFkmw8gD45MNsNjKMXK/Ji+sYD0nTUkNKa17MYlFePc2mMXl7UCRjZI/5R+rP4y
         9v7e+FHovFnSGXqv7KrVgUjzXA/Nms1U+cx/05Mvegxr9SJpFpUnkrEgr9nYp2kuJiKl
         y/lSBKbuCCpcroYVRwOwP1RSK9JOPwtBxjkUBGfakn/RKBAM3jUi1q0+e7bw5XvXk18R
         sb93WnobmwK/SuvW0N4R3PZuHelGJP0j6r5nrMwn1zPG3mQu8Cc1W/QhIapn+Do+uwHN
         GL+u7D3A3Ag3AckJspJkmCeT1C7lXo4c7CPvIR8BGCf0aFuYyCaRvn+hCdMoruWawM4d
         0BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267618; x=1729872418;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oxb/SAQUrEM+BNO0w0IMGwQpA+53ixNq+VSmsiWddk=;
        b=K9NV68f538t+Lu3qY8+WuobjuEz13bNUoihdMr08cRCvdauSc2AfKMfbbHsDOTO2m8
         5Iw3aWzYs07ACkYiFTkZ/OnHe47BCyrP+Q5/jjYz0tT2keydzM1j8rPDlOxj07+Vq4gY
         DrSvk4CRbYoUKELyAN1oV2dLz3fQWLoUplE/WkNtUVq3Co1Zvb3pYu3XTkJ271GbCrtC
         cNU0DhcGGzEOqBkDivSVs4YjG71BcQ57dYVfrzS7PjKL8xaMwOT1bzZsvQddEfSj7JAN
         9dOlaaNSlL21B5qFeunh21ccmR5vQmmp0Ujysc17Vy7b/sUUS0Tfqp2Pkjf/gZJKqAef
         r62A==
X-Forwarded-Encrypted: i=1; AJvYcCVXey84Q35IxX2faH88koHzxaSGV0EB28PSwbbr/USKsIUJf7m3bKKa97wcg4uQrYr4EplGgYWgSQKzK44=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzPJBQ+1T5Jab4EP1ULxodJ7zWIsXGU17m95j8KIneA3D8n8bfj
	V+fdPGnQdlP4Aq7bYV07olmDHdAROWw8npNqSOmKD1as1AtuiSyn
X-Google-Smtp-Source: AGHT+IHH+8mnLv/RNwmJofMZH1/UlAGTE95HlSmIfUGjBIn/0P3/HWerod9ADou0u6dLHFU/8kiQBQ==
X-Received: by 2002:a17:902:ccc8:b0:20c:c704:629e with SMTP id d9443c01a7336-20e5a93e82amr47973845ad.56.1729267618038;
        Fri, 18 Oct 2024 09:06:58 -0700 (PDT)
Received: from dw-tp ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8fe68asm14345345ad.237.2024.10.18.09.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:06:57 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
Subject: Re: [RFC v3 1/3] fadump: Refactor and prepare fadump_cma_init for late init
In-Reply-To: <b66e69a9-7098-44f6-822d-f19bfe85117d@linux.ibm.com>
Date: Fri, 18 Oct 2024 21:34:23 +0530
Message-ID: <87zfn1gzy0.fsf@gmail.com>
References: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com> <941875f7-0d7f-4ba3-bc7c-7aedc3b20dae@linux.ibm.com> <87bjznyliv.fsf@gmail.com> <b66e69a9-7098-44f6-822d-f19bfe85117d@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

>
> Patchset looks fine to me. 
>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com> for the series.
>

Thanks Maddy for the reviews! 
I will spin PATCH v4 with these minor suggested changes (No code changes)

-ritesh

