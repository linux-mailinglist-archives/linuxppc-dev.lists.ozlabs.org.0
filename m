Return-Path: <linuxppc-dev+bounces-8308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718CAA9B91
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 20:32:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrqrB4zDjz2yr3;
	Tue,  6 May 2025 04:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746469930;
	cv=none; b=VKx2Gz6VdqA/gORv+wGj1BIGD0PMt/SppvbdTvV94WoQw41t9wYpRrqBexqn0oDT16G2dCYWbKTnYiK7MUSPfq8Q4fWsVGga90v6o/pNQj7L3JbRKJJp1zrV0ixcvr2MhYZbsHivafWOiUL7zMQEZr3dy04iw1JJfET7H1bhFLbvaB75fyRkH5IYXmDhWWriHNrCRuKQO3A3QrCudx2fTgrDtR2yv2qh7YgLNzPtoxGe6XsUMBiiRtKWjqQ83m3OrmKF51yeHGKh6a72/QvFURcKeSZvqOadCjSk2c6SV5zc9w9P6ndfGBrNS7C9GWOiKDrTHgPCrcyDSM7pvR5zRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746469930; c=relaxed/relaxed;
	bh=G+rx5YkRQB2m3RpX0Dkv55899VOEaYs/uah1PbfJoNU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iroea4utG0sP7EfaVP6f7izVBbOa9woeGo4BMY+Ey9wlBI7J+g5tji3p5/YFuUrTy0S5CjV4S+rEAaVDb71mtVu1pwvT0jAaslAA21TSfCJvn7Q9JzBcTfjY3xdxWyORdeAqFc+EPUA8aCb3RzwgPTfzD7q/O8vUQFOVwOzGYyDFPRX/CasyUudo+NoPq0sxI/T2GTY12GFgNDONUh7gsH66v68MQ2brgi6NuTCMlpOQOEfBvGuuFrCunXVXNGDKAb7Wam5KuKY4wrq8al7nTUazwf8xtaaRsweKdAamEICSRg0vr4MUp5G8PxMTQV7KDkbXW5WHXSlmqxjVM8lA9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=yW8pmccQ; dkim-atps=neutral; spf=pass (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=yW8pmccQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [131.188.11.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrqr673bwz2y8t
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 04:32:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1746469919; bh=G+rx5YkRQB2m3RpX0Dkv55899VOEaYs/uah1PbfJoNU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=yW8pmccQZmfxN/uiui/GsNvYsuT03rI5l+mrjcdBr8Ba/sIQtV3vWyU7uepeyBqlU
	 Fv991SaO8f4A9H4Cs8LHYsaEcvP8iZRw+qZ9sYJmOzltJQexukPzSArDcZ7Rduh3cl
	 evsmAIf4OEVEGBDNIzUEWaCy2Dle4rlovBLNzZrCCWl+KbdfPIlLdK+eGkIvjVfNue
	 0ddGuOxWrA9BnMQxJI7zuSyzVSkw0f+S3FI4ONcmlBPsDt0TG7nyCgq44GGWwq9YLH
	 DV6JcUf0p1lcLcmIG/I/jjQJ6fj+56LZ4DZ+Ie6WbrtZmmetbjEfZhii7Gc6WQWMla
	 S8vi6tD+TLzsg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zrqqy6XMDz8sgT;
	Mon,  5 May 2025 20:31:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:360f:4200:9271:67e3:d4db:9352
Received: from localhost (unknown [IPv6:2001:9e8:360f:4200:9271:67e3:d4db:9352])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18Yw8S/8gEWPxucUMHgztU2l/wqL20Lctk=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zrqqv4bwgz8t5P;
	Mon,  5 May 2025 20:31:55 +0200 (CEST)
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
  Henriette Herzog <henriette.herzog@rub.de>,  Saket Kumar Bhaskar
 <skb99@linux.ibm.com>,  Cupertino Miranda <cupertino.miranda@oracle.com>,
  Jiayuan Chen <mrpre@163.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,
  Maximilian Ott <ott@cs.fau.de>,  Milan Stephan <milan.stephan@fau.de>
Subject: Re: [PATCH bpf-next v3 02/11] bpf: Move insn if/else into
 do_check_insn()
In-Reply-To: <15294d369d94cf005c9aa722967e5ddb1fa8cee3.camel@gmail.com>
	(Eduard Zingerman's message of "Thu, 01 May 2025 11:22:53 -0700")
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	<20250501073603.1402960-3-luis.gerhorst@fau.de>
	<15294d369d94cf005c9aa722967e5ddb1fa8cee3.camel@gmail.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Mon, 05 May 2025 20:31:54 +0200
Message-ID: <87tt5yhpt1.fsf@fau.de>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eduard Zingerman <eddyz87@gmail.com> writes:

> On Thu, 2025-05-01 at 09:35 +0200, Luis Gerhorst wrote:
> 
>> +		dst_reg_type = cur_regs(env)[insn->dst_reg].type;
>
> Implicitly relying on `insn == &env->prog->insnsi[env->cur_idx]`
> is weird. Still think that `insn` parameter should be dropped and
> computed inside this function instead.
>
>> +				return -EINVAL;
>> +			}
>> +process_bpf_exit_full:
>
> Nit: since we are refactoring I'd extract this as a function instead of goto.

Both done, thanks again for the review and testing!

