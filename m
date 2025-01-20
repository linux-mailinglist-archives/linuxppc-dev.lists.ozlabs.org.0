Return-Path: <linuxppc-dev+bounces-5394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC14A16DA0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 14:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcBRC75Cgz2ywh;
	Tue, 21 Jan 2025 00:44:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737380695;
	cv=none; b=A1HrNXdDfT0cZsrSsSh0tul7x8s03/SeTFXL0xCsx+WIZOKqJ8yfSqyk/CNtBkCL9hRZ85TE4bJGHnjClE+qEGZuC1y0Ykvp8CQmjA5J6ZVmsyjR32StI5m0cjCVFzPDbjsKM4TxJL7g8mIAXXqRv2bktwMUfqtqykGV52lu063sjKbJGbPKE4UasvhK0ptzgC0ztqhH9QzJB3nMOFF8obBBu5D9dPBdjdCvYHGTU4XsthQhI+tFTIIulluh+J8xbn+MK3BQKfORoTofN9CoG6nx0RxKXyuReso/6iwNj/49e9BDl5KBmgelF54OzWb4KUFGa8FdkItKsdU/dAFd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737380695; c=relaxed/relaxed;
	bh=esHaCH94LdGCcr/CRETDjlEYdI7GR+2kJhOxJ8F9Pps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CzfSHEQ2KurQYxT3G55xYx6EkritOji8kAeVlEPPV44EBb/H6HQQFMbxqfw4eJXawB+LcgPkfHhT7rKr6ynF0TUM8I2YeGu6asDE7gZ/XNbgps/aO/v0dC0pm3XbimPhEr1M43V94cOQlKHbbW1gVUUtqu4ZODi5WEAWCmqCviOJXVZlSMFjKBs74ntvjNRiy3Nda4/KaQBjj6z8l+ZOTLk54Mddr7ntDayYrPmVaTSmG7RESTOIiIkl3YicAVAPgHjxkJoZzw0aAsOljJ+lSgPnvUmRkReqopJ7VxFtF8zGvqItkMBl524lFrOFG+7LGeXi1BpgzQfJYW7pQonzfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9/sGpMb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9/sGpMb; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9/sGpMb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9/sGpMb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcBRB4YtXz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 00:44:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=esHaCH94LdGCcr/CRETDjlEYdI7GR+2kJhOxJ8F9Pps=;
	b=R9/sGpMblmovSSTEmDpW23zjUMhNyn7ER4kVOkygWHGJiPn0sIeOtl48RBVdl3JyhIjfnj
	zwdOOMWQPXasGYj96l7u67DE41VQt5Eu9PBsV/CyRWtO9sXBlGVHkNNU1TPiF6tvMMsAhq
	1Cs0yRQnVf4i+93/H0Yp94F5oiLW9IQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=esHaCH94LdGCcr/CRETDjlEYdI7GR+2kJhOxJ8F9Pps=;
	b=R9/sGpMblmovSSTEmDpW23zjUMhNyn7ER4kVOkygWHGJiPn0sIeOtl48RBVdl3JyhIjfnj
	zwdOOMWQPXasGYj96l7u67DE41VQt5Eu9PBsV/CyRWtO9sXBlGVHkNNU1TPiF6tvMMsAhq
	1Cs0yRQnVf4i+93/H0Yp94F5oiLW9IQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-mn46SPf1NXGrxaW4AoHaSQ-1; Mon,
 20 Jan 2025 08:44:43 -0500
X-MC-Unique: mn46SPf1NXGrxaW4AoHaSQ-1
X-Mimecast-MFC-AGG-ID: mn46SPf1NXGrxaW4AoHaSQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFAF41956070;
	Mon, 20 Jan 2025 13:44:40 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E98B319560BF;
	Mon, 20 Jan 2025 13:44:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:44:15 +0100 (CET)
Date: Mon, 20 Jan 2025 14:44:09 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] seccomp: remove the 'sd' argument from
 __secure_computing()
Message-ID: <20250120134409.GA21241@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

I know nothing about arch/mips and I don't have a mips machine, 1/4 wasn't
even compile tested.

Oleg.
---

 arch/mips/kernel/ptrace.c           | 20 ++------------------
 arch/powerpc/kernel/ptrace/ptrace.c |  2 +-
 include/linux/seccomp.h             | 12 ++++--------
 kernel/entry/common.c               |  2 +-
 kernel/seccomp.c                    | 26 ++++++++++----------------
 5 files changed, 18 insertions(+), 44 deletions(-)


