Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B986558F83E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 09:20:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3J9x5Khsz3c6M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 17:20:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OKKZBZtb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OKKZBZtb;
	dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3J9H0TMdz2xtw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 17:20:01 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id b7so12735949qvq.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 00:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=h2MoL03lBkdgEsIuQqutH8cxN+Yd4x7ZcsieCTffkXk=;
        b=OKKZBZtblln4astqy2YHb8FA49/KSI+mVt5AUXvViSuIkTNMR/R0wTKefOo7e8T61s
         TuTufJbFxMz8giToczOxES3Sqf2WTprj97bAf2j/JxawDqlIrjsRUC627ViaZew1Aiqg
         1AIGyRw81ixA9eX2X864CQzz2gyWU1qKqjvgjsPXIb0jPij+Xc7skUotKs+tHZpYrUe1
         hqVwT5oIBc9MHh6Tge9Rkfvo2pAawU3TxAgUQ1UDCpMQkjbfjhI4ggKld15GK9nrPl1o
         /m9W5K55vs+0Q5A+eR7TlPMgcnhDy83fjOkrBTPc+c/pNImKRzv2j/aSEuEfjK3WFH3+
         wiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=h2MoL03lBkdgEsIuQqutH8cxN+Yd4x7ZcsieCTffkXk=;
        b=o/14cdX+6mKdGeWkpNURSiM1bRPvtPoZbn7HlA8emoKJMDwuNiE80oBQxswDHikfhi
         fAXQC7KGSTcAX15u7eZHVzVWScmnaUTp9x9aWiy+4U92Gjxj4rP/FbbYYvMGHjUEBNac
         ck5tM/8jLV59JzydGfnjuU0XhS4h6W/1n80p/Wz9ej08kzxSdm9BNTEjtFdyM5VZHi7D
         Q6XQQhciUG+nmcaQjhurEJ8vHuQJ0fzkmczl7Hk33RRUnyv5x/0sHnwOSRxnZ3spDu8r
         duoCsDtnkGYmWPrNXrvc0gbpmahrNlThuX+OQKCjUlV5x+swyxhZEpaqzGUBT0niBqyI
         elmQ==
X-Gm-Message-State: ACgBeo0arvPuXFUsI9cIxhihQ+5ZFEcWvGlp/59riGAOM20LUmVnuZMQ
	gX/VhdSP+uPZsi5NeLk4vv5drp/pBvm2RkmnIWQ=
X-Google-Smtp-Source: AA6agR7tQbBprz1To2uSkdhWrz3WsFgRTMHSY6HM/0OxOG18+HdvoQfeg+d30I0zQs0eJ1f9oKBzNzItoo8IGe7ytfY=
X-Received: by 2002:ad4:5bed:0:b0:476:dbbe:f167 with SMTP id
 k13-20020ad45bed000000b00476dbbef167mr27343541qvc.100.1660202398215; Thu, 11
 Aug 2022 00:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220806085301.25142-1-ruscur@russell.cc> <87lervcn9o.fsf@mpe.ellerman.id.au>
In-Reply-To: <87lervcn9o.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 11 Aug 2022 17:19:47 +1000
Message-ID: <CAOSf1CHtmSPSbW-KiL7svks2sXO4KEx9hZteHJjRvvfqcb6YoQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself as EEH maintainer
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 11, 2022 at 4:22 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Russell Currey <ruscur@russell.cc> writes:
> > I haven't touched EEH in a long time I don't have much knowledge of the
> > subsystem at this point either, so it's misleading to have me as a
> > maintainer.
>
> Thank you for your service.
>
> > I remain grateful to Oliver for picking up my slack over the years.
>
> Ack.
>
> But I wonder if he is still happy being listed as the only maintainer.
> Given the status is "Supported" that means "Someone is actually paid to
> look after this" - and I suspect Oracle are probably not paying him to
> do that?

I'm still happy to field questions and/or give reviews occasionally if
needed, but yeah I don't have the time, hardware, or inclination to do
any actual maintenance. IIRC Mahesh was supposed to take over
supporting EEH after I left IBM. If he's still around he should
probably be listed as a maintainer.
