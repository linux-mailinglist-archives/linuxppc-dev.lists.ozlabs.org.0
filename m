Return-Path: <linuxppc-dev+bounces-17823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIifIBjWqmn3XQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 14:26:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E52218E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 14:26:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS6d06b4Yz30T9;
	Sat, 07 Mar 2026 00:26:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772803604;
	cv=none; b=lLtlBUjFF/ZxVcj1hDe8HOj+hkz+UMtfn5J9UhZTT1no4J4jvMxuCwBMnHJg+9p5pJxdOZRBTyAGrcKcZ/xSu4uuFV5oZ+R+awNshapl2LqjsrUb53CY7SmxtzRWZDuFxWMAqj/T06f8PTv9zZGx2+PNK3Od2WTofpEwTueKEw1VuetEtRRqqG4920w+M1TlQec6Avs7KUfLugEShSB5GSfu9l9qOAbwVjh33TrZFbiDWV7NSSQwzvI4xpaZ+AsPQQxPXVtBPzfBlU7WongjlA2Wew09bfHya9LJ8NbHjIrQo3o2tYtIhNK0/LkmhaQeU1PAvLXaLo7pYnREllBwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772803604; c=relaxed/relaxed;
	bh=df5ajusRl1mTyz4QEN1b6qe012o5RmwmEQN9zOYMiTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLDs4yr5UaGYTmCPiF91EGGx8V2sKS4FHvM91DeMcxH5bojSsEC0qPyTwDH8DKw/Y4d+E/YYVIxaam89jw6AfVl1+Xbgoasbf2GUJ+fCLk7W1O6Y1wCVeCRsxnx6QDxzb9B0Mend4bI8qb4Dsmf+RwIS612tDeWatJNG5dp8TJMLmv7LD/YGXK6e72IVzvjbfmdEr/j3wa+v+qk00qoCJUe95wliFOo1Q1v4pnVLMc8JGy2zqFOGpKTxmBvxQQrGDtbIWaHwUu/XGBdzRTqrKax4fQN9iUdb3JgmgSd2v7nEvD8rDE+QE9sibc9GQ7iY8oKovgMDw7gy4wKiVkanzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qVqpZu8S; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qVqpZu8S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS6cz6WcNz2xT4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 00:26:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3E7A60134;
	Fri,  6 Mar 2026 13:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F89C4CEF7;
	Fri,  6 Mar 2026 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772803601;
	bh=sR/kIGYNND8K9nQw+FjdFBOKIkK/ANUJzx5w8waG85s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qVqpZu8S/0TQR7CEKgDfDM8hrU1N4lLByrpecHCFJ9rd9kU2UuFJCwUl8CKVXZxsb
	 Fl/m8BIcs6TvfadSYBelOUxIOjBsO9TSySEvhI9Bw9VxhmMwHNHpBKsr/nf0NpApIE
	 Lzno5NcUDSeRl4qBWWD+UQn3vFc599K7kr7pM+HLyerwq89vH8/qIsW7EMzkXbchZp
	 wXnQcDRO0cNpto62BhoHJjxLyqNV9ovxlNkjrLgMhlD3d9ysgPfbkt2NWUo0i20Ajz
	 n1KwwMzAD0NVYw/WOdaDwVApZdC/YrZqyeFYf92rdOTiyvFay3e02NZvcq4kWQXpTb
	 wTPnLmsZLMXlA==
Message-ID: <e404a5a0-a46b-450f-bbf3-7bd8ea494bc2@kernel.org>
Date: Fri, 6 Mar 2026 14:26:33 +0100
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
Subject: Re: [PATCH v2 0/5] vDSO: Use 32-bit CHECKFLAGS for compat vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 David Laight <david.laight.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Sun Jian <sun.jian.kdev@gmail.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
 <96cdd223-5139-4535-b82d-831dac472cc3@kernel.org>
 <20260306115350-ef265661-6d6b-4043-9bd0-8e6b437d0d67@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260306115350-ef265661-6d6b-4043-9bd0-8e6b437d0d67@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A73E52218E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17823-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-s390@vger.kernel.org,m:david.laight.linux@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:sun.jian.kdev@gmail.com,m:lkp@intel.com,m:dan.carpenter@linaro.org,m:davidlaightlinux@gmail.com,m:sunjiankdev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[davemloft.net,gaisler.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,linux.ibm.com,ellerman.id.au,gmail.com,vger.kernel.org,lists.ozlabs.org,intel.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linutronix.de:email,outlook.com:url]
X-Rspamd-Action: no action



Le 06/03/2026 à 14:08, Thomas Weißschuh a écrit :
> On Fri, Mar 06, 2026 at 11:43:24AM +0100, Christophe Leroy (CS GROUP) wrote:
>>
>>
>> Le 02/03/2026 à 08:58, Thomas Weißschuh a écrit :
>>> When building the compat vDSO the CHECKFLAGS from the 64-bit kernel
>>> are used. These are combined with the 32-bit CFLAGS. This confuses
>>> sparse, producing false-positive warnings or potentially missing
>>> real issues.
>>>
>>> Manually override the CHECKFLAGS for the compat vDSO with the correct
>>> 32-bit configuration.
>>>
>>> Not all architectures are supported, as many do not use sparse for their
>>> (compat) vDSO. These can be enabled later.
>>>
>>> Also add some checks to bitsperlong.h to detect such issues earlier.
>>>
>>> Based on tip/timers/vdso.
>>>
>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>> ---
>>> Changes in v2:
>>> - Simplify __BITS_PER_LONG consistency checks
>>> - Fix an inconsistency in the powerpc audit code
>>
>> The powerpc audit code should be replaced by generic
>> AUDIT_ARCH_COMPAT_GENERIC, as there is no difference between them
>> apparently.
> 
> Agreed.
> 
>> A tentative was made in the past but was declined by audit maintainers
>> because we were not able to test it allthought the failure was the same
>> before and after the patch, see
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Flinuxppc%2Fissues%2Fissues%2F412&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cca6c85b42bd44c6a80c608de7b81819d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639083993321723266%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=VxTy22klpH9H8Altgcthr%2F%2ByUIL6q%2FbBkDV7FQS%2BljI%3D&reserved=0
> 
> On v7.0-rc1 the test failure of filter_exclude/test is gone.
> It also keeps working when applying your patch. Some other tests are
> broken, but it looks that is due to missing dependencies on Debian.
> So maybe it is time to resubmit your patch.
> 
> In any case, I don't really want to entangle my series with the switch
> to AUDIT_ARCH_COMPAT_GENERIC. My proposed cleanup does not make the code
> worse and if both patches are applied the conflict will be trivial to
> resolve.

I didn't mean to interfere with your patch, it is just that your patch 
reminded me that tentative.

Thanks for testing, I will consider re-posting my patch based on your test.

Christophe

