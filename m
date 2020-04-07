Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F01A0EBE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:58:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xTWx70x3zDqlV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 23:58:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fcTdeDCI; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xTRd2s2QzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 23:54:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586267671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RINIddZUqq5kUQ1PrShNaCH2LZ2pehWwvKUvtGUDiTs=;
 b=fcTdeDCIno4jMh+U8WynjON+qyDaEPfv2SdRFSVLaOPiZMJtWcv/0IpqCTV81aYbaJcSgT
 89tgfquHztr2j1CttajXfXd63SDuIkQlAZ0S1Si1PPythINF4gfXB4ZoHjkf0iwcx+STDM
 rgs98bRnrTRkuKVgLjk8cpDV1Bu9T4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-MKl6M0WKP2SXWRLZchOcBQ-1; Tue, 07 Apr 2020 09:54:25 -0400
X-MC-Unique: MKl6M0WKP2SXWRLZchOcBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7E9185EE6E;
 Tue,  7 Apr 2020 13:54:23 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA56E7E303;
 Tue,  7 Apr 2020 13:54:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] mm/memory_hotplug: remove is_mem_section_removable()
Date: Tue,  7 Apr 2020 15:54:14 +0200
Message-Id: <20200407135416.24093-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
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
Cc: Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the follow-up of "[PATCH v1] drivers/base/memory.c: indicate all
memory blocks as removable" [1], which gets rid of
is_mem_section_removable().

More details can be found in [1] and [2]

[1] https://lkml.kernel.org/r/20200128093542.6908-1-david@redhat.com
[2] https://lkml.kernel.org/r/20200117105759.27905-1-david@redhat.com

David Hildenbrand (2):
  powerpc/pseries/hotplug-memory: stop checking
    is_mem_section_removable()
  mm/memory_hotplug: remove is_mem_section_removable()

 .../platforms/pseries/hotplug-memory.c        | 26 +------
 include/linux/memory_hotplug.h                |  7 --
 mm/memory_hotplug.c                           | 75 -------------------
 3 files changed, 3 insertions(+), 105 deletions(-)

--=20
2.25.1

