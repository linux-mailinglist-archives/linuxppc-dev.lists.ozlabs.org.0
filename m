Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9609345B9D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 13:02:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzflC3GkZz307C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 23:02:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lzHGXHqz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzfkd1PGkz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 23:02:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lzHGXHqz; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Hzfkc72m8z4xdm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 23:02:00 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Hzfkc6zgtz4xf3; Wed, 24 Nov 2021 23:02:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lzHGXHqz; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Hzfkc6vm4z4xdm
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Nov 2021 23:02:00 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id m17so1550652qvx.8
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Nov 2021 04:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xMs60OY6NuqoTznb3kAiAXIsovsCKzGLK+pIVmyJY0A=;
 b=lzHGXHqzWVcTimHCU6SNfHlDXu8eChfYOrIxaoprIgcDx9jH39cR7aYpZcQQCqtjrF
 aPuKE0lykdswvBrfa4TEIS9iBBeklUzlhXdL/uTwWDGfYCL+AjBY9eoq8qcNw98RJJc2
 9h/u8dx1kpBCxeSllcVxYJX3DNNGqq6XTqPUZukHtvcXtUsW6YeSfdimD7uxvrekIvTn
 QqwVJEhB5ZH89byKO2wS5T9z5eqYEgS+4D28X1aZ7lpz5YMtbHYiXytwts59hkj1meAp
 4D0mu2Tycf34IjPCGFIu/rRcRHMkt4W50UZQnFuhkvm5HxDge80x2wkEa3Qjxb1JofQz
 E7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xMs60OY6NuqoTznb3kAiAXIsovsCKzGLK+pIVmyJY0A=;
 b=SyJGuQr1kSbxYEZZnsd0OGpWDpQEac9SG22g6MJ5U0c2rHfv/FRhCRyL09GcZurkc9
 lIUM8aoHScnxlJ7l2yHUWuTB7UC+AEAiG0WIjvak2F/URH5IdVamjLsTlDcWRYHbMM6I
 U6Z1u7a3xjNToDLT1OgiyKcnkugM60fL3MuMYcNhTHFlgb10aT8pVsYBPsREYWHAGfH1
 A6D1Nhs/1IAJ3O03vzSDMUxygcVUE2QMZNKexNgDzxASogn9NlWj3orzz2+n3y2H6tF5
 UfJGZR14XxWmjOUjRj4GowfU9pXToAmWEog6qMdi1KplNE9YkXY+qmzBz7occyFl3H0E
 iI/Q==
X-Gm-Message-State: AOAM532re3w6jlTsKBMpdQpHm9iTyfNfIuo6OmJidm4+MwW33jk0yCQv
 GTAWf2TliwB83++b7gGm6KekSxHbX7qTNFgfcNo=
X-Google-Smtp-Source: ABdhPJz3OdCr9/ZmClglEISeEwIH7PRK/EUkdCTrHMeYapGlCCcdtd8Nl8dP4/F0Ia40eRTWqlRfWXmiGSIjzEIKNbc=
X-Received: by 2002:a05:6214:8f2:: with SMTP id
 dr18mr6862237qvb.56.1637755316799; 
 Wed, 24 Nov 2021 04:01:56 -0800 (PST)
MIME-Version: 1.0
References: <163767273634.1368569.7327743414665595326.stgit@jupiter>
In-Reply-To: <163767273634.1368569.7327743414665595326.stgit@jupiter>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 24 Nov 2021 23:01:45 +1100
Message-ID: <CAOSf1CFRY=VsGenpwqVu_VOUYuBheVUEoX2M_h-XSHk6NdUtwg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/eeh: Delay slot presence check once driver is
 notified about the pci error.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 12:05 AM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>
> *snip*
>
> This causes the EEH handler to get stuck for ~6
> seconds before it could notify that the pci error has been detected and
> stop any active operations. Hence with running I/O traffic, during this 6
> seconds, the network driver continues its operation and hits a timeout
> (netdev watchdog).On timeouts, network driver go into ffdc capture mode
> and reset path assuming the PCI device is in fatal condition. This causes
> EEH recovery to fail and sometimes it leads to system hang or crash.

Whatever is causing that crash is the real issue IMO. PCI error
reporting is fundamentally asynchronous and the driver always has to
tolerate some amount of latency between the error occuring and being
reported. Six seconds is admittedly an eternity, but it should not
cause a system crash under any circumstances. Printing a warning due
to a timeout is annoying, but it's not the end of the world.
