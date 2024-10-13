Return-Path: <linuxppc-dev+bounces-2175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8E99BC44
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 23:33:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRYWR6tCkz2yDH;
	Mon, 14 Oct 2024 08:33:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728852822;
	cv=none; b=NV1pFrxCCTbQ5jWRw7j8TY0N0kTEIDZTrZhjFPqN7Ar1PHliVNheJ2+tw0eHMVBkDyRD2fmH86OsEfQwQK1EqYEUTzSauSL1seRewUbn4wEXzYa2I57fpHDAsgRCX05jnwNCVOt92qT6SNk8dAGQQfvlOCL+rDulEzwXZMtuYsSkTkuF2AcoJ41pda7LaLbKjw3/7nF3we/EDKCpRYMy+fVJr4CPJ9lfYOEGrZTnvn9pK4V9NxIrDs/OpUiyU6i0OCFIMIBxoB+kwEg/uRFTC5lcZwlwX/AaDDgvqTnJaJP6QuH6APbNSZj2q5iGpZkZXYEOkFLyDTWQ1PI/yRT0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728852822; c=relaxed/relaxed;
	bh=tW/oVLxMGVp293pF30Jw4BkfUNSmxaGcYjy7Hqe9zSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KxcsnE3raZjvQP0jFpv9GWuGH4nzICi7VCVXFCj54bVBRH2kU4OezVxRlwHge3sU6XUOf2d5mWp1XKdvZyBBupt/FdIe5K2kGIY6PUCy1pSfQOAN/iWlNcwQO7qb4uCpgimZlDeR6+FeLrZvRFIxbmnhjattf8738fU3HQdN+07NahiTZgsHdIsamZSx0jEOOZW1ZVQAv9H4x0ZyzTbgSMOyMhB3HkM+Ls8TLic9NHqZGYdksIC2rKH02I/SkC25da6/s7TWRGK0RLtQEhVdDaG+MbE6GW2h7OoP/Vs+C0YZUbRdPznGeWvGV5NGcHl9PsjE0vLUpgpWssvXgRgr7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk; dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=pPJozBSO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.dk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=pPJozBSO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRXdc5bNsz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 07:53:36 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e5130832aso644429b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 13:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728852813; x=1729457613; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW/oVLxMGVp293pF30Jw4BkfUNSmxaGcYjy7Hqe9zSo=;
        b=pPJozBSO72EgzFvwo3fMZb2OkWBjV5Pb/NP2WbsFfjZy0DXkilwpJ+oWvXnmmVH2FC
         bHmfdMYk4D/RyBU3jDtDX5oChhrUQuCZTAlicuVsaTVChrO1QGDJGjqtW6QSmZuLoE0H
         a+ynvDTBAYFhS+SUOGrDwSX1ZaNAJ0NHQCiSysAkyhXqGsMoAwudyF+h3pd57QTZiuQ2
         1Sba0y8Dnw2S+0fM9El5Q3BkS1qzrpeiTCBr3+JLiQe8ef8LNBKo7f+aBGh8H1JORDnT
         DESihyAo4BjsIMqmiCM0UZUhxes8vLfFqEO7/K++2vAEzmOLfPJ1i3qgLv9O3SeLijfy
         kYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728852813; x=1729457613;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW/oVLxMGVp293pF30Jw4BkfUNSmxaGcYjy7Hqe9zSo=;
        b=dyPKrRx2o/LwgDZ4hg6W+2YFawzcjlMgtwE+3HXdHsIzrn9DynHCssU9gLRTUmoOxA
         JcxkJSGF7rSgtT3K9xLwrkb/p3O5moySoyaNBsQlkRxx2O1ujNr2Y+5ZWgjXHcJTePo9
         5zqBOnclNtgmQlqDXwOkbDvJJoDw4Vp/jQ4cqTO0w34v0HpVmSfcOseO6Z1Jvb9hAKae
         UnK3+ECJihfScwt4qoBPBiskiKdcDE9ETBUPVre7Zz9pvz2L5pL9AHZywRYYD0Y9OfHc
         jw+46gc0cM5aUzS8NCTXyMsnRu9g6WdyyZNWb7bbS7DWiQ3i1XNJkxsuXz3tfG/h4X0W
         jK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWy/op6Dq4LCPunjaudPwSP1zZW0/9IeoyQiTaDOWvpA3h/8q63eoy7IcJj3fjh1L4Q+J7Y27vHsnSroX4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtP1jtzX1RPaoN5Y046MdLOCAs4WCEbrcs/Pnnc0ju3GX4tnE7
	Ut5DGe0mSV+t4OSfzawx6hqo/5F28aWVzXnwOBkLHHBDnPaP9XNeIhOjVEjobkA=
X-Google-Smtp-Source: AGHT+IGeHW/T1utnJaL2THMthWNT/SlEE9KTreIWsQr33pvF5db22afBNXHDL1azWfd6tDGW/vbLCA==
X-Received: by 2002:a05:6a00:1391:b0:71e:ba5:820e with SMTP id d2e1a72fcca58-71e4c1dcd95mr9404250b3a.27.1728852812746;
        Sun, 13 Oct 2024 13:53:32 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e48bcfe81sm3815287b3a.66.2024.10.13.13.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 13:53:32 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-nfs@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, vbabka@suse.cz, paulmck@kernel.org, 
 Tom Talpey <tom@talpey.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Olga Kornievskaia <okorniev@redhat.com>, Neil Brown <neilb@suse.de>, 
 linux-can@vger.kernel.org, bridge@lists.linux.dev, 
 b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, ecryptfs@vger.kernel.org, 
 linux-block@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/17] replace call_rcu by kfree_rcu for
 simple kmem_cache_free callback
Message-Id: <172885281086.338120.2063739137198887833.b4-ty@kernel.dk>
Date: Sun, 13 Oct 2024 14:53:30 -0600
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Sun, 13 Oct 2024 22:16:47 +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were done using the following Coccinelle semantic patch.
> This semantic patch is designed to ignore cases where the callback
> function is used in another way.
> 
> [...]

Applied, thanks!

[09/17] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
        commit: 7a9b197adbafa9d6d1a79a0633607b78b1adef82

Best regards,
-- 
Jens Axboe




