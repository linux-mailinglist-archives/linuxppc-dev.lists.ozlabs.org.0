Return-Path: <linuxppc-dev+bounces-5767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94131A24D3B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2025 09:50:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ym3H32jvYz2yVt;
	Sun,  2 Feb 2025 19:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738486207;
	cv=none; b=SViRZggYf/HibdlLn4yXEOw4itBNDNu8biX8kNM0KgenYyDMPLf4YnptBQblXFcPiblj/xI+WQz/95RW38jffOUs9288N/t22gqk6OqtGFhKm6Kuk/RAJtbHSFdX8mKAw3xu+7GDnq8iH4sFKAOb7TvIqbDhi3RbGZPWxqwW4JIY/Ek7iOBfT4as7Vr13a/NbbFDuDXV5h0cBq9WXGW3ISEt2L+OTfFiWn7scUaF51i92Qdg+XwFndvTHblUcfFPY5/czOGN76K1oK/DOkpSwuI57p9sQtn7Es81RLD27nOseHlnlgdCjv8rZbP+WfFwc+8WvI35tikcgu+0FHDqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738486207; c=relaxed/relaxed;
	bh=KdxxBTF4eMOlt6Wz53THMPbX15NgzkxKo8yV3ndanak=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=KMj4upQS4W0RDb77YZKCJeggRzZ9oe4TdMhgCNJOTg9TfyiesaPDGaoyFiyzYb4FIVesT15LBWRmqIh/eilNsq89zOywCtNi2pQPtfbdy++mdmku3kVLYo37AQC6a9FfZtqORme/WzIF0lhN47ZTiRb+BYSlVQJZhsVAcloshh6mrtoKAPcci2iqXwplRxmX5cIFo2qAby/sKxvQRZYZjRWMWHyPK3FuMYkHqA5Y5sxY6XmtwDOquNO7imxjwea60HFalnR/H4QBDOZHZyEM2V9Ct4b6h50KzqmMoaUvUznSo6lgdc4N8ZMbUirV3EFZpPZHUetAy8oLmhel8fysFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ym3H20ksbz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2025 19:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ym38N6wT4z9sRr;
	Sun,  2 Feb 2025 09:44:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAIHvGpOdCjw; Sun,  2 Feb 2025 09:44:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ym38N6CSjz9sRk;
	Sun,  2 Feb 2025 09:44:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C4D988B764;
	Sun,  2 Feb 2025 09:44:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id z4thb_XSyLwN; Sun,  2 Feb 2025 09:44:20 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 77F688B763;
	Sun,  2 Feb 2025 09:44:20 +0100 (CET)
Message-ID: <66f36cf5-37d5-4edb-a20b-4047dbe6a846@csgroup.eu>
Date: Sun, 2 Feb 2025 09:44:20 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in
 copy_to_kernel_nofault+0xd8/0x1c8 (v6.13-rc6, PowerMac G4)
To: Erhard Furtner <erhard_f@mailbox.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "Christopher M. Riedl" <cmr@bluescreens.de>
References: <20250112135832.57c92322@yea>
 <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
 <20250121220027.64b79bab@yea>
 <f06de018-34ae-4662-8a35-1c55dff1024a@csgroup.eu>
 <20250122002159.43b367f0@yea>
 <ca7568ef-5032-4a80-9350-a9648b87f0b5@csgroup.eu>
 <8acd6ef8-adf0-4694-a3e5-72ec3cf09bf1@csgroup.eu>
 <20250201151435.48400261@yea>
 <1ff477a4-85f6-4330-aa0c-add315abfff9@csgroup.eu>
 <20250201165416.71e00c43@yea>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>
In-Reply-To: <20250201165416.71e00c43@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 01/02/2025 à 16:54, Erhard Furtner a écrit :
> On Sat, 1 Feb 2025 16:14:04 +0100
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> Thanks for the report.
>>
>> That's something different. Previous report was:
>>
>> BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8
>>
>> This is what my patch fixes.
>>
>> New report is:
>>
>> BUG: KASAN: user-memory-access in copy_to_kernel_nofault+0x8c/0x1a0
>>
>> Christophe
> 
> Ah, sorry... I have not been very thoroughly it seems!
> 
> The dmesg looked similarly so I thought it was the same issue.
> 

This time the problem is a mixture of commit 465cabc97b42 
("powerpc/code-patching: introduce patch_instructions()") and commit 
c28c15b6d28a ("powerpc/code-patching: Use temporary mm for Radix MMU") 
which is revealed by commit e4137f08816b ("mm, kasan, kmsan: instrument 
copy_from/to_kernel_nofault")

Commit c28c15b6d28a is inspired by commit b3fd8e83ada0 
("x86/alternatives: Use temporary mm for text poking") but misses the 
kasan_disable_current() / kasan_enable_current() sequence.

Was not necessary because __patch_mem() is not instrumented. But commit 
465cabc97b42 added use of copy_to_kernel_nofault() which is now 
instrumented.

The problem is that commit c28c15b6d28a makes use of a special memory 
area which is not kernel memory and it doesn't have any matching KASAN 
shadow area. And because it is located below TASK_SIZE, in addition 
kasan sees it as user memory.

Can you try the change below ?

diff --git a/arch/powerpc/lib/code-patching.c 
b/arch/powerpc/lib/code-patching.c
index 8a378fc19074..f84e0337cc02 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -493,7 +493,9 @@ static int __do_patch_instructions_mm(u32 *addr, u32 
*code, size_t len, bool rep

  	orig_mm = start_using_temp_mm(patching_mm);

+	kasan_disable_current();
  	err = __patch_instructions(patch_addr, code, len, repeat_instr);
+	kasan_enable_current();

  	/* context synchronisation performed by __patch_instructions */
  	stop_using_temp_mm(patching_mm, orig_mm);


