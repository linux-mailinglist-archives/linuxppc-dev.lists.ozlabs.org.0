Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62C444A4C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 22:34:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl0Ql3LdKz2yHB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 08:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lrlsl0kW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=sjitindarsingh@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lrlsl0kW; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl0Q12WjMz2xBb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 08:33:43 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id m21so3503760pgu.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 14:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vrz+tdiTTOp8szNJ91rvZ9PnjQkFO5LZUDNo6iz8BFk=;
 b=lrlsl0kWNH6gBlT7Fehk8GvFi1ohYeIPuGJC8y0Wtsn21/AFqufl0BsSeljKPJOgqo
 QRBPr0w/Qp0WeOw9SMpGdFtR6bKT9MiFMm4l7rc7D7JPvLuMQXt5wg6s/zG+xRBW2JGD
 DJk+sNZrRd68Jp6V9WzgNlDiqO1rA+Z8f7k3mowUuZK/h7Rx9B8/G4XTcS4ogOJantCq
 8P8e5woqUzDLGPFMgnKjcxwTAnTIK70AJTYDjAF7HnWL1Ou5dvDVY9Fiw9rtZkHLmBeL
 5UknEF+vmqL9qUg2cNP+nZzWRqr9oqXNFUu7H41tZ90CTaV0T884XMzKjfBfjtMJoW25
 TAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vrz+tdiTTOp8szNJ91rvZ9PnjQkFO5LZUDNo6iz8BFk=;
 b=s5jgdv0hilDe0wYwMn9rIzVoKjAu2Xz69ZUWucZZ+/t/DxjvTRg2qJdIxgtEv75PXo
 BqwG3v9TDc5zSnWnz5vyQoN6r1JBrwLRXPJxaHzM/Ul6u9OQBlx/yFYiZeHBDJ6/QmgQ
 YslTKuB8j2V/x2r+GvBR1/Fo24hmzgm+uT3Y5G9tPOCIp/0mdGNUr+gwCjSwq6cItXnD
 GygrYQB8l7fxjqnwcwJClz+KTsUkebLOq1EV+pHZ9V7WIgS8mkvnfg/tkYPv0w4P/ywg
 E+ymt3k66R+X47ugymilEB+vqf1TB9aVGF6it28cLcfqAmmDPl+Yg341/MkOzu3IUDBD
 41UA==
X-Gm-Message-State: AOAM531xH7s+6n59wjMJxruEvYmpJ/RcrmH26MPvT0i1bszh35IrasiB
 KPs4hGMb2MXxDy1Q5hIJhWM=
X-Google-Smtp-Source: ABdhPJyg0R3/Q3bIGPKfyNNRvH9PP7swCV9K3IQVMYv+zNfLa8JDaYKVoxGJ4Pa5OL9U2eRghuj/Ig==
X-Received: by 2002:a63:c:: with SMTP id 12mr35942364pga.477.1635975220204;
 Wed, 03 Nov 2021 14:33:40 -0700 (PDT)
Received: from vpn-10-50-19-212.sea19.amazon.com ([54.240.196.175])
 by smtp.googlemail.com with ESMTPSA id
 a140sm3192789pfd.150.2021.11.03.14.33.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Nov 2021 14:33:39 -0700 (PDT)
Message-ID: <664dc34bc9343e761d2f1ea701aa682778913073.camel@gmail.com>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: Russell Currey <ruscur@russell.cc>, Joe Lawrence
 <joe.lawrence@redhat.com>,  live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Date: Wed, 03 Nov 2021 14:33:39 -0700
In-Reply-To: <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Russell,

On Mon, 2021-11-01 at 19:20 +1000, Russell Currey wrote:
> On Sun, 2021-10-31 at 22:43 -0400, Joe Lawrence wrote:
> > Starting with 5.14 kernels, I can reliably reproduce a crash [1] on
> > ppc64le when loading livepatches containing late klp-relocations
> > [2].
> > These are relocations, specific to livepatching, that are resolved
> > not
> > when a livepatch module is loaded, but only when a livepatch-target
> > module is loaded.
> 
> Hey Joe, thanks for the report.
> 
> > I haven't started looking at a fix yet, but in the case of the x86
> > code
> > update, its apply_relocate_add() implementation was modified to use
> > a
> > common text_poke() function to allowed us to drop
> > module_{en,dis}ble_ro() games by the livepatching code.
> 
> It should be a similar fix for Power, our patch_instruction() uses a
> text poke area but apply_relocate_add() doesn't use it and does its
> own
> raw patching instead.
> 
> > I can take a closer look this week, but thought I'd send out a
> > report
> > in case this may be a known todo for STRICT_MODULE_RWX on Power.
> 
> I'm looking into this now, will update when there's progress.  I
> personally wasn't aware but Jordan flagged this as an issue back in
> August [0].  Are the selftests in the klp-convert tree sufficient for
> testing?  I'm not especially familiar with livepatching & haven't
> used
> the userspace tools.
> 

You can test this by livepatching any module since this only occurs
when writing relocations for modules since the vmlinux relocations are
written earlier before the module text is mapped read-only.

- Suraj

> - Russell
> 
> [0] https://github.com/linuxppc/issues/issues/375
> 
> > 
> > -- Joe
> 
> 

