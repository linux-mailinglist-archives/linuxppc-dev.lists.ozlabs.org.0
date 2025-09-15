Return-Path: <linuxppc-dev+bounces-12256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97BB58635
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 22:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQcdb72sdz2yCK;
	Tue, 16 Sep 2025 06:51:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757969491;
	cv=none; b=XeLa0R7kJxSyq7OVDrYSSmAsYcj4sRWW54UcBMOfDSQIWQsCm6ehpXkulCGatT8lt2tPslagF5LHt92CqBMg5iLr+kyeBlpxOoVQrcH603s8pmKeW9+o0+PxP248oKX8k6ALVVXGhW8hWnZv2W/GtRA3s5KnY3WaKoVGxJEbJvAikgosbHX5mWLiBNvS68kAi31Pz3OdYvtt0tTXzb3gkgnuyeA/j9wn1IJl1UfgW2/QyUe6XidgHi8lurvklvMCbD+JUfzi6G4nuq6BhwSY4rvRYGt06NzY7wCtb4tm/HZgsJFmOPm95KbO5iFCA0ZzwtAhudiNZCfP46nHoRKUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757969491; c=relaxed/relaxed;
	bh=7rPOUNSKjPh4xy6BLtaDSFDtBxmH2telq/K+IIfMn+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZym1yZE7ccfNcpyUfgrcs2H5G4qnSeA4oNNoF98pHk/SwmdQm+UcczfARLStmiA1JS0Fi96I3grtJ+ffY+ME0clVIyhFFoO0hKzU1IHdnGOvMY8j0rxrF7ISFZw+X4Y8UmUokOD8UcDYFWD0P0rKCuueFKVDdv08jcQ5V6vTApEaz92/HG4Y+rE8LnyFwK+XhUrQMpzCxLX71U9ZAYJqzysGdcF/kI5orSogpADLMjyy0p7HhOYniInie0yFDg3QJMt1EuR2BJl1krdkuFNt9HnlIogbbnEn4rn91adZ49BLvhG0WzTw+/MFwDjiX5XDnjbv3HVMuUlbrTDdioD7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z92rmyCy; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ul2WS9wG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z92rmyCy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ul2WS9wG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQcdZ3xnSz2xnx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 06:51:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757969482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7rPOUNSKjPh4xy6BLtaDSFDtBxmH2telq/K+IIfMn+E=;
	b=Z92rmyCyxBQyJj9ytIY6jSJAPnhbOq0rHa9SIWFWpRKEIAaiYrb5FrSKdNhOD22GQ9Eg7d
	Pcy/Pgz90x6KZWDgxG3TVcoJy7vOLcmp+g90OJelnzYjQd/gDmuYWi4ATeY6YrNj+MX2CX
	XFyLz0PWIu3webS1SfSNY7HyfR9Axvk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757969483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7rPOUNSKjPh4xy6BLtaDSFDtBxmH2telq/K+IIfMn+E=;
	b=Ul2WS9wGPl0IYPbc8D+DTKZMydqm1GjVFLiUUVYHEM65ntpHjX4icvFiFc73UU7g7xCJXv
	B3kHJcvZgaDXQtDPorLrTXO+zn50eg8jEYBNvCpEqRKvxgsgEH60CXxlORwzMtTvdjesV6
	ECJYbXc2jkwO8FtDKRn/fNeHSEouf6I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-43-bCfdDYtiNDq6GW0h-gRsqg-1; Mon,
 15 Sep 2025 16:51:20 -0400
X-MC-Unique: bCfdDYtiNDq6GW0h-gRsqg-1
X-Mimecast-MFC-AGG-ID: bCfdDYtiNDq6GW0h-gRsqg_1757969478
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE9101800350;
	Mon, 15 Sep 2025 20:51:17 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5CA7F300021A;
	Mon, 15 Sep 2025 20:51:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-spdx@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH] macintosh/via-pmu: Replace GPLv2 boilerplate text with SPDX
Date: Mon, 15 Sep 2025 22:51:12 +0200
Message-ID: <20250915205112.353656-1-thuth@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thomas Huth <thuth@redhat.com>

The FSF does not reside in 51 Franklin Street anymore, so we should
not ask the people to write to that address in case they need a
copy of the GPL. To fix it, replace the boilerplate text by a proper
SPDX tag.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 drivers/macintosh/via-pmu-event.c | 17 +----------------
 drivers/macintosh/via-pmu-led.c   | 17 +----------------
 2 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/macintosh/via-pmu-event.c b/drivers/macintosh/via-pmu-event.c
index 25cd56542328c..7a73956e9b8a6 100644
--- a/drivers/macintosh/via-pmu-event.c
+++ b/drivers/macintosh/via-pmu-event.c
@@ -1,23 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * via-pmu event device for reporting some events that come through the PMU
  *
  * Copyright 2006 Johannes Berg <johannes@sipsolutions.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- * NON INFRINGEMENT.  See the GNU General Public License for more
- * details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
- *
  */
 
 #include <linux/input.h>
diff --git a/drivers/macintosh/via-pmu-led.c b/drivers/macintosh/via-pmu-led.c
index fc1af74b65967..cbbb0036254cb 100644
--- a/drivers/macintosh/via-pmu-led.c
+++ b/drivers/macintosh/via-pmu-led.c
@@ -1,23 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * via-pmu LED class device
  *
  * Copyright 2006 Johannes Berg <johannes@sipsolutions.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- * NON INFRINGEMENT.  See the GNU General Public License for more
- * details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
- *
  */
 #include <linux/types.h>
 #include <linux/kernel.h>
-- 
2.51.0


