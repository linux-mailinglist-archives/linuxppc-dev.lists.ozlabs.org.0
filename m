Return-Path: <linuxppc-dev+bounces-13236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBCC03818
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 23:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cszM84xtwz2xlK;
	Fri, 24 Oct 2025 08:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761254100;
	cv=none; b=jSTlYiOzj4xCcPVgJYi+/ftIP5HdUUzmXCTsEr/UIWeXP6nqOnfZOgYzoJSxy1lc06RfmR/6vCkODpQW99mQplDm1fEMH6C3hh/LB5FP77+SWi4Mu1hEvlPHmXEQ/+xA0vcsz7OGAUeYFdAUp8TJMT5ca1TinaIaVK0OvYtMFICu3TqNv2fb8xNF8iXjBrTPoL3RnSJt1qguJ34U00O6KKPhhK2iUZEPXZcC0No3IsvwcfDvSza3T3t5OBBDVSUIzSmbs26agqMii4wLsRlAW3zh6R3/d5IYR9JOAd629vj2OjVh5HAOjPCy8ikpMPET/bA2n++x/RYq4DM25vX9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761254100; c=relaxed/relaxed;
	bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kkc9RLlipd8s2ECWKSdmBoPIX2m68sNWIbK7ib3Y+/jjBTgMU4Wx8dQpO3qTLJfJXXh+5yidlfKqCmpnE1VFdMBt8AzDD+xYCCI4wJEn8TxymxxB+dUBw065AiHb9Mq+GsJspZONHTYH7qM3T//Y39BzTzzvj7+1QArfJ0ixMm6EkmNubz3NTQ9GJQuoF5D99QHG+RnsgFNqj6xTgCPXrOMvFtTKcZ5g07vcZ3hnf1eSU7XMgMKUcJxR8LzHBIysFjglcTAVlYA90rC4CHRjC/mNpEoyh2uQLXo1LLwzjaAAv7eCTOy+pO+TBpnDctOitNkwsgyyTBDN7qkKU18tGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a06IDLSw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a06IDLSw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cszM70Ww5z2xR3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 08:14:57 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42701b29a7eso732187f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254094; x=1761858894; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=;
        b=a06IDLSwKqzSHEPmtn8Y9jSeo/LjbB5PuHf1OBwQ4IYM0gbE0zr3nPHEnnGDxeXHtu
         UjJ1Ct1t8kZWMpsH9sXp7Qts2M2h9MmJ+NOiTdlYjL+oSpXV0NfuPpLurj6iUEF+8NHL
         +OProkHfUkwhMJI+0w0Sy+0sz81WcS1QvgCqZbYmRMUO44JavGEYPvKnA2kR91e3UE7g
         EtEE0TFCHXa/75+Y7gd+ArM2t3K1zJsfHYPHpY5M+YxSd8Xr+HKAPyMGKQDka62zpYzX
         xp1fRZTdoXlvK8NjHh4eazHw1H3RJpJOZFUk/uhhYUU3XCBPpC4CEPKEYVodi7ZEZ1TA
         3edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254094; x=1761858894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=;
        b=tnb4/a8fOjey452vtVr9MTOeH/MGm+xOaGAv2FqVGXXDsW044UePsA7xraPRqonmdi
         fB4O38hDIQsPT647IvxdLiLp2wFuo96ZSNFHGirv9y6RfP4bOKVacm/sFapVCe2P22gr
         oRpC6EyXuUqnP0/s/7xjiF1zB71nPWMhl32ZpfVgWTJD8JXvqzlOs+8oi68uMD02AfNi
         PEww/e5zeQYTMASHQfPitF/QIPUw9NKkKYx1OYZIEXoU8ocuK/NCReiCfvLauL6SLWFZ
         04FYhNTHjSyLzaWv3UEbrbMIwEraC3Oeaa0e/0w3xFu0LvL5SwaKn+ia9MzvlfHI+r7M
         gO8A==
X-Forwarded-Encrypted: i=1; AJvYcCW7PoGPs4TChwFbufME9r5NQiPOVREUj7vn4v3g7xqLI0XiF3YOeaPqMUJVYAUd+a3P/FtOJvQr4RqR15M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDNJXa7sMX8EJbf4hzGI9E2tbqvw6L0lZiatS2TUc6pUJ+mlOd
	IFxaVsBA6BFXmsZKyKagyfki6sLtryomR52sfC2gPCRAyDBVhObeT2tH
X-Gm-Gg: ASbGnctAI+RZxOUyQGjpDL9rXtvROHVvkaQ8LfoHMku4P42QHgADfhkUKy4j5/NuvKp
	CjPJVWjszYajIXtMDn4qfGDj+jkHE9xzg83NHTZzl7spK55FKBrkyaGE76XQ85eJIlGpsExnJbH
	IgwH0U40+jr1yHPgPxQqSccB4oAEc7ZEmRS0ooPWcr7fbuRpb19gLl3Yha4Y1Mjq3vFOMawQKu/
	+00zvGo7MI/dcHh1z6ZwzjUlqfGdvM2J0mQXcFwGZK0OeWCbQPb5mf7B7CXyFJ4U2JE8wSL+HSd
	Z0XsnZffjXrczUoGvwXS1vcpJal1CKVinCKUuBLBrqdHWutvXVfKD0vVNKpfQnfYml3OPjZsHpw
	qnfQckXQtq0+Sh1MinE/cqgybV8Gt4juZTuD6ZZmHrMtMTvTJMMiCwQvZ1ey9ttOwUpG+C06Xdg
	TFkDhalgnx3VwmWGAZ5ofxuE5afs9IGhYuRtsarKyoyg==
X-Google-Smtp-Source: AGHT+IGk8eEDWy3Lb1qhGeYZ8N0urG/YCIu8xY7+WZCUmyVKdYxjr9Zc6A6l5BFcgm2g7Vw9SfAVXA==
X-Received: by 2002:a05:6000:1446:b0:427:374:d91e with SMTP id ffacd0b85a97d-4298f545550mr248975f8f.11.1761254093423;
        Thu, 23 Oct 2025 14:14:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897ff3f5sm5951290f8f.22.2025.10.23.14.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:14:53 -0700 (PDT)
Date: Thu, 23 Oct 2025 22:14:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, kernel test robot
 <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
Message-ID: <20251023221450.1303003d@pumpkin>
In-Reply-To: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
References: <20251022102427.400699796@linutronix.de>
	<20251022103112.478876605@linutronix.de>
	<CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
	<873479xxtu.ffs@tglx>
	<CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 23 Oct 2025 09:26:12 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 23 Oct 2025 at 08:44, Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > But as you said out-of-line function call it occured to me that these
> > helpers might be just named get/put_user_inline(). Hmm?  
> 
> Yeah, with a comment that clearly says "you need to have actual
> performance numbers for why this needs to be inlined" for people to
> use it.

Avoiding an extra clac/stac pair for two accesses might be enough.
But for a single access it might be hard to justify.

(Even if 'return' instructions are horribly painful.
Although anyone chasing performance is probably using a local system
and just disables all that 'stuff'.)

> 
>            Linus


