Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B45BE5AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 14:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX12Z3Nv4z3dpY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:24:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVh6fIjk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AiuZqNLo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVh6fIjk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AiuZqNLo;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX10p5T5sz3bxp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 22:23:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663676594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Elnu7bpANXPrM1PE7lHq91CUKuXWmTGmVUjcxfcQtwA=;
	b=JVh6fIjkcruXny8K/p2Mq0C1CTUjmKXM6G0gd6EEB3UR/Hou44iVNFTVqpbiFSZBoJQn/7
	Yo37/intm9ASSo9lC3lmhUQuufIF4Nfky3bidonTFjX+/KSmxGl3s+Y/bBP61yR2SOfoPw
	qzlOdGyVrgj8c3pU8vPlj6ImkhavR+w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663676595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Elnu7bpANXPrM1PE7lHq91CUKuXWmTGmVUjcxfcQtwA=;
	b=AiuZqNLoWT1nGeuooGt2asVklwZ5zZsqQOYIeXiRlgk3uGzNOQqbw4TEgtYRJ9czoGj2F1
	b8KoVz7BFMoTFRGmCXf630JJcbHIqsPoruqwcs89CQPjg+6i4yBAiImthocHeCFDH6vldh
	2vxAaaZ5evH0iltp0Oli+HoSP8o9vaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-w7ie62AuMA2p2FaXb2QrxA-1; Tue, 20 Sep 2022 08:23:09 -0400
X-MC-Unique: w7ie62AuMA2p2FaXb2QrxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4924862FE0;
	Tue, 20 Sep 2022 12:23:08 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 016C9C15BBC;
	Tue, 20 Sep 2022 12:23:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] coding-style.rst: document BUG() and WARN() rules
Date: Tue, 20 Sep 2022 14:22:59 +0200
Message-Id: <20220920122302.99195-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Young <dyoung@redhat.com>, linux-doc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As it seems to be rather unclear if/when to use BUG(), BUG_ON(),
VM_BUG_ON(), WARN_ON_ONCE(), ... let's try to document the result of a
recent discussion.

Details can be found in patch #1.

RFC -> v1:
* "coding-style.rst: document BUG() and WARN() rules ("do not crash the
   kernel")"
 -> Rephrase/extend according to John
 -> Add some details regarding the use of panic()
* powerpc/prom_init: drop PROM_BUG()
 -> Added
* "checkpatch: warn on usage of VM_BUG_ON() and other BUG variants"
 -> Warn on more variants


Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: David Laight <David.Laight@ACULAB.COM>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>

David Hildenbrand (3):
  coding-style.rst: document BUG() and WARN() rules ("do not crash the
    kernel")
  powerpc/prom_init: drop PROM_BUG()
  checkpatch: warn on usage of VM_BUG_ON() and other BUG variants

 Documentation/process/coding-style.rst | 61 ++++++++++++++++++++++++++
 arch/powerpc/kernel/prom_init.c        |  6 ---
 scripts/checkpatch.pl                  |  6 +--
 3 files changed, 64 insertions(+), 9 deletions(-)

-- 
2.37.3

