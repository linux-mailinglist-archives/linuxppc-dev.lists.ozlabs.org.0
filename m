Return-Path: <linuxppc-dev+bounces-2844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F659BBCE6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 19:10:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhzzC4qblz2yRC;
	Tue,  5 Nov 2024 05:10:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730743831;
	cv=none; b=I4L6C8XdoetTWNYRIy97EKWilcQPe09syP0u3J79MG+wyOOzaDMniB8YSYo6wduhjHn5JZC50YJT740OuLJGpT+H9CWDU/a7/lIKWiac5pVMT7Do9QJzn0GJlEeV1dyun27VooIQHqDPvzAqtj/5G2he6HfJNUlZQTHERyBp5RTIRuCNjma3ZEy+s0APWGKN8WZFCFXpyTtFt/OHufBISkZV9yWwMA5Dx75dwxICGbQibiwFDMNB9crH6h/oeqbgfX7SeyvHWSlurhfgi1oB99uXe6irKsNYyTIE2lGYMKmKLLaJXrpS+uC4GXvNxuz1EFk0OfC+tEJweThGlxsqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730743831; c=relaxed/relaxed;
	bh=t29gOT00reR4nbxlcJY0aptmffhd2gSsC1GS8E2B4Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLDB9He34bjhIoP3b1yWXfMOVSEvWMZRyVo6tfCC310QhmUkApVSquBWDdbl5yrOAzpmpRNy9HWwzS1J5EmUQK0Xx1fBLjfnNHnSmwUNKwvYHE8lqF77wnv+vSrTommtOOVA9cvnfekUtKKfSGuCYSEHNQ0guyPlMD28phK1lpHic6USSzlcnW25Z9++wC+Ifig9Plz42KdWtBKNQXNWyME2hh8BNOfQDfmnRSERWb4xizpqyUgQy7U4OqADO8kn4SkuLgAbbeTk37naZ49B5VwMg1+nPZJw8dqVBbU7dTylrUD1Ms34GTWjHeWJxCZXXR8mchGQ3TjXL2w3ZRkpXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMfO1/O0; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMfO1/O0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhzzB52L9z2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 05:10:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46F89A4251E;
	Mon,  4 Nov 2024 18:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F8FC4CECE;
	Mon,  4 Nov 2024 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730743828;
	bh=A9QEobhM0Tk66PTKUxkoy2PH75AkXVl7kAtDO3RqV40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMfO1/O0f3WTFHcevl3ZKLDtacBxMdE3BT7RFEx/b3+uCvKbbdhBTvloMt0wa0OwX
	 n90Z5gcaPjxU3VikQM87AaL+farAbSj6GceGjTrdFooAVP1M8KvLcXwQ38fUeWBv8N
	 nSueT0gGDtEoY8EFJAIpvIVUUWXl5Q+eF6EU53irRc2UnkG16rz8Z0sqp62Nd22MA5
	 VHQu3uGLJaQJEr8WHqAb0R2V4++l7ByYkHuVDtoe7B8G75lQBftyc2Y6tQRfZwmKhm
	 h8Lgj1UBc9z/xdcPqGhAJ2c/yL+WIAA6KPIsfzCpa8AVQaSz9Mv0vPpuMxziyvvJML
	 5V3YtcPfQjK/A==
Date: Mon, 4 Nov 2024 18:10:26 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 05/18] arm/crc32: expose CRC32 functions through lib
Message-ID: <20241104181026.GC1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-6-ebiggers@kernel.org>
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
In-Reply-To: <20241103223154.136127-6-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03, 2024 at 02:31:41PM -0800, Eric Biggers wrote:
> -static int __init crc32_pmull_mod_init(void)
> -{
> -	if (elf_hwcap2 & HWCAP2_PMULL) {
> -		crc32_pmull_algs[0].update = crc32_pmull_update;
> -		crc32_pmull_algs[1].update = crc32c_pmull_update;
> -
> -		if (elf_hwcap2 & HWCAP2_CRC32) {
> -			fallback_crc32 = crc32_armv8_le;
> -			fallback_crc32c = crc32c_armv8_le;
> -		} else {
> -			fallback_crc32 = crc32_le;
> -			fallback_crc32c = __crc32c_le;
> -		}
> -	} else if (!(elf_hwcap2 & HWCAP2_CRC32)) {
> -		return -ENODEV;
> -	}
[...]
> +static u32 crc32_le_scalar(u32 crc, const u8 *p, size_t len)
> +{
> +	if (static_branch_likely(&have_crc32))
> +		return crc32_armv8_le(crc, p, len);
> +	return crc32_le_base(crc, p, len);
> +}

kernel test robot reported a build error on this patch,
"undefined symbol: __kcfi_typeid_crc32_armv8_le".  It's because crc32-core.S
uses SYM_TYPED_FUNC_START(crc32_armv8_le), and this patch makes crc32_armv8_le
be called only via direct calls, not indirect calls as it was before.  I will
fix this by replacing SYM_TYPED_FUNC_START by SYM_FUNC_START.

- Eric

