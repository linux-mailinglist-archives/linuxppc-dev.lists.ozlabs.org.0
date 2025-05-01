Return-Path: <linuxppc-dev+bounces-8224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C3AA627A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 19:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpM0V6K2Mz2xJ8;
	Fri,  2 May 2025 03:45:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746121546;
	cv=none; b=eMMdiEDkbiGpKQMsMZBnkhwa2jcyNFZbgMcpM8R9vRiYQ23J1TwLHsvoMRy5O9wZ79MK9jbi/x4VO301GeW/NXTTnpR3+cW2m9sqLqxg2hUCiR26tPgqIJ8bjTsnHVfiKtqI5qDjLigU4LhqFzyxr1pHKpxFjDMljdlqzdbaXq7SKuQYrTiSc3Mx3Uk+ySCDCgF1S3wFFv/y1SKIVQ6oRyXeUmpn775jUmFGlIwKSXmSIx9cyV9laGF6eT0rJJuvRa3CJdLzYM2FEq/1qJ4z2F9rccJLd8YyDHog66m44pG+tcb8qswuTORFw2AgqQV1yOShopz7kUTtxPAkwuKJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746121546; c=relaxed/relaxed;
	bh=pqCUl1E1e2DoAqjUx3nS868gkprr/kaVWJsax4Gih78=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hzmI+hvPDMMdUvsug+fi/OpulX8FjJD1KXQX5BiLVstbqLieUAKeZOispldOlC2CsooyubTnfTJfR8jAm2y1dk2NAMG07RfhMgFNK+GKZDfUxbkXnlNxIH8a7JjXI0atBK+5vImWsIYVdKjJve7F3MgJUfMfN+NHkXkxse3MsA/qDE5lCNef672nzYroH1yEsp/AD4mzFaoGS2UK2KbvDKpbh5VPVAXXRaOsJdQseldHQlaUYT613A8G5ymtv2ms2dHilpP2/vceTioWciF0Cx9PXsjUMihF3x0j0HMKfbV69k15cyqi8wgKEahmOhr9EgdI3gu5FZoHQSSi/DB6QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gR0HJJV5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gR0HJJV5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=eddyz87@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpM0T2s7mz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 03:45:44 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-309fac646adso2285970a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 May 2025 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746121542; x=1746726342; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqCUl1E1e2DoAqjUx3nS868gkprr/kaVWJsax4Gih78=;
        b=gR0HJJV5c0iPVmLc1nPsjdpPN5SPOZmGvNZ6yblj65PKWtqCtGW33YvENk+GpC6o0R
         s5SXjtoYqIUfrglRALI4KL1wpG2XxvS0To1qUMypT9Ig8M1dIUlMPEwuT2wO3j1TBcLQ
         littR2qroRZnL2xXpv/hP96Ppo2CqcParFUHawCSxy4TNR6omj3bMLOtdzcdxIw25uiZ
         Nczbqf5k3GJSKH+mEFbNGmm8J0U17aB6CPHGRrDOWI9uC52feg+NArqFFCDhM4GbRGTt
         MPAcU/ZQz9dX8wDTBKr44gkhDlxYSEVRrMwe9SMOK8xgfiQVTviBhFEfSKJzwEnshbAS
         YMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746121542; x=1746726342;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqCUl1E1e2DoAqjUx3nS868gkprr/kaVWJsax4Gih78=;
        b=pOleHwIoWkyNUiOQHvsxtlsbZeH+9CaOpkKtbYDj/+FDu5557YJSIKVaW7w+Tgq+uo
         0PgGCbhh4ekc62NacfGAcmyucZopLzmD9P/COxDKUwGYUehZ9VbCgZAH2LKJPvbk2Wdp
         m/WCKoqi4Q+egPTOJhM0bDe/fd3vU2pCKEo/mjCQbxCmLwjQfkoRd1p8JLD6dt6HkF2T
         YPt52DPc4RHVcDT0b7beEncuw+lE/92+UeAaG93zwoSr1T+Y3enq2tGsvWX0La+r6BWx
         DhyCAp1K52GQ555g+oBYfWFF4+ZOyc1VrMueIvQN8JUka5pXivO0WNXWHSThG61bA3jQ
         b0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCU6EJ7kRUoETJJESz9b/dtSJS3ljz/ICFnXAGIwJstSGNIP6npstX00RRVTBMkEeG0dmNZEZ6nn/Ya6CuA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyM3jeBhzONR6UIXA5hoKdCin85nb9Ri/Zi4acNob0WzKD22AqA
	U9RPyOVPMP9H173T/8cba7/7EqURvTiNOI1vGy8135rzZCpgKG+Q
X-Gm-Gg: ASbGncs7va+qyVr6Sxtcqvy9hexHvK0ipUoxCFOd01paTJOCfSC8GEpvpA9XDseii1d
	L0wse8bCEe1n/s3kXgQ6UIPGsRzxzyjWcj97yDADByonRbJt+4GdW8G9RUhhkPgx/AQSb29ZLNT
	kwDUOEP3CKz2xanGkA0StGaG5/edeVOHOymWyxmxIebw3m3i0k/W9W4f7Ula6hzk7GhgOPv9f5q
	2VucSCkIsX//CdRRqVaCWORaqn5PZHftl/IxFm+PulReSdpm0myffE56g45awLp38Xj7eMCFRLV
	5BEaSJMz23Om2w11/lKn4zLT6l1tEHLPzOfOo7r8q77Q6zM=
X-Google-Smtp-Source: AGHT+IG1DZt+WbEs1H1vBv8On6YGa9H+fvBwkfvRfEpQp1ZKcph5zdItji4Y36KqTtQ8K03Lzl8Kow==
X-Received: by 2002:a17:90b:3bce:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-30a4e1e6a93mr175707a91.9.1746121542286;
        Thu, 01 May 2025 10:45:42 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a244bd4e2sm4706976a91.0.2025.05.01.10.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:45:41 -0700 (PDT)
Message-ID: <13fc0801bf4fd8e561cb35773a4c5f3f22d9d51f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 01/11] selftests/bpf: Fix caps for
 __xlated/jited_unpriv
From: Eduard Zingerman <eddyz87@gmail.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hari Bathini	 <hbathini@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Mykola
 Lysenko	 <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Henriette Herzog	
 <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
 Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen
 <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>,  Dimitar Kanaliev
 <dimitar.kanaliev@siteground.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>,
 Daniel Xu <dxu@dxuuu.xyz>, 	bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-kselftest@vger.kernel.org
Date: Thu, 01 May 2025 10:45:39 -0700
In-Reply-To: <20250501073603.1402960-2-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	 <20250501073603.1402960-2-luis.gerhorst@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-05-01 at 09:35 +0200, Luis Gerhorst wrote:
> Currently, __xlated_unpriv and __jited_unpriv do not work because the
> BPF syscall will overwrite info.jited_prog_len and info.xlated_prog_len
> with 0 if the process is not bpf_capable(). This bug was not noticed
> before, because there is no test that actually uses
> __xlated_unpriv/__jited_unpriv.
>=20
> To resolve this, simply restore the capabilities earlier (but still
> after loading the program). Adding this here unconditionally is fine
> because the function first checks that the capabilities were initialized
> before attempting to restore them.
>=20
> This will be important later when we add tests that check whether a
> speculation barrier was inserted in the correct location.
>=20
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Fixes: 9c9f73391310 ("selftests/bpf: allow checking xlated programs in ve=
rifier_* tests")
> Fixes: 7d743e4c759c ("selftests/bpf: __jited test tag to check disassembl=
y after jit")
> ---

My bad, thank you for fixing this omission.

Tested-by: Eduard Zingerman <eddyz87@gmail.com>


