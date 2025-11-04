Return-Path: <linuxppc-dev+bounces-13727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0000C307C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 11:24:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d14MJ3vyDz3bfM;
	Tue,  4 Nov 2025 21:24:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762251884;
	cv=none; b=TDt/zvLqdo6jvnF8x2kTl7sd8bc+GQIPMlc1PBeRRYomT0ed3d2zfW11sTQwvyeXlqJhYqJPSzB7BPQAqU6RKwKGoCKpRcatpcAsS1/nM9v7OSWyAjLmq/YNkPzPa8x30FAtxk2SSfuNcGpxng4++SBP3TgaBIRlPkhmarba6fGgE5k3nFZ7MX4OQnm3g6ibInc3qpcOPYFhdKxsIiamM+EyWJJsJxl87aIvvVeWnq2dtwV8r291TvWXEoDyKZ7cJnf/mSW3C3jAdkhyj3fxOzX+rgvByPV7pJ60tY13dIL2fzzwZpTvJ7eS6fB+OoishwSus8TvrTNbD6PBVxjtgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762251884; c=relaxed/relaxed;
	bh=owDawV/cnKyMwzi7YiANe4vB27Qq/ThAIZ5MpALecMg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=VIE9dLcRUqtOGdpDC42HhILZi3bFXqhg+Yhlw1+5DcTOaBRnNuvfgcnyvwqOm/7neqYJLZZtu+SSxIUcRI7qT9XzyJGNgysUDdxaDULkXhqTOW5HnX8Bn9thDCzyM0nNLVzhRIC9t+GdaRoKMAl4a/HNKwvFV2pmpExvqFgR+pyqiHSRYa1F6fmCs/dOGKBSBc6Pn381/Q9A5s9izFqOvcMwD5XqcI0SdGojgbC1KFDlci75ToOYlH+LifPnmv31sgkHgV3T00Xm2wLJzatd6wnOEHCX0NXZuIpw2Mnqd+UdtoIuWE60TlCBReNacvnCxsxiQdxxLCcRyvqYEx2yjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F3A0OWNp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F3A0OWNp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d14MH1Cshz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 21:24:42 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-294fc62d7f4so50394535ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762251879; x=1762856679; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=owDawV/cnKyMwzi7YiANe4vB27Qq/ThAIZ5MpALecMg=;
        b=F3A0OWNp1TU+6qcFqpzViF2E3cD5kvvBL0z8QZVBA3Q8QqQktbloI1xa/z+jpUmPmv
         Pby9Xed1A0FZDdmDKWPnV94aBaeIbVWiE3ZWkD+Vo/m0bv3L+aF1XYdNqQ0GZPj297vj
         WXUu8U5zBS8d18/KAbYRMrSujhyGo9iU5HHpAp1S4HsJ1zzGMyD64rNz8ShcpWK/NDcX
         E0Wol1RdHxbwo2l6B+4ysWN2Vwink8zI/X2++umCVlIgwn+mnGAPoNcr7t1bJolL5Zs/
         kewh7UJiMT4FH0tSE7aoglvmYQZyi2l+MHzFx5Ij0x2HuCOCqfbQH00ZoIOwf6Ugaedi
         xrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251879; x=1762856679;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owDawV/cnKyMwzi7YiANe4vB27Qq/ThAIZ5MpALecMg=;
        b=ijGj8GmpdpNT7Aa2YGSyT1/OI4n/GV0rSx5/TPyMxYTCZhlsv7vNS4ddC0WLQyNeVb
         ir+KiZ65Fw2aMZSmUn7GVOtPMYYLC3XVf72X5gU3nEvGBkTg0hzpTAdCzJxiCE98n/70
         +GXEiAeFNkncF1D7ixxGn5oZvS+8dbAlZ9HYogdZWCI8Tc6JZQkxS03zqJZsE/xdqayE
         J+lwEaJEdg+/lVuSnFyI4yL/t4l7ou6m39o3jECYxVO3Mbz6i2ILEV9cxirRc/zBmksV
         wsesezNouVNTBgxUfw/K//hbe3O8PsxFeWF888NA0gtFGaslgi/59F2lcWR5hkSIXMrW
         8vUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKglXe9AyAqoWULp6FSlsezRAJra/I7QZrfF+/PyDVbfbpRhF9v5eKwh5MNbAI39S5tNSko1zVeZQ3RKk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDYQ3PZUE2P0bin4KYdln80trQAHTBoSg3wRLVyYcYFuRNFYvf
	o4z+HxKauLTxD6s17jomo+z+cg38QLOjebJcTu6TG9Xdt8beiYUNtOLe
X-Gm-Gg: ASbGncuTN6JgAiNTlzB65v7tdcQ1itfx5gbBn/oRqG8LFVaHvy1EJMsTftgQexJhieo
	Qev5b91gmE2SI2tmwRZxn1tRltGihF3gPc7lm5HAwOTM4N1R2eli5Mq03uhYC6d20uhRHTZGJJ6
	mH/7BGrVpnweSpTsZBaoL9OeyrDaSBKjcfPnFcfn8Q5VhGGLgvSxPAroKLrwG/SPOXWJ6pDFIpo
	/7qyfa2aR4u8TlKqkbhLHM6Cez1Fr1OFpbnoq7vHxxOH+8Tb009hlGR5LhXOBIq00bydHJsMJ2Z
	3zXMDC6bkD41Lv+vlQ0KC5ZUICEnqob1gSKPQ9J2s6QfCfSvVnRRirm6opX4h9gzcvh0jASZrJF
	S9oKIPNiCioWsNpeSEekdrIA680uFeuLfrhjkUQg5qlTBA/wuZBJ8qZfkFsP1JnYtBeHPyw==
X-Google-Smtp-Source: AGHT+IEu4ISs/3Zx+zO0qMNXn+InIequcG2BrEwlpQjYK4nng9gbF8T2Q1dyWzpa23EPsiCBGAeVBw==
X-Received: by 2002:a17:903:41cc:b0:295:7b85:2f5f with SMTP id d9443c01a7336-2957b8530eemr103346575ad.31.1762251879495;
        Tue, 04 Nov 2025 02:24:39 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2960199832asm21393245ad.26.2025.11.04.02.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:24:38 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: Re: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <7957bd55-5bda-406f-aab3-64e0620bd452@linux.ibm.com>
Date: Tue, 04 Nov 2025 15:48:48 +0530
Message-ID: <87wm463xtj.ritesh.list@gmail.com>
References: <20251103043747.1298065-1-sourabhjain@linux.ibm.com> <87y0on4ebh.ritesh.list@gmail.com> <7957bd55-5bda-406f-aab3-64e0620bd452@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Sourabh Jain <sourabhjain@linux.ibm.com> writes:


> I would like to keep kdump_cma_reserve() as is it because of two reasons:
>
> - It keeps setup_arch() free from kdump #ifdefs

Not really.

Instead of kdump_cma_reserve(crashk_cma_size), one could call

reserve_crashkernel_cma(crashk_cma_size) directly in setup_arch().

> - In case if we want to add some condition on this reservation it would 
> straight forward.
>

Make sense.

> So lets keep kdump_cma_reserve as is, unless you have strong opinion on 
> not to.
>

No strong opinion, as I said it was a minor nit. Feel free to keep the
function kdump_cma_reserve() as is then.

-ritesh


