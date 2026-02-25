Return-Path: <linuxppc-dev+bounces-17193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHw/ECb/nmlAYgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 14:54:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AECDA198684
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 14:54:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLbgP05HRz3f4j;
	Thu, 26 Feb 2026 00:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772027680;
	cv=none; b=PMAfKt87CuL3SQ89hvdDrRu0QA6q33XWyDqDiz8FtYRUWLxyQWi75efqXFfAxYN6YAjPHf6lVUzq7MuqF4dknEnlZxZHOf5w8HqwdlkDjpRyXyMi78c3YVVbAIFq7L4MRitFzzoFhGnxAlojs/cauJ7LdeRctfquV02K8ER7GB5zt9n1Kq58/tAEZDhXMefaWFTmoYi4IAqrE10TnISeGGKh9C0WwV31aJgnxdEn6olsK2rx4lIhORXfzIDVNXDqFTm7dCBGN7oS+hFfWlcH/Xja4XrfVVelny9w2iKH/i8moZnmV7r6qmQBX1KxBSa0yIerayJSZ024L5z/TyCKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772027680; c=relaxed/relaxed;
	bh=GAz8rc5CAoITgJqfCmv4D1o4HGyk3TfsBQ5Rf/9y7JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrTVxxNjUhWIrmOUIcanzvywnF1NwFtZvuX/+T/+ht2n17evPmNABXQgMWJ1O87uhiOutzXgukC7yvL/xvSrSdjp5B5Kc9zGiKN1tw+BHJhmkWTAt4JHoSICPFu9UVYlVjwkuTS5Q80EBRNZ7hWkSwVwNyrC6BWzsb6DJEHQ0+JlsJwNz/kWx25jPLFMe6iEuHApJifpz/R5f0m6KDrAb9vwaXf+A3JzKqMzPusuqKRMiCQYK4ijQDDLeVIuW0oyaop76X3O5ZoSU352VLRoYgG2TGRYDTEHY0nhp6OCuKmCK+6cJ+1DnFxZvJEB+r74+hNvc0PRO0RN3XTTf2zJCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GBhBPun4; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GBhBPun4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLbgM5cRHz3f4W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 00:54:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 852B2444F1;
	Wed, 25 Feb 2026 13:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B113AC116D0;
	Wed, 25 Feb 2026 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772027677;
	bh=/jtwKwzIi+GIwE+zzDpn9t7/e5X6Lp+Zt9M6vEbI2Kk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GBhBPun46o86Vq+lIWj+TXZ6Z7exP9immnhgEq8nam3CPpetbZ9LLmqdbNLOTiHHX
	 xcTNQgka0f2yT8SAKNGHAqQ8Miu5dyzqEWZrT3nOEMSZUvWBEOMMyk8+v3qSv/35G0
	 csQ0/WSZ4jtZGlizEUg3LuFLXKiWn3sb6iyBpOFmE97xt0S2cW2GqzJzEfo7F/+Oyj
	 53nl6cGDvCC8ql8JwTF0eCJ052DOn2wfdx9J9nMn2TQ1gI4FmbscLrH/AcEubZ1gx9
	 CUvrl9bwWxSQcmbJu/1shZn2tzbIAX/8EIGyvgECMiyWMKrMh6+dN+OYEuKwF8dgYJ
	 JwkYP/7Bbjtqw==
Message-ID: <6c007cf1-46d5-4853-ae2e-90ee5257c6c9@kernel.org>
Date: Wed, 25 Feb 2026 14:54:28 +0100
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
Subject: Re: [PATCH 04/15] powerpc/time: Prepare to stop elapsing in
 dynticks-idle
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Juri Lelli <juri.lelli@redhat.com>, Kieran Bingham <kbingham@kernel.org>,
 Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Paul E . McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Xin Zhao <jackzxcui1989@163.com>,
 linux-pm@vger.kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260206142245.58987-1-frederic@kernel.org>
 <20260206142245.58987-5-frederic@kernel.org>
 <9413517d-963b-4e6d-b11b-b440acd7cb5a@linux.ibm.com>
 <9ab1e7d7-57ee-49f9-963c-3a1b96dda684@kernel.org>
 <120884b0-0b09-43a9-b0f6-7dc2affe1ac0@linux.ibm.com>
 <55720b5b-f643-4e67-8841-d81a9e712faf@kernel.org>
 <a20beb34-0e4b-4063-b6b0-6c5886bbb971@linux.ibm.com>
 <a0c6e65c-3331-402a-94eb-14ba7f4b7ba7@kernel.org>
 <729a7e7f-a50e-480c-87ce-c45221fbb326@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <729a7e7f-a50e-480c-87ce-c45221fbb326@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17193-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AECDA198684
X-Rspamd-Action: no action

Hi Hegde,

Le 25/02/2026 à 14:33, Shrikanth Hegde a écrit :
> 
> 
> On 2/25/26 4:44 PM, Christophe Leroy (CS GROUP) wrote:
>> Hi Hegde,
>>
>> Le 25/02/2026 à 11:34, Shrikanth Hegde a écrit :
>>> Hi Christophe.
>>>
>>> On 2/25/26 3:15 PM, Christophe Leroy (CS GROUP) wrote:
>>>>
>>>> Hope it is more explicit now.
>>>>
>>>
>>> Got it. The main concern was around with additional computation that 
>>> sched_clock,
>>> not any additional paths per se.
>>>
>>> yes, that would be possible,
>>>
>>>
>>> How about we do below? This adds only one subtraction.
>>> This achieves the same outcome.
>>
>> It adds a bit more than just a substration. It adds a call to an 
>> extern fonction.
> 
> I think we should make it always inline and move it to time.h
> 
>>
>> 00000164 <my_account_cpu_user_entry>:
>>   164:    94 21 ff f0     stwu    r1,-16(r1)
>>   168:    7c 08 02 a6     mflr    r0
>>   16c:    90 01 00 14     stw     r0,20(r1)
>>   170:    93 e1 00 0c     stw     r31,12(r1)
>>   174:    7f ec 42 e6     mftb    r31
>>   178:    48 00 00 01     bl      178 <my_account_cpu_user_entry+0x14>
>>              178: R_PPC_REL24    get_boot_tb
>>   17c:    81 02 00 08     lwz     r8,8(r2)
>>   180:    81 22 00 28     lwz     r9,40(r2)
>>   184:    7c 84 f8 50     subf    r4,r4,r31
>>   188:    7d 29 40 50     subf    r9,r9,r8
>>   18c:    7d 29 22 14     add     r9,r9,r4
>>   190:    90 82 00 24     stw     r4,36(r2)
>>   194:    91 22 00 08     stw     r9,8(r2)
>>   198:    80 01 00 14     lwz     r0,20(r1)
>>   19c:    83 e1 00 0c     lwz     r31,12(r1)
>>   1a0:    7c 08 03 a6     mtlr    r0
>>   1a4:    38 21 00 10     addi    r1,r1,16
>>   1a8:    4e 80 00 20     blr
>>
>> 000001ac <my_account_cpu_user_exit>:
>>   1ac:    94 21 ff f0     stwu    r1,-16(r1)
>>   1b0:    7c 08 02 a6     mflr    r0
>>   1b4:    90 01 00 14     stw     r0,20(r1)
>>   1b8:    93 e1 00 0c     stw     r31,12(r1)
>>   1bc:    7f ec 42 e6     mftb    r31
>>   1c0:    48 00 00 01     bl      1c0 <my_account_cpu_user_exit+0x14>
>>              1c0: R_PPC_REL24    get_boot_tb
>>   1c4:    81 02 00 0c     lwz     r8,12(r2)
>>   1c8:    81 22 00 24     lwz     r9,36(r2)
>>   1cc:    7c 84 f8 50     subf    r4,r4,r31
>>   1d0:    7d 29 40 50     subf    r9,r9,r8
>>   1d4:    7d 29 22 14     add     r9,r9,r4
>>   1d8:    90 82 00 28     stw     r4,40(r2)
>>   1dc:    91 22 00 0c     stw     r9,12(r2)
>>   1e0:    80 01 00 14     lwz     r0,20(r1)
>>   1e4:    83 e1 00 0c     lwz     r31,12(r1)
>>   1e8:    7c 08 03 a6     mtlr    r0
>>   1ec:    38 21 00 10     addi    r1,r1,16
>>   1f0:    4e 80 00 20     blr
>>
>>
>> I really still can't see the point of this substraction.
>>
>> At one place we do
>>
>>      tb1 = mftb1;
>>
>>      acct->utime += (tb1 - acct->starttime_user);
>>      acct->starttime = tb1;
>>
>> At the other place we do
>>
>>      tb2 = mftb2;
>>
>>      acct->stime += (tb2 - acct->starttime);
>>      acct->starttime_user = tb2;
>>
>> So at the end we have
>>
>>      acct->utime += mftb1 - mftb2;
>>      acct->stime += mftb2 - mftb1;
>>
>> You want to change to
>>      tb1 = mftb1 - boot_tb;
>>      tb2 = mftb2 - boot_tb;
>>
>> At the end we would get
>>
>>      acct->utime += mftb1 - boot_tb - mftb2 + boot_tb = mftb1 - mftb2;
>>      acct->stime += mftb2 - boot_tb - mftb1 + boot_tb = mftb2 - mftb1;
>>
>> So what's the point in doing such a useless substract that disappears 
>> at the end ? What am I missing ?
>>
> 
> I had similar thought, but I saw this data below when i do exec on the 
> system.
> 
> This was the stats seen on PowerNV system with 144 CPUs.
> Nothing is running on the system after boot. So it is mostly idle.
> 
> 
> ======== With the series applied ===
> 
> cat /proc/stat | head
> cpu  1494 0 135607576 9628633227 16876 142 63 0 0 0
> cpu0 0 0 8 67807311 0 2 40 0 0 0
> cpu1 0 0 6 67807349 0 0 0 0 0 0
> 
> cat /proc/uptime
> 48.32 96286332.82   << Note this value is too huge. Also system value is 
> also huge.
> 
> ========= without the series(tip/master) ===============
> cat /proc/stat | head
> cpu  2003 0 67866261 859414 15923 249 66 0 0 0
> cpu0 5 0 23 5595 461 2 38 0 0 0
> cpu1 0 0 9 6092 21 0 3 0 0 0
> 
> cat /proc/uptime
> 61.29 8594.82    << This is right. 144*61 = 8784.
> 
> But note, the system time reported. i.e 67866261. It is too huge again. 
> And very close to actual mftb value
> rather than the diff. i.e we have paths were tb1 is not done. tb2 is 
> effectively mftb - 0
> 
> 
> ========= with proposed fix of mftb - boot_tb ===============
> cat /proc/stat | head
> cpu  5187 0 10996 2025690 16566 765 184 0 0 0
> cpu0 9 0 28 14096 65 6 108 0 0 0
> cpu1 4 0 15 14277 0 0 2 0 0 0
> 
> cat /proc/uptime
> 142.97 20257.42     << Looks correct, since 142*144 is close to 20448
> 
> =============================================================
> 
> Now lets go to CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
> 
> cat /proc/stat | head
> cpu  1804 0 3003 791760 15695 0 0 0 0 0
> cpu0 22 0 46 5535 0 0 0 0 0 0
> cpu1 0 0 7 5637 0 0 0 0 0 0
> 
> cat /proc/uptime
> 56.49 7918.05      << Looks correct. close 56*144
> 
> 
> ================================================
> 

I think I'm starting to understand now.

I think the problem is that acct->starttime has an invalid value the 
very first time it is used.

We are probably lacking an initial value in paca->accounting.starttime.
This should likely be initialised from mftb in head_64.S in 
start_here_common for main CPU and __secondary_start for other CPUs or 
maybe at higher level in C in setup_arch() and start_secondary()

Christophe

