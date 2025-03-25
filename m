Return-Path: <linuxppc-dev+bounces-7331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67520A70BDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 22:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMj7Q0nnBz2yLB;
	Wed, 26 Mar 2025 08:03:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742916468;
	cv=none; b=CAp1kwy8M2zsVVyN+UCV5mZUTSNMS36EydvzdThyIDy95KGqhtsZpk5NPPVtpVbH5PEK8Cy5I/Uu129zFtaycgU+KSqDOB/nxsuOnIgRhNd/GCbelkFTTXFKZxoXbYvDKeFPmpVpSRWFPaysUQfTrlL1HQYA78vqAN3g5Me1hoqqAjXa6LIoDaM08hCwehRYe9I7sV/8riE7Xwyai8wc0/XLNg6Hxz3Avfvkz9JQc21EN0z2V83yixRxaryHFXLxUGMyypbGC1jWZEXYrUMCFpJM6IlRZ/Udg8rEflsN1773V9fGkuBVMh99HlE7YlEOGrZJu8epc06O1PQNNj+Z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742916468; c=relaxed/relaxed;
	bh=l/9JrztZdMRANNNYnwlKzpEp8aB2VLVcNVggrexDqoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pb1t9tSrGPAKtRq9nCAaKavHdIgAwC1lKSKLAAZceJuZUTD/ExTmzCQIbzC1BEwGC/BD8A9PZI2k8GLNSc6SyWb56FLnjkijjEjCekNXTCzTMEumJ448rtH4i1i+2J1I2fhJmG5I+a6yudRN9wtWtaySSdL2/JVKkRU689l3uQ42bL8mlj7LWtz1DWs3qcJZRANwtX9IWaCfq8KRjwmijRx55dbAWQqlsT27juyOgnNlZa6bui81elJRZnRgXOgIFDYsYgLuS+c3bVfGgWmOAyaoWEM7w6+VibZSSQV1hfgVQHGmyqVZ1LlMwdUrMr/7ADClusvqpEgQ3H8naNScgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XpabP0Fy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=qmo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XpabP0Fy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=qmo@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMYhM3wrtz2yf4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 02:27:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37C6261158;
	Tue, 25 Mar 2025 15:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C778C4CEE4;
	Tue, 25 Mar 2025 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742916458;
	bh=kBSdYtzA9BOEoK+BTjkYPoIMn3M4gtTS4Y3w0W6TsA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XpabP0FyMI9754psd6hZwF0ek3DOl/IO725jDQA5BgN7MLEuyyiCnSZYyED+qmPa7
	 pulPx2PzAWLlCekAgRiczGkGK4ngc8Y7BeqySZF1FDpZhwobAzuPKfanNP+BSrIPrv
	 YjI1YsVHLcYb00nVG9HNIr8IyQzCkl1yvKj9y1EyCnIgTahWZkHM+Tw/cGGIYb13mu
	 Qiv66lchO+3/SKpFO3a9Eaka9OBV8tWpPWXq+kXDSw1WcKh50yX448ckeyII15HUdg
	 dFE6dnotAIsR2fQ23rv2hvSbD+JZuNa2mCTFaaNn0Tt07ZcDbI3fkQyvCCZfQb3BsZ
	 S3tnsdhkSpX5Q==
Message-ID: <a5cccd3a-ff63-4adc-aec1-ad61a58a4b25@kernel.org>
Date: Tue, 25 Mar 2025 15:27:34 +0000
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
To: Tomas Glozar <tglozar@redhat.com>
Cc: Saket Kumar Bhaskar <skb99@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, bpf <bpf@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 jkacur@redhat.com, lgoncalv@redhat.com, gmonaco@redhat.com,
 williams@redhat.com, rostedt@goodmis.org
References: <5df6968a-2e5f-468e-b457-fc201535dd4c@linux.ibm.com>
 <8b0b2a41-203d-41f8-888d-2273afb877d0@qmon.net>
 <Z+KXN0KjyHlQPLUj@linux.ibm.com>
 <15370998-6a91-464d-b680-931074889bc1@kernel.org>
 <CAP4=nvQ23pcQQ+bf6ddVWXd4zAXfUTqQxDrimqhsrB-sBXL_ew@mail.gmail.com>
 <CAP4=nvTUWvnZvcBhn0dcUQueZNuOFY1XqTeU5N3FEjNmj4yHDA@mail.gmail.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <CAP4=nvTUWvnZvcBhn0dcUQueZNuOFY1XqTeU5N3FEjNmj4yHDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> My commits sets BPFTOOL to bpftool since otherwise, the feature check
> would fail, as BPFTOOL wouldn't be defined, since it is not passed to
> the feature detection make call.


Sorry I don't understand the issue, why not simply rename the variable
that you introduced in tools/build/feature/Makefile at the same time, as
well? That should solve it, no? This way you don't have to export it
from the rtla Makefiles. Or am I missing something?


2025-03-25 16:09 UTC+0100 ~ Tomas Glozar <tglozar@redhat.com>
> út 25. 3. 2025 v 15:59 odesílatel Tomas Glozar <tglozar@redhat.com> napsal:
>> Shouldn't the selftests always test the in-tree bpftool instead of the
>> system one? Let's say there is a stray BPFTOOL environmental variable.
>> In that case, the tests will give incorrect, possibly false negative
>> results, if the user is expecting selftests to test what is in the
>> kernel tree. If it is intended to also be able to test with another


I think this was the intent.


>> version of bpftool, we can work around the problem by removing the
>> BPFTOOL definition from tools/scripts/Makefile.include and exporting
>> it from the rtla Makefiles instead, to make sure the feature tests see
>> it. The problem with that is, obviously, that future users of the
>> bpftool feature check would have to do the same, or they would always
>> fail, unless the user sets BPFTOOL as an environment variable
>> themselves.
> 
> Or the selftests and other users could use another variable, like
> BPFTOOL_TEST or BPFTOOL_INTERNAL. Not sure what you BPF folks think
> about that. I believe assuming BPFTOOL refers to the system bpftool
> (just like it does for all the other tools) is quite reasonable.


The variable name needs to change either for rtla + probe, or for all
BPF utilities relying on it, indeed. As far as I can see, this is the
sched_ext and runqslower utilities as well as the selftests for bpf,
sched_ext, and hid. I'd argue that the variable has been in use in the
Makefiles for these tools and selftests for a while, and renaming it
might produce errors for anyone already using it to pass a specfic
version of bpftool to try.


> The reason why I opted to use the system bpftool is that bpftool
> itself has a lot of dependencies


Note: Not that many dependencies, most of them are optional. For
bootstrap bpftool we pass -lelf, -lz, sometimes -lzstd.

Quentin

