Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115619EF34
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:46:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wYKm3F0WzDqhH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:46:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GMCuX59W; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wYGD5cTkzDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:43:16 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r14so6767583pfl.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=SlwKZhggJtXqNs7Yrk3WMQWVP3iUpdR4maR08x43Blc=;
 b=GMCuX59Wzs8NCxiqc2qUvtMtD+1VUPi9wR9ZGS4RyrTfZ5AVkbpnW/NFGBJaIlSc75
 g/tKe9kLNx98ZcJ2EspzedBVpVQkpoGqols/azIRWBBqFRHI5uSZ+vFT8Vcm1kO/tiCa
 5XflQwEhsGgED444d1iMaRH7WJc3uvC6CEQlqsdP5YpD8FuEfujI2YnWwXGIBDjgaZWP
 G/EBZUo0DolixLtDsW/PbvLjJy5IpALpB0dghhKRtZrwB4I2LbjY2BoTRJcSh+QN9Guj
 lUokaIm6MOZYieb+HprdmtLswu5oSzOO7HswqJpCuxPdsLOSwKEe7v9IFtY1HjwSPDst
 jgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=SlwKZhggJtXqNs7Yrk3WMQWVP3iUpdR4maR08x43Blc=;
 b=F0ZzytI11PKnJUhMq+qx/ebFTytLfEcQ+MVQis/SZcUALzvF+pEFKtutoMqBsIF+zQ
 3hBut3TQLHM9n59fV6tPPigJ6+x0LbOgnIL/gegcu8UmDAB4qzeRLLacx9KK6Kz2VPvK
 hogZjXJf1m7NQtPkvEd3SC1TxDrmrksop7dMY+SLtQU3/KRRhinqvtDW5GcZjm4Ebrrt
 hnQ1LObOaf1k+V1SmXURj6V169Fp69/9F7HiVZnFXXLRWxvSJXPBbAALXgt01qwJbd1A
 vSCSamuNZNhKPdVeHR1rVaBnNRDJggSNuvZc612DYplsQBO9OJqCxyR2AbgxhLH51dIe
 JuMQ==
X-Gm-Message-State: AGi0PuYIi0D2mNOI24GZ8FPIdX0awjI93ovtwUfzONMzM+ugrjjSaLtc
 RqeMYPc1ckvYljBKFw7Mt88=
X-Google-Smtp-Source: APiQypK787EqE6ngINs5TXiIV+FU46w5wMuCQfPQ5zgBdP6BwTRdtKCUfE+c/fI77Ac1O+R+BpZnXA==
X-Received: by 2002:a63:f502:: with SMTP id w2mr19256994pgh.423.1586137394697; 
 Sun, 05 Apr 2020 18:43:14 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id j96sm10611992pje.32.2020.04.05.18.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 18:43:14 -0700 (PDT)
Date: Mon, 06 Apr 2020 11:42:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 05/13] powerpc/syscall: Rename syscall_64.c into
 syscall.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <cacbc62ded444e26e15ca67e0ec91b05b7de6459.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <cacbc62ded444e26e15ca67e0ec91b05b7de6459.1586108649.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586137301.c2ssus5vmb.astroid@bobo.none>
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

Christophe Leroy's on April 6, 2020 3:44 am:
> syscall_64.c will be reused almost as is for PPC32.
>=20
> Rename it syscall.c

Don't mind this, but I wonder if we can rename it to interrupt.c.

A system call is a type of interrupt.

Thanks,
Nick
=
