Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF183DCE98
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 04:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdLs40QDMz3bWy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 12:03:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lax88g34;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lax88g34; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdLrc020Lz2yM1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 12:03:27 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so11937528pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Aug 2021 19:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=qRAGhi37lhF1sunuSfrr1C0LvoIqLv4kahSQWWZ31Ss=;
 b=lax88g34cj6deV6YZblYxmwfptSOzpkqmyB+B4Vn1fweUniem1asTRHasAOxZ55XZJ
 zqsiJgmLq/+cRjJh0nO5k2UN7G0HlE2kugBTza3Og3GUw7rG2N+SwGBi9+uA1T1Er2yA
 6Qe1ETEHjQvyXkez1SmHzAkGP3+ymXApiEOpV1FzAMyW6KGMKhL0TpJK/qLv87h87dWh
 0pq5ri7OReltA40mhbAKM7zvrUxaTPAeuVXsDc1yJrWOdJcIdfTM/vcBcPyM1RuXikNs
 1llU3wtFXO0lSeXGbvldh/bTWKHqwYxzmauFRFoxe05GNbONOLErhKlh9idTSR22x3fR
 HSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=qRAGhi37lhF1sunuSfrr1C0LvoIqLv4kahSQWWZ31Ss=;
 b=Ct/AKGgE1jManl4AHUNTwCeGbDqTzduVimBWbQlMkQXzRQTu2rz1OsVomlUH86dlB+
 sHfshPU7OInCBNs1y0IhRqZ76jBPwytyfzEpcCoxAAokW8LCrwvX79KfnFhTWK8aMxxg
 u7jpG5r85JxONLahrjJN98NbLpKtoXph+rViXGir+zgI4+RQGv9Yw/lxnFg0c6YAcL5t
 7idUKupIeuydq4YzFLDRdA6iufEDHF7hV1nIYgpqyxi4rBwjGMifPMN7wHRx2UclrRgU
 2orjofkEQzr7qUZfQ8MMJvjb3qMxk5j+mYt2LwpcBYWEMW2Bw02k05yOi/Mm3MUVx0GW
 9PCQ==
X-Gm-Message-State: AOAM530AVgwq1I2/kpjN521upQ8gQNiBxavWY+Q2Hh19Yk3JTgfQsc9L
 RuR0ZMqf9PEl54ln37vSEj8=
X-Google-Smtp-Source: ABdhPJzV7KdTwX/eRoeMqY3JPzEDww/yit821nvXnqkx9bMQbO1GpBQJFlJezLK900wCL/Z+zR4LDg==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr14997962pjv.38.1627869804836; 
 Sun, 01 Aug 2021 19:03:24 -0700 (PDT)
Received: from localhost (60-242-181-102.static.tpgi.com.au. [60.242.181.102])
 by smtp.gmail.com with ESMTPSA id
 j10sm10189936pfd.200.2021.08.01.19.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 19:03:24 -0700 (PDT)
Date: Mon, 02 Aug 2021 12:03:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/svm: Don't issue ultracalls if
 !mem_encrypt_active()
To: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
References: <20210730114231.23445-1-will@kernel.org>
In-Reply-To: <20210730114231.23445-1-will@kernel.org>
MIME-Version: 1.0
Message-Id: <1627869720.jrkx2xunfl.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Nathan Chancellor <nathan@kernel.org>, iommu@lists.linux-foundation.org,
 Claire Chang <tientzu@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Will Deacon's message of July 30, 2021 9:42 pm:
> Commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()")
> introduced a set_memory_encrypted() call to swiotlb_exit() so that the
> buffer pages are returned to an encrypted state prior to being freed.
>=20
> Sachin reports that this leads to the following crash on a Power server:
>=20
> [    0.010799] software IO TLB: tearing down default memory pool
> [    0.010805] ------------[ cut here ]------------
> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>=20
> Nick spotted that this is because set_memory_encrypted() is issuing an
> ultracall which doesn't exist for the processor, and should therefore
> be gated by mem_encrypt_active() to mirror the x86 implementation.
>=20
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Claire Chang <tientzu@chromium.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Fixes: ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()")
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://lore.kernel.org/r/1905CD70-7656-42AE-99E2-A31FC3812EAC@linu=
x.vnet.ibm.com/
> Signed-off-by: Will Deacon <will@kernel.org>
> ---

Thanks for writing it.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>  arch/powerpc/platforms/pseries/svm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platform=
s/pseries/svm.c
> index 1d829e257996..87f001b4c4e4 100644
> --- a/arch/powerpc/platforms/pseries/svm.c
> +++ b/arch/powerpc/platforms/pseries/svm.c
> @@ -63,6 +63,9 @@ void __init svm_swiotlb_init(void)
> =20
>  int set_memory_encrypted(unsigned long addr, int numpages)
>  {
> +	if (!mem_encrypt_active())
> +		return 0;
> +
>  	if (!PAGE_ALIGNED(addr))
>  		return -EINVAL;
> =20
> @@ -73,6 +76,9 @@ int set_memory_encrypted(unsigned long addr, int numpag=
es)
> =20
>  int set_memory_decrypted(unsigned long addr, int numpages)
>  {
> +	if (!mem_encrypt_active())
> +		return 0;
> +
>  	if (!PAGE_ALIGNED(addr))
>  		return -EINVAL;
> =20
> --=20
> 2.32.0.554.ge1b32706d8-goog
>=20
>=20
