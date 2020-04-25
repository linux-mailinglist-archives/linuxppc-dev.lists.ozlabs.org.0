Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2231B83D3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 07:27:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498KKt6MD5zDr6t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 15:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ndMz/kmB; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498KJK3L3GzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 15:25:52 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id k18so4557133pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 22:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=2HOADhTkAeksIfTBCZQLnFFLjEGrFQSgemgFeHgUpTQ=;
 b=ndMz/kmBh0Ub/KAdOAf+xOuLKJ9R4AuOt08zym3J7hyPMFLCrhvjF3BnoD9T6++2+a
 RpUC6wTv6p9uhBfsVc6WWsplAIQokLQlbrCsmDT0oo+iE4HL+NorP9rTzOile2m1tnvM
 I94s4tO15J3hjs/eAQRr5gcKKP4u53KDMQBH2484RPkobM3mU6sFR4b+lw2xa14d8wTY
 b1MvJ92TTFMgChp+O974pPWaRWJJWZjkOXAL2k1Zs4gD+YJby8C+QOdruAtvTPve4hjR
 ebePR8Fkta5Ze763UosgH211HYrq8X5TGW26oSXnX0TuiZ7xOr2w7RZ2QIAyMxiMhL/W
 FJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=2HOADhTkAeksIfTBCZQLnFFLjEGrFQSgemgFeHgUpTQ=;
 b=sRX9H7rmYzUw1X9yL6ws1hDva9HT50OO1+dl438ryr6rHFOPtMq0vS4XOKP8QMWC5g
 glJKVBZHRr5VC0LiIsOAgB5hjuSmXHkNBvkHIQbQMvmOLjwb+41UqrSxTPYzeTivTdbB
 gTB9LsU0mUroUViWFFw03fgsORTD+cHWCSKi4Dz/Y5538IIU8ms69ZOFkIL5pnxG/9go
 zEjzp3+fbMi12YEIlzAfOqhrfacyJYM+qlNmS8hcwdFmEYjOhsKvC70x+u0Na4/dwXD5
 1CwdXGRYP2+tjFXmlFuux8yg0QaWspetpC/ILuBspHdTB1IV4ZPZxq1SnfzWCuRMCK7Y
 x8kg==
X-Gm-Message-State: AGi0PuYJw9MAFfZ1IhH67jvpZjdXIZPGVr9mW4T/jnpXqNQPkRJf3YPm
 52CJmS9go+c6/tDOqJ+DmFE+bRuo
X-Google-Smtp-Source: APiQypIYBLaRpub6XaHOpLMaYg70Dxmn7zJlSNgCHVkcOFtI2rc8iaGSvVraXD4RSzeizrLJf5oqIw==
X-Received: by 2002:a17:90b:8c4:: with SMTP id
 ds4mr4964810pjb.133.1587792349141; 
 Fri, 24 Apr 2020 22:25:49 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id y10sm7227890pfb.53.2020.04.24.22.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 22:25:48 -0700 (PDT)
Date: Sat, 25 Apr 2020 15:22:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: New powerpc vdso calling convention
To: linuxppc-dev@lists.ozlabs.org, binutils@sourceware.org
MIME-Version: 1.0
Message-Id: <1587790194.w180xsw5be.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: libc-dev@lists.llvm.org, Rich Felker <dalias@libc.org>,
 libc-alpha@sourceware.org, Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As noted in the 'scv' thread, powerpc's vdso calling convention does not=20
match the C ELF ABI calling convention (or the proposed scv convention).
I think we could implement a new ABI by basically duplicating function
entry points with different names.

The ELF v2 ABI convention would suit it well, because the caller already
requires the function address for ctr, so having it in r12 will=20
eliminate the need for address calculation, which suits the vdso data=20
page access.

Is there a need for ELF v1 specific calls as well, or could those just be=20
deprecated and remain on existing functions or required to use the ELF=20
v2 calls using asm wrappers?

Is there a good reason for the system call fallback to go in the vdso=20
function rather than have the caller handle it?

Thanks,
Nick
