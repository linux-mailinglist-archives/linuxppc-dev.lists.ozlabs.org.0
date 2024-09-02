Return-Path: <linuxppc-dev+bounces-880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 513BA968A15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 16:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyBDX24FMz2xxy;
	Tue,  3 Sep 2024 00:37:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725287852;
	cv=none; b=WSZpIyMc0gcVt3wuLnL7qDS6lie3xNWxBQGI9JXGvAOGuq47oXmsFAzCXn/zB+ebdL5g86bj6iS/F9q5mTE1KMry1PSV8Vi9KmF/+Kk3JF2VmQ4rhsqFyCO/Y/57gH5PmDLyRPhyFRhlMpDVw0TG0lSFAquTCIfh2kMCVEX7zkeFIrBoYVUpl6HiW/5j04dsvTXkrYCl1/G5FsUwzcje7M4QEz09nJRiHaTYiJRcBWDdIyiS6gPJuyMDfLQ9VSQ0bNRv1M2PjN5fLl5WBInPHjkck7qXecTgv0OQZf1xtX8IiT+dpfaTMa200egDGGB+UbAwAXN8jz7SYaFJVenTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725287852; c=relaxed/relaxed;
	bh=fkpr2xyIOoNVSN6u9wpBQgcyAP1uccLTt9mgRczfpKU=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=cFFVwgaBVJ41Ai94NhQO4DcMrYo1dOw8XAS0U1ky4TIry0eZic4ocZROMCBybEC55qa+jwvsgtkEgO57wg6kc2Zy0fmO95fpUDVZv4Z4oB75SE87w5MW03XuFuT9ct4ZqOH8dtNdx+oAlVh6k0ellGSeogogw8KSuCL1+IOPWHXX/pPh3LsQp+V3tkZfWfbqu5KTcHK8Fymoc0Wg663aJ6EWxWE3pZ8MRJu4Y4cwNxW4J0JRpDmCC1jmeAQ4A16n2CdJJpbBS3ieW/hRyLCB/LPmqUuU1sVXDm4Uz7rw8qiZj2V4lLJQipuNNsl6ppaM4GyBMKWBEH7ixpnSBam3sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=i1U/TFM/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=i1U/TFM/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyBDX0TM0z2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 00:37:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1AB85C5848;
	Mon,  2 Sep 2024 14:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB3CC4CEC2;
	Mon,  2 Sep 2024 14:37:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="i1U/TFM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725287845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkpr2xyIOoNVSN6u9wpBQgcyAP1uccLTt9mgRczfpKU=;
	b=i1U/TFM/BVYMk5TlS2vnBMnfGpj32tpFcSRnNwTo99N5lrPyNwJjZr8pkxe6jXhDmkDbjn
	GWCnZdMN+yY/+ANdCkUyfXNpGinu8fcfRlZAsDMhrKZE6VFWFmnpGRjRv73QnO4bRbnrxQ
	dbBjZkpe5RvVnXQOmj1jYisPJP5j5YU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b222261e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 2 Sep 2024 14:37:25 +0000 (UTC)
Date: Mon, 2 Sep 2024 16:37:24 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v4 5/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC64
Message-ID: <ZtXNpLbk2jj4Hr4c@zx2c4.com>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
 <27de70dcc356e56754a03a2887a97597f5e840a4.1725278148.git.christophe.leroy@csgroup.eu>
 <ZtWyeuCfzZ66fVsg@zx2c4.com>
 <bdf1a515-b3d0-471d-89ee-989ae0d63202@csgroup.eu>
 <ZtXE-AISB4w9U9Yc@zx2c4.com>
 <c411b0c6-1806-4e4d-8bcf-51f0747fcd19@csgroup.eu>
 <ZtXJfiA1lU55JLMM@zx2c4.com>
 <dac37bce-9616-450c-8c1e-aa24dcbfb882@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dac37bce-9616-450c-8c1e-aa24dcbfb882@csgroup.eu>

On Mon, Sep 02, 2024 at 04:27:12PM +0200, Christophe Leroy wrote:
> Hi Jason, hi Michael,
> 
> Le 02/09/2024 à 16:19, Jason A. Donenfeld a écrit :
> > On Mon, Sep 02, 2024 at 04:16:48PM +0200, Christophe Leroy wrote:
> >> Can do that, but there will still be a problem with chacha selftests if
> >> I don't opt-out the entire function content when it is ppc64. It will
> >> build properly but if someone runs it on a ppc64 it will likely crash
> >> because only the low 32 bits of registers will be saved.
> > 
> > What if you don't wire up the selftests _at all_ until the ppc64 commit?
> > Then there'll be no risk.
> > 
> > (And I think I would prefer to see the 32-bit code all in the 32-bit
> > commit; that'd make it more straight forward to review too.)
> 
> I'd be fine with that but I'd like feedback from Michael on it: Is there 
> a risk to only get PPC32 part merged as a first step or will both PPC32 
> and PPC64 go together anyway ?
> 
> I would prefer not to delay PPC32 because someone doesn't feel confident 
> with PPC64.

I have no objection to applying these at the same time.

