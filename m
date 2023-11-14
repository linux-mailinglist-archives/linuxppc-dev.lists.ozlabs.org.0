Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DA7EACDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 10:18:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cp4bVDmQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZN12+5gq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV1176lksz3cnZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 20:18:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cp4bVDmQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZN12+5gq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV10F4xvhz2xdd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 20:17:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699953431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MtEPkJopop+ROXauEEPPt+ntR5SxkjHn3hndM/5Vkgk=;
	b=cp4bVDmQO1qESqhTLv/GUzhJ6eJHYnOB0N6PPenrB5AZnKhwdMnGwMXa7hiKSODCyxx+zP
	WY7loPIeKA9FrvXDwC0jUQ+1bGKvn/OWia4hdJ3UTCuZhrHKPgtGuqfV43ERc+jwQQBgTi
	XShU72G0h2Tw4XuOVsQM5e5xwR56b18=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699953432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MtEPkJopop+ROXauEEPPt+ntR5SxkjHn3hndM/5Vkgk=;
	b=ZN12+5gqojUsILdt4dDPBX41HlLw8LTFzImwdY2uzanUfGvvwKVjIzX+Q81e4KCBXC+Zrr
	cI2m7iLcFnt+KFfc2TKpbgjaVaExUpWy58M0UKss2LXXyMiTYpw5cFas4Ym1EGSXEIPJo4
	VLRlXEjJZ1LP5ODKqGIALEP6jTNBz9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-HXGGcwenPp2Kdq6IOqHFRA-1; Tue, 14 Nov 2023 04:17:06 -0500
X-MC-Unique: HXGGcwenPp2Kdq6IOqHFRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A04CF821C21;
	Tue, 14 Nov 2023 09:17:05 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 615C72166B26;
	Tue, 14 Nov 2023 09:17:01 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] kexec_file: Load kernel at top of system RAM if required
Date: Tue, 14 Nov 2023 17:16:56 +0800
Message-ID: <20231114091658.228030-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, takahiro.akashi@linaro.org, ebiederm@xmission.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Justification:
==============
Kexec_load interface has been doing top down searching and loading
kernel/initrd/purgtory etc to prepare for kexec reboot. In that way,
the benefits are that it avoids to consume and fragment limited low
memory which satisfy DMA buffer allocation and big chunk of continuous
memory during system init; and avoids to stir with BIOS/FW reserved
or occupied areas, or corner case handling/work around/quirk occupied
areas when doing system init. By the way, the top-down searching and
loading of kexec-ed kernel is done in user space utility code.

For kexec_file loading, even if kexec_buf.top_down is 'true', it's simply
ignored. It calls walk_system_ram_res() directly to go through all
resources of System RAM bottom up, to find an available memory region,
then call locate_mem_hole_callback() to allocate memory in that found
memory region from top to down. This is not expected and inconsistent
with kexec_load.

Implementation
===============
In patch 1, introduce a new function walk_system_ram_res_rev() which is
a variant of walk_system_ram_res(), it walks through a list of all the
resources of System RAM in reversed order, i.e., from higher to lower.

In patch 2, check if kexec_buf.top_down is 'true' in kexec_walk_resources(),
if yes, call walk_system_ram_res_rev() to find memory region of system RAM
from top to down to load kernel/initrd etc.

Background information:
=======================
And I ever tried this in the past in a different way, please see below
link. In the post, I tried to adjust struct sibling linking code,
replace the the singly linked list with list_head so that
walk_system_ram_res_rev() can be implemented in a much easier way.
Finally I failed.
https://lore.kernel.org/all/20180718024944.577-4-bhe@redhat.com/

This time, I picked up the patch from AKASHI Takahiro's old post and
made some change to take as the current patch 1:
https://lists.infradead.org/pipermail/linux-arm-kernel/2017-September/531456.html

Testing:
========
Only tried on x86_64

Baoquan He (2):
  resource: add walk_system_ram_res_rev()
  kexec_file: Load kernel at top of system RAM if required

 include/linux/ioport.h |  3 +++
 kernel/kexec_file.c    |  2 ++
 kernel/resource.c      | 61 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

-- 
2.41.0

