Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5C745B72
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 13:45:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o/pTtt8L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvkcj5rFFz3c35
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 21:45:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o/pTtt8L;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvkYx5wLFz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 21:42:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688384565;
	bh=U5YuiErzR98A6ucde78maFR8Nd+I4nB4/wMbbmnDPJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o/pTtt8L5lXobScjBYHMY1tIRIqaOZ04oySAid8aZM6sUKLX3ZN3qLCMGKKmn47FL
	 qsA/LU0dK7bt1EFnKvepsIjmsEO0FV6zoQ4m/qRn6Luh2yBJSCI1LiJ9r3Zu7tKxs7
	 /k+wFbuKgTV/Q/Bguc6LVOu15D1tbpg5cFZd6988zgHvDlZI+eeeDVBMJxjA0uzFFE
	 OdIiQEs7fsy9hKZdyOmTAhN/9ka/M+9nrH1h3s3BGPqFb+ueqGG5nxhB8QLUD34qmO
	 +YsBFVZf/xPLXKCawY4ryVfi1PuPkSZiUPdBqB3YSosMeOe5alnquOP1Sv9fzaPQyq
	 iKTD4/epF5GrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvkYx4M0Cz4wqZ;
	Mon,  3 Jul 2023 21:42:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230701054714.30512-1-rdunlap@infradead.org>
References: <20230701054714.30512-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
Message-Id: <168838439189.114505.9243193427099744583.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 21:39:51 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, Pali Rohár <pali@kernel.org>, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Jun 2023 22:47:12 -0700, Randy Dunlap wrote:
> In a randconfig with CONFIG_SERIAL_CPM=m and
> CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
> ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!
> 
> Prevent the build error by allowing PPC_EARLY_DEBUG_CPM only when
> SERIAL_CPM=y.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
      https://git.kernel.org/powerpc/c/39f49684036d24af800ff194c33c7b2653c591d7

cheers
