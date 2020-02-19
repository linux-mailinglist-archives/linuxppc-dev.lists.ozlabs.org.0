Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F9C1642E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 12:05:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Mvyd316YzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 22:05:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UAyZSZRb; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Mvx63zfZzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 22:04:10 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id y8so9412284pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 03:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=emwrNMNz/+5caxVEhEQPNZ9qcBrCFvTbWghUK4RKCTI=;
 b=UAyZSZRbyc8vRQR/AVxC6hJ1rhtdPw0nKRsJPzMcA5lBZyfQsGFrEaKwfI239ROhjE
 yrOQWekX/cCO2qgpaa9eLnVUuxnR2l8eBqAOAvvGEQ46Mtypz+TxUZV8cNZ8rHlQueMl
 JnKR59X9vIXn7YHm31qut9pAKpkdDsneaqucul8ntUyQ6X4ry+iL7lUzXD9HK7MeHC4Q
 0k1L4TCvijVuqHfLXrMxxLQ8n2Aa+PiNcVoDzR+Cb/VnC6RXc9vIk6p55gMTFCj4hIJ9
 oX+HjdZPEkA7RuXuwWqU1ogOGVuLf/6OUYCOJ9CQpCU+wxcjqau/EIGJ6cTrjnZIOT1U
 oH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=emwrNMNz/+5caxVEhEQPNZ9qcBrCFvTbWghUK4RKCTI=;
 b=sH+fYi+2KFYB9HaWAwJb6TkDF7ETk6AwW3leDW5WwbO+oG6F7/C8qZtHwbkLO+B9IB
 3Pr1yRq1iq0rvExnScnLDue8EgtndLzxIhTUX8bG/jDyzEvw8F/4EGN5U+yqb7yZl6u4
 2Bq475JgVtZEQCL1+APdbm8j3RwFv+VHbueRynw8Yx5BqqGdGxyL/OgLOoy9r/Tz/Gb0
 ALyA+qswZxxvCyh9MdS4foVb8zajSP4fNyeqx/mptfABdZ00YK8G3qjuNsgQ/Q4OwDTH
 W7M5cLm/2/fSRQb738ibfCMsDvJe1/jSt/vXGWJetv/CvDPb3jeIjGbH6EdrmmVMNhk8
 kH3Q==
X-Gm-Message-State: APjAAAUYmKNeN+uhmHC5St+X1Du8TjA23OFq34ZVEu/JNLh+hzneq3qj
 mENoKEGm5K20tsohn6It3nVK+Pxb
X-Google-Smtp-Source: APXvYqxptAnoauMYJXuvcT8nVPl1yQ7O+Nq4I3TqHw26nQHpX9UBNt4q0zItY6IfZvors13m4eYqog==
X-Received: by 2002:a17:902:5a0c:: with SMTP id
 q12mr25503370pli.301.1582110246766; 
 Wed, 19 Feb 2020 03:04:06 -0800 (PST)
Received: from localhost (193-116-115-193.tpgi.com.au. [193.116.115.193])
 by smtp.gmail.com with ESMTPSA id b3sm2469130pft.73.2020.02.19.03.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 03:04:06 -0800 (PST)
Date: Wed, 19 Feb 2020 21:03:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Libc-alpha Mailing List <libc-alpha@sourceware.org>,
 linuxppc-dev@lists.ozlabs.org, Tulio Magno Quites Machado Filho
 <tuliom@ascii.art.br>
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <cd9e4b28-d577-8850-7c2b-a488fcb4740d@linaro.org>
 <1580273424.ea818exa2c.astroid@bobo.none> <874kwe8dm7.fsf@linux.ibm.com>
In-Reply-To: <874kwe8dm7.fsf@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582110052.mzie4hrb7b.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tulio Magno Quites Machado Filho's on January 30, 2020 1:51 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Adhemerval Zanella's on January 29, 2020 3:26 am:
>>>=20
>>> We already had to push a similar hack where glibc used to abort transac=
tions
>>> prior syscalls to avoid some side-effects on kernel (commit 56cf2763819=
d2f).
>>> It was eventually removed from syscall handling by f0458cf4f9ff3d870, w=
here
>>> we only enable TLE if kernel suppors PPC_FEATURE2_HTM_NOSC.
>>>=20
>>> The transaction syscall abort used to read a variable directly from TCB=
,
>>> so this could be an option. I would expect that we could optimize it wh=
ere
>>> if glibc is building against a recent kernel and compiler is building
>>> for a ISA 3.0+ cpu we could remove the 'sc' code.
>>>=20
>>
>> We would just have to be careful of running on ISA 3.0 CPUs on older
>> kernels which do not support scv.
>=20
> Can we assume that, if a syscall is available through sc it's also availa=
ble
> in scv 0?

Was on vacation, thanks for waiting.

Yes, except for the difference in calling convention, we would require
that the syscalls available to `sc` is exactly the same as `scv 0`. This
happens as a natural consequence of the kernel implementation which
re-uses code to select the syscall.

>=20
> Because if that's true, I believe your suggestion to interpret PPC_FEATUR=
E2_SCV
> as scv 0 support would be helpful to provide this support via IFUNC even
> when glibc is built using --with-cpu=3Dpower8, which is the most common s=
cenario
> in ppc64le.
>=20
> In that scenario, it seems new HWCAP bits for new vectors wouldn't be too
> frequent, which was the only downside of this proposal.

Okay good feedback, thanks.

Thanks,
Nick
=
