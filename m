Return-Path: <linuxppc-dev+bounces-4653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24485A00DE1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 19:45:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPsvf5w5lz30Tr;
	Sat,  4 Jan 2025 05:45:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735929918;
	cv=none; b=dwz21b8sXvph6HTrdKBl+jtzn6hptf0ytFmJTqFsMYAj+MLwFZBB1DoB6byNm4fygvD8AVbm3RFR2vynEZxIU8OYinkAVSgq4flv4TcMTImbmWHn2GpSQ5OPileFmuN+Tlc6SWMO9rOb/pHHxTHeJ26s1Xj90six4vVLE1sfSMeDsPwtO3VLQwOGRMSs8hnFQ5b7RvtAmt3757+Dpiv5pZLnHrSf4CMOSYXZUFGBhevzGLGUwMaM/+WqX6uS+94O/B9G2iEwTLzt+UcLoiInK1KQLUz6r4ZU6o4g39dQ+KPhKH6kr+sl4eFtBYV0w07Zs7jXPhtTVL2sdNXKa8RcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735929918; c=relaxed/relaxed;
	bh=Xv2LJFwvzdFekdOiLKdjOBtXm3+icKcXY80cmxqTpUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nv3vbdSCzELGBPPR6DPfsmt+gM6pxJzz3F/eahg+uhx/GPnse4EomcXu1VAwrxTHYn6vnWVAyUwrCrYPwrJRyHy+7PEAQTxC76Ebdp7aDklUEM6UX3TuBNrP0kHyubY55C3qf/rme5I+QuBIl4PrF4Eahrbd31LuDoiw42VoTqAfWvkpTDr0h7Fy/xhpS95cGpFdtPNo1KNPppOArTNrQiiSnzkvYf+GASiSJgjoGjUzQlRRPEYJUE2WtCJJC8htVnUOlcPrcOP1CSHLpeNVD6bRRYgMRNWneYt8YuxzxTGiBqjtVyFGZodBV0WGJ5oupHYUY1Q9ec0aEPQvtrYg4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk; dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SyDGs5WE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.dk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SyDGs5WE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPsvc61pFz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 05:45:13 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2165448243fso209226605ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 10:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1735929905; x=1736534705; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xv2LJFwvzdFekdOiLKdjOBtXm3+icKcXY80cmxqTpUg=;
        b=SyDGs5WEMzj9X+7fxHcmmAdZ6BosYe5kyGodHEXHhOEKlv/xMppD60/FPY046UjC+u
         cxXdgL2O/G946VQPgKHr2psNQBnNPxcHuQ6KQsnijTqTO6wYsq4Dt7+Q4o/o0Ncsmjb5
         ValNe+WRLRISY4gw0jzzLrq6m0pWDVYTFg7a0CP7g3CC0PT8hPNa0YuRy6I5Y/GVH0aT
         bzoNFH6Lv/OuAW0o85ffJdFP39u8w7SuTIYvkfFoAMuyW6S8ENsvxAIsYhujSmF3QY8D
         RActQpmsyzgta97aBIskkSPCWTn5BIM/To2V6xUQdd/iGA/hTTflHyZz5jU83sfIanyq
         YWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735929905; x=1736534705;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv2LJFwvzdFekdOiLKdjOBtXm3+icKcXY80cmxqTpUg=;
        b=JJFQPMafhC2BloU8VC/hD5dNyO2dciMaX+m/hMJkpJlzWDV4lVdTno0OuZMlUF7uhW
         YDOHIkE0nAkRgIo649X3IvS0YgfmGisR3jvVbjzcD8gXCn88GOMWPvfD+z6BJZnwU2p9
         bkRHEmn3TUJbPPKcQqeh4NtxntSHZNd6HxHIi99H8yQcngQUDU+DXEmvGWnlmeiwrKpd
         MI549Vc00ZBSCiV1Si+N6WD+L45bwsDFuLUy9sQ1FIJCfpzPZI2IkSOijJX86ptJjcny
         z34pegyeG36JXus4fuJnkD+ELoNpEy1E8+2xkUxy6KhQmnJ/LqNMChcn0qSTlJvgt5fm
         ViIQ==
X-Gm-Message-State: AOJu0YxFhkTzokEGM99jiRTY4VlacEMEMAOFJkxKr4AbF47+UCxZdk6q
	DkRHnX8dsomVJHd9QU3yU5gv0WAt7XE5T3v64sX0xXnkErGmDfLjc85+n0r4saB4vz8rH+Wt7de
	W
X-Gm-Gg: ASbGncsiOS3YGOLkfmDxRCGrisCJjXTOlb81GE/zHXnKhg2M7pX0SOzEAhwdYFq/iQU
	BRbz3GA8jV+X+ARwLPVbc+t1/9aTi9TP5xGDC8Nc+88aEUcocIrEn+A+qVgC3RFmOgsUdjt4OJA
	YIanSABB0xl+Z2lmngSpA8/48vg1kRNLcre6lv9PKFakOgWYZgZJmJJ4biNjYJ1pIdV8CgnDEOb
	9q7h3YTUjURhHlqV73BHpo8QZ4NHHP1wprRoZxWQW3jw8kH
X-Google-Smtp-Source: AGHT+IHsZrBLN1RWhsZeipatK91oybhaWrde5A6yKnYBFUk10SSfl5AYNAtf8Q+Y/yy6wggYtbAnXw==
X-Received: by 2002:a17:902:c407:b0:216:4b5a:998b with SMTP id d9443c01a7336-219e6f14fb0mr631230515ad.45.1735929905333;
        Fri, 03 Jan 2025 10:45:05 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6951sm248655295ad.171.2025.01.03.10.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 10:45:04 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>, 
 Philipp Hortmann <philipp.g.hortmann@gmail.com>, 
 Geoff Levand <geoff@infradead.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216.git.geert+renesas@glider.be>
References: <06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ps3disk: Do not use dev->bounce_size before it is set
Message-Id: <173592990403.170261.3956098234051434369.b4-ty@kernel.dk>
Date: Fri, 03 Jan 2025 11:45:04 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-14bd6
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Fri, 03 Jan 2025 09:51:25 +0100, Geert Uytterhoeven wrote:
> dev->bounce_size is only initialized after it is used to set the queue
> limits.  Fix this by using BOUNCE_SIZE instead.
> 
> 

Applied, thanks!

[1/1] ps3disk: Do not use dev->bounce_size before it is set
      commit: c2398e6d5f16e15598d3a37e17107fea477e3f91

Best regards,
-- 
Jens Axboe




