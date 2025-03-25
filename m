Return-Path: <linuxppc-dev+bounces-7325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AED25A6FE0E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 13:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMVBg71X0z2yqW;
	Tue, 25 Mar 2025 23:50:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a10:de80:1:4091:b9e9:2212:0:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742901358;
	cv=none; b=PUy0ftJLM9df8Jg5fv8rr/iaUmFeHRFZC4FS8IQX/MVIQGOlYoe5STiq6jbkhIvZlz/VIH1jn6bCq09Wit1zNek+xN0q1aHNEEymczrrG6jg6KZaHMoYej7GaBvKfJrt8l1FlZoGFuT8VVSMlWnC3RoIoOVGayZF0Q00Az2KAQtEoqKGfm05EZIjFYxzFqTtYJSA8WXenuNHf6hknAc+kmSR25XFWf65+5Qga2maDCvtnxEhGR7OZn0/vRpXnDgGm5XRuJrwifph7l81VWlEFEJ7L7lATbLqQb0tgruNTq/zUFm9skN5ZXEEz2BtAe7UbKoAcdoYxuvYtVpMS1gpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742901358; c=relaxed/relaxed;
	bh=cGOfD2XTG3f2KGCnBBCpnWBs5ydWIF56orN3h4fexfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SX5kyWZwZVOBHOWsIrxmX522uR+qj+VvwOV8ps4EKjEroKVrTA5M+CKzjMPku2/MiHQt8uaz5bHRvLPAi3BguxFHhdA6la8TAG+72uLWdif7O8HVOIPwIMW/K42tTH9enYClPrA/r4pOTOIwsXzVelHUYoM/8zvbtoo4HYWZkX/cOmKcXQNQs234bkpj6B+Qh4RKKGm06cBuCRU5OW4aezHjWF4F7Orkeap0iI7uBELkvQllgUmRHB8+LLfQbNv/bquFvAQqLfCI5t16ZZEk0XpSf/W/cZJptLs0wwKWNQ32n+VFwZ4ZzZfppXitTvb9tJ03wiKcsDhx7CZvodpl+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=qmon.net; dkim=pass (2048-bit key; secure) header.d=qmon.net header.i=@qmon.net header.a=rsa-sha256 header.s=soverin1 header.b=r3FoCtrO; dkim-atps=neutral; spf=pass (client-ip=2a10:de80:1:4091:b9e9:2212:0:1; helo=outbound.soverin.net; envelope-from=qmo@qmon.net; receiver=lists.ozlabs.org) smtp.mailfrom=qmon.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=qmon.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=qmon.net header.i=@qmon.net header.a=rsa-sha256 header.s=soverin1 header.b=r3FoCtrO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=qmon.net (client-ip=2a10:de80:1:4091:b9e9:2212:0:1; helo=outbound.soverin.net; envelope-from=qmo@qmon.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 381 seconds by postgrey-1.37 at boromir; Tue, 25 Mar 2025 22:15:54 AEDT
Received: from outbound.soverin.net (outbound.soverin.net [IPv6:2a10:de80:1:4091:b9e9:2212:0:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMS5k1knwz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 22:15:52 +1100 (AEDT)
Received: from smtp.soverin.net (c04cst-smtp-sov02.int.sover.in [10.10.4.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4ZMRyF59pSz5Y;
	Tue, 25 Mar 2025 11:09:25 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.100]) by soverin.net (Postfix) with ESMTPSA id 4ZMRyD4TSVzML;
	Tue, 25 Mar 2025 11:09:24 +0000 (UTC)
Authentication-Results: smtp.soverin.net;
	dkim=pass (2048-bit key; unprotected) header.d=qmon.net header.i=@qmon.net header.a=rsa-sha256 header.s=soverin1 header.b=r3FoCtrO;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qmon.net; s=soverin1;
	t=1742900965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGOfD2XTG3f2KGCnBBCpnWBs5ydWIF56orN3h4fexfI=;
	b=r3FoCtrOdZY5uz3a4IWefaYR/yF9GCJwVwz6OPF/s3+iZQezt1m0luRyELbSFNh1oXjS3Y
	TenjkE7Pwl+to1A2eAgE1ZuFPvbXdKH0zUapeJsie8/v1M4fCtmCNVz/ljAbFwSluvla5V
	cUwZbqQJCvpCUyAvwKvjAWZa2PkZsbanYqQDP/o3hR+3A+niH8kRgZMqA07gp/OdgzzQeN
	SCpJAliHzTXy3L/ydV3sEdoh+2Ee9BD7WPcV7ulIgJFMM8L7crZUjWD6r02rbzO3UXbVDU
	x+Onj0gIaJ+s5ljhcJZwVRyZq1QimJrCZKV/nycNsBmjrrLMXmRWX0pBLcceZA==
X-CM-Envelope: MS4xfE9qJlPwytaJvqH5tq1m5QU56wWQBwUboh0Qh6Yd9gPG3SfGIEto9BX9dKfT5mpckLp6hdBINDG1q65gThfj8VIClkPgn3mJ+gwirrZuazommNFE7IVj f8pr3U4gUKXfDXH9/HS4vCY4QB+ycLV97kwbthBKcJKphbKv4/clwyNx5phT0PVdlrFynOx3BW/v61eZV/Xwy7uLbQMxLLUtDLTSjfKhjgcwBPENDF1iunsZ 1pa3vf8wIMJR9J6b86EksOEXARDZDDa7g5G4zoNAKMbUiwjQ/QQwruJlEGIGadx8Qjy/Zc0DUaxCp4hvLjZEC86gwgq6Qyd7qOwt8fM9r5Pui8OilCkRpakL lX70dETd699Ogy4m4MnbmpHYwqV7LS2PDeBBtr0av5iRrl0ov5xtVaXURGB1YSG39F2lLT4ddjq8wlBThQ79j39LTLOWoiBPH1FtOKaFBX+ZDVW+3IaxLxUU Ja4Pnl+rUa0s9ti265wJnrKHJ2lB7mLFXNtzyD9ihJLPqfDP1TQ6/6LxPcB6CYqgmljjQ3n37XnGLCwLZXwdrF03sYzpFs4G7j19BiP9cxfzPzmQ95pnNBg1 M28Bu9gKEAYQ23bly3Hd9ZqyEImn0l2S9+LJHcgo5DrdhvJKmLdHLv7lSZYEz6SL+1M=
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=67e28ee5 a=vzOQIoBu8N4nb49veeH0EQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VnNF1IyMAAAA:8 a=K2RAGah4TdK_Dg0oFeQA:9 a=QEXdDO2ut3YA:10
Message-ID: <8b0b2a41-203d-41f8-888d-2273afb877d0@qmon.net>
Date: Tue, 25 Mar 2025 11:09:24 +0000
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
Subject: Re: [linux-next-20250324]/tool/bpf/bpftool fails to complie on
 linux-next-20250324
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Saket Kumar Bhaskar <skb99@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com,
 williams@redhat.com, tglozar@redhat.com, rostedt@goodmis.org
References: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
From: Quentin Monnet <qmo@qmon.net>
Content-Language: en-GB
In-Reply-To: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

2025-03-25 16:02 UTC+0530 ~ Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Greetings!!!
> 
> 
> bpftool fails to complie on linux-next-20250324 repo.
> 
> 
> Error:
> 
> make: *** No rule to make target 'bpftool', needed by '/home/linux/
> tools/testing/selftests/bpf/tools/include/vmlinux.h'. Stop.
> make: *** Waiting for unfinished jobs.....


Thanks! Would be great to have a bit more context on the error (and on
how to reproduce) for next time. Bpftool itself seems to compile fine,
the error shows that it's building it from the context of the selftests
that seems broken.


> Git bisect points to commit: 8a635c3856ddb74ed3fe7c856b271cdfeb65f293 as
> first bad commit.

Thank you Venkat for the bisect!

On a quick look, that commit introduced a definition for BPFTOOL in
tools/scripts/Makefile.include:

	diff --git a/tools/scripts/Makefile.include .../Makefile.include
	index 0aa4005017c7..71bbe52721b3 100644
	--- a/tools/scripts/Makefile.include
	+++ b/tools/scripts/Makefile.include
	@@ -91,6 +91,9 @@ LLVM_CONFIG	?= llvm-config
	 LLVM_OBJCOPY	?= llvm-objcopy
	 LLVM_STRIP	?= llvm-strip
	
	+# Some tools require bpftool
	+BPFTOOL		?= bpftool
	+
	 ifeq ($(CC_NO_CLANG), 1)
	 EXTRA_WARNINGS += -Wstrict-aliasing=3

But several utilities or selftests under tools/ include
tools/scripts/Makefile.include _and_ use their own version of the
$(BPFTOOL) variable, often assigning only if unset, for example in
tools/testing/selftests/bpf/Makefile:

	BPFTOOL ?= $(DEFAULT_BPFTOOL)

My guess is that the new definition from Makefile.include overrides this
with simply "bpftool" as a value, and the Makefile fails to build it as
a result.

If I guessed correctly, one workaround would be to rename the variable
in Makefile.include (and in whatever Makefile now relies on it) into
something that is not used in the other Makefiles, for example
BPFTOOL_BINARY.

Please copy the BPF mailing list on changes impacting BPF tooling (or
for BPF-related patchsets in general).

Thanks,
Quentin

