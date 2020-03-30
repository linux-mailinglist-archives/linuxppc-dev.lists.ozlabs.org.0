Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1421197AF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 13:38:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rVpQ6d3vzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 22:38:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=hjl.tools@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vGNB9mRl; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rVkg4WqpzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 22:35:21 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id n13so8059009ilm.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=STJoDQnNxyxtNOLGstObx+rrMyRlmYWEbAqvXTqhttE=;
 b=vGNB9mRlNrfqMzj5IVsAL3VvF1HanMFINy5IeVKBxINJJU8bwp84QKkff5z0BG2kPm
 gA94RZSEIX/Q59LOO2bS5NE+d5iI1GWzP1uAQne47447kVmzLT0SRgUMhg7J7wt+vfGZ
 iDvvKduOAJbrYuoIquLSisbo4NIBw4Dmzo5VFIefDn7NgD+qdWoc1X77QU0RkEnJkuJU
 04epD4YNKd3ezf1+olSVJ5bTi0EenESNu/YFadSrczcRdoTFeVcQRQyihnMms4L2GWbw
 L0Z0cUYMlrtHNWCggr0nSqQ51UMczv9vFKL/xgGLOTdcIN073fOgeA1Ud15pfZKJ6imY
 Medw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STJoDQnNxyxtNOLGstObx+rrMyRlmYWEbAqvXTqhttE=;
 b=XViE9nK9YuRjywpUqavAFC4MxzqDR0PF48Qwqp8ViFfbC/d75kn6rS0S5ZgPJ+1F3b
 hWHIBCf+uM6cWs4vk4TLeRch9uHxsOViEqROQHPUKFQWe7MVQYfOBIr3/oOBzg/tT6aL
 YTKlIBTmvkFtNxJY9szO8aPDTpR0ZYLLb6cwLpDdEwHwB5PRjURAymPNmo7vNtZCem+0
 3mxbbmYM3eUFnniWxruZP3/DgdeGdF/c3a1BDf+OzKnLLZABSRSh4wl65N+hB5etJIXa
 s+EC0pDNEPD6FVLMJtZjUupr10CuLMMVqOmlEN5J4IR/7a08AYk4Q1hH1fQ/5MLdi3ba
 xttQ==
X-Gm-Message-State: ANhLgQ28xHt4Lhmdm4ReXJ7vwSeSkUdm6KCLzD9ktPUYBzKvEaG7fP6G
 X3EVv3FZ96e4YZ3xMhi1LjLUHaFQYXOPLBO7So4=
X-Google-Smtp-Source: ADFU+vsWtPyrwdqj71KtushyxMZ54QOSOtZLLcDf9wnU8XhfOES+G0fFINdp0iDYMhAPUprrWNtm7nOT6zRn2IKZrz8=
X-Received: by 2002:a92:c00a:: with SMTP id q10mr10679625ild.151.1585568117885; 
 Mon, 30 Mar 2020 04:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200330143529.4dafeb34@canb.auug.org.au>
 <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
 <20200330150819.7f0199a2@canb.auug.org.au> <20200330074823.GA14624@zn.tnic>
 <87wo72uv3z.fsf@mpe.ellerman.id.au> <20200330081652.GB14624@zn.tnic>
In-Reply-To: <20200330081652.GB14624@zn.tnic>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Mon, 30 Mar 2020 04:34:42 -0700
Message-ID: <CAMe9rOqCEtn7e2NaKfnX97HUjcN54y481YGN28GfkwWHs8CfcQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Borislav Petkov <bp@suse.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 30, 2020 at 1:17 AM Borislav Petkov <bp@suse.de> wrote:
>
> On Mon, Mar 30, 2020 at 07:04:16PM +1100, Michael Ellerman wrote:
> > Or just squash the hunk Stephen posted into the commit, which is what I
> > thought would happen to begin with.
> >
> > You can have my ack for it:
> >
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> Thanks but considering how this is not really urgent stuff and it can
> take its time and get some wider testing before getting upstream, I'd
> prefer to delay it.

Skip my commit will also delay other commits since they depend on my
commit.

-- 
H.J.
