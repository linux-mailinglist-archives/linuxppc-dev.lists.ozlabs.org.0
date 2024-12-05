Return-Path: <linuxppc-dev+bounces-3826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411D9E5B01
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 17:12:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3ztf0Ndmz2yNf;
	Fri,  6 Dec 2024 03:12:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733415145;
	cv=none; b=chGMIy10j+YpLsh5GkSDt14WL0ARnLrdteeMqGjaZi1TtyFw3OI2xAyYC6zlfJhCtdY6bmAA+srYK81n0PGqserYzEq5PjndKF9JTwHjV4LBkcJMdpNyv/tXwF4IvCx1hegzcqvtHoMo6HzOX5xZ+OtQFzm7Om5Dh4gXEq0To4ZwPzNa0Sw4wJxxUSodEtty2Q9HXAOmwQOxF82YS6RZyTRy8GWn4pTbrUQMKDDJKr+h6i5vPOaJQxcRvSWGOH7A4pZERWlbnYqE+rZLWOQK66a/ZUqWpxAqApR6Bz/0ltNNcWfXziRYqXB3wraNOSZJvYdLhfmCzpqEOncZ9chmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733415145; c=relaxed/relaxed;
	bh=OG5fCxgMQ2Y/Y54cuXKA24jMQsIKEcpN7WyTfNoTDoc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8fOP0KnUVMZybRSIpDi6NokS0vmuDzM0jwKQkuLJQMIpacBTjCpn959xtiuxotRvoBohk/HatKs2CvxfrdzrXk9oi3jpBi9OyN3O3zR6xR8zEU9WhStQIzHmzzos/Y51MJg5F+Mp022f9k/lB0hgokpXliJRhi++W40JYWsDJv3szIpU5pLsls/eVa27F/WKvH0+KtITV+GIVi36lWLQkjseHi8QPp3Iwnf0TDuciUg1cXhyUkHbaAUib2x6f02xyaLZZ6b6BgFic48jnhnuEY85jKE3N6e8Uxphu463PaQbwmKXxj+OfRpJb+6wBLv0xshLysqPLKX8UT37DOhKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=yulh=s6=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=yulh=s6=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3ztb6Cz6z2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 03:12:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 944325C5FC3;
	Thu,  5 Dec 2024 16:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC47C4CED1;
	Thu,  5 Dec 2024 16:12:17 +0000 (UTC)
Date: Thu, 5 Dec 2024 11:12:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, "Naveen N. Rao" <naveen@kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/ftrace: adjust offset for kprobe syntax
 error test
Message-ID: <20241205111222.6dbcd3f3@gandalf.local.home>
In-Reply-To: <d9467ba5-ec01-4683-8078-d85574b2506c@linuxfoundation.org>
References: <20241129202621.721159-1-hbathini@linux.ibm.com>
	<20241202144111.75d1bb3b@gandalf.local.home>
	<fa1e747f-1823-4d20-86c0-b85a3b959952@linuxfoundation.org>
	<20241203202008.1f30a266@gandalf.local.home>
	<d9467ba5-ec01-4683-8078-d85574b2506c@linuxfoundation.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 5 Dec 2024 09:06:43 -0700
Shuah Khan <skhan@linuxfoundation.org> wrote:

> I applied this to linux-kselftest fixes - will send it up for rc2 or rc3

Thanks Shuah,

-- Steve

