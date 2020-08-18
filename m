Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ABE2481F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 11:34:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW5MY5bznzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:34:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oiYao3LS; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW5KR6RCtzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 19:32:11 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id t7so15779929otp.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CukyYxKQagzxSnoAUerbnhafgFTcDCc+vCHDuzHrDm0=;
 b=oiYao3LSY05RtHiCa7E8GRzIrl9VRRJYDZjBtQ/ubmceLYQblalUYWs7OwMluhpnUV
 1OD/4u8SmwCBI4jQy+CFzB9DiOBMSi80AOG36VcptLnhf6mlFt3cEPpf08XASzer3N1U
 8ju50bDwgsm8cIKentn09KT7dEn43UVXAcfqk+qtmEK0ijNDJx9xsmN1YdHBtsSuJmgX
 XysM+f14J1mp0IjxEpAjmlNUmnhz1n1EVGQKFm+eyUG+fLys9+zxOsW+/DEZwSjDm1AD
 eZY+FJmAR1IxLWdli8IGiG0WHu1UOvpZRaDlGQ0XHmg+jBupgMHOuue6LE6XSsPUVN5S
 P/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CukyYxKQagzxSnoAUerbnhafgFTcDCc+vCHDuzHrDm0=;
 b=GhlM70vnQH0JAP7PRCVDXcp+X8gmsPIO1LBdZlMPrnH/1Ma9LDostnoIx80VBCfKIn
 LNpWEOk9S0tQ6V83+4oSnCOAn7cMp+IfWrLYL04kE0SRqKjCZK9bFpc4NxAl6I6smQ6Z
 GGh8u6iZoanZnomA/ufgHP4RU0BceY/wAIBc6pTt5JuQhmwcZ2rqkZk8Ko2RGfRRPa+q
 gNuCla9SG3H9ELRyJ9YT3if3Ih4rkBxVFCkiJMfC7tGQedqi8uBYM9iurdG64wO570fm
 A5UO6qEpDF76+bPbJj7yaEc9vM4++oSNj9KjM5/q9lE/R7nwSxLFP9GogKavyfT463TI
 GQqw==
X-Gm-Message-State: AOAM5334ZeeXSmkikczZMzJT67Npt4hR1I6TyH+HRPdyv7+2ZPqTL151
 oc4iLIlurt5VSxcg3rPgW0QhamO/XUd3S90jkG4=
X-Google-Smtp-Source: ABdhPJxWr9qkdSOHISPy+oYHPAYjGVOTOnZt44b3JJOq1hBBUFKJuivSXPClh61XAr/SYq05DdwSLWmaagZHOPuDyto=
X-Received: by 2002:a9d:128c:: with SMTP id g12mr13892805otg.242.1597743128285; 
 Tue, 18 Aug 2020 02:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hpn7pprl1.wl-tiwai@suse.de>
 <CAEogwTAGHOfBe4ztkx9To0gQGwHwFWzCBxn8nzWJP=wRJUJ56A@mail.gmail.com>
 <s5hk0xxppz6.wl-tiwai@suse.de>
In-Reply-To: <s5hk0xxppz6.wl-tiwai@suse.de>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 18 Aug 2020 15:01:56 +0530
Message-ID: <CAOMdWSLJmiAxH5bvwh9b8O_MLdttU3Fsb4B_Y2tA08_P1b0BXQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
To: Takashi Iwai <tiwai@suse.de>
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
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 timur@kernel.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 clemens@ladisch.de, tiwai@suse.com, o-takashi@sakamocchi.jp,
 nicoleotsuka@gmail.com, Allen Pais <allen.cryptic@gmail.com>, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>
> Well, then at the next time, please mention it explicitly in the cover
> letter.  Usually this kind of API conversion isn't done during rc.  Or
> it's done systematically via script or such.  So unless mentioned,
> it's not expected to be carried to 5.9.

 Sorry for having missed the detail. Will take care of it in the future.

>
> In anyway, if the final purpose is to drop the old tasklet API and
> that's the plan for 5.9, all tree-wide changes have to be done in
> 5.9 beforehand.  Was that the decision?

 The idea was to land the tree-wide changes as part of 5.9

>
> > > I have a patch set to drop the whole tasklet usage in sound/*
> > > (destined for 5.10, to be submitted soon), so if that's for 5.10,
> > > it'll be likely superfluous.
> >
> >  I have picked patches from your tree to adapt to this new API.
> > Those can be picked in 5.10 I suppose.
>
> Adapting the changes are trivial, don't worry.  It was just a question
> of how to organize changes.

Sure, Thank you.

- Allen
