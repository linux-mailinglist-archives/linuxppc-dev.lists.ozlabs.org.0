Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7229739ABF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 10:52:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Opa27WRk;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ve1c4q2s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmvJT4Lqlz3bYR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 18:52:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Opa27WRk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ve1c4q2s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmvHZ6mQGz2yyV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 18:51:38 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687423889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=11GWicbLpC0F9A4O6rye+3TFV+Z0pKuEfGbmi5Xihgc=;
	b=Opa27WRko24s9SyCBdoBaKtro+GrTco4r1eCgge8Lgfx0shKBIsTEUSu6MG9v71RP8O3d2
	SbFwcybbw9miqtX1iK8hfGQZ6W7YN4/79DlQ24txRJ4X7h8agW+3ucdT9h2P2ItdehjhRR
	W5rLoAJs0hiIDY/+5ieAMpJAt1Fk+IfWLguEtZT7/xKVmtsRlgRESsf/3QJjKYYo0HwgWw
	LrSNZbQdyvPcNnVeUgZYTOc4cIOCnaC5ZP011AG6Cn1n1mtrMGNc1uIZencaADiSiwXOoK
	RRWrz5VFP7qiiu4bVOJGsPxq6yG0afTyN9zZc0Dcbyk5UscuvXOi34MDPVN5/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687423889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=11GWicbLpC0F9A4O6rye+3TFV+Z0pKuEfGbmi5Xihgc=;
	b=Ve1c4q2sKAtVICADuROmlUGEt5SFRidTNne8Y/DVygOVgESR5lDmwgOlo+HHq2uYtGIBR3
	GBkNjUNUDJh+T2Cg==
To: Laurent Dufour <ldufour@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] cpu/SMT: Move SMT prototypes into cpu_smt.h
In-Reply-To: <20230615154635.13660-2-ldufour@linux.ibm.com>
References: <20230615154635.13660-1-ldufour@linux.ibm.com>
 <20230615154635.13660-2-ldufour@linux.ibm.com>
Date: Thu, 22 Jun 2023 10:51:29 +0200
Message-ID: <87o7l77ucu.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 15 2023 at 17:46, Laurent Dufour wrote:
> From: Michael Ellerman <mpe@ellerman.id.au>
>
> A subsequent patch would like to use the cpuhp_smt_control enum as part
> of the interface between generic and arch code.

This still has the 'patch' and 'arch' style which I pointed out
before. It seems you fixed it only for one patch in the series.

Thanks,

        tglx


