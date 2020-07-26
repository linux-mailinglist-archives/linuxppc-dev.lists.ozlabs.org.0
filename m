Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EA22DF9A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 16:09:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF4YZ33v5zDrFm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 00:09:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF4Tp2vF5zDrhZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 00:05:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SEnxbi55; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BF4Tm6vhYz9sPf;
 Mon, 27 Jul 2020 00:05:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595772349;
 bh=ggDh6UL9RpHawnptcT1gdA0aEcaDtM3GgWmCkBFdcwQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SEnxbi55fKSoCZydzxUzJa4YkFaJslLDCieUfUYb7em7aZJ9EUjIZd2UzIL3GPsXh
 ETDhl75c8NHPtieYpyotdlc8B+O+e0vNAUgESz2zLdqf3WBsmKqI6neT2Oy2S0TVX8
 D95BLZ1rnOdh59L/juaY2oGKYrBIqRMaQISMm2eJ9L2aGfipNQ5v9DDJsOnrj6id1G
 vBDUo5gJoEw86W5wN8giG7FTnYI1jlXmZyrAkdi0SdLDcWzPBYGFaEWQYlNlvN8dMA
 7Z2RV7BntblwIaQ5ddESTMenKwREW0Y0vNhftAjJwVctfBR2XbkgW2NT23/YyafjIf
 erdGgSOI79CIA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH 5/5] selftests/powerpc: Add test for pkey siginfo
 verification
In-Reply-To: <af137a935684955a60f13de2eb4ca358284f3d7c.1594897099.git.sandipan@linux.ibm.com>
References: <cover.1594897099.git.sandipan@linux.ibm.com>
 <af137a935684955a60f13de2eb4ca358284f3d7c.1594897099.git.sandipan@linux.ibm.com>
Date: Mon, 27 Jul 2020 00:05:47 +1000
Message-ID: <87365egymc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
> new file mode 100644
> index 0000000000000..58605c53d495d
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
> @@ -0,0 +1,332 @@
...
> +
> +static void *protect(void *p)
> +{
> +	unsigned long rights;
> +	unsigned int *base;
> +	size_t size;
> +	int tid, i;
> +
> +	tid = gettid();

pkey_siginfo.c: In function 'protect':
pkey_siginfo.c:103:8: error: implicit declaration of function 'gettid' [-Werror=implicit-function-declaration]
  tid = gettid();
        ^


On Ubuntu 18.04 at least.

cheers
