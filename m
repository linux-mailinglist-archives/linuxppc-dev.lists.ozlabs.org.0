Return-Path: <linuxppc-dev+bounces-4841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4CDA05979
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 12:17:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSljz0Pjdz30Ss;
	Wed,  8 Jan 2025 22:16:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736335015;
	cv=none; b=HSP/tUmXyfhTLuvnGuF69kXE3nT7UB14yqv+clh1kDFcH4P09lWMeaTO+QYJaslhRuYrSNfG3B6QHsG3lRADy5Si4nbkvWyV4jOutg5IFbKScwhYnBYZt1f+4Hyh28qXo+5NPtbbF3GwWVvcejMIFSCKDnARXZHP7Zx+fZ+Sd/pPXnxLWsJJhwpIpVOnmIndBnrblalZeJ2ihk2wI8No3quxBs0KW6Y8KMgGFktdjeD5mJhmciVM3j0pVW8Omoav3GqMf1mZwt7xL1a6CSW07lE5WL8QpwGeWrQHTNzDzFCAjaD2taMtpgfNdPB1HWfh/xbPFzu4oPiLD4gGtEOUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736335015; c=relaxed/relaxed;
	bh=zZORM63nhj4Db7gE3We258vVDV3pB9hu6RoF51BIGqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIBw1eXhOqV9ctiQI20qXUy5WN3Gf1DJ+YxXv5/C8VX4OkzF+Lg+hK8rL1FaTKdMw/FvwGcVnaSY693kVlCDKpAWWis8kz5JaIl8xGRmR1VCh6tHwBnM+R7YjSz8J5ewZQOTWYVyLiJ47jqllx7bWD+pGMnmvL5Wy8yO9BVAOaPfHnfZYX+koriUpLIyy4nIUsTCdiCHiOTm74IIEf9XrEEN1vYjpHsMcFac/1XyLLBNFS2jezhPAJhCOiyGsHz3nQLm+3nQC4UIl8IydUA075ucB8CUL8uNVE8hIgDWzpzhH8G21oiqE3O2HyduoXGP9p4JqRqPPiThXqDo/920gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g7NzIB/C; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VdfbDB+t; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g7NzIB/C;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VdfbDB+t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSljx4qq5z30P3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 22:16:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736335006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zZORM63nhj4Db7gE3We258vVDV3pB9hu6RoF51BIGqQ=;
	b=g7NzIB/CnEySymE66Gt+v2LmNTWff7ZJNW3X9GSIPC/MOq3BAZi5ZFSeE0efXwghDGmcpF
	RYgqqg3Mk40M/WwzWL03GbgRmheL5ibngl7rY/xCesffCHvDUT9eJFbjKkcnRG0jM4RzCQ
	ahDSjRws6Z6w2Ptc3y4DFKkjeHPImok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736335007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zZORM63nhj4Db7gE3We258vVDV3pB9hu6RoF51BIGqQ=;
	b=VdfbDB+tDrc/nCkXODePUQ/9vzjVmD2kRXWQX/s8AAbtkpsKDQi0lgmGqBQjg5uk47JSR0
	MGhE5N0CkWMhQZ4IOgxLrXlmu+ZNye6UXWABTBttmK8qu/0Op8/20EP+oI5XYmzU/M5iFR
	mGgczshypex1bQVdqdTYDy4hhmcmrEs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-173-IXDOU70qOguI5eqrh8OtbA-1; Wed,
 08 Jan 2025 06:16:43 -0500
X-MC-Unique: IXDOU70qOguI5eqrh8OtbA-1
X-Mimecast-MFC-AGG-ID: IXDOU70qOguI5eqrh8OtbA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74A0119560B0;
	Wed,  8 Jan 2025 11:16:41 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A01F1956094;
	Wed,  8 Jan 2025 11:16:39 +0000 (UTC)
Date: Wed, 8 Jan 2025 19:16:29 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v1 1/5] crash: remove an unused argument from
 reserve_crashkernel_generic()
Message-ID: <Z35eja7aQdnY6ZPS@MiWiFi-R3L-srv>
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-2-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20250108101458.406806-2-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/08/25 at 03:44pm, Sourabh Jain wrote:
> cmdline argument is not used in reserve_crashkernel_generic() so remove
> it. Correspondingly, all the callers have been updated as well.
> 
> No functional change intended.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/arm64/mm/init.c          |  6 ++----
>  arch/loongarch/kernel/setup.c |  5 ++---
>  arch/riscv/mm/init.c          |  6 ++----
>  arch/x86/kernel/setup.c       |  6 ++----
>  include/linux/crash_reserve.h | 11 +++++------
>  kernel/crash_reserve.c        |  9 ++++-----
>  6 files changed, 17 insertions(+), 26 deletions(-)

Acked-by: Baoquan He <bhe@redhat.com>


