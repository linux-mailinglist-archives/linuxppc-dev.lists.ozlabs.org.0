Return-Path: <linuxppc-dev+bounces-8415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C94AAE73A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:57:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt1dT3TWCz30NP;
	Thu,  8 May 2025 02:57:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746637021;
	cv=none; b=F6Kzdvqq6TO1Xp3H/ZtwGRDIRwCGJJ3cYlo9MiF3nK0Co5OVNs6TV2/8RZw38O66MDuyLhTUsBKBFDGlDxb1vluughw3HoFfs+dZYmdFHRwpeW9EVD9lxP9kxG6jAeQBB5O1DiGlxAQDWt0ali+4WmFuhyKrD2ujctRjFYgKucmdZadAfBJwRCuxN45RI+6nvy0E/qsZfUlSw6L8R+Kmkwuox0F0RcK1a8FzCMAqqPrjBiUYlKl/AICEeCAoeLlDEDFHQm09Xni70kw4V6qWWPvkl3kj3ktKoMilW+qlr+v6rhMFhqu/euYoDR0+Y6CCvaJtWK247gyiZbqAKC5v6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746637021; c=relaxed/relaxed;
	bh=RqKe5S+kBJ5g+psmAnNRDncbPoduelQxWvprqMMN8Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVn9Xgm1oNx+X63li0kOU64vP8LvpfG66qzTxGR28hAAPX4deVrrApgF7bJba2sR7pL8yPzCLNeXE0JTNSFzAZhTWfAOU1LQf4LzpkRJF9VtKCo1ovUJNpM2r8JJ78QxL32dZHg7Tx0mA06s7GGbnU5hqevn3Q8KMgxl9FjPrgQtVzHxHoXXzljLRniB2mHrvNxvKTE+2AskF9fyoP1xotxO2J6Ol1/FYrRPvugD0hh2xlfSHOxs4Zb4sLFXZcU+Tfgpx2Zv+jiwJKGqpGXaUnybWW1xsYPQGo5TMOCfAvBxR0Va2apj3txeK9EoZFRm14v64jlA+VqUqol1uqGyzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V6wxGd5l; dkim-atps=neutral; spf=pass (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V6wxGd5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt1dR0Q9wz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:56:57 +1000 (AEST)
Date: Wed, 7 May 2025 18:56:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746636997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RqKe5S+kBJ5g+psmAnNRDncbPoduelQxWvprqMMN8Z0=;
	b=V6wxGd5lb06gQoaxfsbumMEc/Q5nPDxudOK3MIErovCU5r8uaDQVrtNYIVNLIglV/yEQ18
	lbnSOXsvJ4kaNeQ7VxExajSM+0ycBh4/Nu2k78IuUZv1jLqSf8vsY4KpITNz/pDEBw+O7I
	e9rURqI7OGGLmkoOnHfmne/5sCmIKvI=
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
Subject: Re: [kvm-unit-tests PATCH v3 15/16] scripts: Add 'disabled_if' test
 definition parameter for kvmtool to use
Message-ID: <20250507-8159aa2cb83d6a5b44c810d3@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-16-alexandru.elisei@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-16-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:55PM +0100, Alexandru Elisei wrote:
> The pci-test is qemu specific. Other tests perform migration, which
> isn't supported by kvmtool. In general, kvmtool is not as feature-rich
> as qemu, so add a new unittest parameter, 'disabled_if', that causes a
> test to be skipped if the condition evaluates to true.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> This is what Drew said about the patch in the previous iteration [1]:
> 
> 'I like disabled_if because I like the lambda-like thing it's doing, but I
> wonder if it wouldn't be better to make TARGET a first class citizen by
> adding a 'targets' unittest parameter which allows listing all targets the
> test can run on [..]
> 
> If targets isn't present then the default is only qemu.'
> 
> Like I've said on the cover letter, I think making qemu the default (if
> 'targets' isn't specified in the test definition) will mean that new tests
> will not run with kvmtool. I was thinking something along the lines
> 'excluded_targets', with the default (when left unspecified) being that the
> tests run with all the vmms that the architecture support (or, to put it
> another way, no vmms are excluded).
> 
> Or we could go with 'targets' and say that when left empty it means 'all
> the vmms that the architecture supports' - though in my opinion this
> semantic is somewhat better conveyed with the name 'excluded_targets'.

excluded_targets sounds good, but disabled_if is growing on me. So, unless
you or others also prefer excluded_targets, then

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

