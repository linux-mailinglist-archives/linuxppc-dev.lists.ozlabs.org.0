Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB187FCD51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 04:14:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YHqSObXH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg4F62fDQz3c5L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:14:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YHqSObXH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg4DH2jr7z30GC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 14:14:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701227637;
	bh=WD8CN6B6PA5ETWaC+DpobWhgPX0ZYgDfpvqgwCszJGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YHqSObXHNt7WR5FVCK8/aiXq+5A4GybseEoweq9ShLioy7eAq1hR595Bh8b2jUEsv
	 KJHsuOm4T+Ie6uuY3VUWhJqn4H7qEdxyetgfUvUAOOn8zPq8D9kEQXhk9Haxbn3B0w
	 ymEwc5gl2xRBy4XszLSFZU/eRyJBj9RB49FU/4DET7sZ22Ux8coLZd39LrIJPVFKRS
	 9bKl0lKuTQpo2w5zL6T3HPpN0XWjzD2UhmTP7eFP8pniw2KOBGCV6AR0Czb6P7wpzA
	 VPogKElP394U3I4asWohY9hiNcbzuJI8YljPgjglR75zhjA6MTFKSMzSwK8KMA8kWb
	 bXdp8GZMyHbvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg4D50B0Pz4wc8;
	Wed, 29 Nov 2023 14:13:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v4 09/13] powerpc/pseries: Add papr-vpd character driver
 for VPD retrieval
In-Reply-To: <87edg91dso.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-9-b794d8cb8502@linux.ibm.com>
 <87msux2tyj.fsf@mail.lhotse>
 <87edg91dso.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Wed, 29 Nov 2023 14:13:43 +1100
Message-ID: <87h6l52qvs.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>> writes:
>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>
>>> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
>>> components using the ibm,get-vpd RTAS function.
>> ...
>>>
>>> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
>>> index 4ea5b837399a..a950545bf7cd 100644
>>> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
>>> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
>>> @@ -349,6 +349,8 @@ Code  Seq#    Include File                                           Comments
>>>                                                                       <mailto:vgo@ratio.de>
>>>  0xB1  00-1F                                                          PPPoX
>>>                                                                       <mailto:mostrows@styx.uwaterloo.ca>
>>> +0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
>>> +                                                                     <mailto:linuxppc-dev>
>>  
>> This hunk should probably go in the previous patch.
>
> The papr-sysparm driver (patch 11/13 "powerpc/pseries/papr-sysparm:
> Expose character device to user space") also adds a line to
> ioctl-number.rst. Are you saying all the additions to ioctl-number.rst
> should be contained in a single patch?

No.

I just meant that the previous patch is where we initially expose the
0xB2 value via uapi, which is the point of no return. So preferably the
documentation is updated by or before that point to reflect that the
0xB2 value is now reserved.

The change log of that patch also talks about allocating a value from
the ioctl-number table, but then doesn't update the table.

cheers
