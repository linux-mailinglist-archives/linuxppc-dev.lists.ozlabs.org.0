Return-Path: <linuxppc-dev+bounces-2854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B435A9BC2FE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 03:11:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjBdb3pvbz2yDk;
	Tue,  5 Nov 2024 13:10:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730770478;
	cv=none; b=goLZP1V2AN6q+K5kYsLIdsgzhTCQvMF9kHj1hEa0Q5UaPJ7kmAtK4iEMdp9aMchtpOsvD5/KAvK2mmJyXGtlGycrRDV1wldSiweHzthgtKoDj1w7bBfP8+Xi+FWOBdjnPsP1X57/fV9ItEChfpNko9eblgN1+YB45jS4fUcHRrNujsHqXJkXThVGsbxqNBepgCYwR6SSrIPOQ9FeoGVK3/3/KFRMZ6sOwIOqrGr5qTHU+1Vu2SZPtQBmMSzZaxLO9/n7x5sxpP4wBadOcIr0jvOIoeA2ypuqg9rmiduS3gzVzofJAMUgQW7BhZUTqDzwNe6rBmDaFEquXwV8B3cWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730770478; c=relaxed/relaxed;
	bh=NHOy9HMfGZsNYCZrwLCSvIFDt8NcrmF4jHCNX3GgtvM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eJjo2/7XRzo4VNxYidIGKuaIhtnjDlFxOORTzTEhXocw4ZN8mtKS192n9q+MeaDOHbQiYjAKnU9RyOpIVbJyeUaSi4yWxOie1AHt2fZ6n2NF/uVQifmulkOwzwGI7iJGqVDvO1tvE3aFBNUvMN4wMXH6ajH/DyAs8NvbBOdpU+ftiHc0cuYGVqWSdmHMMqPbNYgd53vuvuJCyzf0NTDyNzxUia3/bnsQAMfoYqu2Ya3XiUemBJV4ivhsYcNtX00EcsJ8eeycrSZbyO6xBkyKOsEYknr4OdMth8d/nSp2j+afKhGtoLWHyBeM4HHco0Ekw9fr7k4kiBDQi2GUnXP48g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cilUS0qQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=chao@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cilUS0qQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=chao@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj9qd19ssz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 12:34:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD667A41C59;
	Tue,  5 Nov 2024 01:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0B7C4CECE;
	Tue,  5 Nov 2024 01:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730770469;
	bh=pZqyeDU4Z0xb82ka1rqo9zPh5E+ZbwXvL5ApzcS2al4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=cilUS0qQCFaxNF3zH63qgUIqVpBsK5ZAO2+Mc4CrXmk6QZIa3ZA/1eyWd894pH2td
	 p6DeOBI4b44PBAllxDSwZ+pvc/5OEkcYzKgLtcgnvluIpjNagN96SxdO1hq1RTBHL4
	 IsHQ3dUtDassq5aGIJOJqxs+MkAOhLYww1/sRgfew7akFKeqGOT8zYLFCTpqAtJETh
	 hetvPOAoOKDF42PLByagmL9JEdRSFvR3DT2TRaUD4mTfYhVrokbWecXm5y2cdsb4O7
	 uykYoTN0CALyatfk7dtT2vPJ/mDxiOvw5DHvt59QcW4RICZcRPoNv9l/f+5h04HOGk
	 wE3h4ii4bPJsw==
Message-ID: <43d8b52e-5e5b-4a37-9a18-6ac392048d92@kernel.org>
Date: Tue, 5 Nov 2024 09:34:23 +0800
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
User-Agent: Mozilla Thunderbird
Cc: Chao Yu <chao@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [f2fs-dev] [PATCH v3 17/18] f2fs: switch to using the crc32
 library
To: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-18-ebiggers@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20241103223154.136127-18-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/11/4 6:31, Eric Biggers via Linux-f2fs-devel wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32() library function takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

