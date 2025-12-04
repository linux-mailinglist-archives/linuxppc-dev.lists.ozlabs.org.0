Return-Path: <linuxppc-dev+bounces-14630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD550CA599F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 23:16:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMplD2Djpz2xjb;
	Fri, 05 Dec 2025 09:16:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764886616;
	cv=none; b=PKTJlqMUbnG5LeOJhgV8Yd9FYtqFtTRV2lrE7e7Mf2F4asnQ6JrJdQYNFyRjkzsO6zz/k2Ky6MV1aJpd9LILIQ04zS3YGl0pUYSWZm9mq8dOM/GD3o0KhK8AT3g1gv5BWbwyj2W82Y3j9fTSj5u3PuUlzxX3owcCdK1x0ucAP/MRnvlNchG9huKwZnJxhMocJfxhNmOKazuUBTQPztferc9qeXSi7o4emwyJpi7oivJNisos+C7eoKUZyuNk8ntE4OTZUNEeqpHtFgkc3JFeLkp1xJXc/BbtfIpjDOxA8ayMnnWJ/UXwbN1aV3tWgqb//Hr2TF9eb8u79SGQ3pcP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764886616; c=relaxed/relaxed;
	bh=sOX/TOsanFFog9S4Tjf5TWZloru62X5i8eBVTOZ0QU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9leHC7k6tkQ7sp65MepB83GFfC5O3Gwaw7NRZ2BgS0SHXqVRBaZrfUJDh0gZ3AxynbmbzucxnKze3vWj0PrGo3sR3z1PSf4I8jXu5CNwQ5TpfNhrVzvkZk8qTHtJ3aKKf4HLV61EcHgZDGocG48fqriE5XMqS36k4In+p9dlTosiXdV85zS+IIbB/RecSnWvTZE5qtEC0fH1In1ngLI1L4+M/26hYOtcTmV5DJiK6+u7FH3OxsDEoMlCoJjkB+ULnDD2Cye+wvqXTbtrI3nYDrIdQ5caE0/LXZWJ1F7+J8wJ/AEJhllWL697EgYkVs9K2qUI6ETG5dHCOPubcEy1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KBuApwTD; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KBuApwTD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMplC0gQyz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 09:16:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52FBA42BA0;
	Thu,  4 Dec 2025 22:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D13FC4CEFB;
	Thu,  4 Dec 2025 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764886612;
	bh=GIuj8czK7JN8iz28EipslA6aGAVYQK/Gu9reaHBCPGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KBuApwTDXxWWdiJtQf5qi+0VX47yor8Nk3F7562GYuC/SHmqcNeAWPL9H/c8XV8DC
	 UPqGDSIG+kiOWeBOB2NOnleo4M6fuA+1IUkD0gtnUP2MHOPxx+GRl3FHzajYTp/mdj
	 YhItdid8utmBaZBdehY95VBwYuAeXWDgyAXUqsNbvJfJVdOXTx+DdbZnmHRJ/yuemW
	 5E6TamsqebK90TLJQSk7/QyvhdNy8bmKE0UJOaQI1ovMRqWIv9iqKocBetKjbVcGlF
	 Y95h+kTKIqv9R3MRTVA4DXw+fZbKZYhZ20Diq0x07sT7jnzqNDzgkxxaVPxW3UeckK
	 /XNqUzLH3VJjw==
Message-ID: <51d8549e-b084-498e-84c0-76fd3de116cb@kernel.org>
Date: Thu, 4 Dec 2025 23:16:45 +0100
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
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
To: Shuah Khan <skhan@linuxfoundation.org>, akpm@linux-foundation.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, masahiroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251204023358.54107-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/4/25 03:33, Shuah Khan wrote:
> This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
> 
> Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
> systems. git fetch-pack fails when cloning large repos and make hangs
> or errors out of Makefile.build with Error: 139. 

Looking at the last part, "Error 139" was confirmed to be fixed in 6.18, 
right? At least reading [1] there I find

"it was issue of 6.18.0-rc6 kernel itself. After switching to default 
Arch Linux kernel build went without problem and I'm now on 6.18 stable 
kernel."

Did you mange to report the make issue you reported here [2] on 6.18 as 
well, or only pre 6.18-rc7?


[1] https://gitlab.freedesktop.org/drm/amd/-/issues/4724
[2] 
https://lore.kernel.org/all/5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org/T/#u

-- 
Cheers

David

