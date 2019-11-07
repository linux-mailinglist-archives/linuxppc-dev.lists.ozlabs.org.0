Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BDDF28A9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:05:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477wvH1td6zF3lt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:05:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477wd72WsxzF15M
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 18:53:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="nGEZ4HST"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 477qhh1Mjhz9sSZ;
 Thu,  7 Nov 2019 15:11:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573099877;
 bh=jm+Vmz+Pe7sP6gnY/53imRBZ6Tetxa/ULKWT1LQn32s=;
 h=From:To:Cc:Subject:Date:From;
 b=nGEZ4HSTIgls3CXaH1R45tNp1G2bg8tkVvtlcpeSIfLUtD5OacZlsKhOdD1Ah17UQ
 bBsQAoFnSZvqLWXFbDk0cKgJp6EBi7eytHRbm7UfTei8PuVnMjKzaxB8TONbnIGNNN
 N7IGsFNfl6qqIdqPgZTtatB0zDhjUwfNQBNJssxVO4WBVRkC5898TJ4D1wpjiYLeYt
 7Dk3E5B0Jvp2CST7nOThi6BCxwPh0lkYLdyXT00PVJhXXbuOhrEjNEC6TKNkGKWYc+
 hgOba/wksd6OuWw0k5D/ajIoH6NTRdo4mle0T4b6fX3+R2n5EF4wuAo3xTalLBD3zK
 5f+x1pwWBpUww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au> 
Subject: Please add powerpc topic/kasan-bitops branch to linux-next
Date: Thu, 07 Nov 2019 15:11:12 +1100
Message-ID: <87r22k5nrz.fsf@mpe.ellerman.id.au>
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com,
 linux-next@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

Can you please add the topic/kasan-bitops tree of the powerpc repository
to linux-next.

powerpc         git     git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git#topic/kasan-bitops

See:
  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kasan-bitops

This will be a (hopefully) short lived branch to carry some cross
architecture KASAN related patches for v5.5.

cheers
