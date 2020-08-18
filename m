Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1AB247F13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:13:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW2FJ301KzDqZq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 17:13:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SqCc5C2P; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW2CY1QhDzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 17:11:51 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g15so4893674plj.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=CrbEfYzqGVLczm5FAPnHq9lBxUX25p3nCg06/2PxKL8=;
 b=SqCc5C2P2+OzX940ib7aQWLcknAtPBnidHv8+wA4pwsqJ3LSxbkwG2WVXLNAgZAAIu
 9Ot7+7eXamrSfBm+fBsF4Lk+35VL+fuMtKdnoEzOfntLwTYte3cecB0DN4SjUH72Qq+2
 ML7XRgmSogxMX52gS2PQYV6p9IwPKhmklrA44MTrCNXPAgfIZ+sU0JMqq2dt6yjtnvCM
 jzmHXLUtMX2nc81Ng2qbF3u5DHWAbji21lD5nQV6VPG/rv+l4P8IBgHPWDdlx9yLO8Eu
 NN/eSaOoFcsmo5i1+WFiyb/3A59Qkp3dopu9T257aQotD/qjzBEzQ48FEvKZz6BAc+sL
 GLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CrbEfYzqGVLczm5FAPnHq9lBxUX25p3nCg06/2PxKL8=;
 b=VT6p3K3+FIENumyl4wvMm7PNZfpI+v4LwRwB0P8Ms1DoMYhVPOivrZtoLZatScr0Xm
 JdAAnZnPuVvWHMwv4rbLp+O6Wy4QphlF0zGvLvJ8hm+VDINV2zw+Y9a1MuKm9Ts+ir2M
 T6/cCx+BvoLUbYXBAIWx7xZNSobGEZG2E+xHVMt6ihkTfAA/gOzRlPD6+l6HcCoKPQUV
 veBw3zZwpTC7Voi34KS4gfz3PWscicZtpbtf9Fz8pwXQYB8u8EpLe/fZJkLOBJrbis7h
 J9RwDWcf48y0DclxZg45lj82yjq4Vv+/x5pp98xMCNIlpI34ctGLkxBJKGXyOdg0hiFZ
 TfRQ==
X-Gm-Message-State: AOAM531LJGf7MDojbUw4tNyvHk8fWeCYnPx2GXHHAZJyqJ9SZSwClWZ3
 uE44nNqo7MO8Nt2hDYY6NmmxyFHg8vA=
X-Google-Smtp-Source: ABdhPJyODk5Yqdp4Hke6MG/c7WvZiFB9lhN4FOueoxsG7DYBhH5AKxLSQYEQFxVFh4sIC/N7wcfbjw==
X-Received: by 2002:a17:902:10e:: with SMTP id
 14mr13757113plb.297.1597734707551; 
 Tue, 18 Aug 2020 00:11:47 -0700 (PDT)
Received: from localhost (193-116-193-175.tpgi.com.au. [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id t10sm20145947pgp.15.2020.08.18.00.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 00:11:46 -0700 (PDT)
Date: Tue, 18 Aug 2020 17:11:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: remove PROT_SAO support
To: linuxppc-dev@lists.ozlabs.org, Shawn Anastasio <shawn@anastas.io>
References: <20200607120209.463501-1-npiggin@gmail.com>
 <0c74bf2c-beff-c13a-7cfc-83b7d0433963@anastas.io>
In-Reply-To: <0c74bf2c-beff-c13a-7cfc-83b7d0433963@anastas.io>
MIME-Version: 1.0
Message-Id: <1597733955.vlt37n2lw9.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Shawn Anastasio's message of August 18, 2020 5:14 am:
> I'm a bit concerned about the removal of PROT_SAO.
>=20
>  From what I can see, a feature like this would be extremely useful for
> emulating architectures with stronger memory models. QEMU's multi-
> threaded TCG project in particular looks like it would be a good
> candidate, since as far as I'm aware it is currently completely
> unable to perform strong-on-weak emulation.
>=20
> Without hardware support like SAO provides, the only way I could see
> to achieve this would be by emitting tons of unnecessary and costly
> memory barrier instructions.
>=20
> I understand that ISA 3.1 and POWER10 have dropped SAO, but as a POWER9
> user it seems a bit silly to have a potentially useful feature dropped
> from the kernel just because a future processor doesn't support it.
>=20
> Curious to hear more thoughts on this.

Very reasonable point.

The problem we're trying to get a handle on is live partition migration
where a running guest might be using SAO then get migrated to a P10. I
don't think we have a good way to handle this case. Potentially the
hypervisor could revoke the page tables if the guest is running in hash
mode and the guest kernel could be taught about that and sigbus the
process, but in radix the guest controls those page tables and the SAO
state and I don't think there's a way to cause it to take a fault.

I also don't know what the proprietary hypervisor does here.

We could add it back, default to n, or make it bare metal only, or
somehow try to block live migration to a later CPU without the faciliy.
I wouldn't be against that.

It would be very interesting to know how it performs in such a "real"
situation. I don't know how well POWER9 has optimised it -- it's
possible that it's not much better than putting lwsync after every load
or store.

Thanks,
Nick
