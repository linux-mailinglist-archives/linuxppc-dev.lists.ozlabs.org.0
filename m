Return-Path: <linuxppc-dev+bounces-14543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F44C91D8B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 12:46:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHs252g5gz2yvD;
	Fri, 28 Nov 2025 22:46:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764330365;
	cv=none; b=d3lF01vmFsNkL70qwHxjPxh0p3eGO/dz586bDLYxmQGS7Q3VIuTGz1sHyrEzwvZD8LvlEGKeecki82/EjpdXY5jymPRuRRmhhIMtHhLspPGl0QfOi0M6Q+Y1jHQZGo5z5YOY1QEv/qoHx7r0D8hEXm9XHe5M7XAaUGEDg8cv+4rPSAHK1U4X3EWJZCzds3nWnySATV43mRQ/b2IfZJ7v/XkfODZy0WC3/18ZOIKaiqCrKAIoApc8aTqPIEgXt13FkBvA7JK/yWKJ7PjnMnJxiQWws1FFNtsEiYy8ZzEld4yNJdFH2+3C0Z9FsXb68VXMZtRO8yL9OFguIqZYVHj2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764330365; c=relaxed/relaxed;
	bh=Cn1RtaIIs9ub2fLUkzR5Rx4Z7gztn8eAQ647vToUiNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWmH0SJ1qbvp7PktTy85a0k71wcRRJgTND6pM+5izDW0GqTYiDhW6DcQuPRVluq4fPsvFzuQk+phze4sWM2J2AGPsXSNBX9LnzA9+7CkXo6NwEZgcSbdCjUYrKWmjipCAE+gpHqqGiTuTchbK3hm+0y17KN9UPoGSzGWl4IvPafHnNJxyWO7spChfKWPnziIV4+pHW54Cx8GSOg15tYniIjGMbabtV9ufoTzARMODFKzPCkTUsWhVUMC3IwVxvlXu1GQ2CAOCHiZjQbVhFA3yESETArNszwbCxzuk+ZdyjXcLYMRMI1DgBCpwAnmYB7l8pWVsMebpTxVlaseIjSaPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NCDlaJ1x; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NCDlaJ1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHs245Ft1z2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 22:46:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BC4743F41;
	Fri, 28 Nov 2025 11:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC58BC4CEF1;
	Fri, 28 Nov 2025 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764330363;
	bh=vqplphJ1VoiCvxNWL1YV3ef/8TrqVxQk35wf0M+dKpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NCDlaJ1xHq7jQKrG9HYERIFWL4+6bYQzSi84yWcrHIc+mJJJwfcJjCbahGIOCLGJk
	 N9MgQCYV0gXSUhrIFLGQlHDQ1U0Tex0R5nHiCBATbIIrAQMWe5E11T46cKFjg5O5V9
	 CG8+OGkEC9vfC8Ug9PP3vjliWkM2EKMR8SfSZ8g3P7TetdMKvCyR7Z0GM5i1ZvuPMC
	 /vToiwFKxj/lbcrcxoXnI0JWsQPq3bAAJpmfH86B5oCm/O8ZEGMIRSK6pQ/KOKuWZ+
	 65YuH9Bnu9x00I4PG7CLbXhODhUFczkS2h73y9msGtTGRSfiBfcv/4wf1e4K3UiZRg
	 ho3SwP6DLzF4w==
Message-ID: <89b5b9e7-d8c1-4402-9fe6-b312630b3d50@kernel.org>
Date: Fri, 28 Nov 2025 12:45:58 +0100
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
Subject: Re: [PATCH v1 0/2] powerpc/pseries/cmm: two smaller fixes
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20251021100606.148294-1-david@redhat.com>
 <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org>
 <87zf86n3vq.ritesh.list@gmail.com>
 <3cc7d401-c77c-4ac8-abb8-c264fbd9aaf0@kernel.org>
 <87y0nqmwaz.ritesh.list@gmail.com>
 <a3bb0e8e-72c9-4a9c-b347-e899ae29b289@kernel.org>
 <189ac734-b194-4b52-9752-18d8c0b71377@kernel.org>
 <87tsyemocw.ritesh.list@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <87tsyemocw.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/28/25 11:40, Ritesh Harjani (IBM) wrote:
> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
> 
>>>>
>>>> Right. Let me give it a try first with pseries Qemu. Otherwise I have an
>>>> access to pseries LPAR too. I can verify it there.
>>>
>>> Ah, now I realize my problem: I tried with Fedora 43 in a powerpc VM but
>>> the modprobe didn't do anything.
>>>
>>> Looking again:
>>>
>>> # grep CONFIG_CMM /boot/config-6.17.1-300.fc43.ppc64le
>>> CONFIG_CMM=y
>>>
>>> So modprob'ing won't do as the module is built in.
>>
>> Right, so doing "cmm.simulate=1" on the cmdline in a Fedora 43 VMs
>> properly creates the CMM device.
>>
> 
> Right verifying using simulate mode is very straightforward. Thanks for that!
> So.. using various random echo X > simulate_loan_target_kb on a VM...
> 
> ~# cat /proc/vmstat |grep balloon
> nr_balloon_pages 16
> balloon_inflate 1638
> balloon_deflate 1622
> balloon_migrate 4

Thanks a bunch for the review and testing!

-- 
Cheers

David

