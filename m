Return-Path: <linuxppc-dev+bounces-7098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF113A62F02
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 16:20:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFQ0z2RM0z307V;
	Sun, 16 Mar 2025 02:20:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742052050;
	cv=none; b=BwKYr4TURzHxfzNh3LfCEFS9IG4BJJbtU8P2UTLweFrTyKJ3iHpmd6KudPs6Zp242RSi64aiiwGyATPn4Qlm1Tunf2mQZrZ3YJPCm4BcCeIrmpFkEIpIJ9AnykQSWaQ441qyIV4OBGnPSaoXBklsGKfntDbOqZSoZyYbShB1i0oLUBGaA+8yVUqyctJgP4g5R2ou4qqpDncCM9OAvlFe1esvI7a3TnQ2SsUQrYtPWG4dJ0nQrYfXAXAGah2n6rNYjGQQOU1mz5WC6h/sR8t9UZThGY6lV6FcDY8I2B24hMlJlz5/ikvM3BjXgbNdL/DDvm7mKAV5wXxICFNJ3r2eZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742052050; c=relaxed/relaxed;
	bh=08eKfAUvxdmkmUvYQ9Z9AT/EYdDCAc7pdtIm2LqpGzA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fvF+N/HESsPM8RFkj861ZXOEn1lCylkTlBLc5/3JusPUJYmJWUVqghcY+Bsdjq9L4gSX2tUAPLcHcmsYIr2xG8I5Vn/oakW2uyvB2EiHVTrvYG6IKaKlOtunPeUWnfpVE0DIDBsjLkieL9boZalnWPL/H4h+oWIccWIp3N91IAyvDBMTMjMsjR2lrg/ajjvC0v4eTYLpHVZsQjV8qUhJLYKey/HPoGA1YTMZNMoaxbarEcyTwdzyo76vLE0tVji5X+WlzDBuZPobpTKFNSs1YWZOtDa9iADP5+BFXtqON0VG/SJU4O31gGR05M247r3CRQgqZbAU2GDDlHuItRBofw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=mznAtxiI; dkim-atps=neutral; spf=pass (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=mznAtxiI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [131.188.11.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFQ0x3mfXz3064
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Mar 2025 02:20:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1742052044; bh=08eKfAUvxdmkmUvYQ9Z9AT/EYdDCAc7pdtIm2LqpGzA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=mznAtxiI1kJuIBGKAbfrHe6w8x8MA9DVTQPXk3d0my5iXVoXYyYABprKtB8tsWFBP
	 IkwTRc8+ap+WYBbwmrQWhSV0m9CL4aXTKUwg+EgWYk7H2Q9v6S26SmWQmn3h0tVjKP
	 PW4Hjph9jWSGlvjfSp3NqEYZMytJJebnCfFwlyQ8ItHpvN4IJwIJDGSJJj5nlIG8oB
	 f4y7PpcYRkrZFk59ynAPhYK+hN15mdRnsw+QqcsHbs4b5jq0Ljql5F3KPCtWe0TtvX
	 KOr+N2VQNrjSOSmQLSHS85rICmx9EfETv2j5XneoH+uB+VGhSTk9d7F9MyrYqRj2pR
	 UEDCDnkIFd04Q==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZFQ0q6mX6z8tyl;
	Sat, 15 Mar 2025 16:20:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:361f:c600:5210:4b80:a502:1f98
Received: from localhost (unknown [IPv6:2001:9e8:361f:c600:5210:4b80:a502:1f98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/OU7HXrel01HL8JhXs/U6F2fHJ1Gpb/vM=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZFQ0m590Xz8sYS;
	Sat, 15 Mar 2025 16:20:40 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong
 Song <yonghong.song@linux.dev>,  John Fastabend
 <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,  Stanislav
 Fomichev <sdf@fomichev.me>,  Hao Luo <haoluo@google.com>,  Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>,  Xu Kuohai
 <xukuohai@huaweicloud.com>,  Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>,  Hari Bathini <hbathini@linux.ibm.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>,  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  Mykola Lysenko <mykolal@fb.com>,  Shuah Khan <shuah@kernel.org>,
  Henriette Herzog <henriette.herzog@rub.de>,  Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,  George
 Guo <guodongtai@kylinos.cn>,  WANG Xuerui <git@xen0n.name>,  Tiezhu Yang
 <yangtiezhu@loongson.cn>
Subject: Re: [PATCH bpf-next 00/11] bpf: Mitigate Spectre v1 using barriers
In-Reply-To: <f6f08d64c777a6022771ab0adf96cefb6b631d75.camel@gmail.com>
	(Eduard Zingerman's message of "Fri, 14 Mar 2025 16:40:08 -0700")
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	<f6f08d64c777a6022771ab0adf96cefb6b631d75.camel@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Sat, 15 Mar 2025 16:20:39 +0100
Message-ID: <87seneqq0o.fsf@fau.de>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Eduard Zingerman <eddyz87@gmail.com> writes:
> I think it would be good to have some tests checking that nospec
> instructions are inserted in expected locations.
> Could you please take look at use of __xlated tag in e.g.
> tools/testing/selftests/bpf/progs/verifier_sdiv.c ?

That looks very promising, I will look into it for v2. Thanks for the
pointer.

I guess it might be worth it to add __xlated to at least on test per
nospec-related code path. If there are other rewrites at play that will
make it harder to adapt the tests when the other rewrite is ever
changed, but it might also help in catching interactions between the
other rewrites and the nospec.

Also, thanks for the review of patches 2 and 3.

