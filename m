Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A29602C875E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 16:06:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl7pW3R1yzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 02:05:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=HmlyKAGO; dkim-atps=neutral
X-Greylist: delayed 375 seconds by postgrey-1.36 at bilbo;
 Tue, 01 Dec 2020 02:04:12 AEDT
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl7mX1pPWzDqKM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:04:11 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id E859C2E742B;
 Mon, 30 Nov 2020 09:57:52 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WPj8ra9yj3oq; Mon, 30 Nov 2020 09:57:52 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id B1B292E73CB;
 Mon, 30 Nov 2020 09:57:52 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B1B292E73CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1606748272;
 bh=lITSvOLPDJvy5RUmpU0kdOKisZq6vOXOt1kVNAyT3Ok=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=HmlyKAGOiYSSOHLNc5JretHxBI3AFVQ3Vu0Z+ZtqcifiILIl+Un7HehB0UJxNYoc8
 qSYdQ2wbu6DceimCyu1SLO5EkMuE3g1sY81IygmeC1Xp6EeMTGGc2Vz+CGwSQ2FVvh
 rt592i6qwFQXtxEiejsOUt/3TY0gOVP8IhrDYntlbWJqHr5k4SBp+WgIPgq4rFIp13
 fhoM0u+IR1Rhv64x1lLVbqnHItGxrgzjG/02v4ZERSYU5mezsc/kcnztC1DRRY5FIw
 k6gzfH+eV+tkvtCBKdZygOHbLmvY5z5E73GmYgQBqasXlucIy+ymbJHzlNTXF9APje
 u+xoQ8g37l/Ew==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id j89H0hvMPN_8; Mon, 30 Nov 2020 09:57:52 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id A404D2E749F;
 Mon, 30 Nov 2020 09:57:52 -0500 (EST)
Date: Mon, 30 Nov 2020 09:57:52 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <274632921.67676.1606748272576.JavaMail.zimbra@efficios.com>
In-Reply-To: <20201128160141.1003903-3-npiggin@gmail.com>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-3-npiggin@gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3975 (ZimbraWebClient - FF83 (Linux)/8.8.15_GA_3975)
Thread-Topic: x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
Thread-Index: c4mu60IGczpdvtSKpGMZAdba0/GKbQ==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Nov 28, 2020, at 11:01 AM, Nicholas Piggin npiggin@gmail.com wrote:

> And get rid of the generic sync_core_before_usermode facility. This is
> functionally a no-op in the core scheduler code, but it also catches

This sentence is incomplete.

> 
> This helper is the wrong way around I think. The idea that membarrier
> state requires a core sync before returning to user is the easy one
> that does not need hiding behind membarrier calls. The gap in core
> synchronization due to x86's sysret/sysexit and lazy tlb mode, is the
> tricky detail that is better put in x86 lazy tlb code.

Ideally yes this complexity should sit within the x86 architecture code
if only that architecture requires it.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
