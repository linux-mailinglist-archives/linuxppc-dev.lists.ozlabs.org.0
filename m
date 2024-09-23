Return-Path: <linuxppc-dev+bounces-1524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE36397E598
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 07:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBrtT3HDNz2yNs;
	Mon, 23 Sep 2024 15:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727068849;
	cv=none; b=PHZ8g8uhy/GFCmPS6+6fTNKcFUu4iB8DN0ZC+H76viS1n15Ce2tpSZ9TGa5byGdKXf8+tg//rJrYWEp/fcOMvhZ+SzCKuvUDkxtl7TnkyfFzbbfsY9rFVwQ7uy4z1l5uw3S7sg3hFozBYJGaHNwP7tPeDmG5pVw5kX1FMVUa/oBsQx7y9+CwmstROFYfQG12MypJgiV6wqOmntGvYDH+pS+B/2EYPHbQJrW3CZ+0yxl3FUuJr5eXTnw74I0KyNoNE4NUQI2E8B0lSASyBma1/QNKc86KAqPhtDzYpNwh/pHxyCSk1t01gzg17hQuf5+0LjueBCNtvdwf5zZ67D4TfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727068849; c=relaxed/relaxed;
	bh=x7Q3h2SawaWR+sw9PYfDN+KcfCiaOHpGieRaMWQOs6Y=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=NgwII/i8ApDFMp3VKWvGxnntAOrPh24GUbUSLOY0mrp7Ke0b89wKiSf2TeIMBPJBu6Yp9bVD6a9bXvqAO39VYVJ0xbhJLHYjnSzNXlIrdLrNQtJsbeVZ7YH3HycgYdCbo3TraIC/W7Z8jKvzNg2aR5MUc5ZPp9Chh+yzrmBzdegawO7B4k9Hn8IXfUgHbnzqRFq6VG2V0OAZK1RdghAVM4mox4t1EC4Km7b5bwUEUvXRiWJ4NbVSrcRNaWPuE3IFVCaPIH/0PRtpMgxbB8RRTfGDRMAT/4AkJU7ScKpWBXfSKgV9yxHKDy5kFl1Xw7VFR7x6qs7PsukOLdKbdjCSIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KXqayR7w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KXqayR7w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBrtS5cHZz2yNj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 15:20:48 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71923d87be4so2880534b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 22:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727068846; x=1727673646; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7Q3h2SawaWR+sw9PYfDN+KcfCiaOHpGieRaMWQOs6Y=;
        b=KXqayR7wtxTS4cp50zbtednVkuR1Gq2TonYgeJhr5e+p5Si7bg4p2MbuWTXr92A09f
         QKzMoRa/aZEDgVMKsEFi1gA1b3oJkpOQFzSUHdO/RzibfBVRPm3rV5ZJtl2/oGWR2/C6
         g74mT3O0PSqzu0UIOMXrp96TKQzDILhC2Ufvka92OMlVhpn3ri0EzjG1vo2wvIeOh1pU
         WQWKBYDcxQAh9GgsW/NiScX1rbfkXb/WmRB1ECn8gyi+XVTXufRPiWs7V55T0FNz89FF
         rn9e2g2vrYiyHybqt/25jyUYzPif7BZSVW/nZeTxhQfA2sZUisPYjKaB52etYQ654f6m
         OFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727068846; x=1727673646;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7Q3h2SawaWR+sw9PYfDN+KcfCiaOHpGieRaMWQOs6Y=;
        b=aqrmVYDYUkDmKYPGrfAOTLLP2KGGgJYjDpjGLHY5RdEf7dWRa/sheaBdxaizgDPPWv
         sVFFLSDjnGR4Tv1ErwsscMsG4+cWw4yMn774ntNmiS3Sy/llO4mbkvHb0rU80ZSOZeh4
         xP0tcC6MKflzXkfAyZ6qz/ShY9wxDO7IAf4F2kYa7+MQwWpumV0Z2nqdIKXaURFdjBON
         COURXIbaB5VzDbZKOxxZ50H9FQil67olrcQbzP9hwkAlEqMYq4a/bLiUySaXVQw4G8n6
         XECrAwl0u6n0O/fKVAlz/15Bj4U5hcyvZMlSp6nH9FrR+zrEn9ehCdCtKcvtW43bva65
         gLxA==
X-Gm-Message-State: AOJu0YzHjFBwynVWNkjcwtGnb17vuLjP5a64rqGrqT2PnnlVDsqOmK6f
	OJQ14PqSeLAzlk1I9ghRSMgH62m5mMl5v5wNFSvc676FwFDOkCdwCnja07Zg
X-Google-Smtp-Source: AGHT+IEgJn9OKt3pC4i9q2cvQwxoJM+LLyrR6saLnYmaNWreDtyQQqIFXVH8bK0Oqh4X2XHXoQur6A==
X-Received: by 2002:a05:6a00:1ad3:b0:717:8b4e:98b6 with SMTP id d2e1a72fcca58-7199c9f0bddmr15013739b3a.21.1727068845770;
        Sun, 22 Sep 2024 22:20:45 -0700 (PDT)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a9707dsm13148165b3a.38.2024.09.22.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 22:20:45 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Luming Yu <luming.yu@shingroup.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, jialong.yang@shingroup.cn, luming.yu@gmail.com
Subject: Re: [RFC PATCH] powerpc/tlb: enable arch want batched unmap tlb flush
In-Reply-To: <3A7F514D32DFA545+ZvDZF58z6KTRqRjG@HX09040029.powercore.com.cn>
Date: Mon, 23 Sep 2024 10:48:11 +0530
Message-ID: <87ed5bymlo.fsf@gmail.com>
References: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn> <87frpsymf2.fsf@gmail.com> <3A7F514D32DFA545+ZvDZF58z6KTRqRjG@HX09040029.powercore.com.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Luming Yu <luming.yu@shingroup.cn> writes:

> On Sun, Sep 22, 2024 at 04:39:53PM +0530, Ritesh Harjani wrote:
>> Luming Yu <luming.yu@shingroup.cn> writes:
>> 
>> > From: Yu Luming <luming.yu@gmail.com>
>> >
>> > ppc always do its own tracking for batch tlb. By trivially enabling
>> > the ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH in ppc, ppc arch can re-use
>> > common code in rmap and reduce overhead and do optimization it could not
>> > have without a tlb flushing context at low architecture level.
>> 
>> I looked at this patch and other than the compile failure, this patch
>> still won't optimize anything. The idea of this config is that we want
>> to batch all the tlb flush operation at the end. By returning false from
>> should_defer_flush() (in this patch), we are saying we cannot defer
>> the flush and hence we do tlb flush in the same context of unmap.
> not exactly, as false return implies, we currently do nothing but relying on
> book3S_64's tlb batch implementation which contains a bit of defer optimization
> that we need to use a real benchmark to do some performance characterization.
>
> And I need to get my test bed ready for patch testing first. So I have to
> defer the real optimization in this area.
>> 
>> Anyway, I took a quick look at ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>> and I have a quick PoC for the same. I will soon post it.
> thanks for picking up the barton for the future collaboration on the
> potential common performance benefits among us for powerpc arch.

Sure Thanks, Luming. 
I have posted this work here [1].

[1]: https://lore.kernel.org/linuxppc-dev/cover.1727001426.git.ritesh.list@gmail.com/
-ritesh

