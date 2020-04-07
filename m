Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E590C1A03D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 02:30:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x7b94XWLzDqxW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:29:57 +1000 (AEST)
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
 header.s=20161025 header.b=utepuFsA; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x7YR4d0gzDqmT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 10:28:25 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id k15so8455296pfh.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 17:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=lUrQEjas9LyAD7t4uBRXKepPh+kc7mCeSR7ByaIVLxM=;
 b=utepuFsAgCGVrQNm105LCP3VGpoDyYIztLJkGNzysn8V6DNXIn28TDRMjfjj1gR2BL
 MBDFjQT5pphQJhTLWSBKVliMfaeRt0+H43bb1LMpWUfUgTq7zpC+1IFdSF5qOrvLmx6Y
 S95d1hEn6eAf2hs9UvHWKHEZUzJ1aLItVFkF0yrGPRPfWbt3uDxNlTCoTpBuOzw473oj
 DkgcLUl4QTAHkxbeM1ihwvCbXYjVk0XDTOxvyMwH8Mg5iMMdSgyQ31z5XDtdhEH+Ak2f
 toMYHaJodfIQx6VJNAiRxV3kTrvpMwBQg6Ru6Aak3Uud/upHN8bmNnpAGk59aLDkjpvX
 ZekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=lUrQEjas9LyAD7t4uBRXKepPh+kc7mCeSR7ByaIVLxM=;
 b=TXkeUyyjLkusJrdZ5X4opIbnvNonNenJN5NesolhrlIGy3XA6t05CbVegS29w7Lr6N
 P/IQm/4Z7zOTGRLFbwEAplDprphWC++lTzb9xIvW4A+jH0wn6HEmDh9TjvngHjv1J6gV
 20eK8wTsC+Kpgl3gQaPG85hV+WHchbjx5LVNVtC/ktQXEKFwlv3cN1HNQggqrVCcS+BM
 w9DOn0QCc/vs8ZIuXMlE2Wqg0YbL7Z1kWV+d5gKcyfWUJOX4CUCWuExvPFnB/IMlJ8qF
 XzWc0EUd/lSuWVd5n0wbMP+LXAaeNCoB+19IqGTSniAXXYGswifCDVN3husNN4g1gQRm
 4MVQ==
X-Gm-Message-State: AGi0PuZWl3QRxX6JcEEZidsXqjjf2K4vX217j3eCmf1DbbskSmWbYX77
 iJm+QwariGcKnYMSfPtNsvYPQ134
X-Google-Smtp-Source: APiQypL8KF2u89jekKB31NajaeIR1jJV1MTZAwcHEpViXoLNTQO3q4pnc4wwC3IusIfGrjn70laCGQ==
X-Received: by 2002:a63:db10:: with SMTP id e16mr1548594pgg.361.1586219302200; 
 Mon, 06 Apr 2020 17:28:22 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id 8sm1762515pfz.12.2020.04.06.17.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 17:28:21 -0700 (PDT)
Date: Tue, 07 Apr 2020 10:26:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 12/13] powerpc/kernel: Do not inconditionally save
 non volatile registers on system call
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <4ef6d617cfd34e09e9bf5a456b2e0b6d2a8a3c96.1586108649.git.christophe.leroy@c-s.fr>
 <1586135554.pnqaj0giue.astroid@bobo.none>
 <48d3e2e5-318f-011e-a59b-ec89bd7b76d2@c-s.fr>
In-Reply-To: <48d3e2e5-318f-011e-a59b-ec89bd7b76d2@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586218971.lolwg4f0lh.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 7, 2020 4:18 am:
>=20
>=20
> Le 06/04/2020 =C3=A0 03:25, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Christophe Leroy's on April 6, 2020 3:44 am:
>>> Before : 347 cycles on null_syscall
>>> After  : 327 cycles on null_syscall
>>=20
>> The problem I had doing this is that signal delivery wnats full regs,
>> and you don't know if you have a signal pending ahead of time if you
>> have interrupts enabled.
>>=20
>> I began to try bailing out back to asm to save nvgprs and call again.
>> I think that can be made to work, but it is more complication in asm,
>> and I soon found that 64s CPUs don't care about NVGPRs too much so it's
>> nice to get rid of the !fullregs state.
>=20
> I tried a new way in v3, please have a look. I split=20
> syscall_exit_prepare() in 3 parts and the result is unexpected: it is=20
> better than before the series (307 cycles now versus 311 cycles with=20
> full ASM syscall entry/exit).

Great! Well I don't really see a problem with how you changed the C code=20
around. I'll have to look at the assembly but I don't think it would=20
have caused a problem for 64s.

Thanks,
Nick
=
