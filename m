Return-Path: <linuxppc-dev+bounces-7326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D0A6FE40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 13:52:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMVDz1CDLz2yqc;
	Tue, 25 Mar 2025 23:52:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742904272;
	cv=none; b=V5NJlUUcTdraB/WsJ+Ic+mZZLy4U/O40CQc9TJK2acf5cUW1eQHAFbokCCutpjxl9/ye2DXnbesS03w62TqrBhABo2BduSYnCMRkaScaneccilx+jAXfFSLEumOERlW2nNNfRJyRuq9URFOG/QJzfkGtM0EjcBX1CdxJvrEgwH2KX6cyF6lg0w0jnFtyDSXOWklnc4zI9+Agh/zonrG/PSu+qJV9zdmZIYl36YQIwrWEOslW5pwJuprlW81r2NSH3t25NwoOgj1Ys0taqbAm7tDIOPV9ff0AQc2T9yaVqUjZ3k19TL5riuKkvLk/B9XghcbqYt8rHsVHzktgubHDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742904272; c=relaxed/relaxed;
	bh=Rp0Ir+0TgwjjFPPNTjF2m/e/l07zT5s8JzJgEoC2ijA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvSr5F5zhdaiHHFhFhi+gaemoOaVKEujtZKNm5CA5D7wk9xU6f0Pxn8dwJIhRin0lsoyTuQdcy94/bFNNk7LzgEu8Kb2cMCO6iua/Fb5gR/ugjdZxt8L+fFOIwxACrrLycGWhzorPh2WgZPgJgDm6tfYcKGdckElt7SE33dTgKghVdGguF3QiK1TILPNyPADwpXuuq8QPdCxM1l7AI8mDY8oQ5VG5k7p15Z0hm6t9Exj1NZEuH/WV5YJjysk78C8DDGt7yOd5DOI//+GDXK/ZWwxXZFU0q7hvXVoay11cxS7QDB+PUrwj8PGYRsipoFMXTTm5bs1BlIETi1K2GnGDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LMSi9rHJ; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=qmo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LMSi9rHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=qmo@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMT9q5F04z2yqT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 23:04:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89DCF5C5420;
	Tue, 25 Mar 2025 12:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E74FC4CEE4;
	Tue, 25 Mar 2025 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742904268;
	bh=Lgn+GjPuLLv587AjfxPK4UTvCKPwHlaM+UJ3rYCoRzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LMSi9rHJGjJXGdNd/dIHCcGyuASfC3D6gHLXw6U5bfhA2YP24OMJAO+wrDIG5gew4
	 sEZio9lQpI7z8bb89Ge3UshE+gkbRCrtyFM3f7B7apBf7L9OMwjQ9TfSEdGnLfnBYL
	 OAHaOR3AoaiFCD98Xo6niQRRVAIovLyiU5NMaogC+V1x3XqO780BSJAFwzFzKaO6Cy
	 BVsDv9WvNSFzZbur5DauCssWseQYStvLOjP/rMyRMjHbSDJtJI3QA/3j2Ozhg2A55j
	 0TZmi1rTkX7txMyOfv6wmTdIQKz3MG3ZVLZD9gpdvjkdPvRrxX96kvLLgXxKuuQ95X
	 dp/Q4QJtUtNtw==
Message-ID: <15370998-6a91-464d-b680-931074889bc1@kernel.org>
Date: Tue, 25 Mar 2025 12:04:23 +0000
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
Subject: Re: [linux-next-20250324]/tool/bpf/bpftool fails to complie on
 linux-next-20250324
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com,
 williams@redhat.com, tglozar@redhat.com, rostedt@goodmis.org
References: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
 <8b0b2a41-203d-41f8-888d-2273afb877d0@qmon.net>
 <Z+KXN0KjyHlQPLUj@linux.ibm.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <Z+KXN0KjyHlQPLUj@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

2025-03-25 17:14 UTC+0530 ~ Saket Kumar Bhaskar <skb99@linux.ibm.com>
> On Tue, Mar 25, 2025 at 11:09:24AM +0000, Quentin Monnet wrote:
>> 2025-03-25 16:02 UTC+0530 ~ Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>> Greetings!!!
>>>
>>>
>>> bpftool fails to complie on linux-next-20250324 repo.
>>>
>>>
>>> Error:
>>>
>>> make: *** No rule to make target 'bpftool', needed by '/home/linux/
>>> tools/testing/selftests/bpf/tools/include/vmlinux.h'. Stop.
>>> make: *** Waiting for unfinished jobs.....
>>
>>
>> Thanks! Would be great to have a bit more context on the error (and on
>> how to reproduce) for next time. Bpftool itself seems to compile fine,
>> the error shows that it's building it from the context of the selftests
>> that seems broken.
>>
>>
> Yes, selftest build for BPF fails.
> ## pwd
> /linux/tools/testing/selftests/bpf
> 
> # make -j 33
> 
> make: *** No rule to make target 'bpftool', needed by '/home/upstreamci/linux/tools/testing/selftests/bpf/tools/include/vmlinux.h'.  Stop.
> make: *** Waiting for unfinished jobs....
> 
>>> Git bisect points to commit: 8a635c3856ddb74ed3fe7c856b271cdfeb65f293 as
>>> first bad commit.
>>
>> Thank you Venkat for the bisect!
>>
>> On a quick look, that commit introduced a definition for BPFTOOL in
>> tools/scripts/Makefile.include:
>>
>> 	diff --git a/tools/scripts/Makefile.include .../Makefile.include
>> 	index 0aa4005017c7..71bbe52721b3 100644
>> 	--- a/tools/scripts/Makefile.include
>> 	+++ b/tools/scripts/Makefile.include
>> 	@@ -91,6 +91,9 @@ LLVM_CONFIG	?= llvm-config
>> 	 LLVM_OBJCOPY	?= llvm-objcopy
>> 	 LLVM_STRIP	?= llvm-strip
>> 	
>> 	+# Some tools require bpftool
>> 	+BPFTOOL		?= bpftool
>> 	+
>> 	 ifeq ($(CC_NO_CLANG), 1)
>> 	 EXTRA_WARNINGS += -Wstrict-aliasing=3
>>
>> But several utilities or selftests under tools/ include
>> tools/scripts/Makefile.include _and_ use their own version of the
>> $(BPFTOOL) variable, often assigning only if unset, for example in
>> tools/testing/selftests/bpf/Makefile:
>>
>> 	BPFTOOL ?= $(DEFAULT_BPFTOOL)
>>
>> My guess is that the new definition from Makefile.include overrides this
>> with simply "bpftool" as a value, and the Makefile fails to build it as
>> a result.
>>
>> If I guessed correctly, one workaround would be to rename the variable
>> in Makefile.include (and in whatever Makefile now relies on it) into
>> something that is not used in the other Makefiles, for example
>> BPFTOOL_BINARY.
>>
>> Please copy the BPF mailing list on changes impacting BPF tooling (or
>> for BPF-related patchsets in general).
>>
>> Thanks,
>> Quentin
> Yes you are right that the new definition from Makefile.include overrides this
> with simply "bpftool" as a value, and the Makefile in bpf selftest fails to 
> build it as a result.
> 
> But the main cause is that it is not able to locate the bpftool binary.

I'm not sure I follow. What component is not able to locate the binary?

If you talk about the BPF selftests, I believe they only fail to locate
it because of the collision on the $(BPFTOOL) variable. Selftests'
Makefile was able to find the binary before that commit, so there should
be no need to change the path to the binary.

If you talk about tools/tracing/rtla/Makefile failing to locate bpftool,
it's another matter. As far as I understand, the RTLA Makefile assumes
that bpftool is available from $PATH, this is why the commit introduced
a probe in tools/build/feature: to ensure that bpftool is installed and
available. So here again, I don't see the motivation for changing the
path to the binary (And how do you know it's /usr/sbin/bpftool anyway?
Some users have it under /usr/local/sbin/, for example). If the intent
were to compile a bootstrap bpftool to make sure that it's available
instead then it should replicate what other BPF utilities or selftests
do, and get rid of the probe. But the commit description for
8a635c3856dd indicates that RTLA folks prefer not to compile bpftool and
rely on it being installed.

Quentin

