Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9994AF0C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 19:43:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lQJO3Xq4;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CLGXTOSi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfHbG001Nz3dK4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 03:43:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lQJO3Xq4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CLGXTOSi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfHZX6yGWz3cyg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 03:43:00 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723052564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O17//GHBjtdgWWLp7j6suJ5mr+yILELiVZI8I7jqXd8=;
	b=lQJO3Xq4UzG2uiSj4Abwu/wFyet5Uz7Qj0u138+bL3RqJhRZAhGAbjXAeOQBJ9qOcv7xAt
	CyUQ42OQQ302hK4AWxOlGEEmvaplj8JfQsTLVxJ9KMqMd5Yame290NuTiNSePYCkuRVWni
	/VP6qG9s1KeH8TCoreyr/DA2oxUoM5VHL3VtSWbqQIVJm1hY5o1FjqBS9/s2f5R513WMMQ
	qZb0bwWn0ofkZXiO+N/up2+x2yMWBc9VbTKB7asiV5Jjnr9learLUct5EsFuTgQqrs+jFV
	uhVMNizbU6f8/vVmob+2IPJxMGMsLNUUptBCHvLzJ0q6r5qtgDyTa5jtTLHLew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723052564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O17//GHBjtdgWWLp7j6suJ5mr+yILELiVZI8I7jqXd8=;
	b=CLGXTOSiSAxkDphJKiLJfTYIUdZttAgQt+XNoOQn0nzVS737RlVkM48r1QdHFzf8gdG40q
	UePiSpTtl/4N5cBw==
To: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org
Subject: Re: [PATCH 3/4] mm: Remove arch_unmap()
In-Reply-To: <20240807124103.85644-3-mpe@ellerman.id.au>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <20240807124103.85644-3-mpe@ellerman.id.au>
Date: Wed, 07 Aug 2024 19:42:43 +0200
Message-ID: <877ccs2prg.ffs@tglx>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, jeffxu@google.com, jeffxu@chromium.org, oliver.sang@intel.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07 2024 at 22:41, Michael Ellerman wrote:
> Now that powerpc no longer uses arch_unmap() to handle VDSO unmapping,
> there are no meaningful implementions left. Drop support for it
> entirely, and update comments which refer to it.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
