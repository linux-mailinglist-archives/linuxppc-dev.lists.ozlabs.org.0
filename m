Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6AD8FA9C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 07:14:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R/SZlq65;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtf062X3Bz3c3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 15:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R/SZlq65;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtdzL55SPz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 15:13:33 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f62fae8c1aso33041575ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717478011; x=1718082811; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT7SfBTLOwpc/YXnH4XWcLEq77fXjMD17/6UtGiAP8o=;
        b=R/SZlq65mxCJgA4gErbOD/WXreTtB9S78K+jrq2HpVKyBdVHxeKH267qAk0djbfjqw
         PybVNfzkZ0a1AxzSJsPdyKDFqKBegSGazUJs5gTIExjM5VgqIOEwPb16bC+64EQ/0KAl
         nXr8ttt9UQk83Pdl50eV1wZ/xqKRaITEbAuFoHgy/Nf2EwV0SgRUZbrwmiKzR7sydWTX
         A9uLfKS6c5UgFkmzTboQgQ8DgOymgm29W3OWIz9zfMlxmrvb/DK7IsqOIK2/jFrFlhIz
         STYPfyOsMOCp0vddlUgMjGT5iepllVOuA0WVPW6aSm9oCMIFvTLXkzG2C7iWMfHleCDU
         BcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717478011; x=1718082811;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GT7SfBTLOwpc/YXnH4XWcLEq77fXjMD17/6UtGiAP8o=;
        b=AhIYXFmxql8+I7la5rq5Ampz8PyYtGzZ19I424TwZTAHBI+UEgXsN3lqOS+EjQjyts
         kbMJP+njbeWa084TPF3MF94q0TKGY1H858femz4Zgjhnhmk8EnsYb6MOg42gE+ZUBxOi
         /jLDgFuT+bH0qMU/JXXeaeOKGq0BW/20ucMUP/WaUhfS50hTPeQhyaqhERfNC+Mvpsho
         5i8ZoF9/FyxOMKDW51PmhmusG8thAOzsvA2ojphbxuSaCkHAEl6VY9Bv3l+jn47OvhaZ
         Bznrs5FLTvRLAt+nbdA7FLcmIb9YTnAhrkZ4zpQ7aNzAqndibuAjCq+oVYZ1nF0Rmbbc
         QFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFNMJBxQNpH+/lZ1ZFTcexjnL9OJASVJ4r/f8ANOJ9xINcw6UGR7L1APD2xY5yZqCleyjyKIbW4HavqNflHwYzjnZoenM84maw9D4l2Q==
X-Gm-Message-State: AOJu0YxEsOf15M4Pt2jgqRShOYfPEuevpNTDBPCnzOkY5GPheuri/pgB
	SxOyPZQpcFwxz+hP95gWpcaYxP702hk4kw50N1q/Wt+mvIB/WgtX
X-Google-Smtp-Source: AGHT+IFKbc5LjfirCcL45hrRasbp0xZlyYx9lCORURuAdAoEsU4e3Bn/DyFE6rfUbq7e8XuWC9Sp8w==
X-Received: by 2002:a17:903:1109:b0:1f4:b7ff:ac4a with SMTP id d9443c01a7336-1f6370453a9mr122074735ad.37.1717478011071;
        Mon, 03 Jun 2024 22:13:31 -0700 (PDT)
Received: from localhost ([1.146.11.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd918sm73910735ad.164.2024.06.03.22.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 22:13:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 15:13:26 +1000
Message-Id: <D1QZ53WOLR1C.1QGLYWZV6QFFD@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v9 14/31] powerpc: Remove broken SMP
 exception stack setup
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-15-npiggin@gmail.com>
 <7059d458-048a-40a5-b21e-4e15568d1f54@redhat.com>
In-Reply-To: <7059d458-048a-40a5-b21e-4e15568d1f54@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 3, 2024 at 7:30 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > The exception stack setup does not work correctly for SMP, because
> > it is the boot processor that calls cpu_set() which sets SPRG2 to
> > the exception stack, not the target CPU itself. So secondaries
> > never got their SPRG2 set to a valid exception stack.
>
> So secondary CPUs currently must not run into any exceptions?

Yes, at the moment. It was broken anyway.

Patch 16 creates a proper environment for secondaries, including
taking interrupts.

Thanks,
Nick

>
> > Remove the SMP code and just set an exception stack for the boot
> > processor. Make the stack 64kB while we're here, to match the
> > size of the regular stack.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   lib/powerpc/setup.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

