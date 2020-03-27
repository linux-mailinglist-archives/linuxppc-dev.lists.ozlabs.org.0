Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BBB195D8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 19:24:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pqxZ2B0NzDrHt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 05:24:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pqhC4wwkzDrF5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 05:12:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zYES3GlKGcM7crEsvdy2paQv/BH/eO5CEBPjP7k6Uvk=; b=MbHa8GhbAzkgDT1RL7oyhbdD9I
 p+UbUEHqIr3qwiJAMBt/RKUn6JdENFVl5bUttB34HI4/JbYqxKbwUfG/Os8hfOEyVE+aKmhD/P4sK
 rch5dMmNULfIJ1uuaujWahKzzxXbypdHMfuAsvFjM2t/buKfqsq8LrrIV8XMPrKH9IPr0tW+JZxat
 1zCX/wQPBCuBMFhuYob83FcbXKVExzJ2uarL3Ug3oYaCBUYTBd4WrAbX2ziJ/Qgp5V27xWmnI2N2i
 dK9IpsNxA2ETks9Q5NsUF+JrovbPNA/5JB8PaGfowgLMnP5ltET7Nt6fFC4eCttI+YkQwYhXKVE2L
 Tvju8yow==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHtSu-0000z1-4t; Fri, 27 Mar 2020 18:12:20 +0000
Message-Id: <cover.1585332596.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 11:09:56 -0700
Subject: [PATCH 0/3] powerpc: Minor updates to improve build debugging
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 18:12:20 +0000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Here are a few minor updates to the powerpc build files that make debugging
build problems a little easier.  Please consider.

-Geoff

The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-powerpc

for you to fetch changes up to e6fb89a0946dd620f1d8120578744942ca934e11:

  powerpc/head_check: Avoid broken pipe (2020-03-27 09:41:41 -0700)

----------------------------------------------------------------
Geoff Levand (3):
      powerpc/head_check: Automatic verbosity
      powerpc/wrapper: Output linker map file
      powerpc/head_check: Avoid broken pipe

 arch/powerpc/boot/wrapper        | 3 ++-
 arch/powerpc/tools/head_check.sh | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.20.1

