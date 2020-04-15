Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7301AB370
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 23:47:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492bY43SN2zDrBn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 07:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ooWXTcG2; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492bWL1bJDzDr8L
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 07:45:33 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id k15so636225pfh.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 14:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=AEaYw32qnHlvF+/j3/Jvpgo3bfQkRcMMSHiXyI3G7Uw=;
 b=ooWXTcG2n+F1Ludh7geY+v152Ci0b/SMH/EjqYeA6vMhJ9cH4deQTmEUOcQe9yEDqb
 HAdSVPE8LaPk8d1rsj9zw4Blysf+sPK8r6pz3GcBU0gIBECUr2NAyd707aRRJqKSXwZa
 K7O6br4ykUhJ5PX3zU72zbZ0GaEDLrzxUoOf3U5ihERQXRPKE0DiYs5jcM9hqla/xFMc
 z3k2zsbgs18Evq70hrAoCXh9ncj5El7fXiTel4Hbi12tVoK3H6TKyGYtG2F3sUXWep37
 qRC0MPmYyGPBwLDss8ATQ6/Jl/5a0luUTxYmc1v5O2A9KXzek1Qmya6MYV737HpK7A5y
 kXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=AEaYw32qnHlvF+/j3/Jvpgo3bfQkRcMMSHiXyI3G7Uw=;
 b=niJgpwbKGXftZWqma5EHzlbe3d0D4LfST9cGyAvGCIUn6vk8GMq1y0LldxYYQGFJhq
 NIl8tEgsXSC8N727IZ6hbPjs89aRLgRsqUjIBJ1ja+LcXUzJzJhXhLdFF/auXlFi6j8O
 UPbhCHuUqZeb70sK8JuyJIOLrY2GEBiLTsfwI/lE6v5JrxnlxE58+yK8O2DIDMERdAoe
 VLGr1dhF2OOD1a6aEWF3OeAdd4aWAyHmWCtHf4Zu+kq5erpAO5NJGh+SRou4P4q03X+a
 2V+qq7EPbqAsrkmLcNYLHmsBQXGuevo+fI2V6GsEaFwgc6guPV2XCzLsNaDOOXzDmfNM
 ocFQ==
X-Gm-Message-State: AGi0PuZ4pGYI7NlBKgm9V9SQ76EXk3BP1+Jd4IpOIgAxT8Tf45cvUmWN
 NDC0CkGmFjGzIkpHUSVq7DDYTV7M
X-Google-Smtp-Source: APiQypJWoBYoWAm7oki13Exmax+mrhiZhgvqqJoR2FMRTLGjgFCJvvugMY5vDPvbr1AOSRrFApd/Vw==
X-Received: by 2002:a63:c007:: with SMTP id h7mr28169254pgg.428.1586987130406; 
 Wed, 15 Apr 2020 14:45:30 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id g11sm505015pjs.17.2020.04.15.14.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 14:45:29 -0700 (PDT)
Date: Thu, 16 Apr 2020 07:45:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Powerpc Linux 'scv' system call ABI proposal take 2
To: linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Message-Id: <1586931450.ub4c8cq8dj.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I would like to enable Linux support for the powerpc 'scv' instruction,
as a faster system call instruction.

This requires two things to be defined: Firstly a way to advertise to=20
userspace that kernel supports scv, and a way to allocate and advertise
support for individual scv vectors. Secondly, a calling convention ABI
for this new instruction.

Thanks to those who commented last time, since then I have removed my
answered questions and unpopular alternatives but you can find them
here

https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-January/203545.html

Let me try one more with a wider cc list, and then we'll get something
merged. Any questions or counter-opinions are welcome.

System Call Vectored (scv) ABI
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

The scv instruction is introduced with POWER9 / ISA3, it comes with an
rfscv counter-part. The benefit of these instructions is performance
(trading slower SRR0/1 with faster LR/CTR registers, and entering the
kernel with MSR[EE] and MSR[RI] left enabled, which can reduce MSR=20
updates. The scv instruction has 128 interrupt entry points (not enough=20
to cover the Linux system call space).

The proposal is to assign scv numbers very conservatively and allocate=20
them as individual HWCAP features as we add support for more. The zero=20
vector ('scv 0') will be used for normal system calls, equivalent to 'sc'.

Advertisement

Linux has not enabled FSCR[SCV] yet, so the instruction will cause a
SIGILL in current environments. Linux has defined a HWCAP2 bit=20
PPC_FEATURE2_SCV for SCV support, but does not set it.

When scv instruction support and the scv 0 vector for system calls are=20
added, PPC_FEATURE2_SCV will indicate support for these. Other vectors=20
should not be used without future HWCAP bits indicating support, which is
how we will allocate them. (Should unallocated ones generate SIGILL, or
return -ENOSYS in r3?)

Calling convention

The proposal is for scv 0 to provide the standard Linux system call ABI=20
with the following differences from sc convention[1]:

- LR is to be volatile across scv calls. This is necessary because the=20
  scv instruction clobbers LR. From previous discussion, this should be=20
  possible to deal with in GCC clobbers and CFI.

- CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow the
  kernel system call exit to avoid restoring the CR register (although=20
  we probably still would anyway to avoid information leak).

- Error handling: I think the consensus has been to move to using negative
  return value in r3 rather than CR0[SO]=3D1 to indicate error, which match=
es
  most other architectures and is closer to a function call.

The number of scratch registers (r9-r12) at kernel entry seems=20
sufficient that we don't have any costly spilling, patch is here[2]. =20

[1] https://github.com/torvalds/linux/blob/master/Documentation/powerpc/sys=
call64-abi.rst
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204840.ht=
ml

