Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCACF2D3A2A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 06:10:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrQ9p5g4vzDql8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 16:10:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrQ8F6qNdzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 16:09:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EQOXvbxS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrQ8F2rx6z9sWC;
 Wed,  9 Dec 2020 16:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607490573;
 bh=sz/kscNF60uY4qDct280qFqJweL4dgY+7oB2oLObuSc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EQOXvbxSU6r8QaXmMwl8Q4sPNAB9GMPEEh9GeR4kmDi6XJ1TkpWzD51GTrdMsJXdO
 b65UapEg8YZwwgppY6CJTV/21w+U8fJzX7ZoYxPYSMYKzslCbZnmWuZWosQPVi3i1j
 gOqtmPFQjnBxdjLW8gr0C6w9EIj27nkZ59WRpeSXmkqqNdROrkobMsHKowZtIoI9db
 9Jr2VTUUMAY+Ef29MNYNEPQ+8E0pB0nnaNw20scd42Nt7NV4Cnznf48zaiNckZVQYP
 GXS4iKWMIYUh6eyoZMaZsxTyvZ1Fney2d9HkagfO24+FfvTgIQoTODPD4FiPTmfd02
 ICnlbgP8Rqkng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mahesh Jagannath Salgaonkar <mahesh@linux.ibm.com>,
 Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mce: Remove per cpu variables from MCE handlers
In-Reply-To: <83ca2e1c-88f5-fc57-11e2-056f3ce835d7@linux.ibm.com>
References: <20201204102310.76213-1-ganeshgr@linux.ibm.com>
 <871rg0twpw.fsf@mpe.ellerman.id.au>
 <a514db98-6090-467a-74ae-9c7b4337d0c1@linux.ibm.com>
 <83ca2e1c-88f5-fc57-11e2-056f3ce835d7@linux.ibm.com>
Date: Wed, 09 Dec 2020 16:09:32 +1100
Message-ID: <87pn3jsgz7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh Jagannath Salgaonkar <mahesh@linux.ibm.com> writes:
> On 12/8/20 4:16 PM, Ganesh wrote:
>>=20
>> On 12/8/20 4:01 PM, Michael Ellerman wrote:
>>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>>> diff --git a/arch/powerpc/include/asm/paca.h
>>>> b/arch/powerpc/include/asm/paca.h
>>>> index 9454d29ff4b4..4769954efa7d 100644
>>>> --- a/arch/powerpc/include/asm/paca.h
>>>> +++ b/arch/powerpc/include/asm/paca.h
>>>> @@ -273,6 +274,17 @@ struct paca_struct {
>>>> =C2=A0 #ifdef CONFIG_MMIOWB
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmiowb_state mmiowb_state;
>>>> =C2=A0 #endif
>>>> +#ifdef CONFIG_PPC_BOOK3S_64
>>>> +=C2=A0=C2=A0=C2=A0 int mce_nest_count;
>>>> +=C2=A0=C2=A0=C2=A0 struct machine_check_event mce_event[MAX_MC_EVT];
>>>> +=C2=A0=C2=A0=C2=A0 /* Queue for delayed MCE events. */
>>>> +=C2=A0=C2=A0=C2=A0 int mce_queue_count;
>>>> +=C2=A0=C2=A0=C2=A0 struct machine_check_event mce_event_queue[MAX_MC_=
EVT];
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* Queue for delayed MCE UE events. */
>>>> +=C2=A0=C2=A0=C2=A0 int mce_ue_count;
>>>> +=C2=A0=C2=A0=C2=A0 struct machine_check_event=C2=A0 mce_ue_event_queu=
e[MAX_MC_EVT];
>>>> +#endif /* CONFIG_PPC_BOOK3S_64 */
>>>> =C2=A0 } ____cacheline_aligned;
>>> How much does this expand the paca by?
>>=20
>> Size of paca is 4480 bytes, these add up another 2160 bytes, so expands
>> it by 48%.
>
> Should we dynamically allocate the array sizes early as similar to that
> of paca->mce_faulty_slbs so that we don't bump up paca size ?

Yeah I think that would be preferable.

That way those allocations can be normal node-local allocations on bare
metal, or when using radix. (Or even on KVM).

In fact what we probably want is a separate struct for all the MCE
related data, eg something like:

struct mce_stuff {
  int nest_count;
  /* Queue for delayed MCE events. */
  int queue_count;
  /* Queue for delayed MCE UE events. */
  int mce_ue_count;

  struct machine_check_event events[MAX_MC_EVT];
  struct machine_check_event event_queue[MAX_MC_EVT];
  struct machine_check_event=C2=A0 ue_event_queue[MAX_MC_EVT];
};

And then you allocate one of those per CPU, inside the RMO for pseries
with hash, and node-local otherwise.

cheers
