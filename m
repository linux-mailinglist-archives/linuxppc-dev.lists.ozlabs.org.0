Return-Path: <linuxppc-dev+bounces-17584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHQTE/z5pmk7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:10:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F21F21D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQK4S4gFYz3bnv;
	Wed, 04 Mar 2026 02:10:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772550648;
	cv=none; b=Dc51k9hROqd5pCdfbdgC2488uiwJd82ZFYPvY6IXyQDjNe1FbpE5unrq4lUY23ktDk/8Hiy71x0x2bg/LdNv+gnCDYjtq2whhAPanZRblrxw/2G6vrAXlkVod3rJGlwCZ1tIYy/EJqt13tutPhwZ+Zc0ob0AVEJuz/U+J8h9wWgdipPaVTRLkhuK3gN0WtOF04yOxYNhhxfBzyNkilEYPBNhI4lhAOpZ6o2K8r40LOeX+D1sLDp1UPq+VoCIp54voySPO/wV5iNJvjbqUU27TopKbhz+PPLS52or1KanpCePuVs5CYma27Z6BNTo/DLWZmVhXuqdrR7wPofHOVTWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772550648; c=relaxed/relaxed;
	bh=f7YC1gVKQQtPY33i7tiVdYU7aREdcYNYfD3U+1DHxaw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aEH/QUNOndLTW+ZWkQyegaqgJKz+CaKfH9IQXb6V00aOmy9IKIT3fLgQRMi7xmI3a4IA/CvSnEZEXX5IR1a85llYyaL6SRkf1qU3bB19coZ7hmOKUDt8BZCa6hfcKBkKnEjzRdVZ5+Jd6VgdToud5f6kU+a/3o/W+Y7qXB6hNrV4OZ7OdP5qD1fhf7BAJKVTEKJUrpM5g/cWDtUhUGNlknB4ZrNOCk8DWdAEEo106yXem8hXgX92M9VbuDJodiklG0eaWyYWB4YRrVCSR1whHsGfYUe3lHlRcbBuGuuWJTuTAmXbThRFmJ1JY+TSRLGuM5vHqEWGol5AkJ9oCFPQDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OVxk0pn0; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OVxk0pn0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQK4R6X66z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:10:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 507AF60053;
	Tue,  3 Mar 2026 15:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5984DC19422;
	Tue,  3 Mar 2026 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772550645;
	bh=GwVzBNQ7rMY5qPaSHQR01AkQZgqxsAyO7SHGu+BbMls=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=OVxk0pn0Vfm325YBrpP3ULdswzGW18l0XAZJk5gFKIiLZDRspfiuYRVEjfw0aN1jh
	 iP3L12sSnio4+5vVRKHUqbwaXUYbdHRrHhQDzV844FBkNguChospMdEBdghKbgNygX
	 T1w/HIvjJUy6lnFfvlPRiZL0JW/eAAgpQLZ5xzxuA7RHQGbuXOxn5WTfFzbfepeUEV
	 k3Rf9GHZObEODJeQywEfmzb+u4eSWFFtBsNtn6qwfJFVZlK5rU0Eiqj/wHB7tMxayV
	 /K9m7k9/vcbfmvgS2t1jaNhwmtqM8y9Nlx5QnvP6uq7TuZiL1z53/Ji0dRRvysIJqM
	 FWXmfiOaHqeSQ==
Message-ID: <5eaa620f-17cb-4ecb-a1bd-eadc7df81574@kernel.org>
Date: Tue, 3 Mar 2026 16:10:40 +0100
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
Subject: Re: [PATCH v2 1/2] powerpc: fix KUAP warning in VMX usercopy path
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Sayali Patil <sayalip@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, riteshh@linux.ibm.com,
 hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com,
 czhong@redhat.com, venkat88@linux.ibm.com
References: <20260228135319.238985-1-sayalip@linux.ibm.com>
 <d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org>
 <c5138d29-e192-4a6f-b5d2-40d3a29d5bd4@linux.ibm.com>
 <65abe055-38b4-44ec-a7a0-7b4161677ead@kernel.org>
Content-Language: fr-FR
In-Reply-To: <65abe055-38b4-44ec-a7a0-7b4161677ead@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 582F21F21D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17584-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Hi Again,

Le 03/03/2026 à 15:57, Christophe Leroy (CS GROUP) a écrit :
> Hi,
> 
> Le 03/03/2026 à 10:19, Sayali Patil a écrit :
>>
>> On 02/03/26 16:42, Christophe Leroy (CS GROUP) wrote:
>>>
>> Hi Christophe,
>> Thanks for the review.
>> With the suggested change, we are hitting a compilation error.
>>
>> The issue is related to how KUAP enforces the access direction.
>> allow_user_access() contains:
>>
>> BUILD_BUG_ON(!__builtin_constant_p(dir));
>>
>> which requires that the access direction is a compile-time constant.
>> If we pass a runtime value (for example, an unsigned long), the
>> __builtin_constant_p() check fails and triggers the following build 
>> error.
>>
>> Error:
>> In function 'allow_user_access', inlined from '__copy_tofrom_user_vmx' 
>> at arch/powerpc/lib/vmx-helper.c:19:3:
>> BUILD_BUG_ON failed: !__builtin_constant_p(dir) 706
>>
>>
>> The previous implementation worked because allow_user_access() was 
>> invoked with enum
>> constants (READ, WRITE, READ_WRITE), which satisfied the 
>> __builtin_constant_p() requirement.
>> So in this case, the function must be called with a compile-time 
>> constant to satisfy KUAP.
>>
>> Please let me know if you would prefer a different approach.
>>
> 
> Ah, right, I missed that. The problem should only be in vmx-helper.c
> 

Thinking about it once more, I realised that powerpc does not define 
INLINE_COPY_FROM_USER nor INLINE_COPY_TO_USER.

This means that raw_copy_from_user() and raw_copy_to_user() will in 
really not be called much. Therefore __copy_tofrom_user_vmx() could 
remain in uaccess.h as static __always_inline allthough it requires 
exporting enter_vmx_usercopy() and exit_vmx_usercopy().

Christophe

