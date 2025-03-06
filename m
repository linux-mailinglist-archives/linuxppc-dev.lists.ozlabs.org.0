Return-Path: <linuxppc-dev+bounces-6761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9FA54C90
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 14:49:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7rPz652vz3bw9;
	Fri,  7 Mar 2025 00:49:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741268983;
	cv=none; b=S4gaGnhNLlVpuQN2rQsZx51/H0rED8TgAGQ1vlSyOaAgrsdSXs+0ykxVvEALoRBf7SdOrV933uONRMYihgeVgfaxnX5n6eOLTBy8YjA1qgTpVbSA7OHo61ajwb8JLMXsh06FJBiov54OikFCFhm5ixh0KRLdZn0SbNkbOf72gsHtkrBqYfJ75jKteZDqP/TFlOWFliz/KIntiaqTfhDhNW5oefe1AAI9DgZw6TiqJLQrQjtPNB681ImaDavSnUzzL8w8pvaOcBjKEt/osqD08L+4WFcpdg5DIXnOopHp3T1kFOk7iEH7BMI+WFLoqNFtv+e/gaL1Vc+5g2nH9E+Ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741268983; c=relaxed/relaxed;
	bh=3cIGbpF9NDlgcD94aLQCuZD1KrFUYCeF/scbAkv4tk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VJhO8FfQNX85O+pLVWNyDduwLYD4ZUwbzvDUPTA9JC633VpyRxaG7KynaPV59LWZXMhBtOWPpWOptYTItalvRdEPANphM1Jt2eT6ycgpKpNWFfvGfkZmMQF5GshP81zluol5LF9B7oIUbHP2QnYDxFQh+DAeCGGBY+ax8ghcYY7zzI6FlRqHep3QI2BNZAVuh1wPaWy4WUSZw0H+BI4kr7SrulJo2t3u6QmS110A5AchkVvArBGc7p/GN+ixKwjQEiDYTJIY5//IEKgalDYR6iSH8aaIieuSTBGVOD9BTgqULR8MdXqbHozjJ7pmhKYWl8+NFojAHdR9mjvUl5Wv0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JLBkxOEG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JLBkxOEG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7rPy6JSrz30TP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 00:49:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 709E1A44D32;
	Thu,  6 Mar 2025 13:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225BBC4CEE0;
	Thu,  6 Mar 2025 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741268979;
	bh=z3EtNloxkQ6zpWWabp9FALeIuu5pn4FMVWPiMhQVq9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JLBkxOEGxr1J5Dz+U0vAhGviHTdu4hpoiKh87p22s83ZMiNuLxhrxDaR+4+uMGOun
	 g8DGnqGSbC6pBsQCrKUX/gkS7Kld8Dt1EOGLutunF5jrqYuV7PGiUrylPnf5axZP7k
	 RZ1+kZ4SIh1S+xjQrlPhohbi20dvLMZ4IO7l33P25kPs8YTnduJqu7PKdE71sYUlfc
	 /8MPtcJ4LUqowF/miMh/STyuUBpoaNpFCgUHox1X6y+gkt/iW8okI0yER8rAg9MA8N
	 LIH8SZoFJ0cujGf8b5aeiDaQxNaw5oeLkZaeVVVbaiU5U/v2Cq5FyzG0RvksCZkHTE
	 qlXur4sFVU52w==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 Q)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH] book3s64/radix : Align section vmemmap start address to
 PAGE_SIZE
In-Reply-To: <d4b3fdbc-645f-4a43-bd9c-d29f4e4dacbc@linux.ibm.com>
References: <20250226043426.224494-1-donettom@linux.ibm.com>
 <yq5aeczexo5w.fsf@kernel.org>
 <d4b3fdbc-645f-4a43-bd9c-d29f4e4dacbc@linux.ibm.com>
Date: Thu, 06 Mar 2025 09:41:31 +0530
Message-ID: <yq5amsdyssr0.fsf@kernel.org>
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
X-Spam-Status: No, score=0.7 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Donet Tom <donettom@linux.ibm.com> writes:

> On 3/3/25 18:32, Aneesh Kumar K.V wrote:
>> Donet Tom <donettom@linux.ibm.com> writes:
>>
>>> A vmemmap altmap is a device-provided region used to provide
>>> backing storage for struct pages. For each namespace, the altmap
>>> should belong to that same namespace. If the namespaces are
>>> created unaligned, there is a chance that the section vmemmap
>>> start address could also be unaligned. If the section vmemmap
>>> start address is unaligned, the altmap page allocated from the
>>> current namespace might be used by the previous namespace also.
>>> During the free operation, since the altmap is shared between two
>>> namespaces, the previous namespace may detect that the page does
>>> not belong to its altmap and incorrectly assume that the page is a
>>> normal page. It then attempts to free the normal page, which leads
>>> to a kernel crash.
>>>
>>> In this patch, we are aligning the section vmemmap start address
>>> to PAGE_SIZE. After alignment, the start address will not be
>>> part of the current namespace, and a normal page will be allocated
>>> for the vmemmap mapping of the current section. For the remaining
>>> sections, altmaps will be allocated. During the free operation,
>>> the normal page will be correctly freed.
>>>
>>> Without this patch
>>> ==================
>>> NS1 start               NS2 start
>>>   _________________________________________________________
>>> |         NS1               |            NS2              |
>>>   ---------------------------------------------------------
>>> | Altmap| Altmap | .....|Altmap| Altmap | ...........
>>> |  NS1  |  NS1   |      | NS2  |  NS2   |
>>>
>>                              ^^^ this should be allocated in ram?
>>
>
> Yes, it should be allocated from RAM. However, in the current
> implementation, an altmap page gets allocated. This is because the
> NS2 vmemmap section's start address is unaligned. There is an
> altmap_cross_boundary() check. Here, from the vmemmap section
> start, we identify the namespace start and check if the namespace start
> is within the boundary. Since it is within the boundary, it returns false,
> causing an altmap page to be allocated. During the PTE update, the
> vmemmap start address is aligned down to PAGE_SIZE, and the PTE is
> updated. As a result, the altmap page is shared between the current
> and previous namespaces.
>
> If we had aligned the vmemmap start address, the
> altmap_cross_boundary() function would return true because the
> vmemmap section's start address belongs to the previous
> namespace. Therefore normal page gets allocated. During the
> PTE set operation, since the address is already aligned, the
> PTE will updated.
>

So the nvdimm driver should ensure that alignment right? I assume other things
will also require that to be properly aligned.?

-aneesh

