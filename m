Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA129F1AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 17:37:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMWM93JvvzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 03:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bpd85E4L; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=dlMdLmQE; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMW7W5SGfzDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 03:27:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603988850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U6ucExP53XsVuBHTIJjynzcjVBwXkXFE9HrshKR2yNc=;
 b=bpd85E4L3l1MPpogqISFzEkpE2slVXjUgtuShWGvMSkYsTJ3L557jJMh3L/s04hxktKCAj
 dZsfzAR8my365duSinEXWgAVeKaXG0chjzNp9dY/9/OIFmS0QKd3qszA3dZfoY9bMX/xnx
 IrHUNHZf3TRdq08SU3e+G75YZJiyP8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603988851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U6ucExP53XsVuBHTIJjynzcjVBwXkXFE9HrshKR2yNc=;
 b=dlMdLmQEcXLJZyOkEEsYGr84jwUJbpMscelwn95fqKuQEOBBgtsc3MM74ycdKDp4uE3yQT
 tKOpOzTe13SyfhP0slX7yyK/DdZBT4V0F0oHv9rGRR3WWKwevVB/pCeBReBsDeaK/fo+XF
 uenkP5SWEU5DRNngwBsPgv04hEaOSfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-qPI0bZwUNYmvdiUjZCSeyQ-1; Thu, 29 Oct 2020 12:27:28 -0400
X-MC-Unique: qPI0bZwUNYmvdiUjZCSeyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBA8B18B6472;
 Thu, 29 Oct 2020 16:27:25 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-181.ams2.redhat.com [10.36.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B27B5C26A;
 Thu, 29 Oct 2020 16:27:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
Date: Thu, 29 Oct 2020 17:27:14 +0100
Message-Id: <20201029162718.29910-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Rashmica Gupta <rashmica.g@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powernv/memtrace is the only in-kernel user that rips out random memory
it never added (doesn't own) in order to allocate memory without a
linear mapping. Let's stop abusing memory hot(un)plug infrastructure for
that - use alloc_contig_pages() for allocating memory and remove the
linear mapping manually.

The original idea was discussed in:
 https://lkml.kernel.org/r/48340e96-7e6b-736f-9e23-d3111b915b6e@redhat.com

I only tested allocations briefly via QEMU TCG - see patch #4 for more
details.

David Hildenbrand (4):
  powerpc/mm: factor out creating/removing linear mapping
  powerpc/mm: print warning in arch_remove_linear_mapping()
  powerpc/mm: remove linear mapping if __add_pages() fails in
    arch_add_memory()
  powernv/memtrace: don't abuse memory hot(un)plug infrastructure for
    memory allocations

 arch/powerpc/mm/mem.c                     |  48 +++++---
 arch/powerpc/platforms/powernv/Kconfig    |   8 +-
 arch/powerpc/platforms/powernv/memtrace.c | 134 ++++++++--------------
 include/linux/memory_hotplug.h            |   3 +
 4 files changed, 86 insertions(+), 107 deletions(-)

-- 
2.26.2

