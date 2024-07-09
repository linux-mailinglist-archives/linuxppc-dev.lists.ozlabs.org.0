Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1092B29F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 10:53:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMFIk3ts;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JEhXjCgZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJFBl3L77z3d2m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 18:53:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMFIk3ts;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JEhXjCgZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJFB34srMz3cYY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 18:52:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720515155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKrbvYatQQa9iqD/RLLmut5wz3BIvGbGeZI4a400mkw=;
	b=HMFIk3tsdNgd0G/W3920YvH7HcQntzsRvCWHq8OMy0ZpSDltMfo732lvkKTBa0kWYYlPMf
	SCt/K4LSNVwhUVU3J8qUMbF54XuW8MeJFuXhx3BbBMd9yGWEoqLCbeRkrOxq0+1hf0o901
	7HngYHfeIUSIFiImVeIxH1LTDeFA/KE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720515156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKrbvYatQQa9iqD/RLLmut5wz3BIvGbGeZI4a400mkw=;
	b=JEhXjCgZGPKctXO5TbPJ1xt6mItEVYqPxkkN3CtpJtTAeL1qnQKvn7b61jNjR3oZdwr2z/
	9pAampv54O7SMi0cg53unxn2ucFUoSMgdX9MDEpJA+E5RmLlD1imKkQwlIBS7Bgyjcgb5L
	xbvbMaAjhAmpWpSNkGg43971OYnhhoQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-95z-6JRaPpWfMZk9MN0rrw-1; Tue,
 09 Jul 2024 04:52:30 -0400
X-MC-Unique: 95z-6JRaPpWfMZk9MN0rrw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A13F31958B3D;
	Tue,  9 Jul 2024 08:52:25 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDBC43000181;
	Tue,  9 Jul 2024 08:52:15 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
In-Reply-To: <Zoz1lbjrp+y3HXff@arm.com> (Szabolcs Nagy's message of "Tue, 9
	Jul 2024 09:32:21 +0100")
References: <20240503130147.1154804-1-joey.gouly@arm.com>
	<20240503130147.1154804-18-joey.gouly@arm.com>
	<ZlnlQ/avUAuSum5R@arm.com>
	<20240531152138.GA1805682@e124191.cambridge.arm.com>
	<Zln6ckvyktar8r0n@arm.com> <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
	<ZnBNd51hVlaPTvn8@arm.com> <ZownjvHbPI1anfpM@arm.com>
	<Zoz1lbjrp+y3HXff@arm.com>
Date: Tue, 09 Jul 2024 10:52:12 +0200
Message-ID: <87ikxf0wxv.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Szabolcs Nagy:

>> However, does it matter much? That's only for the initial setup, the
>> user can then change the permissions directly via the sysreg. So maybe
>> we don't need all those combinations upfront. A PKEY_DISABLE_EXECUTE
>> together with the full PKEY_DISABLE_ACCESS would probably suffice.
>
> this is ok.
>
> a bit awkward in userspace when the register is directly
> set to e.g write-only and pkey_get has to return something,
> but we can handle settings outside of valid PKEY_* macros
> as unspec, users who want that would use their own register
> set/get code.
>
> i would have designed the permission to use either existing
> PROT_* flags or say that it is architectural and written to
> the register directly and let the libc wrapper deal with
> portable api, i guess it's too late now.

We can still define a portable API if we get a few more PKEY_* bits.
The last attempt stalled because the kernel does not really need them,
it would be for userspace benefit only.

For performance-critical code, pkey_get/pkey_set are already too slow,
so adding a bit more bit twiddling to it wouldn't be a proble, I think.
Applications that want to change protection key bits around a very short
code sequence will have to write the architecture-specific register.

> (the signal handling behaviour should have a control and it
> is possible to fix e.g. via pkey_alloc flags, but that may
> not be the best solution and this can be done later.)

For glibc, the POWER behavior is much more useful.

Thanks,
Florian

