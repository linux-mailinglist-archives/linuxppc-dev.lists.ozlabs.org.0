Return-Path: <linuxppc-dev+bounces-5526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D72A1A759
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 16:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf59L3Fsgz30BG;
	Fri, 24 Jan 2025 02:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737647670;
	cv=none; b=ljUks7I2vbG6hXwF/gcTIlwTZKCYCgFpxPAY2zgR6bpnSuosSxEcyn/gKvcjpS0jRjxuO87rdj0bTwo04aaa/DIRUuUoMqhR36HZVzkNhV82eexadNvK87G9tieXUSKD0P4oNXMw+nhCi3Yi/LFGQPDFzv5/8gghgQW3XptME7fEe3Fw9GjYEcY889oF/Zu1CaZi/rG8sX3jiZG1flspd7WlnX9mzw2+sxca769IuOgv5B459QPrAhPGcdunpUSgHoNJbFc/2QLLPQ4K0x8wavZtabS44hoI/YciKVetDQlfoHzsHbSb3WC7Io/uPmG9YLkzwkkyrTe8wuk4XkqrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737647670; c=relaxed/relaxed;
	bh=0hjrjFJ/ozZH89y4XWSBwoxstcKne12SMD0/oS4m2WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeAtJPcxaS5lBjhu2EgTLCXlXbA30nTp6679HMupsTB8QGmF8mdH93nDjRnRWIy2oPKXBrfEM1bSYHUg0Up8RrUHmHOVkttY/1oiOscKOUHoL1ior7ZhaAeLu+ARYyaRIn+id4lwUh1BwdjNu2GWrYLOChUNjORqlsUGwgbztq4rH0qRuXvWVKc+SwwlT6YanATg4tc5jiNMwQdYzqHBCsqVxDjPYO7gntoi/Ethe9UDy+xFEYgXg8gRYcDJBZSB7dhpgBbqNP/8aMcbWrsMach/Yj8iNNMABvT8cqn1tigIt+J5rgnv4at26ssvRflrGCS31BwvtnvYHj9Iag5Pig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.170; helo=out-170.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf59D4jLGz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 02:54:24 +1100 (AEDT)
Date: Thu, 23 Jan 2025 16:53:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737647644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0hjrjFJ/ozZH89y4XWSBwoxstcKne12SMD0/oS4m2WM=;
	b=shOObFcRnqmPGumC+S+CCw2ZitX5myqi/7q4xT340l4Io42BVxZ4VkdOWBYIJ5jReaeIxO
	b63ldlzoSBnWTUa6eky2tJVgCyM4IkMxtmeyD53EJVtbF09CeeeTmxRMHZOKFSglHvuvig
	3JwVyJx/LwHu65D9VF88YpR25iZdoSQ=
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
Subject: Re: [kvm-unit-tests PATCH v2 16/18] scripts/mkstandalone: Export
 $TARGET
Message-ID: <20250123-9258916e6005692470d95762@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-17-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-17-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:14PM +0000, Alexandru Elisei wrote:
> $TARGET is needed for the test runner to decide if it should use qemu or
> kvmtool, so export it.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/mkstandalone.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 4de97056e641..10abb5e191b7 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -51,6 +51,7 @@ generate_test ()
>  	config_export ARCH
>  	config_export ARCH_NAME
>  	config_export PROCESSOR
> +	config_export TARGET
>  
>  	echo "echo BUILD_HEAD=$(cat build-head)"
>  
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

