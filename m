Return-Path: <linuxppc-dev+bounces-878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B356C9689C2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 16:19:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy9rB34JKz2yDS;
	Tue,  3 Sep 2024 00:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725286794;
	cv=none; b=ZxrPHCs0OLItBijl8ulJT1dq4nPbUhEdhL0mA+aPDsVQoXxk/5UTtyncIlwA4dP4jMIEzSeh6qD/Jh20txj+fN5+h+P1Xs7P7ZloC2jE2OU99iun0E8LhfkF3Z/T9FMba2l2gYs9H4jEccsoTmaxow46g0LI45mJr4yBKhhKaXwDk1GYZpbGshfZXrrQU2YaBz5rm9Rqwv/CMw94hbVlQYPR+Xf75dbEkLYYVogY4CyAi0cIw8FeMZ5tRzjGbHAILlKlk22NheFIODHTsfCOjXp+F2d8V06fZ86rl9KwXvOdHBBx2dV+X8gEUBcw9t2j906OcBpKO11bI3f8etk/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725286794; c=relaxed/relaxed;
	bh=IdelkNQNEJ/x7d6HdhvWfHMFNgEcvt0QuA/u9U3RtjY=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=Lwy/qYTUVnXbjL8qP8HBWkdwMtVe2g9jUOgXuIuIv9PzktA75C5FbV5IJYtoA+/Q3J1hgr5yBbZi9isFF4ERQkeWXVlay/Y24iN2UOQK6Ap04X4SV7DsQFRBcLlmTuqGIl4Gvm5fLZQzjieVEKF7VNQOSTU81VUUkb+/OVftvMSk0c4BCwDDE1tudgxYvIdVYZx1mTY7iLamG1abhSqzaJKoMVY0EH+wDBRqTH15uEVOArmnzGeOhAQUqooUFFARJzQFk3JSnvEW+/wPJqKAg0398kVofpe7iIcDbKxs6m4QkN4alwCbTXvHKVQse/dpN/h2xgZHqQTQ9Wz6wF1tMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=KeV5OogA; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=KeV5OogA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy9rB1Xwsz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 00:19:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA8845C10A2;
	Mon,  2 Sep 2024 14:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9739EC4CEC2;
	Mon,  2 Sep 2024 14:19:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="KeV5OogA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725286788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdelkNQNEJ/x7d6HdhvWfHMFNgEcvt0QuA/u9U3RtjY=;
	b=KeV5OogAbTBAMOtuoki3DgeJqyVvllDRgndH2dkze3yJLmaacKcbExWRMITKy5or0SV258
	x4gQsu2kUb+oZQiOAJEgQaamdG25Rb8FTyy7E8qPs0Lh1OU6kkbcfMQTYpVqXGsBV9qP8K
	jOeTQOwZFwE9yTVHoh1o8Hd59SW8oSE=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5527ce07 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 2 Sep 2024 14:19:47 +0000 (UTC)
Date: Mon, 2 Sep 2024 16:19:42 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
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
Message-ID: <ZtXJfiA1lU55JLMM@zx2c4.com>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
 <27de70dcc356e56754a03a2887a97597f5e840a4.1725278148.git.christophe.leroy@csgroup.eu>
 <ZtWyeuCfzZ66fVsg@zx2c4.com>
 <bdf1a515-b3d0-471d-89ee-989ae0d63202@csgroup.eu>
 <ZtXE-AISB4w9U9Yc@zx2c4.com>
 <c411b0c6-1806-4e4d-8bcf-51f0747fcd19@csgroup.eu>
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
In-Reply-To: <c411b0c6-1806-4e4d-8bcf-51f0747fcd19@csgroup.eu>

On Mon, Sep 02, 2024 at 04:16:48PM +0200, Christophe Leroy wrote:
> Can do that, but there will still be a problem with chacha selftests if 
> I don't opt-out the entire function content when it is ppc64. It will 
> build properly but if someone runs it on a ppc64 it will likely crash 
> because only the low 32 bits of registers will be saved.

What if you don't wire up the selftests _at all_ until the ppc64 commit?
Then there'll be no risk.

(And I think I would prefer to see the 32-bit code all in the 32-bit
commit; that'd make it more straight forward to review too.)

