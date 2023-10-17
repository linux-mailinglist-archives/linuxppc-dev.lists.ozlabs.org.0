Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16F7CB866
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 04:29:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1/TF16J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1/TF16J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8dGN4WPtz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 13:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1/TF16J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f1/TF16J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8dFV5HQQz2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 13:28:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697509707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TgR+mAXMbi1ZPDCzaz8sBFm7f/fiuXUVrTub4khnewo=;
	b=f1/TF16JQxmrRuIREiHRge+2EF2CIBScEC4goyyDhgOiGHEbh86K94dbpI+JCRaQ+iQLlU
	F7RPI715rHPhQ9Lx8VpLBWTL9YN/E9QIoDDY5hxM42Lu46/wTL8K7nDlaLIlNY2U8Ql8FC
	F7AmbjW6+budLIIethgnpdvwQglSnpE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697509707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TgR+mAXMbi1ZPDCzaz8sBFm7f/fiuXUVrTub4khnewo=;
	b=f1/TF16JQxmrRuIREiHRge+2EF2CIBScEC4goyyDhgOiGHEbh86K94dbpI+JCRaQ+iQLlU
	F7RPI715rHPhQ9Lx8VpLBWTL9YN/E9QIoDDY5hxM42Lu46/wTL8K7nDlaLIlNY2U8Ql8FC
	F7AmbjW6+budLIIethgnpdvwQglSnpE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-_-A2clm1O0-LnVxroWITvw-1; Mon, 16 Oct 2023 22:28:23 -0400
X-MC-Unique: _-A2clm1O0-LnVxroWITvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC4973C0E645;
	Tue, 17 Oct 2023 02:28:22 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE2621C060AE;
	Tue, 17 Oct 2023 02:28:14 +0000 (UTC)
From: Pingfan Liu <piliu@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv9 0/2] enable nr_cpus for powerpc
Date: Tue, 17 Oct 2023 10:28:04 +0800
Message-Id: <20231017022806.4523-1-piliu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Pingfan Liu <kernelfans@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pingfan Liu <kernelfans@gmail.com>


Since my last v4 [1], the code has undergone great changes. The paca[]
array has been reorganized and indexed by paca_ptrs[], which
dramatically decreases the memory consumption even if there are many
unpresent cpus in the middle.

However, reordering the logical cpu numbers can further decrease the
size of paca_ptrs[] in the kdump case. These two patches rotate-shifts
the cpu's sequence number in the device tree to obtain the logical cpu
id.


[1]: https://lore.kernel.org/linuxppc-dev/1520829790-14029-1-git-send-email-kernelfans@gmail.com/
---
v8 -> v9
  put aside [3-5/5] in v8 for the time being, which complicates the code.
  optimize out some unnecessary initialization according to Hari's
suggestion

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org

Pingfan Liu (2):
  powerpc/setup : Enable boot_cpu_hwid for PPC32
  powerpc/setup: Loosen the mapping between cpu logical id and its seq
    in dt

 arch/powerpc/include/asm/smp.h     |  2 +-
 arch/powerpc/kernel/prom.c         | 26 +++++----
 arch/powerpc/kernel/setup-common.c | 86 +++++++++++++++++++++++-------
 3 files changed, 83 insertions(+), 31 deletions(-)

-- 
2.31.1

