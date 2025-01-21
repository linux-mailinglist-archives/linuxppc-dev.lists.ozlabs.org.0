Return-Path: <linuxppc-dev+bounces-5465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F934A18201
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:30:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yct4C5gSPz30W5;
	Wed, 22 Jan 2025 03:30:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ad"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737477051;
	cv=none; b=aP6+NNpSs0EF0M8Jkac1z+sejvjxD4diZdpdqHeb8Bktsb2Zks+Js1trIPgByPNnnW2JOqr/FaM7PKi9KLW3oDYgdy1iDkT173EC/1gdys7wx4A40A9ibgY+KOXKIx5/1cnINyLQ8PqsXODdKV1aDgmqusW9n1HKbq2HmqrUoMKiGZqjUUwZIh76gT/iSK4CrFHAGEeqLC1BivyhoKynkYmt55Ug+rUAN8X+AQaA5obrYdYCt7gZkD/4Smou+F7f/dk2J6TksWEP5PJoiOMnz32NZ4rNVcT2OIQiNtFnHvXNVuBCOn4mSfCm8gtCYe/Lnuw/MGy/sVKe+16CcernBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737477051; c=relaxed/relaxed;
	bh=cCgssfmF7bQh08XnJwCfEdidZwB380Ri5cMen/pv4ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVR93cfTXhYFhBfUyoHaXgJFFPbt+tD+Yc4M9LwMu2k4BFtLF89gkkUK1xOmGw4VZ6v0XpOPHuE8dzpVWPnRyV9nKhKzkgk0TO6pYAum8ozxaBlrVIoloE44REa65UQb6+ieappCHE2zZ64cejtUevQGnXkYc/ViYZKGRug4+BI5/5ki9PtB8T7F2dENQ5EAclsv9Jips8pthq+gf/Z/pDPiTVmCXVelOJ2HPbcJ6OsPOu9xujalsVum6JoejPZLWcu81gE9EJIQs6WG849FbxYFqeMJv8YMMN1/9aL+7x0aTRFKFi2G4+jXOcZnzmE/EgUOeWHFJ3sACWPcDilt3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yct4608b0z30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:30:45 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:30:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737477021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cCgssfmF7bQh08XnJwCfEdidZwB380Ri5cMen/pv4ro=;
	b=xY8F3an6zCEpk15gGynkafua9yyx97TTaOBTqWZmP6mBMpuavhwbnszC6x+BQY+pVarPUn
	9IvUfPiMo6ic2OurHPSlmvcdOVCeiJWpDOw+NbVIPLWLHem49eE1yCj7W3pRiH/N6rOqw+
	2K3BWGs0CUwO6E6xqSiFWrYvpeaqZh0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 09/18] scripts/runtime: Skip test when
 kvmtool and $accel is not KVM
Message-ID: <20250121-52d0e326cb9a3091229a7a77@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-10-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-10-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:07PM +0000, Alexandru Elisei wrote:
> kvmtool, unlike qemu, cannot emulate a different architecture than the
> host's, and as a result the only $accel parameter it can support is 'kvm'.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index ee8a188b22ce..55d58eef9c7c 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -153,6 +153,11 @@ function run()
>          accel="$ACCEL"
>      fi
>  
> +    if [[ "$TARGET" = kvmtool ]] && [[ -n "$accel" ]] && [[ "$accel" != "kvm" ]]; then
> +        print_result "SKIP" $testname "" "kvmtool does not support $accel"
> +        return 2
> +    fi
> +
>      # check a file for a particular value before running a test
>      # the check line can contain multiple files to check separated by a space
>      # but each check parameter needs to be of the form <path>=<value>
> -- 
> 2.47.1

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

