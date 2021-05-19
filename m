Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A527388E5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 14:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlXjj1Wsgz301W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 22:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha1 header.s=ascii.art.br header.b=TI2OTUkb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ascii.art.br (client-ip=23.83.212.17;
 helo=bird.elm.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha1
 header.s=ascii.art.br header.b=TI2OTUkb; 
 dkim-atps=neutral
Received: from bird.elm.relay.mailchannels.net
 (bird.elm.relay.mailchannels.net [23.83.212.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlXj80tWDz2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 22:48:09 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id D9342342272;
 Wed, 19 May 2021 12:39:41 +0000 (UTC)
Received: from pdx1-sub0-mail-a6.g.dreamhost.com
 (100-96-16-62.trex.outbound.svc.cluster.local [100.96.16.62])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 1BE5B34255C;
 Wed, 19 May 2021 12:39:41 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from pdx1-sub0-mail-a6.g.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.96.16.62 (trex/6.2.1); Wed, 19 May 2021 12:39:41 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|tuliom@ascii.art.br
X-MailChannels-Auth-Id: dreamhost
X-Harmony-Bottle: 414366c233488d91_1621427981418_23098169
X-MC-Loop-Signature: 1621427981418:425922509
X-MC-Ingress-Time: 1621427981418
Received: from pdx1-sub0-mail-a6.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a6.g.dreamhost.com (Postfix) with ESMTP id D053587870;
 Wed, 19 May 2021 05:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=ascii.art.br; h=from:to:cc
 :subject:in-reply-to:references:date:message-id:mime-version
 :content-type; s=ascii.art.br; bh=Moiw1J8H3kFxYbF9Og3ijiVM3XY=; b=
 TI2OTUkb2gOk2/7xGzALPcJAIQiK+aa2a2Xcsj0Ub7UyauxJc5A2N2962czBl/nX
 QG18QIdDGFE1Wt5XFvq9ia/CnpPWTjl7a6Oyv2xAV9bE8m5JibK1tGCVCW1Igctb
 dvmp2xy1ygBzlKUeZdXMk8VhoioaFduOrZvLhbSueI8=
Received: from ascii.art.br (ip-131-161-4-75.isp.valenet.com.br [131.161.4.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: tuliom@ascii.art.br)
 by pdx1-sub0-mail-a6.g.dreamhost.com (Postfix) with ESMTPSA id 393D47FFC7;
 Wed, 19 May 2021 05:39:37 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a6
From: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
To: Nicholas Piggin <npiggin@gmail.com>, "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: Linux powerpc new system call instruction and ABI
In-Reply-To: <1621421721.r9fefebis8.astroid@bobo.none>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <20210519102403.GA15207@altlinux.org>
 <1621421721.r9fefebis8.astroid@bobo.none>
User-Agent: Notmuch/0.31.3 (http://notmuchmail.org) Emacs/27.2
 (x86_64-redhat-linux-gnu)
Date: Wed, 19 May 2021 09:39:33 -0300
Message-ID: <87r1i2kid6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: musl@lists.openwall.com, linuxppc-dev@lists.ozlabs.org,
 libc-alpha@sourceware.org, libc-dev@lists.llvm.org, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org> writes:

> As a more hacky thing you could make a syscall with -1 and see how
> the error looks, and then assume all syscalls will be the same.

I'm not sure this would work.
Even in glibc, it's expected that early syscalls will use sc while scv is used
later in the execution.

-- 
Tulio Magno
