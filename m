Return-Path: <linuxppc-dev+bounces-14477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9CC83C85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 08:49:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFvvx5bQZz2yw7;
	Tue, 25 Nov 2025 18:49:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764056941;
	cv=none; b=D0QR8s2dE1W6BVtKcZHClweDjp9M9L0hEp1FjRP+8skttm79WKzL9nK0cQJMyYdJhk/JkmkeKfYozWJn2zLfusYlSIp2kNMMd2t6TEpV9eOodn3RGwu8qALGNpg3EGqQqf4D3h4ksupYXYfoFp872z/TvA4USCmLzyZte+SU0rBlyDxlc8JZ/6DRanGMDzBaTbMMoMp70chRNLlgCWTr6XCvp3aXByJ4g2AMTXbb1MrKAuiV8Z9O8H/3AIvI+/JnMiDty9h8z1fPwB5Yiay0NdZmd++MiMjM+56KZszJU7ZfQ13aEmQzKd6Xzi+dLAZ1+6hP1PHXJXPyucncCukqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764056941; c=relaxed/relaxed;
	bh=/jTSbPnUaQvnRPr39f/fYnzHU2qvfniFMScHxC0ltAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHUBJ8YhwzZyJ4BdMh3AIjgz9EtZ0Uunc8kwDgHOkzivUc7L9Yfqs4I36hvBv+H27riC1HRjtZ6Y4Id2LJRsqfI6uWbKYMs1ZIGV6j5jC/hW42QkI8pdhKomJg2O5nW4AivziJvW+22AYIlTJH+p1BE7TiQLUIv+IfvMqKZe1Q9p+zEomv2LqEmGTpUlm9Nw2LBRlTkB7T3z7qa8hh9qWemJ8MAha2M8yHJDzPMNTVkA7R7WUNJ6rsSj3JOOxXE36il43eHHaT/LbqxZ+jgetnudpO3pCJskQhUAbsg9+GIahZFM5Xz/CUiudSvMuhINEVDqHD1zVxt7ktz85zxAig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G6JmKqWL; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G6JmKqWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFvvw6snKz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 18:49:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF6C160189;
	Tue, 25 Nov 2025 07:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B5DC116D0;
	Tue, 25 Nov 2025 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764056937;
	bh=Yp2OICC+dT3r7A+LJziJy0dfokkbEcEq7u2c/S/UchU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G6JmKqWLZhFBI9aXUmpm3W4crt2Mkk+UAPHJjw2X20I7G6hICzp3MqkUpkxvHS9fi
	 WO2v2p4c5QnoeiYUHvzzbU09dkQr790hRjZf3/DYHgaaSHuwMLMmcf3cjraZkArKgf
	 46/2ZNFX4wvXeCTqEwAJ5yf0JqxMe6iEW7GDEjP+6LnDkOEjQ1Qk+ayi/e9x5LnPBy
	 uODOmI9jh0yabgHyffiC4TECqPl+lGoPe0mQt+6f7d/h80ncMPoONHDI8A57B9AYqK
	 sg566nRAq/FeMu+Hw4Yvo+YU0F80FzEIL0CU7TvwNqVfM2dOmFJ6HdlyUToEukL9Ko
	 wVqqbrQE1Ua8w==
Message-ID: <0f53d5b8-dbb7-4265-940a-2f2be3d0154d@kernel.org>
Date: Tue, 25 Nov 2025 08:48:48 +0100
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
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
 maddy@linux.ibm.com, srikar@linux.ibm.com, pbonzini@redhat.com,
 seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
 iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
 dietmar.eggemann@arm.com
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <2025112454-phonics-crept-5b98@gregkh>
 <4b83b443-baa8-4218-8412-ddfb0dda8ac3@linux.ibm.com>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <4b83b443-baa8-4218-8412-ddfb0dda8ac3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shrikanth,

Le 25/11/2025 à 03:39, Shrikanth Hegde a écrit :
> Hi Greg.
> 
> On 11/24/25 10:35 PM, Greg KH wrote:
>> On Wed, Nov 19, 2025 at 06:14:32PM +0530, Shrikanth Hegde wrote:
>>> Detailed problem statement and some of the implementation choices were
>>> discussed earlier[1].
>>>
>>> [1]: https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250910174210.1969750-1- 
>>> sshegde%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cc7e5a5830fcb4c796d4808de2bcbe09d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638996351808032890%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=cV8RTPdV3So1GwQ9uVYgUuGxSfxutSezpaNBq6RYn%2FI%3D&reserved=0
>>>
>>> This is likely the version which would be used for LPC2025 discussion on
>>> this topic. Feel free to provide your suggestion and hoping for a 
>>> solution
>>> that works for different architectures and it's use cases.
>>>
>>> All the existing alternatives such as cpu hotplug, creating isolated
>>> partitions etc break the user affinity. Since number of CPUs to use 
>>> change
>>> depending on the steal time, it is not driven by User. Hence it would be
>>> wrong to break the affinity. This series allows if the task is pinned
>>> only paravirt CPUs, it will continue running there.
>>>
>>> Changes compared v3[1]:
>>
>> There is no "v" for this series :(
>>
> 
> I thought about adding v1.
> 
> I made it as PATCH from RFC PATCH since functionally it should
> be complete now with arch bits. Since it is v1, I remember usually 
> people send out without adding v1. after v1 had tags such as v2.
> 
> I will keep v2 for the next series.
> 

But you are listing changes compared to v3, how can it be a v1 ? 
Shouldn't it be a v4 ? Or in reality a v5 as you already sent a v4 here [1].

[1] 
https://lore.kernel.org/all/20251119062100.1112520-1-sshegde@linux.ibm.com/

Christophe

