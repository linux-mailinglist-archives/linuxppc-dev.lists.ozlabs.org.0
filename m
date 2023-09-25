Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE477AD266
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 09:55:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Th2vVoyz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Th2vVoyz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvFXQ72pzz3ckg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 17:55:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Th2vVoyz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Th2vVoyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvFWY4mCxz3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 17:54:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695628452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkXHcWrt/ISGO01H27Y9nB2Iev3COcRqarEgCcDgrsw=;
	b=Th2vVoyzrhDx8BfATBXK60X6VaaHtw5gzVhSpeJeaN/kyG4VF+FLYdwGEQefFl7HFk7Xjt
	XnXEg2mSgsORbfqtG7ah5MJ9vXsgxSnUurFGNPTTNj1bInRR9BKeP9iBInD4Rz09ZLaySy
	eINIgjQuCpVAyPZzjArRIWV8dQPmDc4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695628452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkXHcWrt/ISGO01H27Y9nB2Iev3COcRqarEgCcDgrsw=;
	b=Th2vVoyzrhDx8BfATBXK60X6VaaHtw5gzVhSpeJeaN/kyG4VF+FLYdwGEQefFl7HFk7Xjt
	XnXEg2mSgsORbfqtG7ah5MJ9vXsgxSnUurFGNPTTNj1bInRR9BKeP9iBInD4Rz09ZLaySy
	eINIgjQuCpVAyPZzjArRIWV8dQPmDc4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-dJinBq2ZNQmARTZSIbeRAw-1; Mon, 25 Sep 2023 03:54:08 -0400
X-MC-Unique: dJinBq2ZNQmARTZSIbeRAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C497329A9D3D;
	Mon, 25 Sep 2023 07:54:07 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A214540C6E76;
	Mon, 25 Sep 2023 07:54:03 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv7 0/4] enable nr_cpus for powerpc
Date: Mon, 25 Sep 2023 15:53:44 +0800
Message-Id: <20230925075348.16654-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, Mahesh Salgaonkar <mahesh@us.ibm.com>, kexec@lists.infradead.org, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since my last v4 [1], the code has undergone great changes. The paca[]
array has been reorganized and indexed by paca_ptrs[], which
dramatically decreases the memory consumption even if there are many
unpresent cpus in the middle.

However, reordering the logical cpu numbers can further decrease the
size of paca_ptrs[] in the kdump case. So I keep [2/4], which
rotate-shifts the cpu's sequence number in the device tree to obtain the
logical cpu id.

Patch [3-4/4] make efforts to decrease the nr_cpus to be less than or
equal to two.

[1]: https://lore.kernel.org/linuxppc-dev/1520829790-14029-1-git-send-email-kernelfans@gmail.com/
---
v6 -> v7
  Add [1/4], which fixes compilation error on PPC32

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@us.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org


Pingfan Liu (4):
  powerpc/setup : Enable boot_cpu_hwid for PPC32
  powerpc/setup: Loosen the mapping between cpu logical id and its seq
    in dt
  powerpc/setup: Handle the case when boot_cpuid greater than nr_cpus
  powerpc/setup: alloc extra paca_ptrs to hold boot_cpuid

 arch/powerpc/include/asm/smp.h     |   2 +-
 arch/powerpc/kernel/paca.c         |  10 +--
 arch/powerpc/kernel/prom.c         |  29 +++++---
 arch/powerpc/kernel/setup-common.c | 108 +++++++++++++++++++++++------
 4 files changed, 114 insertions(+), 35 deletions(-)

-- 
2.31.1

