Return-Path: <linuxppc-dev+bounces-7866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5FEA952AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 16:23:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh6zL71jjz2yKq;
	Tue, 22 Apr 2025 00:23:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745245390;
	cv=none; b=WyEbz777pg9frLCX4qZmBxHwdTiHnsRTxwhhNoA/0EGPwLDqAxwQkMthV6HaVlIycCzNl6U1vHRTRc4loe/YQPA/xchveIB1WB7ti9KcJuG8klnIv1mpTe4sJS1+8SUuifpeuH9xBR0P8xLv9OzslD2XYUu8T8gUVsfjUUxHXUY6ymhdFzFxLesT/TTwXqv7SZMJI1WPfO1ftYnmhbfOtPEhnRa8FVzKMqjxmKm7j9/FzGhMNINrxZ/tDqc78p6B/j+/45USIQjIScN4PxzSR+cVNbWwIJj0JT2tN42G3mKPfQuzo0/5txUD9jPK105EjosQO6G57tKfFrLfJ1FSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745245390; c=relaxed/relaxed;
	bh=dHRKLKa57WaRcw3gsgSapFs5eoq+g/y962Gr8FAxtJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PjHsxfxbjtwtB4bg4aJezxo2SBHMyaqDv0lXG9FvVWcAdNEx3X170tBqF1E+n/aPM0K00Jqz7VD/vY4qdvE4PX6TNf6E+liGP+8vRhXRrk8LV/UEJk2L+ERvFbyyCb/R9tsWQ02be/j1ZZW+rEwuHNgyUsmdJ42DJagj9i8UYxkYjIgABc2B8AOU2ktGfIaHzKV/8rACHKXeyjTYJaKXKhxwvkHP+gCf25UAIRPs8dYzOa5M4OmSx5J9gw5VZd9nSVE7JX14yn81j71c3XpZBe2qagjcCWFVRRo0bcT2DhtbB63dzqfwleSZbOuvCspqOS2q6JQpkMciS0TP0sqY1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=orBiie4c; dkim-atps=neutral; spf=pass (client-ip=131.188.11.21; helo=mx-rz-2.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=orBiie4c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.21; helo=mx-rz-2.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-2.rrze.uni-erlangen.de (mx-rz-2.rrze.uni-erlangen.de [131.188.11.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh6zK3l1Yz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 00:23:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745245384; bh=dHRKLKa57WaRcw3gsgSapFs5eoq+g/y962Gr8FAxtJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=orBiie4cvNrHVv1JbBWkrpOyYmyGmifj9slSFQzZ0sJetOlRXTDNVGexBpdHSLlCj
	 cIRmDtYCELKKpt25P9o50N7Y+j9jsWe+aLzGb7aUsWJA9N64p44PwD8KSuAJ4OjZJB
	 XZ/ImmqlxC4T3CkcYfAZJBcM3JIzvolN8AqEG1ESQtwmvQXdXlF0t9Lnu4dsv8XVMd
	 dOj+KKY125Rtr8bCcieX7+VlKdKSQWGglObQaut+Mmr0zxuF1dr3qH1s8G40zgEohX
	 itn/AJJ+UntW48id29kZH/dXMJJNuSAKYM4NQG3NbSOJdhyEJRv3pYs07IFq2UTGT0
	 zumuzse94SOdg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zh6zD2qDxzPjmG;
	Mon, 21 Apr 2025 16:23:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3600:7e00:5b67:6b9c:caeb:75c
Received: from localhost (unknown [IPv6:2001:9e8:3600:7e00:5b67:6b9c:caeb:75c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+yS0Gm16sXrv8zOrS9nARAtw0fhZkEU8I=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zh6yw2GKwzPjsn;
	Mon, 21 Apr 2025 16:22:48 +0200 (CEST)
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
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 henriette.herzog@rub.de
Subject: Re: [PATCH bpf-next v2 05/11] bpf, arm64, powerpc: Add
 bpf_jit_bypass_spec_v1/v4()
In-Reply-To: <202504212142.V3yjAcaI-lkp@intel.com> (kernel test robot's
	message of "Mon, 21 Apr 2025 21:17:56 +0800")
References: <20250421091802.3234859-6-luis.gerhorst@fau.de>
	<202504212142.V3yjAcaI-lkp@intel.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 21 Apr 2025 16:22:47 +0200
Message-ID: <87r01lzj9k.fsf@fau.de>
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

> All warnings (new ones prefixed by >>):
>
>>> kernel/bpf/core.c:3037:13: warning: no previous prototype for 'bpf_jit_bypass_spec_v1' [-Wmissing-prototypes]
>     3037 | bool __weak bpf_jit_bypass_spec_v1(void)
>          |             ^~~~~~~~~~~~~~~~~~~~~~
>>> kernel/bpf/core.c:3042:13: warning: no previous prototype for 'bpf_jit_bypass_spec_v4' [-Wmissing-prototypes]
>     3042 | bool __weak bpf_jit_bypass_spec_v4(void)
>          |             ^~~~~~~~~~~~~~~~~~~~~~

That's because the prototypes in include/linux/bpf.h were in the #ifdef
CONFIG_BPF_SYSCALL. I fixed this for v3 by moving the prototypes out of
the ifdef.

