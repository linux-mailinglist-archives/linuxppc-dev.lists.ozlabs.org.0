Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A58A1E5D94
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 16:00:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470jKX0jY8zDqrX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 01:00:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="UdKa/EIa"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470jDb5PSLzDqlj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 00:55:43 +1100 (AEDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B69AA214DA
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572098141;
 bh=oS8AafU4UoR1Cdt5q1QkipV0ZVxN87r+AIY8DNgHUts=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UdKa/EIasgUwWUWKLVUZjsocCCXKaIIKQvHCKkWsta4ac76dgl2yQ/T8MABrC3sI7
 QT4WVsaHMploW8g3OvhBvq4nUFVqX2zrXBy68w8n3je7YCvffgOqbOQqcXWLA2hKIV
 C5TuFXmNCXo9w+NkE8kU8xCo3ymWDEd1iMs2nCNo=
Received: by mail-wr1-f49.google.com with SMTP id r1so5325512wrs.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 06:55:40 -0700 (PDT)
X-Gm-Message-State: APjAAAVKaWJkodVSubGObc6izjEr9ykOCG1XiZcUY1C/0a0Qf+ZmixJu
 fSKDSEpHwr2UUa3gDHokUvhVJ4V4guHGLuLCsiJtuQ==
X-Google-Smtp-Source: APXvYqwvksRrIQEjjgyaaAImviBGypA0F9sRduelJfzhcIHS0Kqw9RdPhWtrIf2y553xqjuua9wmwExmrcJ/9/9X9zs=
X-Received: by 2002:adf:f04e:: with SMTP id t14mr7762143wro.106.1572098139231; 
 Sat, 26 Oct 2019 06:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
 <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
 <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
In-Reply-To: <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 26 Oct 2019 06:55:28 -0700
X-Gmail-Original-Message-ID: <CALCETrWEKrE6nhu2F9+V_8EhWKqyuq5Qit05Uj9V_TeBKZNJsw@mail.gmail.com>
Message-ID: <CALCETrWEKrE6nhu2F9+V_8EhWKqyuq5Qit05Uj9V_TeBKZNJsw@mail.gmail.com>
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 22, 2019 at 6:56 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
> >>> The performance is rather disappoiting. That's most likely all
> >>> calculation in the C implementation are based on 64 bits math and
> >>> converted to 32 bits at the very end. I guess C implementation should
> >>> use 32 bits math like the assembly VDSO does as of today.
> >>
> >>> gettimeofday:    vdso: 750 nsec/call
> >>>
> >>> gettimeofday:    vdso: 1533 nsec/call
> >
> > Small improvement (3%) with the proposed change:
> >
> > gettimeofday:    vdso: 1485 nsec/call
>
> By inlining do_hres() I get the following:
>
> gettimeofday:    vdso: 1072 nsec/call
>

A perf report might be informative.
