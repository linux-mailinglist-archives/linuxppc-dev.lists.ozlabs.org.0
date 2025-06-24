Return-Path: <linuxppc-dev+bounces-9681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35DAE6CDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 18:50:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRWCT0Xlvz2xk5;
	Wed, 25 Jun 2025 02:50:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750783813;
	cv=none; b=CtRPgUG/Zt3hhN8gQnPhXjzxvItOZfVUFML6DkdkyyiumGd9uJl8b6Ydea+kdufxP5rP6YxufQ+RPZ9CzNeVEGHtCp1sD17qBSNK9iccrR2n/cp6GDa7+WUudt7S1x27hHmdMaD0M/48X61hbY7rTHhGQ7Szev+MeR/D/BxhCvW4j2qaOUY8ESFOhg33QJ9IxQKE1j+mPs1+lZp8loNIJmush/KXBNeXyhzuVqXsPs/kKlEgcCgFtla5NNh+IlsFuAa642/du7o0llYgj9MIdLeAOacQol/QaamJwF+GmWlXw3YfRTxEKRi33tdVAcfsv0Npaornq7jDone59ADm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750783813; c=relaxed/relaxed;
	bh=+e3hnOeuzSCQasYOAxsJ6u0yD/pA+ufnXI0wxwmTU+4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtLz7q/2mkquckaPgOhCZUZt3PlxfHrUceFsK2g7+zVNQHCI/mZtJLZNZ4XqyWLq7kbVtj7kOkSc3gBK3ZM+jgW4gFOFZzS2z/xlutYWgQLq9HKG9s38gNDPwvcgFLwKZIpKCvCyQdXYHKCCzRAx/a063K58NWgWD9wi7NssF7FyjWD9aRmQNOZ/cJfHCNaw8y8iv8WEEQDh85BLcfnvmoYT6qXeA2BiKraR0Rh/vwIOSJb2OXDJDZv0oYgI2hQaxAon+YyRr3XRoPFhsMVPUYRL1Yn+B2NyhE1ff9tyowmLYE31YuB17rBINmA7kj95GwRfahl8rB0zuP81Cge5IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nipYZHaz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nipYZHaz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRWCR0fwTz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:50:10 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso381845e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750783806; x=1751388606; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+e3hnOeuzSCQasYOAxsJ6u0yD/pA+ufnXI0wxwmTU+4=;
        b=nipYZHazQj9rcRwLocHP+skekngrzP/OUplc+RQ5zsvI8aaxeXGaUxegcr3NYYx9bc
         eycbpWaSU/yEvsVL21XmiRZ4nXQw7orloJX2rJPA/ojiE37NEdwot1tWSpT1RuODadZy
         d8DsB8YXhOsqyhYZWtaCq9TKTYhyxFmsEZ+FNDZ8FTx899ckwTYeuXmlwGcP839+Z0XR
         LQjE6n3vY53/0a73gFMBEeLS0kbK3mfbGF1+TDEyeU7nP7mB7BX2fmLgSpD2RVKTqcai
         y3PnIHABc6O8UsL2uGoiptGb9CJbLW2DzFXXgaTLSkDRi596+/4lCEmYgVaMXMk7EbCR
         Tfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783806; x=1751388606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+e3hnOeuzSCQasYOAxsJ6u0yD/pA+ufnXI0wxwmTU+4=;
        b=sbXQcNUr0VPhduaDFO3HrAkWBtRt02bKmQIHbPAOlJ1Gn4Wfs9k0mU+sQDsKsL7SSY
         7s/AB90D/9zcliFeT06LbWndkqYvijK9Td6iUb5RiVRsYTf/0wTpWi+Gg9bNAK0jdMkZ
         ywxvRtAoI64NY+yjzPWHi4R5XSmM6KPZRifn/JgYnrl9g5a329G8gUZXWNHceefuLhBT
         Ct1XSESxr9sjHfXk2sBbpasclaGFpjq6N5uywjoki1qo/hdwHSBDvJH5FOQyjOWMtaUG
         cMds6O4TxIzWfZDm2XElZSjOCxggBQ/f+3ozHqdMS26zZZgj5nJemBLg6r6THjsGW9Wd
         V8ag==
X-Forwarded-Encrypted: i=1; AJvYcCU93REpgpOLoNupeFHiDseABqSe7sHF+GQZoEcjWvcHzTKY3mlaJRgRvPPf3DKdG05GFNOrDaG+KqGLKbk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8QSd5mpRCOO5u+L5ru0HLog0NnO17h2Bb73YFBkLILoWOI2+L
	S21MQFqXOrVJMcxjEguH6E1PgCzJBccuerdHArOPgp/5ZOMjaAYuftLu
X-Gm-Gg: ASbGnctv2w5L5lbgHsntN9J0QuG2YTmLGwXdCtZZE1bCAik/V9a7vAgLkOZrIjmF94A
	2Nfk0bjoujr5aDYFoVutaIc087Qvn7hvhT9lWX212WuxGRqs59BiPyJAHutsz4eCpQpgKmAA3kv
	t4mEQasQ61lmRE6ndF3+JgtKQY+F7HFAddTo+s0cfyGqtw1GXQ6WUl3wPWA0uv2kQBaUy/T+H5z
	9yQMe/TaDjIxTCL2hPnRpHPuluuPv7wITdF7Uu7G7LgoYQ6+b5QNFQrpOKK8qpJZAeisaCnxzlE
	nVNd/EI0sbXF7Oni7e7o+/An6NEozuiLf99OSwdgt0u6roe31+yhKVUkyWcsqN7q60cr4HNWIIs
	42Iu7+m9WB71lYx+szs7AUV/Em9fKoiB4qmI=
X-Google-Smtp-Source: AGHT+IH0NW2taYrThKs/rmne2sj+/2+7M+BO+nO8dYgCHBW+cVa/eP5sOMngFZpqksHY5KrlSUEikw==
X-Received: by 2002:a05:600c:4706:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4537b79c3d0mr49670815e9.14.1750783805834;
        Tue, 24 Jun 2025 09:50:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1391sm147960395e9.9.2025.06.24.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:50:05 -0700 (PDT)
Date: Tue, 24 Jun 2025 17:50:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/5] powerpc: Implement masked user access
Message-ID: <20250624175001.148a768f@pumpkin>
In-Reply-To: <20250624131714.GG17294@gate.crashing.org>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<20250622172043.3fb0e54c@pumpkin>
	<ff2662ca-3b86-425b-97f8-3883f1018e83@csgroup.eu>
	<20250624131714.GG17294@gate.crashing.org>
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

On Tue, 24 Jun 2025 08:17:14 -0500
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> On Tue, Jun 24, 2025 at 07:27:47AM +0200, Christophe Leroy wrote:
> > Ah ok, I overlooked that, I didn't know the cmove instruction, seem 
> > similar to the isel instruction on powerpc e500.  
> 
> cmove does a move (register or memory) when some condition is true.

The destination of x86 'cmov' is always a register (only the source can be
memory - an is probably always read).
It is a also a computational instruction.
It may well always do the register write - hard to detect.

There is a planned new instruction that would do a conditional write
to memory - but not on any cpu yet.

> isel (which is base PowerPC, not something "e500" only) is a
> computational instruction, it copies one of two registers to a third,
> which of the two is decided by any bit in the condition register.

Does that mean it could be used for all the ppc cpu variants?

> But sure, seen from very far off both isel and cmove can be used to
> implement the ternary operator ("?:"), are similar in that way :-)

Which is exactly what you want to avoid speculation.

	David

> 
> 
> Segher


