Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82E19EF1E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:28:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wXwv0y2RzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:28:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JODDqlVL; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wXtx6B5kzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:26:31 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id k15so6778144pfh.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=bCP/VQw337JNSqQZ2HvUPrrXtQBfFLYo/RggJtgrBzk=;
 b=JODDqlVLar9yt2N3yezSvdVx6Le8p4yT8o0VbdUK272Yp99tZPIZzaU7VSbHlgz0yL
 3pvJOFR1go5wOvBReFKpU2wX/ncT5zVydtd0dsEr+qvR08cN9nq6qNugH5iY3J1aUX4o
 SXPjp37XJg5ZmuLdpa2pNBqPpTNvPaoABnYBYolgC7u15k+Kx6+Y0Se8OWV0MibaywPy
 RCBPhUgaEq//tEPMtOlac9B0LwDaHgnHWx+L7YqwHznNM3NqeFWz7qcuaqLRhymvFCOj
 5fpZMRdo2Z4dUgwafbsw4sWlGKKyJu+9txLNk8xZfUh0nigpUPoZA6MgKATYT8sslUi9
 zC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=bCP/VQw337JNSqQZ2HvUPrrXtQBfFLYo/RggJtgrBzk=;
 b=t1CsR4br8orS530mXyvr7xM9K2RCw4R4WURN8rhe0BJ5KaQqfBU1GOt34Ij5AHHrPP
 fN9Uo91hHoqpy2YKrOAwoH4Hd6d1QpAdahYMzUj2Gh40hqK+OHs2JCoJ43eB9Tnv95aP
 7iCXBGKIrkXLiFE1v73SGDY/slMe2TL/JN231L+x+cOTIkTlYnVsG7urJZLb4hrj2zC6
 FADGB8qDq04pyvgPFtU7JjUv/WJ6NSQztZefXtSmmo+LYlTlIz+Q3mhYihKRaGjGA/kX
 OWuj0S2h1PKwsBQr7PvhEx9UFovPuL6LspyP7rfkTPU4er5XsYnIIva9dVGwoLmElcRy
 wtVw==
X-Gm-Message-State: AGi0PuZL+2SzvKf2OergXMiHXtr1LO5IMey5z0dTPt05GkLHqKlPNkEq
 un1yXGBQHUJp1NK+NSfLXM4=
X-Google-Smtp-Source: APiQypKqiMO6ppndjhgdZ6+iwHVyw8jrQA2O3khmT516KEmmVVAwmNYuLrt9v+d/g0JDoWUtctLjpw==
X-Received: by 2002:a65:5647:: with SMTP id m7mr18606743pgs.371.1586136388432; 
 Sun, 05 Apr 2020 18:26:28 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id a3sm10322567pfg.172.2020.04.05.18.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 18:26:27 -0700 (PDT)
Date: Mon, 06 Apr 2020 11:25:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 12/13] powerpc/kernel: Do not inconditionally save
 non volatile registers on system call
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <4ef6d617cfd34e09e9bf5a456b2e0b6d2a8a3c96.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <4ef6d617cfd34e09e9bf5a456b2e0b6d2a8a3c96.1586108649.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586135554.pnqaj0giue.astroid@bobo.none>
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
> Before : 347 cycles on null_syscall
> After  : 327 cycles on null_syscall

The problem I had doing this is that signal delivery wnats full regs,
and you don't know if you have a signal pending ahead of time if you
have interrupts enabled.

I began to try bailing out back to asm to save nvgprs and call again.
I think that can be made to work, but it is more complication in asm,
and I soon found that 64s CPUs don't care about NVGPRs too much so it's
nice to get rid of the !fullregs state.

Possibly another approach would be to leave interrupts disabled for the
case where you have no work to do. You could create a small
syscall_exit_prepare_nowork fastpath for that case for 32-bit, perhaps?

Thanks,
Nick
=
