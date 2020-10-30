Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E07C22A0618
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 14:01:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN2Wh6chXzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 00:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN2Rj6m8rzDqpy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 23:58:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CN2RS2Hrdz9vCxr;
 Fri, 30 Oct 2020 13:58:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g-TNzz5dYdfZ; Fri, 30 Oct 2020 13:58:12 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CN2RS1156z9vCxm;
 Fri, 30 Oct 2020 13:58:12 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 7996D24BA; Fri, 30 Oct 2020 14:00:47 +0100 (CET)
Received: from 37-171-46-117.coucou-networks.fr
 (37-171-46-117.coucou-networks.fr [37.171.46.117]) by messagerie.c-s.fr
 (Horde Framework) with HTTP; Fri, 30 Oct 2020 14:00:47 +0100
Date: Fri, 30 Oct 2020 14:00:47 +0100
Message-ID: <20201030140047.Horde.TJJqKGzG9vSGbMRNIj-MPg7@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] powerpc/32s: Setup the early hash table at all time.
References: <b8f8101c368b8a6451844a58d7bd7d83c14cf2aa.1601566529.git.christophe.leroy@csgroup.eu>
 <87wnz8vizm.fsf@igel.home> <87y2jouw8k.fsf@mpe.ellerman.id.au>
 <87v9esaxlv.fsf@igel.home>
In-Reply-To: <87v9esaxlv.fsf@igel.home>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> a =C3=A9crit=C2=A0:

> On Okt 30 2020, Michael Ellerman wrote:
>
>> Andreas Schwab <schwab@linux-m68k.org> writes:
>>> On Okt 01 2020, Christophe Leroy wrote:
>>>
>>>> At the time being, an early hash table is set up when
>>>> CONFIG_KASAN is selected.
>>>>
>>>> There is nothing wrong with setting such an early hash table
>>>> all the time, even if it is not used. This is a statically
>>>> allocated 256 kB table which lies in the init data section.
>>>>
>>>> This makes the code simpler and may in the future allow to
>>>> setup early IO mappings with fixmap instead of hard coding BATs.
>>>>
>>>> Put create_hpte() and flush_hash_pages() in the .ref.text section
>>>> in order to avoid warning for the reference to early_hash[]. This
>>>> reference is removed by MMU_init_hw_patch() before init memory is
>>>> freed.
>>>
>>> This breaks booting on the iBook G4.
>>
>> Do you get an oops or anything?
>
> Nope, nothing at all.
>

Under qemu it was working.

Can you share your .config, or are you using one of the defconfig ?

Christophe

