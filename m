Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6098125E42A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 01:28:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bjv4M1FlRzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 09:28:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bjv2F6JShzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 09:26:29 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 7745D2ACD4; Fri,  4 Sep 2020 19:26:27 -0400 (EDT)
Message-Id: <cover.1599260540.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 0/5] powerpc/tau: TAU driver fixes
Date: Sat, 05 Sep 2020 09:02:20 +1000
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series fixes various bugs in the Thermal Assist Unit driver.
It was tested on 266 MHz and 292 MHz PowerBook G3 laptops.


Finn Thain (5):
  powerpc/tau: Use appropriate temperature sample interval
  powerpc/tau: Convert from timer to workqueue
  powerpc/tau: Remove duplicated set_thresholds() call
  powerpc/tau: Check processor type before enabling TAU interrupt
  powerpc/tau: Disable TAU between measurements

 arch/powerpc/include/asm/reg.h |   2 +-
 arch/powerpc/kernel/tau_6xx.c  | 147 +++++++++++++--------------------
 arch/powerpc/platforms/Kconfig |  14 +---
 3 files changed, 62 insertions(+), 101 deletions(-)

-- 
2.26.2

