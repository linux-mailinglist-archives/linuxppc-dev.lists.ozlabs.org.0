Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7F81FF4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 13:08:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iGu4TXb/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1kfz6Thlz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 23:08:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iGu4TXb/;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1kf93VBfz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Dec 2023 23:07:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703851665;
	bh=WNHw3aubT3CF0HJcnnDIhvKd0BEO6tSg+Hq9A9JlkMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iGu4TXb/CKCjHX/4jPVQ4eDUlqFuFSdlZZYJ2xkG6zafiwk2/xfJgLZRdIU9lj7NK
	 4h6M5yDu8sclIooU+86sYEq/0aGejwlyrBgs8cLfFjK4P6f5CrNWAOZCC5I60crq8r
	 YsoyHTpOtbP4TwXG78B7DZ0M0+c9IBBmRJLPkErdaJquNvCo4THS1M8uae4hIHc2SE
	 KrvnI5E/ECtMLwjDpLUkXxsrhMaAziyKpL2qGCJxqwMJM9XEr2/gR1rbcGJiZIENkS
	 Eh3t7oWZGtCxmiGcJlxGx4bBmHDcUqai11XrIScnxrRQoc8gZk8hvhlVzZNRgBYOTq
	 MDnl12WqDBibA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T1kf92lGQz4wbQ;
	Fri, 29 Dec 2023 23:07:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pingfan Liu <kernelfans@gmail.com>, Pingfan Liu <piliu@redhat.com>, Hari
 Bathini <hbathini@linux.ibm.com>
Subject: Re: [RFC PATCH 5/5] powerpc/smp: Remap boot CPU onto core 0 if >=
 nr_cpu_ids
In-Reply-To: <20231229120107.2281153-5-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
 <20231229120107.2281153-5-mpe@ellerman.id.au>
Date: Fri, 29 Dec 2023 23:07:45 +1100
Message-ID: <87tto1jjou.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> If nr_cpu_ids is too low to include the boot CPU, remap the boot CPU
> onto logical core 0.

Hi guys,

I finally got time to look at this issue. I think this series should fix
the problems that have been seen. I've tested this fairly thoroughly
with a qemu script, and also a few boots on a real machine.

If you can test it with your setups that would be great. Hopefully there
isn't some obscure case I've missed.

cheers
