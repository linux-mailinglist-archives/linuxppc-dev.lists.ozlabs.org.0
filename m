Return-Path: <linuxppc-dev+bounces-8403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92443AAE5D3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt0R61jGzz3091;
	Thu,  8 May 2025 02:02:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ae"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746633778;
	cv=none; b=cwpNx/3jlqSM9C+gU8cqupOWhEf3T++ODlh5ZV2rQl4Udzpe9m36PDGSHBpUKRXMJRRP5kHfkiGfv2mEvhmbqk79UGUC6yVRNgIYboOF1uJaHioyub/TlGsP4vnNbjBBzXE8o1rupIvlNRD+hHths7XWFvgGujmsOB0P/3p4TNh5I6uGfkMiWXXRGWLz7ouQFH1sPpI7IZdg1PeWvHJvEyoMXiFGzhktv52LBh2VPD2pgahGtasZx+dLCkhNnPHZxFn89ILl26Ooe+Gs+WvUibIcvea/tz0W1jcDJWGfEpYj9grKkgEexkw3kp5q5swFmyYL2diZAiFXGloceJB1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746633778; c=relaxed/relaxed;
	bh=4sAt9jGqtjjuAu3AgUOHLrQORncUHd8FqoP4fvAA0kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pvhto0JMSJnO8VJSwICXR2ORkUiJwgjPDtNWQf78h83Fni9piufwp6EUbir0r2L5GMDYrfLCCfDDTDwR+1iPakcZBPwruI+FDiOp9VY3ZMIXyy33+av3/2x+F22cFHXdcDTKv9kQiR7zF0vIDyXIYGnsRTYBo/MXQLR9X6lbj94y+gx04XNDDg51NuyV/LXh4plbMRGxCNanzTG28RSAv3yGXgEPuRP7k8Y7YJ4TzDU+4rXfcHnELyRXgaMhIv7ljE0yFsbSOp4VU/gUWJHo3QDr8fjNAs9+EeSciKvErpP+WSHxYhddzYp2B0r89wnIUXjERrTbwJKRJK4s10SAwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qnydbb3x; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ae; helo=out-174.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qnydbb3x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ae; helo=out-174.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 220 seconds by postgrey-1.37 at boromir; Thu, 08 May 2025 02:02:55 AEST
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt0R3704lz3089
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:02:53 +1000 (AEST)
Date: Wed, 7 May 2025 18:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746633754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sAt9jGqtjjuAu3AgUOHLrQORncUHd8FqoP4fvAA0kg=;
	b=qnydbb3xFdGbLQifmPErPW1DnOoiQgr2a2V28pycc4PkDj8V7yypsPLcvozd5Sq6E4YFjI
	bzWOadRjXBPASa/sWwBsVRH4CnEeWAtpDr7WRHM7m8DQM0gEbzoKVHTHFaphzKWAEAcnhO
	80z3pXFEcgz+TmwJjMBc0VLlEYYCE3g=
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
Subject: Re: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET
 unconditionally
Message-ID: <20250507-78bbc45f50ea8867b4fa7e74@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> architectures can only set --target to 'qemu', which is also the default.
> 
> Needed to make the changes necessary to add support for kvmtool to the test
> runner.
> 
> kvmtool also supports running the riscv tests, so it's not outside of the
> realm of the possibily for the riscv tests to get support for kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

