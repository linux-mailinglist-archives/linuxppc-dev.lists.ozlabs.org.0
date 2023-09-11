Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B779A840
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 15:20:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXzbrho4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXzbrho4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RknPq56Dlz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 23:19:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXzbrho4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXzbrho4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RknNy59Zhz2xdm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 23:19:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694438349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=23bwaDVIUeu1xrOkLjrcpotMczUMf0CbTLoopyLaEdA=;
	b=iXzbrho4CyMdNk5a0t2AzfHrF/4qM096Hz1OYsHBkVLiNvpAaTn9ByMJq0bTTgqtgTeKaU
	i46FtA96wZ0jdnfI6+Ig7NVKH4kQvYtnHG0Q+gGOAYj1KHgh3FZhXUV2MiunW4SFcDfo5K
	/foYHZhwVqF48Or7GZ98hUYdWJgANuU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694438349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=23bwaDVIUeu1xrOkLjrcpotMczUMf0CbTLoopyLaEdA=;
	b=iXzbrho4CyMdNk5a0t2AzfHrF/4qM096Hz1OYsHBkVLiNvpAaTn9ByMJq0bTTgqtgTeKaU
	i46FtA96wZ0jdnfI6+Ig7NVKH4kQvYtnHG0Q+gGOAYj1KHgh3FZhXUV2MiunW4SFcDfo5K
	/foYHZhwVqF48Or7GZ98hUYdWJgANuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-6aQ1HiQLPTmuF6_IFR5hlw-1; Mon, 11 Sep 2023 09:19:05 -0400
X-MC-Unique: 6aQ1HiQLPTmuF6_IFR5hlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26680101A529;
	Mon, 11 Sep 2023 13:19:05 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DE692156701;
	Mon, 11 Sep 2023 13:19:00 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv6 0/3] enable nr_cpus for powerpc
Date: Mon, 11 Sep 2023 21:18:52 +0800
Message-Id: <20230911131855.40738-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since my last v4 [1], the code has undergone great changes. The paca[]
array has been reorganized and indexed by paca_ptrs[], which
dramatically decreases the memory consumption even if there are many
unpresent cpus in the middle.

However, reordering the logical cpu numbers can further decrease the
size of paca_ptrs[] in the kdump case. So I keep [1/3], which
rotate-shifts the cpu's sequence number in the device tree to obtain the
logical cpu id.

Patch [2-3/3] make efforts to decrease the nr_cpus to be less than or
equal to two.

[1]: https://lore.kernel.org/linuxppc-dev/1520829790-14029-1-git-send-email-kernelfans@gmail.com/

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@linux.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org

v5 -> v6:
  assign nr_cpu_ids by set_nr_cpu_ids() to tackle with the issue if nr_cpu_ids is
configured as a constant

Pingfan Liu (3):
  powerpc/setup: Loosen the mapping between cpu logical id and its seq
    in dt
  powerpc/setup: Handle the case when boot_cpuid greater than nr_cpus
  powerpc/setup: alloc extra paca_ptrs to hold boot_cpuid

 arch/powerpc/kernel/paca.c         |  10 +--
 arch/powerpc/kernel/prom.c         |  28 +++++---
 arch/powerpc/kernel/setup-common.c | 106 ++++++++++++++++++++++++-----
 3 files changed, 113 insertions(+), 31 deletions(-)

-- 
2.31.1

