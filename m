Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53840854D2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 16:45:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=nLnIEsmc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZjFX1wz8z3h05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 02:45:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=nLnIEsmc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=paul.walmsley@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZjDn0Spcz3cDr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 02:44:39 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7bc332d49f6so271968639f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707925475; x=1708530275; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8H+tRUVl6VTTJ+I26hI6HADTZ0Un+fCkMERAMbKsgaY=;
        b=nLnIEsmcvPsS4SvFIgmg+VRFE7FzDS2M2oSxA6NnYEzyiXxV9KPLnpvi6h/4k6iRIl
         oJZkzo6+z0m9Y95nOOtXtjK8ME65HlBcCU38a6Gt5yNyBfPnybV1YeB78odF1B4ozqns
         yVlGZ/Y8NqkUapfqb35tIRIIM70npW8gILDa/ZOuyM47QIEbx27LHH090+q1MhcyMP0X
         k9n4QGZUqjmVvfuqOj63j1inBKwohYxWhXOwV5FKpFE9c0B/DiWk+gx8He7PbaZ8rnTb
         mwmuTM1d2Yhri3EH9zf/Z3dp8obVLlnqy+QgqJbaaagJuKvLjxEvVnkPLnHNA5mLDL3F
         rdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925475; x=1708530275;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8H+tRUVl6VTTJ+I26hI6HADTZ0Un+fCkMERAMbKsgaY=;
        b=dz20EYQ+nvvmnrHVVkV7sVVTH8xTF4nnmf3mkPhzOq+Rjmv2tEwsxvi1CfhKPJA/rb
         HNwRRmQ2yVH4uoh2OP0hJtlN05xBopZ760vZ92CDQdHdk8toQ2moS9l4l9GhFN4jLoEc
         0pzig3rUwEGshcOmrNSJj8ebIAiVSoVz3jZEElW1haBbj6MqcNnJAfmrF0Macz20j+g2
         9N9PwLou+PnHpZg7fqHHPaZjnCbWgUB7JXthOjruM1+ueDR++u8YgEu31uPxgt9/uHtK
         GtTHvi275R0wFGjVRx5gPhLLmgkzlcQx1uB0OTtHEc2CpSesWA78wojV1mTPESKzaKgg
         JRlA==
X-Forwarded-Encrypted: i=1; AJvYcCX+hSUwDzJJR2ndo5X1XXWtzQKmV5vNTziYHKjh9zjcoN/xwMB+V3vbwSmrpspfA/vTaW8TXRAvfC3XuIEWVQWf/SI6qwYWUzvbCMpN5w==
X-Gm-Message-State: AOJu0YwLxhd+1Jsq9CQ5HGbLyPXa2DvIrepW39KaYmatqUK1Q62e+e/b
	rJe6FgmOGHidWol9mtiE2cDlca4E8wyMy8rCJh+idnHPv9cce03wbawt69suax0=
X-Google-Smtp-Source: AGHT+IFSYvJVra1vjtWRcKFPj8EVyDWmX9NPiOhHx5QSIIUGMlUmsQm/kaGm5mHv2EhcHDI6PNBp7Q==
X-Received: by 2002:a05:6602:5c2:b0:7c4:6b0f:ee7 with SMTP id w2-20020a05660205c200b007c46b0f0ee7mr3689037iox.7.1707925475720;
        Wed, 14 Feb 2024 07:44:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVppKyfQx+1K0Z9etHaCtXFjcZ0ltuX51rMZRw8r7Hn3rqRCqUQHSe34BMQK/vibc3EGnEXzCUDXX4aJ4y12fqw+eikFKbJZP5ND+IEH7dP2qbcptphPDaBqWt6hz5g9bUIJV9GCWSVWJQfbnnJCnu+LWiS+SRarXPQRnWJTg09a0MPqcpWI1tHAeJJhPB9tsBX2LLa5o0Ei26c6kfq9Z/xqc6LTR/9BVl/cNEVsrCWD6pzUEwyt1h8UvE1LbIBZ3ZLy4AoX8qKzUhS5qD94rXCEkllJmhGAkmWyzjq/AkRUe6mlU60S889xjiUSdlaavBP8ScOM07xOKaOA9kzG7a5an3KUfuaOFIjoK/zPTvrWtL54g==
Received: from localhost (c-98-32-39-159.hsd1.nm.comcast.net. [98.32.39.159])
        by smtp.gmail.com with ESMTPSA id a26-20020a02ac1a000000b0047133a05f33sm2484253jao.49.2024.02.14.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 07:44:35 -0800 (PST)
Date: Wed, 14 Feb 2024 07:44:33 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by
 default
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
Message-ID: <0e41108b-2a64-2144-34f1-e7c0f1ec952f@sifive.com>
References: <20240214153429.16484-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: apatel@ventanamicro.com, Emil Renner Berthing <kernel@esmil.dk>, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Feb 2024, Palmer Dabbelt wrote:

> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The new SBI console has the same problem as the old one: there's only
> one shared backing hardware and no synchronization, so the two drivers
> end up stepping on each other.  This was the same issue the old SBI-0.1
> console drivers had, but that was disabled by default when SBI-0.1 was.
> 
> So just mark the new driver as nonportable.
> 
> Reported-by: Emil Renner Berthing <kernel@esmil.dk>
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul
