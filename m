Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B725586AE0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 12:49:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SlEmAVBK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCLQ2Ywhz3dTr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:49:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SlEmAVBK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.183; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCKg5yTVz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 22:48:23 +1100 (AEDT)
Date: Wed, 28 Feb 2024 12:47:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709120874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Au6hwmd26uHWeon8xSbDYZG4pXatYbizYk+xmJMEcsA=;
	b=SlEmAVBKKFKRJDwYiU0Un070dqwwQCQ0bIWzjNGbgDc0nhtIdnyfPA9NvcEm5mYYQknXF1
	ngFKFTYiiJBUgc3i/1Fg6HU8LnJdaklbfb2W6uL0YOgljJGoh5SM0LFtKbRfkDGwM5R6+Y
	8jyGT86VTQzbB9HrOBvn6p4cv+mIg7Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 09/32] scripts: allow machine option to be
 specified in unittests.cfg
Message-ID: <20240228-386d106a6ef0bc0430edad1a@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-10-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226101218.1472843-10-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:11:55PM +1000, Nicholas Piggin wrote:
> This allows different machines with different requirements to be
> supported by run_tests.sh, similarly to how different accelerators
> are handled.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  scripts/common.bash  |  8 ++++++--
>  scripts/runtime.bash | 16 ++++++++++++----
>  2 files changed, 18 insertions(+), 6 deletions(-)

Please also update the unittests.cfg documentation. Currently that
documentation lives in the header of each unittests.cfg file, but
we could maybe change each file to have a single line which points
at a single document.

Thanks,
drew
