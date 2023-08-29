Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7878C85F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 17:13:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8H0uIgy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8H0uIgy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZrXy17K3z3c3M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 01:13:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8H0uIgy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8H0uIgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZrX30gZyz2ytr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 01:12:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693321967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=w3CVYpgxTsvHbKTea4nnprzsRm89plHSxyih6vxlw24=;
	b=e8H0uIgylawxU+7re+cJ2m9NIKNvKpbrTakWjg1JnvxXm4JXkQTQqCCtesXvV3JZaKEhCN
	6ccJKveNCD06z5FsOOk9hLGMlKTxnFQtPgootUsYt7FlA+uhkzC+FqLdJFtZ8a4Zs4IK7U
	etCd7DRXRVfRR8izm+P5kUyIJoHrH/U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693321967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=w3CVYpgxTsvHbKTea4nnprzsRm89plHSxyih6vxlw24=;
	b=e8H0uIgylawxU+7re+cJ2m9NIKNvKpbrTakWjg1JnvxXm4JXkQTQqCCtesXvV3JZaKEhCN
	6ccJKveNCD06z5FsOOk9hLGMlKTxnFQtPgootUsYt7FlA+uhkzC+FqLdJFtZ8a4Zs4IK7U
	etCd7DRXRVfRR8izm+P5kUyIJoHrH/U=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-xaklgDF5NhOHUji6ZcH9AA-1; Tue, 29 Aug 2023 11:12:44 -0400
X-MC-Unique: xaklgDF5NhOHUji6ZcH9AA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0194A1C03D96;
	Tue, 29 Aug 2023 15:12:44 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE4FD401051;
	Tue, 29 Aug 2023 15:12:43 +0000 (UTC)
Date: Tue, 29 Aug 2023 11:12:42 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Recent Power changes and stack_trace_save_tsk_reliable?
Message-ID: <ZO4K6hflM/arMjse@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: live-patching@vger.kernel.org, Joe Lawrence <joe.lawrence@redhat.com>, Ryan Sullivan <rysulliv@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi ppc-dev list,

We noticed that our kpatch integration tests started failing on ppc64le
when targeting the upstream v6.4 kernel, and then confirmed that the
in-tree livepatching kselftests similarly fail, too.  From the kselftest
results, it appears that livepatch transitions are no longer completing.

Looking at the commit logs for v6.4, there looks to be some churn in the
powerpc stack layout code -- I am suspicious that "reliable" stack
unwinding may be left untested/broken after those changes.  AFAICT, the
livepatching subsystem is the only user of this interface in
kernel/livepatch/transition.c :: klp_check_stack()'s call to
stack_trace_save_tsk_reliable().  As such, the livepatching kselftests
are probably the only way to test reliable unwinding.

Unfortunately, git bisect isn't cooperating (we keep falling into a long
span of non-bootable commits, despite efforts to `git bisect skip` over
them), so we don't have an offending commit or patchset to point to.

A few other details:

- Test machine is a Power 9 9009-42A (IBM Power System S924)
- Reproducable with v6.4, v6.5
- Minimal repro:
-- Build with CONFIG_TEST_LIVEPATCH=m
-- Run tools/testing/selftests/livepatch/test-livepatch.sh

If this has already been report or fixed, please send any pointers to
threads / commits.  If not, I can provide any other info to help
reproduce.

Thanks,

--
Joe

