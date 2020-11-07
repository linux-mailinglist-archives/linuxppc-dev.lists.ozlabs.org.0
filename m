Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7961F2AA552
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 14:26:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSyhZ3bDVzDrSd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 00:26:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSyf16wcFzDrRF
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Nov 2020 00:24:23 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CSydn27sqz1qrfr;
 Sat,  7 Nov 2020 14:24:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CSydn1Br0z1qvh7;
 Sat,  7 Nov 2020 14:24:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yx6A5fhOWZED; Sat,  7 Nov 2020 14:24:12 +0100 (CET)
X-Auth-Info: 7bE/BA4ypitYUy/vkFxt9WFQ+74DxPJApc0pbxU19YnMQEFls8n4mCuBA20ORM6x
Received: from igel.home (ppp-46-244-173-93.dynamic.mnet-online.de
 [46.244.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat,  7 Nov 2020 14:24:12 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 8184C2C35EC; Sat,  7 Nov 2020 14:24:11 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Subject: Re: [PATCH] powerpc/32s: Use relocation offset when setting early
 hash table
References: <9e225a856a8b22e0e77587ee22ab7a2f5bca8753.1604740029.git.christophe.leroy@csgroup.eu>
 <87blg9lchr.fsf@depni.sinp.msu.ru>
X-Yow: Will the third world war keep ``Bosom Buddies'' off the air?
Date: Sat, 07 Nov 2020 14:24:11 +0100
In-Reply-To: <87blg9lchr.fsf@depni.sinp.msu.ru> (Serge Belyshev's message of
 "Sat, 07 Nov 2020 12:53:04 +0300")
Message-ID: <87lffdqozo.fsf@igel.home>
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
Cc: erhard_f@mailbox.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Nov 07 2020, Serge Belyshev wrote:

> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>
>> When calling early_hash_table(), the kernel hasn't been yet
>> relocated to its linking address, so data must be addressed
>> with relocation offset.
>>
>> Add relocation offset to write into Hash in early_hash_table().
>>
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>> Fixes: 69a1593abdbc ("powerpc/32s: Setup the early hash table at all time.")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Tested-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>

Works here as well.

Thanks, Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
