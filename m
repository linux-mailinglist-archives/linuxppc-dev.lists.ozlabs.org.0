Return-Path: <linuxppc-dev+bounces-14823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6ECC5620
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 23:41:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWBkC6kzqz2y8c;
	Wed, 17 Dec 2025 09:41:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765924899;
	cv=none; b=mSCDiyNWiSER7QMxGyqKNgjci2JCq9WQXsmnnj4XFWJBPXLMUjA8TFjIQJNT2rsi6KfWeCBa/oDZOGPqHuvlZM1Xh+kcKRp0VVPkNe6fNwzenN7/JcQfAJ5hHnSHyiREW/Kx5kUSfxCiUCY0jZHAaPAyOCHhhmIO5WPf5Ix46G7MKIBEX63yQehiaOWc62r/s2TXup5sQzSja67vNBMK6ccaebzfKGhkT4A85NS1aD1BXFilRNopq9vmRRVuhgqU6+WmYVBcigDDMEfGK8TCjoLlqLGWNbk12yEEWttQybFPtM0PpI+kwgYpiiyHBkNHnNZLJ54ZiGQXNc+3jfYASA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765924899; c=relaxed/relaxed;
	bh=1vxN9hckTTpZj/ULtF8jxaUp9o4kj81s2ZCGWbJ/mt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0XQ/J7U6ROBTjTkvoI1VPVJLSErMBxR9C/odPxz14FrZTf8VOT8DOVSXRqcijGGH4TM4tSylzvi4aYNgMEdJm2c1N3tlVozh+ddQomrt0ucCOoTnayDa+6CCo5vDv9fdt4X8BKH3i5T4XHxZ5/mPvLI8pgGArMqShS+E37OsTHihzhl9GnQ449uYk7kQwQDrTMcQeqLR7VByBi1FurUbTcklsPOLdHuXSh19CnMer2Os89+S1TLUG050HPQMQJLvdLJzQOzvQqGNsfk11kDB/p3XR1gC6fzWr+9a+UNrkrSWS4Ec0bAoDtmuEavtSFsJC2Y9a+sNcWIqwz4PD3FcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZIdESS+p; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZIdESS+p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWBkB1JZvz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 09:41:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0496860194;
	Tue, 16 Dec 2025 22:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C998CC4CEF1;
	Tue, 16 Dec 2025 22:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765924864;
	bh=96pavKuE2aINzdEYpQ/slR7/qIuE9K5cfsZo/RAh5V0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZIdESS+pCtNV7hdsHai4Ph/cEZY1dWHyNd2DPFjYxOplsv2u6oZ56DHaqH3H6xbYN
	 si9jEhV1kv5aySLaKtC3J6Bb/VhE/kHXyks6uKek6M2zyi+xIqlxbwhWE16rHXT++l
	 yOwBHW1uDG7jz2wKwni9G0B1li78zB5Vw+L0hj9sMI4muJQuMAgAqkMB6sIaQaTOB7
	 Oibv8ueBSZZ7eCrHaDRdKe7Wdw6Ra2vJ39mmyy9oGbVMIX8K+R5utrDq53NkGjLrBZ
	 P88+33uP/0FsyxJrtZeWxBNcpyiooj/QoecMKK9K6AeGlGBc2lIyH/2K88BQCdWD4P
	 BJRUHQZxw0wzw==
Message-ID: <49b2a51b-a324-4a8b-b6e8-434fcc411b19@kernel.org>
Date: Tue, 16 Dec 2025 23:40:51 +0100
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
Subject: Re: [PATCH v2 6/8] powerpc: Prepare for IRQ entry exit
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org,
 mchauras@linux.ibm.com, thuth@redhat.com, sshegde@linux.ibm.com,
 charlie@rivosinc.com, macro@orcam.me.uk, akpm@linux-foundation.org,
 ldv@strace.io, deller@gmx.de, ankur.a.arora@oracle.com,
 segher@kernel.crashing.org, tglx@linutronix.de,
 thomas.weissschuh@linutronix.de, peterz@infradead.org,
 menglong8.dong@gmail.com, bigeasy@linutronix.de, namcao@linutronix.de,
 kan.liang@linux.intel.com, mingo@kernel.org, atrajeev@linux.vnet.ibm.com,
 mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-7-mkchauras@linux.ibm.com>
 <91d280af-fb41-4c05-8b96-113717ecd64a@kernel.org>
 <vk6k6fbjpq6pajvce5idrfq2m7smygpazpqemxkiyov7ywhbt7@6sckgpjdxarq>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <vk6k6fbjpq6pajvce5idrfq2m7smygpazpqemxkiyov7ywhbt7@6sckgpjdxarq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 16/12/2025 à 16:00, Mukesh Kumar Chaurasiya a écrit :
> On Tue, Dec 16, 2025 at 10:58:16AM +0100, Christophe Leroy (CS GROUP) wrote:
>>
>>
>> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
>>> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
>>>
>>> Move interrupt entry and exit helper routines from interrupt.h into the
>>> PowerPC-specific entry-common.h header as a preparatory step for enabling
>>> the generic entry/exit framework.
>>>
>>> This consolidation places all PowerPC interrupt entry/exit handling in a
>>> single common header, aligning with the generic entry infrastructure.
>>> The helpers provide architecture-specific handling for interrupt and NMI
>>> entry/exit sequences, including:
>>>
>>>    - arch_interrupt_enter/exit_prepare()
>>>    - arch_interrupt_async_enter/exit_prepare()
>>>    - arch_interrupt_nmi_enter/exit_prepare()
>>>    - Supporting helpers such as nap_adjust_return(), check_return_regs_valid(),
>>>      debug register maintenance, and soft mask handling.
>>>
>>> The functions are copied verbatim from interrupt.h to avoid functional
>>> changes at this stage. Subsequent patches will integrate these routines
>>> into the generic entry/exit flow.
>>
>> Can we move them instead of duplicating them ?
>>
> Till we enable the Generic framework i didn't want to touch the already
> used code path. Once we enable the code all the unused code should be
> removed. This helps us in bisecting future issues caused due to this.

I can't see who it can help bisecting. What did I miss ?

If you copy the code, you don't know whether what you have copied is 
correct or not until you use it. So when you start using it you don't 
know if the problem is in the copied code or the code using it.

If instead of copying the code you move it and continue to use the moved 
code from the only implementation, they when you start using it with the 
new code you are sure it works and then if you have a problem you know 
it is not the moved code but the new code using it.

Christophe

