Return-Path: <linuxppc-dev+bounces-8026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB2A9DA3F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 12:54:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl66f0GM9z2xmZ;
	Sat, 26 Apr 2025 20:54:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.22
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745664889;
	cv=none; b=k7JekzZ//IhoGh00KkDzxn28KV5S/uSHELysBdEzalTy1w7XL3PF5nh+C8Bsvajk2xiGv9xo22ZiNqu7iohFu8Pmucd1kNsslOliULM7HWypNanPo4iZS3JuXJ7L1349KWOV0Blx/IKMDxM9RXgngKRvmjy9jML62rPdN8L1/0D1TeRlJPkqtCioqhKctnR60rQF6zhFD7WQL9p0TpI4HRqeGuqk3TW4EaFShUqimoIsuPun26X7kyq14QYIVpDHX5JDDLmQ1LviA2xTdmN9etmEPY6wcMwfvQQrF8FMQeyCyYXxuV/2dzIqXZkN7/TEeFuVv/D6VfxVV1yAcML0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745664889; c=relaxed/relaxed;
	bh=Ce0GIrbVfPWC7H8gy4FhbwT9KDZQbFbYWNbCLDBescY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XhD0ysuYoaAYS3ZUYAO/kmp9DDjoiU9vu0IivrZjkrwBiJ97QcDGyoLee6tSUcUa9iOyLnUimXAIL6pJn4YQOGMPdZ6ASW1M4Sojedk4rJwLKtKsoC2qVaXboa0FF9WZ3eSEjk3nrhTaI1mAQDUK6F5efxoDZIBlTjd7q3wekn29HEvNJgG9QkLqkisKbD0xfWUnrgNrPg4mbo3NekK+s4hgYi5uf2l7JqGgAxS35zI3Q+gONBPo+LOo4McRUGJ+PTi5Prt5SGz+FW8ulU6LQ9y9/otNkmEhX9Mpy6ZjzEKU9koq/gOT7rOCgFXXmuuXcxqGD9QY8ogvUUBPfu1ljg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=Y0zaE4Y9; dkim-atps=neutral; spf=pass (client-ip=131.188.11.22; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=Y0zaE4Y9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.22; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de [131.188.11.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl66Z4zqCz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 20:54:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745664879; bh=Ce0GIrbVfPWC7H8gy4FhbwT9KDZQbFbYWNbCLDBescY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=Y0zaE4Y9YZ0haQY9H50iAWqNCuovbbuQ7R25J9ew8C6QDDjBdXmPhnIaOdR7ckEuH
	 hMAoEYrWTjho84BJUjxwmy7qHUKTALqbu6vYKqX3ZIP53Pwa6YbZdN+9x+tPs0fk4U
	 natPf1ZcLG1WRhbeqA9mqq1aEEdOv0vcx5Z0DaGjT9mfjq16B6QFaHno2/nd1hTofx
	 rTDA7W35vkIwtud31kdGsJcLA+DWKpLTCbcA1quyi48iUmZ5ou3M6AeUJJHiEr2Xxh
	 yEo7p6HlwHUqb/6Cf5O9+SNrdyGEH9llvJd66rQ2B3AKpu8llaYHx+Pb9+kfW/s/nV
	 X9PcK+83aAJUg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zl66Q6ybQz1yN6;
	Sat, 26 Apr 2025 12:54:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:361b:dc00:c019:e67c:3dc8:e824
Received: from localhost (unknown [IPv6:2001:9e8:361b:dc00:c019:e67c:3dc8:e824])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19VP6nuyGgC1ZFJikQ/3jfzd/7EixAh4QE=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zl66M4BX7z1xys;
	Sat, 26 Apr 2025 12:54:35 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: kernel test robot <lkp@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,
  John Fastabend <john.fastabend@gmail.com>,  KP Singh
 <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao Luo
 <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Puranjay Mohan
 <puranjay@kernel.org>,  Xu Kuohai <xukuohai@huaweicloud.com>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Hari
 Bathini <hbathini@linux.ibm.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Mykola
 Lysenko <mykolal@fb.com>,  Shuah Khan <skhan@linuxfoundation.org>,
  Henriette Herzog <henriette.herzog@rub.de>,  Saket Kumar Bhaskar
 <skb99@linux.ibm.com>,  Cupertino Miranda <cupertino.miranda@oracle.com>,
  Jiayuan Chen <mrpre@163.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 06/11] bpf, arm64, powerpc: Change nospec to
 include v1 barrier
In-Reply-To: <202504220035.SoGveGpj-lkp@intel.com> (kernel test robot's
	message of "Tue, 22 Apr 2025 00:24:41 +0800")
References: <20250421091802.3234859-7-luis.gerhorst@fau.de>
	<202504220035.SoGveGpj-lkp@intel.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Sat, 26 Apr 2025 12:54:35 +0200
Message-ID: <874iyb6vmc.fsf@fau.de>
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

kernel test robot <lkp@intel.com> writes:

> All errors (new ones prefixed by >>):
>
>    arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
>>> arch/powerpc/net/bpf_jit_comp64.c:814:4: error: a label can only be part of a statement and a declaration is not a statement
>      814 |    bool sync_emitted = false;
>          |    ^~~~
>>> arch/powerpc/net/bpf_jit_comp64.c:815:4: error: expected expression before 'bool'
>      815 |    bool ori31_emitted = false;
>          |    ^~~~
>>> arch/powerpc/net/bpf_jit_comp64.c:833:6: error: 'ori31_emitted' undeclared (first use in this function)
>      833 |      ori31_emitted = true;
>          |      ^~~~~~~~~~~~~
>    arch/powerpc/net/bpf_jit_comp64.c:833:6: note: each undeclared identifier is reported only once for each function it appears in

Fixed this for v3. For the other archs, the patches also don't add
declarations in a switch/case.

I also checked that there are no new W=2 warnings for the touched C
files on x86 with the vmtest bpf config.

I have not checked that all files that include a touched header don't
have new warnings. When doing -j $(nproc) the diff does not work and
with -j 1 it takes forever (e.g., because bpf.h is touched). If you
think this is required just let me know (and if you have a tip on how to
do it more quickly that would be great too).

