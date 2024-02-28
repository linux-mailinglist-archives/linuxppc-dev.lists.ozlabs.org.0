Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD5B86AEAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 13:04:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FGKQp71c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCgx0YLQz3dX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:04:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FGKQp71c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::bc; helo=out-188.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCg95DpNz3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 23:03:33 +1100 (AEDT)
Date: Wed, 28 Feb 2024 13:03:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709121790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q89KG4hdzw91oeVn8moMG49vjA7FBhdRABUSEGGkg0o=;
	b=FGKQp71cnpb+ff7fwhUaOxfcQi2pU2AQTOhrS+iK+ckkJXe7l6AiLbVdHDWo/naazejElA
	Ux9yyzoomusx4EMtfjcFSIY0eYRjXld8bGDHF3Ln7lkq/9YOCa72PslC9+oDscM+s5IXXn
	AYJry5YoWg8egA6yIUcnHPPN4xj/v1U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 24/32] common/sieve: Use vmalloc.h for
 setup_mmu definition
Message-ID: <20240228-9d47975f00d02c47c9b9368b@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-25-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226101218.1472843-25-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, Nico =?utf-8?B?QsO2aHI=?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:12:10PM +1000, Nicholas Piggin wrote:
> There is no good reason to put setup_vm in libcflat.h when it's
> defined in vmalloc.h.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Andrew Jones <andrew.jones@linux.dev>
> Cc: Janosch Frank <frankja@linux.ibm.com>
> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Cc: Nico Böhr <nrb@linux.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: kvm@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  common/sieve.c         | 1 +
>  lib/libcflat.h         | 2 --
>  lib/s390x/io.c         | 1 +
>  lib/s390x/uv.h         | 1 +
>  lib/x86/vm.h           | 1 +
>  s390x/mvpg.c           | 1 +
>  s390x/selftest.c       | 1 +
>  x86/pmu.c              | 1 +
>  x86/pmu_lbr.c          | 1 +
>  x86/vmexit.c           | 1 +
>  x86/vmware_backdoors.c | 1 +
>  11 files changed, 10 insertions(+), 2 deletions(-)
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>
