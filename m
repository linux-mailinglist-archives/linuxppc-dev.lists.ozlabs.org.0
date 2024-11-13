Return-Path: <linuxppc-dev+bounces-3134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682809C6967
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 07:41:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDFm0ZS5z2yRP;
	Wed, 13 Nov 2024 17:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731480076;
	cv=none; b=jAUXQDAexqYXvu2xikmTkjKaVugglXeAfJrGHk2GOsCiRu75/kRrLVl7MFxdg+ZG5l/iPDv+UwCFRVMu/eCngXownoP5wUeqFubJ8WYsSXWdGFAt2HFlfm3uLmuyUrvqyFXl+cZZndpiXe/3ZDUC8ra1YbeJunUSSTdZV2UiyZyRmE/4gj21fLc7Z5Ofa8FjCN7v2TSeXhrpBoxOJ/dbluzPZuXU5alREvzxNmTtjSC9oA+MOm7l1a8yNL3id1ns9NOzhow9ZEqTDuO1PGnnPWYmfQPxDIZpwpM9ZdJsvA0d3vNfEmtws2wYsgSBWlCI7WZEEW25i02QQ6etOMbdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731480076; c=relaxed/relaxed;
	bh=JRNvgkgyAq1nq2s+FmJibdkLS9j4evHhQhts6ydEE3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ml/ky/mRuihHvKZXandIX11gwVCCQ24pQqre+u0ZenjyrxUdNLq4CdppwGbRM/FsoNvIgE4d6P1ULMd/45B8lsC/89fOFa3Tid3M2mhWyiPKshhxTm2/bIRyNXs2UAbvitQmgjvrhoTIw3DMotF8nesejVdkkoA3k4YUHwmm43fSQdFkHwHhxZRpojKF9TdZWtkyb/jcoGIuxsmCmso2khfD2Qheu8On29ejuc/qbaUo6JxbwIN1NKxPo8rD+u5gnh/Z4YmWGNF4khKiO1TrwcU/6s1jvRUfBlPof5mE81ozqXlq3lx8RQbjH556hcg9UDeww/u89xOrycBncF4hgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3XFJ+1uy; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FIPC+Sh+; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3XFJ+1uy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FIPC+Sh+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDFk2gcPz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 17:41:14 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731480070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JRNvgkgyAq1nq2s+FmJibdkLS9j4evHhQhts6ydEE3Y=;
	b=3XFJ+1uyMPT3YAz61nx3nSMkvYXWjQMiLWZnkuLedBWgyZLnRFq6zTQ9snAmaEkshKWTR+
	i2wyk/p4VbkvjgyL0TwIjCgEE1KayJ6dgkUIH6x4bFUwIxbSbJNDxgGCL/8VIjBLETyDR9
	rhOR+ZvJmkXRypI6B5ysDRcuFJt0qU38VSV/i1gYi0z5GvqssgGa3iy82Vkdq3e8KRTiXJ
	5VymkvSZ4n48w4dZd82xpgwZS1eeXrkc9Gcu9jKxwn7pgQsOlo+acvEU7QQSeNSghzL2B5
	fzsjKwLrD02+n1jHHJNqgt/7TRpSWrVNZsQxssegZnNiW6x4ITKWzwUoLe5gIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731480070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JRNvgkgyAq1nq2s+FmJibdkLS9j4evHhQhts6ydEE3Y=;
	b=FIPC+Sh+Vq47vUS2+43S+5N47lk2kyiUgz/DgkC8ECgHTz4tg+oJICEMn53ZCRSEcBAcUA
	kY/Ag++xbnEP5SAg==
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [PATCH v2 5/8] powerpc/entry: add irqentry_state and generic
 entry support
In-Reply-To: <B8D89E4E26FBB584+20241111031934.1579-10-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
 <B8D89E4E26FBB584+20241111031934.1579-10-luming.yu@shingroup.cn>
Date: Wed, 13 Nov 2024 07:41:26 +0100
Message-ID: <877c97my95.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 11 2024 at 11:19, Luming Yu wrote:
> generic irq entry support via generic irqentry is added for powerpc.
> There may be duplciate calls and missing callbacks requires further
> work.

No. This needs to be a transition which is consistent and correct at any
stage of the series.

You cannot go and break stuff first and then gradually add hacks to fix
it up. Well, you can but don't be surprised if it goes nowhere.

Thanks,

        tglx





