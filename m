Return-Path: <linuxppc-dev+bounces-6900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B257BA5C57C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 16:15:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBy4c14sXz3brR;
	Wed, 12 Mar 2025 02:15:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741706128;
	cv=none; b=SSwUDRHb1JdelDSCUbvYFX6V2ZM36fFiaAi1tFKtOwa7ces6ZhIPq0wOrabySpa+RtsXnvrI4purwRdgegTx+qtqyAtpyP8p5xzMQe+Am87OFVCfl1Wb01+77QaJ3PlvnGRtZNrMWfQRsE0m/D/5S1VJJsbYpvkg5mhg1EmppD/KQ0jS44192R5v5EIFd3czpE/GsUVKDM8Y1RFgFNTADJ+Jio2xQ7E4hXdyC9nlz2sfd9COHQQD9tijKOIBnnihLt57TVDx4EVdkY1Sp+M7/36iLv8aWHDZJOcoQCehDI9zSkFK/jFZ2o9D/eQgaTXL/S4v7mffUamSVbrkEAkUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741706128; c=relaxed/relaxed;
	bh=JKkAW0UIzqm6r4vB92ZekbOgf936keSki2pNmwT0r9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiqAdmZXFtMxEdihZolauauQMfkXb0Jlka/d0JAc4xwbPYR+e+LsG59DhTp5laLnNCu25r325p+53B+9wq9uFij4Byl+sADE+UfhVap7/MHl27BBFLto3hzN2L/Hs2O3KX77bU+0FrXpCrSMmHKLrTBWCXFpDIZm7AneKJz0w+PUiOJJ9IQyE9txCH6sbhDzxOsEFgufu+/3gKugKOpCUs2O+s8EbdAaAxOeSU/MPB/r1ih/wFySqpah35xHsvoM8VsVU61HXPi7VSxLYrtK7tgbOHdIMQmWIW9YdP35ribM4bsAbJIVt4UmDiU49mX8ZuKCzED07UkobCzmrZDVyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBy4b2s4Jz30VQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 02:15:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47F845C64BB;
	Tue, 11 Mar 2025 15:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE924C4CEE9;
	Tue, 11 Mar 2025 15:15:22 +0000 (UTC)
Date: Tue, 11 Mar 2025 15:15:20 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: shuah@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org,
	yury.khrustalev@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] selftest/powerpc/mm/pkey: fix build-break introduced by
 commit 00894c3fc917
Message-ID: <Z9BTiOh6DkstKZ53@arm.com>
References: <20250311084129.39308-1-maddy@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311084129.39308-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Madhavan,

On Tue, Mar 11, 2025 at 02:11:29PM +0530, Madhavan Srinivasan wrote:
> Build break was reported in the powerpc mailing list for next-20250218 with below errors
> 
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
>   CC       pkey_exec_prot
> In file included from pkey_exec_prot.c:18:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>       |                                  ^~~~~~~~~~~~~~~~~
> 
> https://lore.kernel.org/all/20250113170619.484698-2-yury.khrustalev@arm.com/ patchset
> has been queued to arm64/for-next/pkey_unrestricted which is causing a build break
> in the selftest/powerpc builds.
> 
> Commit 6d61527d931ba ("mm/pkey: Add PKEY_UNRESTRICTED macro") added a macro
> PKEY_UNRESTRICTED to handle implicit literal value of 0x0 (which is "unrestricted").
> Add the same to selftest/powerpc/pkeys.h to fix the reported build break.
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/lkml/3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com/T/
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Catalin, can you take this fix via arm64/for-next/pkey_unrestricted?
> Patch applies clean on top of arm64/for-next/pkey_unrestricted

I'll take it, sorry for the break. I did not realise powerpc duplicates
those definitions.

-- 
Catalin

