Return-Path: <linuxppc-dev+bounces-11184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05993B316FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 14:07:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7f8546GSz30Nl;
	Fri, 22 Aug 2025 22:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755864453;
	cv=none; b=JJGNbH/rRAmrSNmiKzupivEqfMe0Zd9+AbzIlQ1kJ86woH1dL8de26bMYTeq5VyELuOcUKLc/xeMvhtKsSUnxZJVsNJKrE5WufhQHRW51v5tVMpFHusls+YL0IvUTaNUEOM1o2OgSii57vCiHn/4kfRTC1uaHW1M8f3tW7Ycll+fLHn26Udu/G0l3sWy1s2oeJ3lXx+WoP0ikQ/4YP+PifMUioHbv/MBm7UHJZZVw78gwuICYWXtQeZ1stTAqgDRxOUOnhHn+x6N/Jvfih3NK8eGHiZXzFZ1PwvvjYtWQZVKPnYylZwWLHzYFZL1CX4sOrALfXWJd17wX1MTKvlbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755864453; c=relaxed/relaxed;
	bh=G8l8c6RdN9SEwzhMIPJOr5f2j416dT55akZSctyPtco=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZaLmaVTkl8H+HGccDc6z9YE62nMDUt9yWRdNrMS9+zMhg4ufCEFYfe3rOqldY5TVsTFOhJlJrxv8KCyeEU4k4AGSEtK2DOtjoJFuy466PhRgYM2zaKb00/qPaQTBpAdBPH4BGDdBBMjLlkrylbGExZ5TuH+fAnULCuqNYkDipx1ljxtJ4bdYsF6h8OFnk9hMNGH3qq8AcfPl4T+MxqBX1t63bJXzYyRlAn090M2EmuS7/bOHCnXgQpfGb951Eeeg9wLJa7T1h6VPUzs8rfdmYu49tWPO6KtNUOcpjMQraiz6BGYyMAnt2e/ya21k9NUPKr45heiCQZfaeu8W4x5Uqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=maX29iR5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=maX29iR5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7f8426vqz3054
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 22:07:30 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso16109525e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755864446; x=1756469246; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8l8c6RdN9SEwzhMIPJOr5f2j416dT55akZSctyPtco=;
        b=maX29iR5rIdLS1H1wAZFGb8zP+7yR9cmdeItiL4BNs5DPQymkkMWvWsCWnoODJKDDl
         dPaBeCbYDl81Y7su0LTWmufHdAWVWFZ8Cd1YZKRoeMUKFGj/yIb8iNZ9s7YS8gKWICkE
         LBYUtQnff6581oo3vPAcsmO5CMIFYDiSS1RPmlNewfRMDZDvlQPNQMgvhVywIMsBFyPE
         fKXeXiA1QShmtQSKMLCK77/TRl5zPcinjUV2o9W1qyWo0yrq+s3m1/zeb6UK28TVh6vo
         /Mt7kZ+9vb8JHlv/bm1FE04cTsvfMed0JL+kZAg1GIft+i3ISNtT2hPxx1DMd6qBxlfz
         oEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864446; x=1756469246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8l8c6RdN9SEwzhMIPJOr5f2j416dT55akZSctyPtco=;
        b=t5rsEJok/Dcn40K90S07JXMnS0bacsU25z7EO3MKf2/0Ah/AdM64JnLgrwc15qAyLg
         5Tfe/j/wEgCTwRLT6qj1Uk7HkBtpRgw/wvYzbls7qzf8K05xmHC3ucIBGgO7oR5PZxXq
         clBigiMaHeg5h+FbITgTecEn7wHn2oZQiqFPY2zSIuAFVisSD5uv9IA1OxEb+rFqsyD/
         J1jmXkomwe1eDXuvyPLksp0tfAFoA9gNb8/d3M5YlgwGsEHwsc8iNNeCxIY7pvMKxW0+
         5fmB8aO7I7hleXPKeWgdXsCuMDKO0lK2jl1lsMk+6D0RFjWKpfKVRIrPNRVF1h9vvCut
         EjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE2IWCM390ohFqEOvK9K1t8YPCJ45ajBx3xBWryp/78eiCxe5vHKuEOTfEBJDb3X0ml6a5Jems3ZOoNN0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxYYnkKxbaguOIM/TVpzGgGzuwWFNC0GYOSpNbelDEPM0MceGy7
	/EIynQv619wSTbzTSbM5PMrp5t5v0ZLfwTg4m01ZyfwhFjeI1r7L2ZCE
X-Gm-Gg: ASbGncvx54nQBYSXQBCC5icDZQ8QGpooVyGqwZ9owxRNRboeKMozD4hLLrpUhTFqPFg
	oBezMa1xvs81PnWLHqHEE+2lKA1Lh5u14s+oPR+xkdYtc6OsYRGj+vYsi4Qd1DMDRkfLZMrvhmb
	jCaIOobCdN/DsTssVPpjHwMuslkcx/RyF09N+mflvgYqsVjxXcXpXz/cDn52WyOp1YcagVXJ5i2
	FV7kuDAnkxgsCrV5E0UPgF7ktYcMT7gBHgIjTW2rLYhBGB4geio9YfuKuaYS/ButezPV4oe9wLe
	VnPjdosqzNTBThyjBQCA0Aeqrm9efL8xjKn5wXVAdn6iRkOkomzCZGdldJ9Usy6jcjyCv37RtN1
	gysf0x3qooz86qf2BW91Yti5hyuv+eSZVAN/Ccta+opTCGGQ41Awli/0Atrr+jqNr
X-Google-Smtp-Source: AGHT+IF32esv8LZscvwNHgYR6ljsLtgAqraMmy0VAs35rpd70926148m7dEBX/SFBT9exOpIVVtZSg==
X-Received: by 2002:a5d:5d0f:0:b0:3b8:d0bb:7541 with SMTP id ffacd0b85a97d-3c5dc5426ccmr2223990f8f.40.1755864446093;
        Fri, 22 Aug 2025 05:07:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c5393b797csm5054822f8f.39.2025.08.22.05.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:07:25 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:04:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, "Andre
 Almeida" <andrealmeid@igalia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Daniel Borkmann
 <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-block@vger.kernel.org
Subject: Re: [PATCH v2 09/10] powerpc/32: Automatically adapt TASK_SIZE
 based on constraints
Message-ID: <20250822130420.6c6a3fce@pumpkin>
In-Reply-To: <db7f9b12d731d88ac612a27e2caf4d99d76472d2.1755854833.git.christophe.leroy@csgroup.eu>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
	<db7f9b12d731d88ac612a27e2caf4d99d76472d2.1755854833.git.christophe.leroy@csgroup.eu>
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

On Fri, 22 Aug 2025 11:58:05 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> At the time being, TASK_SIZE can be customized by the user via Kconfig
> but it is not possible to check all constraints in Kconfig. Impossible
> setups are detected at compile time with BUILD_BUG() but that leads
> to build failure when setting crazy values. It is not a problem on its
> own because the user will usually either use the default value or set
> a well thought value. However build robots generate crazy random
> configs that lead to build failures, and build robots see it as a
> regression every time a patch adds such a constraint.
> 
> So instead of failing the build when the custom TASK_SIZE is too
> big, just adjust it to the maximum possible value matching the setup.
> 
> Several architectures already calculate TASK_SIZE based on other
> parameters and options.
> 
> In order to do so, move MODULES_VADDR calculation into task_size_32.h
> and ensure that:
> - On book3s/32, userspace and module area have their own segments (256M)
> - On 8xx, userspace has its own full PGDIR entries (4M)
> 
> Then TASK_SIZE is garantied to be correct so remove related
                    ^ guaranteed

> BUILD_BUG()s.

