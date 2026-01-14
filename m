Return-Path: <linuxppc-dev+bounces-15730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC8D1EBE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 13:29:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drlm15drhz2xMt;
	Wed, 14 Jan 2026 23:29:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768393745;
	cv=none; b=ixrDW3hRnscNi9j2IpIEKqxqTCsRLUMVWUiw0SBTSkIH6UyEsn4OlYy4h2ElVsMEwX3YDJxRt1ftKTDgbK9ASm/Lsm6TipNmxh/gNFXb39e/Hs4OffzFAIHDz5nxH1tT41catR0Xl5ceRqoY5tbQbczpi7+eeENu6cPXz0B3nzBmgpRHd4mb/9x2iFOZ5ttMxP/sKPArFcc7DAmis3DSx11efPJ/oXyjYknuVzVFHErU5iCLmzvIXdzlQHSvKs/c+p0mSjW/miDTszvjxvqjQFXhKFduTVo/Tug0YoxA7F6ACGA/+GZJNMc1Ye7esMbBD7w2TmfrSoSY7ye9Yus9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768393745; c=relaxed/relaxed;
	bh=LXhocvDi6po2WrnNrtNFceeGR7ZN7pCt7tsJONeQXcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOQl4uV3qKajUx9vZE8/mYpeiyRZw8KPxRyhljWhNYyQNXnqCWQ+u6n9bbsra6ZId4uAvq1K3P43asF6YHh/7Crq+/QB3RRJydh8kP163UVPkioWREE9via6a6d/ANdCyR32ejDr5n8AEfk9WT/Bl/sDyABHW5RQ5XFNFM3UvVAV9Z5n2KOAGq2qX1+kh0uezi1ewRrLSqFEHCcD+AC90q8wkFc7k1WvVCkV562c97BdYp8/STWrMONL69XsbyelERwP10iFJGPaAEC1NUMF0vh6QMVSozkSViVdAJbvyr93AbuJ/IA20vEp/sU2en0UMFJsEsjxdILbEoo/IawGSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZzxO7pL; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZzxO7pL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drlm11216z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 23:29:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AE8B600CB;
	Wed, 14 Jan 2026 12:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB30C4CEF7;
	Wed, 14 Jan 2026 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768393742;
	bh=2LVUPJAyVyauvFS49vi97xmP0WMroGHn6IQqudEGN2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UZzxO7pL24lBvpdl1yW2iNKJHrmOL9xko6kMOCad3v9j6YfEYsgb2G8yIz5wt0iaw
	 gnNNyD1rs+q/oqGcWDu9ny+k4UCf/+zmgwv5OL6s5LnzPnWVcgkJ2L9aNoiEA+XdL2
	 G7NsXm0gSwM2wclNrL5RQSLnVVyBNjsf9KkFO26wAJISZH0AfllbWlYVsFtNyBqyJ0
	 gOhG0ynHhGM9mSgO+ci43Yc7zOWpRaVylc14J5VBTXkTjuCHZsWoyigx5cZiUCsgO7
	 oKZuKbdJC3Dwc2rBIiQCWC7S7JjQZTNmGRiGTGbWmcwH85AKARtM2Sg3t2b/h2OYnN
	 MH0+g17HO78Ew==
Message-ID: <3bc63f36-a732-43d8-8f65-43d532adcd68@kernel.org>
Date: Wed, 14 Jan 2026 13:28:55 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] powerpc64/bpf: Support tailcalls with subprogs &
 BPF exceptions
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260114114450.30405-1-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/01/2026 à 12:44, adubey@linux.ibm.com a écrit :
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> This patch series enables support for two BPF JIT features
> on powerpc64. The first three patches target support for
> tail calls with subprogram combinations. The first patch
> supports realignment of tail_call_cnt offset in stack frame.
> Implementation details are provided in the commit messages.

Did you consider doing it also for powerpc32 ?

Christophe


