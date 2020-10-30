Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E12A00E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:11:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMxQC46RnzDqvv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 20:11:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMxNB50yGzDqsp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 20:09:55 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CMxMx5vhpz1qs0Y;
 Fri, 30 Oct 2020 10:09:49 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CMxMx4dgTz1qsWc;
 Fri, 30 Oct 2020 10:09:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id wAF-Y83BoLiQ; Fri, 30 Oct 2020 10:09:48 +0100 (CET)
X-Auth-Info: 4AtbbN48/aZMiOAZFS4xlKpOKabhtpCSh7fP3AYSsvWeDjdfAfWjfqVMzEwh5No5
Received: from igel.home (ppp-46-244-190-51.dynamic.mnet-online.de
 [46.244.190.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 30 Oct 2020 10:09:48 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 2DAC62C089E; Fri, 30 Oct 2020 10:09:48 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32s: Setup the early hash table at all time.
References: <b8f8101c368b8a6451844a58d7bd7d83c14cf2aa.1601566529.git.christophe.leroy@csgroup.eu>
 <87wnz8vizm.fsf@igel.home> <87y2jouw8k.fsf@mpe.ellerman.id.au>
X-Yow: NOT fucking!! Also not a PACKAGE of LOOSE-LEAF PAPER!!
Date: Fri, 30 Oct 2020 10:09:48 +0100
In-Reply-To: <87y2jouw8k.fsf@mpe.ellerman.id.au> (Michael Ellerman's message
 of "Fri, 30 Oct 2020 16:19:07 +1100")
Message-ID: <87v9esaxlv.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Okt 30 2020, Michael Ellerman wrote:

> Andreas Schwab <schwab@linux-m68k.org> writes:
>> On Okt 01 2020, Christophe Leroy wrote:
>>
>>> At the time being, an early hash table is set up when
>>> CONFIG_KASAN is selected.
>>>
>>> There is nothing wrong with setting such an early hash table
>>> all the time, even if it is not used. This is a statically
>>> allocated 256 kB table which lies in the init data section.
>>>
>>> This makes the code simpler and may in the future allow to
>>> setup early IO mappings with fixmap instead of hard coding BATs.
>>>
>>> Put create_hpte() and flush_hash_pages() in the .ref.text section
>>> in order to avoid warning for the reference to early_hash[]. This
>>> reference is removed by MMU_init_hw_patch() before init memory is
>>> freed.
>>
>> This breaks booting on the iBook G4.
>
> Do you get an oops or anything?

Nope, nothing at all.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
