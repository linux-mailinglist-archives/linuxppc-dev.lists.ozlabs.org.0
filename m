Return-Path: <linuxppc-dev+bounces-12090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E49B55163
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 16:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNcGL6rvKz3dK0;
	Sat, 13 Sep 2025 00:27:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757687274;
	cv=none; b=JMAu3bbU7O3kpwOQeN99oryLl1qUpZH3Xd/IFH4sYh7MZHqClo3YdNTk5s4b2mS9h/kmUQn+Zlp63YjTEDe8TU78Mju66BnG1ctFUt4gf4HjxEw2x3Edfmp3y1XJphsDqQ5FkJluP+FFVchbXYSwgFmhj0jxDh7/wWcqe4m52uMwjg630yNc8QIj4kicqag2jpOua4n3I8IbOIVSFlgGtgcX9CkbqmP2wHiRMvBKdnGo0izFmnJ6xRnizhUJtJ7ocJczx8NvDGPGhSGujIad7C63MAjFn/eqjxPkV3Trq7yMQ0ExK9foFvqHwsH+KUZHMGB1j2ckNHZmPujd5cMXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757687274; c=relaxed/relaxed;
	bh=wdMeJNpmaMWU91io11Cf7LsjSfeZyGuNLcRl222Xmsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=NHPMp87bFhB+pgFa0/sEEFx9C/jXuTRJ1ts5eKzoogy0mOuvizBCZaq8KRcppFC6GGfKfUIKxSeyT6AtdJp9X8Au38Xyny/CD9MewibTZe9WhyYAyZj5AF7Ji99fQXkMvjttxjxKGpCba+AOxd2PGv0/xBI0W1szEcBAmbwcKxL0cdpSK/kWk80qyzY36fJyjsLuNODTaPRC7Z6rkxASOmDtqTidkJuWW+yTM3prmqiaY4PoGPjlfzm/vIz8H6zYo0JsasvP2cB5729At87MUnj/18Wq6XqAKGGrT5j1qRbikwWRDswafkK3QW1QCDrNiEwCteB4pFNn9Rr7LwmGjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJiVGXQY; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJjYrEoB; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJiVGXQY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJjYrEoB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNcGK6mNsz3dJd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 00:27:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wdMeJNpmaMWU91io11Cf7LsjSfeZyGuNLcRl222Xmsw=;
	b=GJiVGXQYprZUMFqAK7PPmGP9/eAT8ev400PAGZBrI5gIVn2KLqChMnDty8WGpOiFqqXQXo
	4TU9BGwJlydxLprVD4Ago8cRE42WII8afKs63ufnZmajTWvRYh2I9r5sjNQ3IdWLuIYDFT
	wqi8JKfZJQGGQNh3Vy2nfSyjAXPqmTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wdMeJNpmaMWU91io11Cf7LsjSfeZyGuNLcRl222Xmsw=;
	b=MJjYrEoBbMykp/Avun9S1vaSZn5fHtfL+tO/q905oBijxAQAobtiHhPNyIeRBTNWd+FVIb
	bP+cb79izatzMSJEHNFvskMcAjn3gopboMaAOS2IlN0nb10R8I/O6PdO7kjA0jeLly+8SX
	giyWB6XQEZFEWjbbKyFOw/M6vv9h6Rw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-NH7vFBPcPI208v_eBsPDsA-1; Fri,
 12 Sep 2025 10:27:49 -0400
X-MC-Unique: NH7vFBPcPI208v_eBsPDsA-1
X-Mimecast-MFC-AGG-ID: NH7vFBPcPI208v_eBsPDsA_1757687268
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29E4B1956050;
	Fri, 12 Sep 2025 14:27:47 +0000 (UTC)
Received: from jolawren-thinkpadp1gen7.ibmlowe.csb (unknown [10.22.81.60])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D902180035E;
	Fri, 12 Sep 2025 14:27:44 +0000 (UTC)
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 0/3] powerpc/ftrace: Fix livepatch module OOL ftrace corruption
Date: Fri, 12 Sep 2025 10:27:37 -0400
Message-ID: <20250912142740.3581368-1-joe.lawrence@redhat.com>
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
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series fixes a couple of bugs in the powerpc64 out-of-line
(OOL) ftrace support for modules, and follows up with a patch to
simplify the module .stubs allocation code. An analysis of the module
stub area corruption that prompted this work can be found in the v1
thread [1].

The first two patches fix bugs introduced by commit eec37961a56a
("powerpc64/ftrace: Move ftrace sequence out of line"). The first,
suggested by Naveen, ensures that a NOP'd ftrace call site has its
ftrace_ops record updated correctly. The second patch corrects a loop in
setup_ftrace_ool_stubs() to ensure all required stubs are reserved, not
just the first. Together, these bugs lead to potential corruption of the
OOL ftrace stubs area for livepatch modules.

The final patch replaces the sentinel-based allocation in the module
.stubs section with an explicit counter. This improves clarity and helps
prevent similar problems in the future.

Changes since v1: https://lore.kernel.org/live-patching/df7taxdxpbo4qfn7lniggj5o4ili6kweg4nytyb2fwwwgmnyo4@halp5gf244nn/T/

- Split into parts: bug fix x2, code cleanup
- Call ftrace_rec_set_nop_ops() from ftrace_init_nop() [Naveen]
- Update commit msg on cleanup patch [Naveen]

Joe Lawrence (3):
  powerpc/ftrace: ensure ftrace record ops are always set for NOPs
  powerpc64/modules: correctly iterate over stubs in
    setup_ftrace_ool_stubs
  powerpc64/modules: replace stub allocation sentinel with an explicit
    counter

 arch/powerpc/include/asm/module.h  |  1 +
 arch/powerpc/kernel/module_64.c    | 26 ++++++++------------------
 arch/powerpc/kernel/trace/ftrace.c | 10 ++++++++--
 3 files changed, 17 insertions(+), 20 deletions(-)

-- 
2.51.0


