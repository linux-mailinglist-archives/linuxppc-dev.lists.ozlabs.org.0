Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C3D925B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 15:22:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tXz26ylrzDr39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 00:22:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c43;
 helo=mail-yw1-xc43.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l+f/ZloC"; 
 dkim-atps=neutral
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tXvc2KBQzDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 00:19:39 +1100 (AEDT)
Received: by mail-yw1-xc43.google.com with SMTP id 129so8616456ywb.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cJhS8Uvu8IS3lCqQrY8q+tdti+Cg6adXgBIoOdjb8V4=;
 b=l+f/ZloCq0TVSoEKdWG/xPvaVz+QBL1zTeb90NW5z4y3GDFVfBM7zJ34XaMCn56+Kp
 3kjIIsa3MI+UoVki34SxLwL3RaAnePZ531WRDJfONzet7TPBphaGXUXer+ADNf4LcLFM
 0uRs/Bewx2ZRnXSuCMvtvJ9JKAZFtyvMBtfi3ivpzuxnXmfMAXKEh5YrYIYpfsG0eQXQ
 gVTJiRSJla5Kr5rVrur3QEVeOkHYdhCDCCzcvfto9CU4VidedP3fFSqLhEoBLvt2OFTC
 3aqEyiRT5WTzOqW86CntMXbdXAqH/20E4PibjNgEALZNDJEQJ1V8Ad1GGxEei1JfAfT7
 6K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cJhS8Uvu8IS3lCqQrY8q+tdti+Cg6adXgBIoOdjb8V4=;
 b=Fzj12py+usjJlQz0SSs4Nq4ZbeOBehwvroDIQJm9qPHPwHSFiSdy340LKmDXcsSeDe
 rT/msfwQ7sTP0E9fZ1bHIu48xOqb6Sah49ISHbEYf/M5njZtZUu/CAuwJCr+7C61TW4Z
 O6X1m5PjUcsY4sSqxkFw7Uh1+oWjg5ahUyG4uVhWUFjwtz9j5bVISDetIGkJf+jUILkG
 oZq25w4pNFK6ro8Xit5avcSGVRzQZ45+g0dvYkcO8cUquVFH0KyeA/Q08F3zwS7nwUoP
 qCX4fR4IyUYHYLHYte2e1lI60joHbVs3CJ+n1y7XP9Pi1rLqIOMsLPgOZr6tg2Qt+TV4
 o5Qg==
X-Gm-Message-State: APjAAAVRnG6LMsiETlb4I5JEmOAC/jbjWEjEQIYhPOmZcFDi3GYCA6OM
 54Mew7Hkgi4LAUIUDDRnGwzXBnc8mC9cFzIBSn8=
X-Google-Smtp-Source: APXvYqxvAnQjFlEVu3M2J2YJIJLTrVczrnPSvhRw7WSimuLqSEPHX37qsxqOnKqC9yo3gFeqVo1f0HnW3sZl3tKtiQc=
X-Received: by 2002:a81:1a85:: with SMTP id a127mr21804082ywa.53.1571231976415; 
 Wed, 16 Oct 2019 06:19:36 -0700 (PDT)
MIME-Version: 1.0
From: Carlo Pisani <carlojpisani@gmail.com>
Date: Wed, 16 Oct 2019 15:19:24 +0200
Message-ID: <CA+QBN9Cxgwhga4dArM8MiHMYjT_Ab1YBVNnL6vAPf-euH03erw@mail.gmail.com>
Subject: Linux PowerPC, PPC4xx
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, 
 linuxppc-dev@lists.ozlabs.org, alistair@popple.id.au, 
 mporter@kernel.crashing.org, sfr@canb.auug.org.au, michael@ellerman.id.au, 
 david@gibson.dropbear.id.au, agust@denx.de, scottwood@freescale.com, 
 patchwork.ozlabs@gmail.com
Content-Type: text/plain; charset="UTF-8"
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

hi
I am a student, I represent a group of friends running a couple of
opensource projects(1), and we are lost with this(2) problem.

I wrote here(2) a couple of years ago, we are still working with kernel
4.11.0 and there is broken support for initializing the PCI.

The PCI initialization of the PPC405GP seems wrong and every
kernel >= 2.6.26 is not able to correctly address the PDC20265

an interesting note is:
kernel 2.6.26 can be compiled with arch=ppc and arch=powerpc

when compiled with arch=ppc the promise PDC20265 chip is correctly
managed; while when compiled with arch=powerpc the PDC20265 is not
correctly managed

any idea? advice? help? suggestion?
a good place to discuss it?

thanks
Carlo

(1) http://www.downthebunker.com/reloaded/space/viewforum.php?f=37
(2) https://bugzilla.kernel.org/show_bug.cgi?id=195933
