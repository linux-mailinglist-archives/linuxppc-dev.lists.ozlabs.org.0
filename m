Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 887121E9522
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 06:15:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZQ2J1cKLzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 14:15:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZPw66f3TzDqll
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 14:09:58 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id E3A9327F0C; Sat, 30 May 2020 19:20:32 -0400 (EDT)
Message-Id: <cover.1590880623.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 0/8] Mac ADB IOP driver fixes
Date: Sun, 31 May 2020 09:17:03 +1000
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The adb-iop driver was never finished. Some deficiencies have become
apparent over the years. For example,

 - Mouse and/or keyboard may stop working if used together

 - SRQ autopoll list cannot be changed

 - Some bugs were found by inspection

This patch series contains fixes for the known bugs in the driver, plus
a few clean-ups.


Finn Thain (8):
  macintosh/adb-iop: Remove dead and redundant code
  macintosh/adb-iop: Correct comment text
  macintosh/adb-iop: Adopt bus reset algorithm from via-macii driver
  macintosh/adb-iop: Access current_req and adb_iop_state when inside
    lock
  macintosh/adb-iop: Resolve static checker warnings
  macintosh/adb-iop: Implement idle -> sending state transition
  macintosh/adb-iop: Implement sending -> idle state transition
  macintosh/adb-iop: Implement SRQ autopolling

 arch/m68k/include/asm/adb_iop.h |   1 +
 drivers/macintosh/adb-iop.c     | 186 +++++++++++++++-----------------
 2 files changed, 86 insertions(+), 101 deletions(-)

-- 
2.26.2

