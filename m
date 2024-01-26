Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4383D279
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 03:20:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jW907Oc0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLhHR0bG7z3cW0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 13:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jW907Oc0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLhGg0RLRz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 13:19:38 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-602c91a76b1so2538927b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 18:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706235573; x=1706840373; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItFgj4jgK5sZKOgTM9vrgG8H+a4jRjcTY7CINpA2Wvw=;
        b=jW907Oc0A+j/aCuGimKCt+QewhkC+wSL1xckwhJ4sd7aJ9J74Pn2kewEsR4nI4lMLu
         k3qczsQ61pDhD9fy10pbpfiD6IkB6nJ+pWXsGLTePczQcAY90kX0tu/7/i8gbiIwB2/C
         BMT4ffMAyyLOvPB/GwdPzDG7hytA0RXcHnZNPctRn6Bt5uaBpcfQ0G7sZKwQoxYL0tAd
         e2a+ZhjjLxoWFIJFioaYycbwhRWjaX8OLsLAnRSuhGi7Azx/d6We20+MrryMsrwshKpy
         QLvRaVhGHpdawz3XSBE1PmZZKnOi9TcL2j7rJEyugB3gCAkj9VfX0qV542i48tHDZx3L
         HURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706235573; x=1706840373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItFgj4jgK5sZKOgTM9vrgG8H+a4jRjcTY7CINpA2Wvw=;
        b=bc6eJVmtj77dVYm6s5etjprIH9iENfoq3xHOxv6RMGwf75HFLXt7O6JniADra6wIrv
         IdYyohJPN4ve/r4lqKw/Y9QQ1/a+STOH6S04Yd8C456nKtnKRx9kTMrtYwj8KLQ4Gh7f
         a5yK9Cx2o8JLjh6ZI906x8vNmOMr4tadGgcAgmZNkZVIaKuzoHxiA9c5dI8d8X4tG0v6
         t+04+SqWudwQElHSNzyma12KF480X/zeNf+tCPgLqFRw6rgDz1pJTWg8NJNIygQhtNKK
         pQdr4hdX9BPmfVgcDVylsCaHcu29ccFvMnjTec0GIuLiI9T2dSdUfob5/rITqswPTEtz
         fXdg==
X-Gm-Message-State: AOJu0YwHQ+EasD3GQTnU48xSr1dxRhi/Sqe4ySGSj5dC5qlIDqk+Ef52
	b0t4V+65mfiTOwcsJDMgTer1UxN/EYscYMwZNF/2UrT0YVWIzf+CGhJRwU1+5jBCnuDJnvnk0Km
	gGTSTP7SBgvCFahEoMMTPMguof0As9AUQC7D6
X-Google-Smtp-Source: AGHT+IGaiNJjkVpexInpWQwByTe3797L2nUjpt0NZIQ90tD35vlByjZTnFzZwYmbW6zfg0hQ6um63uQcPL9NRTHsJjs=
X-Received: by 2002:a81:a188:0:b0:5e8:995f:6a0f with SMTP id
 y130-20020a81a188000000b005e8995f6a0fmr805824ywg.13.1706235573358; Thu, 25
 Jan 2024 18:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20240123064305.2829244-1-surenb@google.com> <20240125180424.121455beae4d56799a0bac28@linux-foundation.org>
In-Reply-To: <20240125180424.121455beae4d56799a0bac28@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 25 Jan 2024 18:19:19 -0800
Message-ID: <CAJuCfpGy=AmngLNMG737N4W_RXz=pRfisa1o7j9chBQ7=Mq6Kw@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/arm/mm: fix major fault accounting when retrying
 under per-VMA lock
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, willy@infradead.org, luto@kernel.org, agordeev@linux.ibm.com, will@kernel.org, gerald.schaefer@linux.ibm.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 25, 2024 at 6:04=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 22 Jan 2024 22:43:05 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > The change [1] missed ARM architecture when fixing major fault accounti=
ng
> > for page fault retry under per-VMA lock. Add missing code to fix ARM
> > architecture fault accounting.
> >
> > [1] 46e714c729c8 ("arch/mm/fault: fix major fault accounting when retry=
ing under per-VMA lock")
> >
> > Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")
>
> What are the userspace-visible runtime effects of this change?

The user-visible effects is that it restores correct major fault
accounting that was broken after [2] was merged in 6.7 kernel. The
more detailed description is in [3] and this patch simply adds the
same fix to ARM architecture which I missed in [3]. I can re-send the
patch with the full description from [3] if needed.

>
> Is a cc:stable backport desirable?

Yes, I guess since [2] was merged in 6.7, cc-ing stable would be desirable.
Please let me know if you want me to re-send the patch with full
description and CC'ing stable.

[2] https://lore.kernel.org/all/20231006195318.4087158-6-willy@infradead.or=
g/
[3] https://lore.kernel.org/all/20231226214610.109282-1-surenb@google.com/

>
> > Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
