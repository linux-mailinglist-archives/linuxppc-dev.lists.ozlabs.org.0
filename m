Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042F905ED4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 00:53:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BDzK5ONz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W01701RZXz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 08:53:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BDzK5ONz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W016C4yNpz30WB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 08:53:04 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2c3071634bdso42556a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718232780; x=1718837580; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCKGfocKzBU0+xeBiPtl1Ex5TwQcMh3k2EBSdA3xSn0=;
        b=BDzK5ONzR+yqeuP6636F4fLubeheXqDosIoAaMrijT5gXTyD0o0wGYauggn3cGuQ7A
         bucLraDuPDZzg33q96WJhh+KzMHnwzCTtVHtYLjnyrG+aRrN/QF0T8XGmHP1p35nNjwN
         oLUSXVkWd5NPkhFxO8cRqvofRUJp1FrWkBHuuUyBdzIE16ZSebPfmSBZu+QAMc4ove9I
         pcPdOf3ZM3+GAWMwVaH71F/4xM1UBH+TH1SHDNiudYRUtU2F9Rkz+obK8CAL2AORTn/c
         R3VnmxAbQ14LblSOpHnF7GbIIjdib9QW2rFv0JIa7kOBihkJ2pPzRmPZmmxzxmipU7FH
         uxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718232780; x=1718837580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCKGfocKzBU0+xeBiPtl1Ex5TwQcMh3k2EBSdA3xSn0=;
        b=dmFat+Rh/KAPg8Ot0eRIN8/Bg4lxvcP2KNJOl8oQJ+6rclqFWNmqrRMRdyGXTQszcR
         U/bZAc6XLH2HFcFOH6mAVLHPVMOJt4WJKK7mB7TuZ1BhsLhEe/ILRfVW/u/qmuCZ1IyF
         4803v0eGIZsCblyOTKdRMV5dZwOtTmpt3gt25+sjs+ReC/wKdbD/5O6JCJc1orqhpxUB
         I/4YQIKLeI0B0Sro1AXi7ltScD9/1Pev0cKJq7RIvb/hUrG/RH63L0HfROmjKP3ett4g
         tk4yQX6GAisNxEqBCA67EGM8dVFmw5Vgs88/X3Auy59V74I5G3K/9U/+s02UcfFbeOYT
         FqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh7uFWdG/rDHyp1YbAniOKqQPkJZG1gtb3aAmn3A1iXz83T1T4JKZIcDK2gQr2FahkNRZ4YvQugCypeJU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/1w5u2wnnsJqnMxrudcZpVRSg2xCuipiijryomGxbBILvbxcp
	9D8+obFNXuucAcQGc/FopAJrPY9pKI3M9xKBchTKDOhgbMpAUTr6EU0POqHSPQ4=
X-Google-Smtp-Source: AGHT+IH5UZSMoyLCwmMYbQsnXovMsmtOxcZgzfit4qNG1yAnUakar4EveGlx5xiJfFg6llU0rCt4rg==
X-Received: by 2002:a05:6a20:5647:b0:1af:acda:979d with SMTP id adf61e73a8af0-1b8a9b4e85fmr2859600637.1.1718232780575;
        Wed, 12 Jun 2024 15:53:00 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d2c5sm73821b3a.105.2024.06.12.15.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 15:53:00 -0700 (PDT)
Message-ID: <7e58e73d-4173-49fe-8f05-38a3699bc2c1@kernel.dk>
Date: Wed, 12 Jun 2024 16:52:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: paulmck@kernel.org, Jakub Kicinski <kuba@kernel.org>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, Lai Jiangshan <jiangshanlai@gmail.com>, Olga Kornievskaia <kolga@netapp.com>, kernel-janitors@vger.kernel.org, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/12/24 4:37 PM, Paul E. McKenney wrote:
> [PATCH 09/14] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> 	I don't see a kmem_cache_destroy(), but then again, I also don't
> 	see the kmem_cache_create().  Unless someone can see what I am
> 	not seeing, let's wait.

It's in that same file:

blk_ioc_init()

the cache itself never goes away, as the ioc code is not unloadable. So
I think the change there should be fine.

-- 
Jens Axboe

