Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49E37733C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 18:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FctND6zq9z3070
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 02:40:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=BBknOPrZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.221;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=BBknOPrZ; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FctMd1CpZz2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 02:39:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620491964; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=TcsC/+0AmGiAS6T22/W+2bCnl8BXsgmSc/39cWXrBi04k4mV7p7f+i6YFY+WcMgI39
 M3SRppSRWyDK60Jc7S4ZdnMOK73Q9I+UX8gENC5Ptp7L2f9eI5iajkM4xMPQmbqcKmpb
 kwZAwbDZqQUg8BqK2kCRe2klG+cMCpB8MElUylAXMYgKkmrK2s5kNi+zzTvD+DhmghuT
 wczdSCwuoqS5lnwfDOpQKBT5IFZzyv0jvcNp+fkH/Jzv628C2ONFQMuecDHIfQpbXGu3
 Tu/8k5nVX63WseV7z01VNxtBJGl+CZ5x6Gk9SxnsThsdC0p2/+ZADG+vNmEmP1GzdegC
 FjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620491964;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=99VAfQWeE/Y2XOOp+FwjMZPLpN3yf3l+JU7vcAnmtiw=;
 b=T2dsD8YZVe1tN01qdQkU0T+L1GOwJdfbG80WfIiC7DzDXd5LHkg8QNIE6S2pFKuQ/A
 juyQnKRz/yN+8fuvJv1RUpp3Uy1sbQTQvsgRBjmFlF52XoV/lQJagpf+wKdOoe4SB7Pe
 i6Sg/Vvf2S/MhgoEx9iVlLVb5zc2RJphmy80VS9d7kuALCPI2+o3g3W2N24RoxiIb7Pk
 PFrHdOV5cdQCmJohrlqh48mt468PhV84n0wRIf3xXcwcrJsjJ/xYI1GWNCHganRVz8Vh
 QIuqDz+wXDUtWyhGkhtsuFHEuBvUiGrdHPhtPs/p/L14SI6mmx/hhzh4qtlaBs2/OJci
 mwkw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620491964;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=99VAfQWeE/Y2XOOp+FwjMZPLpN3yf3l+JU7vcAnmtiw=;
 b=BBknOPrZzg0pk/YGEIvVdHEdQUDdH9w72+Pi/Lysvn1XwEXImv6h6DJCp758il01Ju
 +gWU4xS8Gfn1M2Hgp79nxYudjsr4LhgeHFABor0SVSReMocdGHoWL9GDmql2jJbTqA1D
 ML44HgM/qBjRxnm0UmYkswn9TZs58xfyL53BOeKdiQHRQxKfMa5tE++ATP3QG2bSEUoR
 U5NGLRIuBDMFLz529schnpGZVxxLiylS3D9BswVt6WyvRdl9becBxv0TbNks8DYXz4cl
 ugHqevViVivA5LtpjeIvMTpAEaETU0iBlUxkzXWIWYBhpchqWTZ146ekA5YXFAkfJViv
 DVew==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSL06ZWscSTlkrPeTX3v+h4w6B"
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id L0ba16x48GdN5Y7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 8 May 2021 18:39:23 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
 <0A8D70F6-CBD4-44FD-9DB1-69097AEB5FA3@xenosoft.de>
Message-ID: <10d52780-34ca-2205-8d5c-544a1ff2f248@xenosoft.de>
Date: Sat, 8 May 2021 18:39:22 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0A8D70F6-CBD4-44FD-9DB1-69097AEB5FA3@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06 May 2021 at 03:58 pm, Christian Zigotzky wrote:
> I have started bisecting again.
>
> Link: 
> https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106 
> <https://forum.hyperion-entertainment.com/viewtopic.php?p=53106#p53106>
>
>
>> On 6. May 2021, at 10:09, Christophe Leroy 
>> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>> - Can you check that 887f3ceb51cd with cherry-picked 525642624783 has 
>> Xorg working ?
git checkout 887f3ceb51cd
git cherry-pick 525642624783

Result: Xorg works.
>> - Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to 
>> identify first bad commit that stops after loading the dtb and uImage ?
>> - Once that first bad commit is identified, can you check whether the 
>> preceeding commit with cherry-picked 525642624783 has Xorg working or 
>> not ?
>>
>> Thanks
>> Christophe
git bisect start
git bisect good 887f3ceb51cd
git bisect bad 56bec2f9d4d0
git bisect good -- Xorg restarts again and again but we are looking for 
the first bad commit that stops the boot after loading the dtb and uImage.
git bisect good -- Xorg restarts again and again.
git bisect good -- Xorg restarts again and again.
git bisect good -- Xorg restarts again and again.

Result:

56bec2f9d4d05675cada96772a8a93010f4d82bf is the first bad commit
commit 56bec2f9d4d05675cada96772a8a93010f4d82bf
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Wed Mar 31 11:38:40 2021 +1100

     powerpc/mm/64s: Add _PAGE_KERNEL_ROX

     In the past we had a fallback definition for _PAGE_KERNEL_ROX, but we
     removed that in commit d82fd29c5a8c ("powerpc/mm: Distribute platform
     specific PAGE and PMD flags and definitions") and added definitions
     for each MMU family.

     However we missed adding a definition for 64s, which was not really a
     bug because it's currently not used.

     But we'd like to use PAGE_KERNEL_ROX in a future patch so add a
     definition now.

     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
     Link: 
https://lore.kernel.org/r/20210331003845.216246-1-mpe@ellerman.id.au

:040000 040000 ff8171830c08e4f99852947a5c3b62e784220a26 
85aff144e5219bce4eb6adb2ac32c6459cac22d0 M    arch

---

git cherry-pick 525642624783

Output:

powerpc/signal32: Fix erroneous SIGSEGV on RT signal return
  Author: Christophe Leroy <christophe.leroy@csgroup.eu>
  Date: Fri Apr 23 13:52:10 2021 +0000
  1 file changed, 2 insertions(+), 2 deletions(-)

---

Xorg works after compiling with the cherry-pick of 525642624783.
