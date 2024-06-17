Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CB90AFB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 15:41:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BJ9k3upb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BJ9k3upb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2rdN2vS8z3g1X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 23:41:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BJ9k3upb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BJ9k3upb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2rch62gmz30WY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 23:40:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718631649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZBlbppOoi/sPSeYF7gaxdAuqfyJGO0cqsg4bud1ypk=;
	b=BJ9k3upbQ551gABFvhgboMkabVdb1bfd02hsfmSP02LMB77EwNsETVa5uvlXdTQ0krQJxE
	1PWPqsW0i7sSp90Ghxtg2KjUFKSUS1AwhRBGNk37pugUVZEQkMDwSAaVCFIMTSRbGKMY91
	i5qzF2kM3IbjF3NMB3hso7LClfe8l8o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718631649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZBlbppOoi/sPSeYF7gaxdAuqfyJGO0cqsg4bud1ypk=;
	b=BJ9k3upbQ551gABFvhgboMkabVdb1bfd02hsfmSP02LMB77EwNsETVa5uvlXdTQ0krQJxE
	1PWPqsW0i7sSp90Ghxtg2KjUFKSUS1AwhRBGNk37pugUVZEQkMDwSAaVCFIMTSRbGKMY91
	i5qzF2kM3IbjF3NMB3hso7LClfe8l8o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-htwtfZpzNTiLJPIb1IiYrA-1; Mon,
 17 Jun 2024 09:40:42 -0400
X-MC-Unique: htwtfZpzNTiLJPIb1IiYrA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0D2A19560AE;
	Mon, 17 Jun 2024 13:40:37 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.203])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 744B819560AE;
	Mon, 17 Jun 2024 13:40:29 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
In-Reply-To: <Zln6ckvyktar8r0n@arm.com> (Szabolcs Nagy's message of "Fri, 31
	May 2024 17:27:30 +0100")
References: <20240503130147.1154804-1-joey.gouly@arm.com>
	<20240503130147.1154804-18-joey.gouly@arm.com>
	<ZlnlQ/avUAuSum5R@arm.com>
	<20240531152138.GA1805682@e124191.cambridge.arm.com>
	<Zln6ckvyktar8r0n@arm.com>
Date: Mon, 17 Jun 2024 15:40:27 +0200
Message-ID: <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Szabolcs Nagy:

>> A user can still set it by interacting with the register directly, but I guess
>> we want something for the glibc interface..
>> 
>> Dave, any thoughts here?
>
> adding Florian too, since i found an old thread of his that tried
> to add separate PKEY_DISABLE_READ and PKEY_DISABLE_EXECUTE, but
> it did not seem to end up upstream. (this makes more sense to me
> as libc api than the weird disable access semantics)

I still think it makes sense to have a full complenent of PKEY_* flags
complementing the PROT_* flags, in a somewhat abstract fashion for
pkey_alloc only.  The internal protection mask register encoding will
differ from architecture to architecture, but the abstract glibc
functions pkey_set and pkey_get could use them (if we are a bit
careful).

Thanks,
Florian

