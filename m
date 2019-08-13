Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF758B533
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 12:15:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4677rx4hJ0zDqYK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 20:15:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4677jc546nzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 20:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="m4llgH2r"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4677jc3r74z9sP6; Tue, 13 Aug 2019 20:09:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4677jc34qTz9sNk; Tue, 13 Aug 2019 20:09:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1565690964; bh=lkQErqq2LggBXUmI28o57yvUkVxgeWvgJahOWziULOo=;
 h=Date:From:To:Cc:Subject:From;
 b=m4llgH2rlAYympdshVOV79m+3UqrNgy+kEuLMIDXzG2jfZp3kPjGHrIV8vK5soz8D
 wwQumHYK7E+KDsZwrIWMYGBkUZak3hMwSc+HNxaZ1lrn2LZaqt5NZrEHgj6IAujEjN
 D99Nu9mxtpxiuEPZ35eepsplGgIbmoGXnONyecEgCo9WOHXp9cPnLu1Sayd3qb77FX
 C7VOunYKUpCoHW9I9yiZxNhC0b9X+kBunz98NZYxVcLlqpmP15ce07qpYacMy7FWYO
 muI6L0cvOaSlYj0bJ70hqKyxx9BDB4mpYiCBAkayGbBzn7/Zr994lv8+THkIuzAp5h
 xW0KJnGJVuFXg==
Date: Tue, 13 Aug 2019 19:58:45 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH v2 0/3] powerpc/xive: Fix race condition leading to host
 crashes and hangs
Message-ID: <20190813095845.GA9567@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes a race condition that has been observed in testing
on POWER9 machines running KVM guests.  An interrupt being freed by
free_irq() can have an instance present in a XIVE interrupt queue,
which can then be presented to the generic interrupt code after the
data structures for it have been freed, leading to a variety of
crashes and hangs.

This series is based on current upstream kernel source plus Cédric Le
Goater's patch "KVM: PPC: Book3S HV: XIVE: Free escalation interrupts
before disabling the VP", which is a pre-requisite for this series.
As it touches both KVM and generic PPC code, this series will probably
go in via Michael Ellerman's powerpc tree.

V2 of this patch series adds a patch fixing a bug noticed by Cédric,
and also fixes a bug in patch 1/2 of the v1 series.

Paul.

 arch/powerpc/include/asm/xive.h         |  8 +++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 38 +++++++++-----
 arch/powerpc/kvm/book3s_xive.c          | 42 +++++++++++++++-
 arch/powerpc/kvm/book3s_xive.h          |  2 +
 arch/powerpc/kvm/book3s_xive_native.c   |  6 +++
 arch/powerpc/sysdev/xive/common.c       | 87 ++++++++++++++++++++++++---------
 6 files changed, 146 insertions(+), 37 deletions(-)
