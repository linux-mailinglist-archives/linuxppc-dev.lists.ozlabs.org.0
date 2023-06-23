Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7096773B847
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 14:55:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AIIAE35r;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kjc/8qw2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QncfJ2DMxz3bZ1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 22:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AIIAE35r;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kjc/8qw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QncdK5P5Vz30K8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 22:54:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687524865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9fCMPOeXvmZRh+e8bRoilHrrW+K9gcC171wg8gjwxXk=;
	b=AIIAE35r585i+WzC3OkZsCl5UeXD9EaVfaAU1vsESpjb/nCMaO+UOrrsufMyods3PmRqu1
	oowrn4NYKVf2ypV7ZN7EZvepbJmcuYcItH9KPSEWfsRMBjTbylYu4TMuJJjyGv+Hn+yPdp
	TfGgkCoQTLaSSNDWGowq4r7CNs6GdWU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687524866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9fCMPOeXvmZRh+e8bRoilHrrW+K9gcC171wg8gjwxXk=;
	b=Kjc/8qw2UYP9BRQuVRQMCL6XcoXwjzTwutJLR4O4vifGL+PFUdEi932NT6sH2bSiIKKWls
	AGI9Rk/g6NoKkjbZ22lNPmuNoI0Rm4ZnyQgTb4U0QEHp+HFslv//bLD6IX27RtMsKiX5CT
	F/mB7OrEGLrTy1Cl1ikegVa3TKHBs1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-5TjDrdBlOmy0RWPp0ZCtNQ-1; Fri, 23 Jun 2023 08:54:22 -0400
X-MC-Unique: 5TjDrdBlOmy0RWPp0ZCtNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C3F3185A7A4;
	Fri, 23 Jun 2023 12:54:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBF14F41C8;
	Fri, 23 Jun 2023 12:54:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Nico=20B=C3=B6hr?= <nrb@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH 0/2] Rework LDFLAGS and link with noexecstack
Date: Fri, 23 Jun 2023 14:54:14 +0200
Message-Id: <20230623125416.481755-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: kvmarm@lists.linux.dev, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Laurent Vivier <lvivier@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I noticed that the latest version of ld (in Fedora rawhide) emits
a warning on x86 and s390x, complaining about missing .note.GNU-stack
section that implies an executable stack. It can be silenced by
linking with "-z noexecstack".

While trying to add this switch globally to the kvm-unit-tests, I
had to discover that the common LDFLAGS are hardly used anywhere,
so the first patch cleans up that problem first before adding the
new flag in the second patch.

Thomas Huth (2):
  Rework the common LDFLAGS to become more useful again
  Link with "-z noexecstack" to avoid warning from newer versions of ld

 Makefile                | 2 +-
 arm/Makefile.common     | 2 +-
 powerpc/Makefile.common | 2 +-
 s390x/Makefile          | 2 +-
 x86/Makefile.common     | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.3

