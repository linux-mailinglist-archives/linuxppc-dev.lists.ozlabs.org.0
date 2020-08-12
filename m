Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB1242693
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 10:13:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRMs51fvGzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:13:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRMpM08y2zDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 18:10:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=vCjHb5vB; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BRMpK6zPrz9sTS;
 Wed, 12 Aug 2020 18:10:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597219850;
 bh=EwYn/Or/GSQzchVBqT38g5LKug7ijXeHeDaIIpnLpgM=;
 h=From:To:Cc:Subject:Date:From;
 b=vCjHb5vB0xNL3gFbdRAoyPCkvj/rq/rfTBjSv4BuPO/Vuvb4vliV9ZqT+5p5jQ1iE
 B7vbM9mxSTZen1oY1ADqoVUnFYgMV+txvtXOh0ePP0Rzv4L7lTx4zRtpLD7zWba+Ok
 7wKhZsW/0isHR4QkAAmsjafeEUG6cYeGFG1N5MMEftCnjWrYI6VDWjwi7VgnNKTWEe
 GSkAJE8VlPh8CcEgFD0EkJ+n794sZeGM5wKep6HJMuL8KV9PF3xQ1KPg9AasKV3MqW
 UHnJkKyzz9PiLSZUsO9hbEDyCfRQpNBzelszKPLVKlPpQrlFiOoC14bwV7J3Y40YhB
 JSnTvmFqdpJ2g==
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/2] powerpc: unrel_branch_check.sh: enable llvm-objdump
Date: Wed, 12 Aug 2020 18:10:34 +1000
Message-Id: <20200812081036.7969-1-sfr@canb.auug.org.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Linux PowerPC List <linuxppc-dev@lists.ozlabs.org>,
 Bill Wendling <morbo@google.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These 2 patches enable this script to work properly when llvm-objtool
is being used.

They depend on my previos series that make this script suck less.

Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Bill Wendling <morbo@google.com>

