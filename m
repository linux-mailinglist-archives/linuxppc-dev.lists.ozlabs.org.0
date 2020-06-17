Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F01FC639
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 08:31:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mwFT0FVFzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 16:31:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mwCQ3xxHzDqBM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 16:29:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KZO9Lign; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49mwCP6NfVz9sRW;
 Wed, 17 Jun 2020 16:29:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592375377;
 bh=i7JrZNcNJhnRJi0P47ovEX3dKlKdn1Jwp9ZNCMJImGE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KZO9LignhJKQwaVLtKmUMN01US0l82q2LNRMI1dw32Zaftum3/4O7WqUaBJDVerEy
 t+q0pvEj9G3yZlMlOp+ufyKc7S9opb9XsY5zBc7iIonP2JFqaGIOtfLmFv0ziiaVU0
 aFg8I9of+cB3V10BcS4bUi2YKI/TQoRCksR2vVtqnXU1YnvBJimTqDBvsJtikfAoIV
 nbZhlU4zLnKXib9EX0jMhkSizbnpoB3F74tjlNOy8PFTPPImUVf2lk5tZut/6Uwd+7
 RBQ4pHIDBsFlT1pbNr1wTIDc/QvDlqbu0X8H9BgkqyDv2EyauDwkW/E05Jk7L6yIK1
 WWteiQf8NmXPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: powerpc/pci: [PATCH 1/1 V3] PCIE PHB reset
In-Reply-To: <CAOSf1CHT9A55+ZAKquikHy9Siy_k5E0ucB-qY2G7hjfVSmf7pg@mail.gmail.com>
References: <1590499319-6472-1-git-send-email-wenxiong@linux.vnet.ibm.com>
 <87r1ufdy1x.fsf@mpe.ellerman.id.au>
 <CAOSf1CHT9A55+ZAKquikHy9Siy_k5E0ucB-qY2G7hjfVSmf7pg@mail.gmail.com>
Date: Wed, 17 Jun 2020 16:30:02 +1000
Message-ID: <87ftaudx1x.fsf@mpe.ellerman.id.au>
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 Wen Xiong <wenxiong@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:
> On Tue, Jun 16, 2020 at 9:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> wenxiong@linux.vnet.ibm.com writes:
>> > From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
>> >
>> > Several device drivers hit EEH(Extended Error handling) when triggering
>> > kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
>> > in pci general code when triggering kdump.
>>
>> Actually it's in pseries specific PCI code, and the reset is done in the
>> 2nd kernel as it boots, not when triggering the kdump.
>>
>> You're doing it as a:
>>
>>   machine_postcore_initcall(pseries, pseries_phb_reset);
>>
>> But we do the EEH initialisation in:
>>
>>   core_initcall_sync(eeh_init);
>>
>> Which happens first.
>>
>> So it seems to me that this should be called from pseries_eeh_init().
>
> This happens to use some of the same RTAS calls as EEH, but it's
> entirely orthogonal to it.

I don't agree. I mean it's literally calling EEH_RESET_FUNDAMENTAL etc.
Those RTAS calls are all documented in the EEH section of PAPR.

I guess you're saying it's orthogonal to the kernel handling an EEH and
doing the recovery process etc, which I can kind of see.

> Wedging the two together doesn't make any real sense IMO since this
> should be usable even with !CONFIG_EEH.

You can't turn CONFIG_EEH off for pseries or powernv.

And if you could this patch wouldn't compile because it uses EEH
constants that are behind #ifdef CONFIG_EEH.

If you could turn CONFIG_EEH off it would presumably be because you were
on a platform that didn't support EEH, in which case you wouldn't need
this code.

So IMO this is EEH code, and should be with the other EEH code and
should be behind CONFIG_EEH.

>> That would isolate the code in the right place, and allow you to use the
>> existing ibm_get_config_addr_info.
>>
>> You probably can't use pseries_eeh_get_pe_addr(), because you won't have
>> a "pe" structure yet.
>>
>> Instead you should add a helper that does the core of that logic but
>> accepts config_addr/buid as parameters, and then have your code and
>> pseries_eeh_get_pe_addr() call that.
>
> I have a patch in my next pile of eeh reworks which kills off
> pseries_eeh_get_pe_addr() entirely. It's used to implement
> eeh_ops->get_pe_addr for pseries, but the only caller of
> ->get_pe_addr() is in pseries EEH code and the powernv version is a
> stub so I was going to drop it from EEH ops and fold it into the
> caller. We could do that in this patch, but it's just going to create
> a merge conflict for you to deal with. Up to you.

That sounds like a good cleanup. I'm not concerned about conflicts
within arch/powerpc, I can fix them up.

>> > +             list_for_each_entry(phb, &hose_list, list_node) {
>> > +                     config_addr = pseries_get_pdn_addr(phb);
>> > +                     if (config_addr == -1)
>> > +                             continue;
>> > +
>> > +                     ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
>> > +                             config_addr, BUID_HI(phb->buid),
>> > +                             BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
>> > +
>> > +                     /* If fundamental-reset not supported, try hot-reset */
>> > +                     if (ret == -8)
>>
>> Where does -8 come from?
>
> There's a comment right there.

Yeah I guess. I was expecting it would map to some RTAS_ERROR_FOO value,
but it's just literally -8 in PAPR.

As long as there's only a single usage then I don't mind it.

> It could be better explained I suppose, but you need to read
> PAPR/LoPAPR to make sense of anything RTAS so what's it really buying
> you?

Making the code easier for new folks to understand?

cheers
