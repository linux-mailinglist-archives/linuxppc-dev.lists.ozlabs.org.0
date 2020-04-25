Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FE1B8379
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 05:34:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498Gr70myRzDr7j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 13:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GUGSdyJ/; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498GpY4GLJzDqlS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 13:33:22 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id h69so5586771pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 20:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zq/PxwzV2d2pv7ZxLs5gTdqBJ4G3tFPgkx7FiWQoE1Q=;
 b=GUGSdyJ/mRmE8koXK42Ga/MJmPG5a1DXTZ7gf88UwoLctcvaQXOfPlaYW5lisOx1KA
 9m+fCwbnq8AS27zCet4Rl48xj7kn4s4rmL9eeqPVkXm4RMJKR2iOuAhGtMjdiIbrMobZ
 o3gQCqxcrWBIWh+/6Y98Jns63TXjaXVfYH7m8UNkr7ZAYQjUxsM+SLM+Yb15VKwiPaFy
 qypYyYhuib8SGUPE+THlhoQptaVeYbLRMLt5X7dnooXECesUzBX0qofe4G1pWvYicPL3
 CHUDCPCbpp7EKYMYq5aNBuUa7ykP/nNiWegbopMHmVzDAIWjMae9RGJk5sRnMjx+j8xN
 5W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zq/PxwzV2d2pv7ZxLs5gTdqBJ4G3tFPgkx7FiWQoE1Q=;
 b=VcORYyim1XzcpVx4ZMvGL58o0woONe4vnrir6J6u5ZKgtSRf5IKgT8JTRvwpYmQK4p
 mbU0apqe6ts37IvAAuR3ImD2/GNUx637C3NjwSngCHxlwXuLgaGF65qBD2UImEQSZLlh
 dEKJzaxX4b8FWtU8tf0eCGvlHh/dPdYimCQhfp2oDeZmkb16GX6qWqlkvl2ATQpnm7Bp
 SfIHlIcNgGWnxUlO2j7oRbcf5JoIA3somtiswuBTAOl66Ad2mc/zzwpPG4+szes42cRP
 CqRg2V1hUI6uGUG24SlDtgwSBAoiKyJef2DZ+mzpjPLKODhJMPpjiXKjgx+8toFzJtf8
 cdiA==
X-Gm-Message-State: AGi0Pua+xmBdewvkW3Vrj60CR8QbJYnF0KVjv5a4ll9xbZlFBcqUPQmC
 SWJsDtLJtTJxVvq2v7LanM4=
X-Google-Smtp-Source: APiQypLZeLwCzg/ULJrK5hnsg/ulTWDl8qxC/67iRD5FVpsWwjGkOdxbOKIQClArFWUlnfmy8ToYQw==
X-Received: by 2002:a63:e94f:: with SMTP id q15mr12534145pgj.339.1587785599218; 
 Fri, 24 Apr 2020 20:33:19 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id x16sm6977578pfm.146.2020.04.24.20.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 20:33:18 -0700 (PDT)
Date: Sat, 25 Apr 2020 13:30:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <20200420013412.GZ11469@brightrain.aerifal.cx>
 <1587348538.l1ioqml73m.astroid@bobo.none>
 <20200420040926.GA11469@brightrain.aerifal.cx>
 <1587356128.aslvdnmtbw.astroid@bobo.none>
 <20200420172715.GC11469@brightrain.aerifal.cx>
 <1587531042.1qvc287tsc.astroid@bobo.none>
 <20200423023642.GP11469@brightrain.aerifal.cx>
In-Reply-To: <20200423023642.GP11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587784441.81hgf5xa06.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 23, 2020 12:36 pm:
> On Wed, Apr 22, 2020 at 04:18:36PM +1000, Nicholas Piggin wrote:
>> Yeah I had a bit of a play around with musl (which is very nice code I
>> must say). The powerpc64 syscall asm is missing ctr clobber by the way. =
=20
>> Fortunately adding it doesn't change code generation for me, but it=20
>> should be fixed. glibc had the same bug at one point I think (probably=20
>> due to syscall ABI documentation not existing -- something now lives in=20
>> linux/Documentation/powerpc/syscall64-abi.rst).
>=20
> Do you know anywhere I can read about the ctr issue, possibly the
> relevant glibc bug report? I'm not particularly familiar with ppc
> register file (at least I have to refamiliarize myself every time I
> work on this stuff) so it'd be nice to understand what's
> potentially-wrong now.

Ah I was misremembering, glibc was (and still is) actually missing cr=20
clobbers from its "vsyscall", probably because it copied syscall which=20
only clobbers cr0, but vsyscall clobbers cr0-1,5-7 like a normal=20
function call.

musl is missing the ctr register clobber from syscalls.

powerpc has gpr0-31 GPRs, cr0-7 condition regs, and lr and ctr branch=20
registers (lr is generally used for function returns, ctr for other=20
indirect branches). ctr is volatile (caller saved) across C function=20
calls, and sc system calls on Linux.

Thanks,
Nick
