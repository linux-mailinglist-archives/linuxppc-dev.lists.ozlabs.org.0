Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547682C572
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 19:31:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=f1Kys5h3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBVVV0FVvz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 05:31:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=f1Kys5h3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBVTd021Vz3bXk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 05:30:43 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3bc09844f29so5502618b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705084238; x=1705689038; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y9RFKMR0FSPqYNNO9hPu+QHh0esMWSorBv6pzr/qFM=;
        b=f1Kys5h3NSe999slSUcGyd108WAPFJnbriruOLQu9wDdT6shBP26JsAOh2wXOoHdLK
         wYQoWtUIPqj+3Q+W70lwuJH+rLPXJW/6s7XGdmOE1er13VMdB6zgEJcSNs7d+jnIZwz/
         4h9GCZd/PRNgZUKlKUiv73le9u0q4RlSQMChso8bo+0RgB0pKGHiyv1/QIiyewtFbGJN
         0o8/f6foRH/Rrpan21pMmPG3sN7yFnqg8w2v9hL6RavhpJGv4IX3T+cgsMoxp6qbWw7V
         1Gwpvli+4r+OA35+CSvqXsu4xIr8TfROw/cClGaYC3oq0UidwDxUPAYC2grKCE/VuEGs
         Y3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705084238; x=1705689038;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y9RFKMR0FSPqYNNO9hPu+QHh0esMWSorBv6pzr/qFM=;
        b=P81LMoTEJvJelJ+YCsErjEb8s4TJv4pvJZ2nDTTkhCKZE2tfvnAfGTvUu2CHgadSkx
         B4CMPMJTYwdkjgisYVLUR6afdr43hPInPKj86EWx+aoMUQm0NbIjS6WHDgnia90PaMyL
         SzzOF4AW0znMgDaYZ0GExVSmPWy4+qdV5S4kjOeSDNM1NekT69LNTUXVe3aRWvCN7QX9
         dzOCA1E0K9SowivJiPqS5mvIHe0CPWvnrUCjek7tm0Uh7Ie2D8x9qxZGY7U47OZM3IcO
         MWdJZM0a0OMtpHG+PKa0ad8J+jkh3jhpSNdJK1tn7gJLOU5Govxf5PI2FE4NU7zVRySO
         u4lw==
X-Gm-Message-State: AOJu0YzXaSVWIDJ1hm1YbITpoEYfYRiQepuNIZpkup0LfLPBDjrjxfwW
	pGONp+sLx/zUNM7sIAueEOX4j9gumTCt2w==
X-Google-Smtp-Source: AGHT+IF1BUZm9MFACP928AtwGap6NZre7MHtBSqet5vC3dqPxL0czPLn7Q0DKWE2Rm3d/VpIQYiTIg==
X-Received: by 2002:a05:6808:3a14:b0:3bd:5f84:b599 with SMTP id gr20-20020a0568083a1400b003bd5f84b599mr2083047oib.109.1705084238187;
        Fri, 12 Jan 2024 10:30:38 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id n17-20020a0568080a1100b003bc144dc4f5sm669050oij.1.2024.01.12.10.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 10:30:37 -0800 (PST)
Date: Fri, 12 Jan 2024 10:30:37 -0800 (PST)
X-Google-Original-Date: Fri, 12 Jan 2024 10:30:23 PST (-0800)
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
In-Reply-To: <170498463783.20080.10723421328706946354.git-patchwork-notify@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com, Greg KH <gregkh@linuxfoundation.org>, nathan@kernel.org
Message-ID: <mhng-2a34d0e2-170f-47a5-a688-ab454a70f06b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Jan 2024 06:50:37 PST (-0800), patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
>
> This series was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>
> On Fri, 24 Nov 2023 12:39:00 +0530 you wrote:
>> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
>> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
>> functions sbi_console_putchar() and sbi_console_getchar().
>> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
>>
>> This series adds support for SBI debug console (DBCN) extension in
>> Linux RISC-V.
>>
>> [...]
>
> Here is the summary with links:
>   - [v5,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
>     https://git.kernel.org/riscv/c/f503b167b660
>   - [v5,2/5] RISC-V: Add SBI debug console helper routines
>     https://git.kernel.org/riscv/c/f43fabf444ca
>   - [v5,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
>     https://git.kernel.org/riscv/c/c77bf3607a0f
>   - [v5,4/5] tty: Add SBI debug console support to HVC SBI driver
>     https://git.kernel.org/riscv/c/88ead68e764c
>   - [v5,5/5] RISC-V: Enable SBI based earlycon support
>     https://git.kernel.org/riscv/c/50942ad6ddb5
>
> You are awesome, thank you!

Nathan points out that this has some semantic conflicts with a patch in 
Greg's TTY tree: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?id=f32fcbedbe9290565e4eac3fd7c4c451d5478787

So I think the best bet is to wait on Greg's patch to land in Linus' 
tree, and then base a v6 of this patch set on that merged patch.  I'm 
going to drop this one from for-next.
