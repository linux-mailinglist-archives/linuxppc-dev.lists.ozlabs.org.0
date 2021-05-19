Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50246389753
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 22:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlkLh1XRdz3c4t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 06:02:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EPf+1bHe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXYwlF41;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=rgb@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EPf+1bHe; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HXYwlF41; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlkKk2TKDz305n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 06:01:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621454514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oqR82qYZ5cHPW+jMmb6LKw1zBxDgfEa0K+Sm55MnPRw=;
 b=EPf+1bHeNhuGn0Rrr6sUg9QfQAd3pj66II1RbGEWOtigcjPVeLdlvnzLgdbZ4Y3Ml5/UY+
 JV4+aRg24ZyBhNCJp+s2XFZ1vidOVJ/5Fg0FSke4zSpY4N3zWQdfhJSfd69xWB+3HO+5KU
 EsCQ+Uui8eWob2LecfwVc6NOTIvYi0s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621454515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oqR82qYZ5cHPW+jMmb6LKw1zBxDgfEa0K+Sm55MnPRw=;
 b=HXYwlF414X7rukZeL1nwxwbLVs04xzzwiIRuvLNNQRl/8xFSSGRHdYrlTMqjhz2xN8YDXK
 Ss0LuftVznTvQk8a0HnWJ3NrBX6hHNaJgrErgtmVgqMJQ2CNGKOtyOrW9wYkbGaIiskWel
 6xetYoyNZ1WG1UgyCVfAR1yNryhG6+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-6OHx4A6KP1SdsuldedHntQ-1; Wed, 19 May 2021 16:01:50 -0400
X-MC-Unique: 6OHx4A6KP1SdsuldedHntQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65013107AFA7;
 Wed, 19 May 2021 20:01:48 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.3.128.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7788D60BF1;
 Wed, 19 May 2021 20:01:44 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v4 0/3] audit: add support for openat2
Date: Wed, 19 May 2021 16:00:19 -0400
Message-Id: <cover.1621363275.git.rgb@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 x86@kernel.org, Eric Paris <eparis@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The openat2(2) syscall was added in v5.6.  Add support for openat2 to the
audit syscall classifier and for recording openat2 parameters that cannot
be captured in the syscall parameters of the SYSCALL record.

Supporting userspace code can be found in
https://github.com/rgbriggs/audit-userspace/tree/ghau-openat2

Supporting test case can be found in
https://github.com/linux-audit/audit-testsuite/pull/103

Changelog:
v4:
- change filename include/linux/auditscm.h to auditsc_classmacros.h to avoid socket association

v3:
- re-add commit descriptions that somehow got dropped
- add new file to MAINTAINERS

v2:
- add include/linux/auditscm.h for audit syscall class macros due to syscall redefinition warnings:
        arch/x86/ia32/audit.c:3:
        ./include/linux/audit.h:12,
        ./include/linux/sched.h:22,
        ./include/linux/seccomp.h:21,
        ./arch/x86/include/asm/seccomp.h:5,
        ./arch/x86/include/asm/unistd.h:20,
        ./arch/x86/include/generated/uapi/asm/unistd_64.h:4: warning: "__NR_read" redefined #define __NR_read 0
	...
        ./arch/x86/include/generated/uapi/asm/unistd_64.h:338: warning: "__NR_rseq" redefined #define __NR_rseq 334
    previous:
        arch/x86/ia32/audit.c:2:
        ./arch/x86/include/generated/uapi/asm/unistd_32.h:7: note: this is the location of the previous definition #define __NR_read 3                                                                                                      
	...
        ./arch/x86/include/generated/uapi/asm/unistd_32.h:386: note: this is the location of the previous definition #define __NR_rseq 386

Richard Guy Briggs (3):
  audit: replace magic audit syscall class numbers with macros
  audit: add support for the openat2 syscall
  audit: add OPENAT2 record to list how

 MAINTAINERS                         |  1 +
 arch/alpha/kernel/audit.c           | 10 ++++++----
 arch/ia64/kernel/audit.c            | 10 ++++++----
 arch/parisc/kernel/audit.c          | 10 ++++++----
 arch/parisc/kernel/compat_audit.c   | 11 ++++++----
 arch/powerpc/kernel/audit.c         | 12 ++++++-----
 arch/powerpc/kernel/compat_audit.c  | 13 +++++++-----
 arch/s390/kernel/audit.c            | 12 ++++++-----
 arch/s390/kernel/compat_audit.c     | 13 +++++++-----
 arch/sparc/kernel/audit.c           | 12 ++++++-----
 arch/sparc/kernel/compat_audit.c    | 13 +++++++-----
 arch/x86/ia32/audit.c               | 13 +++++++-----
 arch/x86/kernel/audit_64.c          | 10 ++++++----
 fs/open.c                           |  2 ++
 include/linux/audit.h               | 11 ++++++++++
 include/linux/auditsc_classmacros.h | 24 ++++++++++++++++++++++
 include/uapi/linux/audit.h          |  1 +
 kernel/audit.h                      |  2 ++
 kernel/auditsc.c                    | 31 +++++++++++++++++++++++------
 lib/audit.c                         | 14 ++++++++-----
 lib/compat_audit.c                  | 15 +++++++++-----
 21 files changed, 169 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/auditsc_classmacros.h

-- 
2.27.0

