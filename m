Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 359641D6279
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 18:05:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PVVM0J9VzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 02:05:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=TbIMRP7f; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PVSW1HhbzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 02:03:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=XlRrqMYd8zmrp5QopdCBZjbFoS1JwVIutNtpP08DbbI=; b=TbIMRP7fnbVckjmFAtwi1Yng23
 cE9MT9WofucD4WXKKoUeMNQl2eCc61v1ppy1K5SaX3CaLAy/jVhjSpvPwH8s7lp4SrdQbtDQwqXCm
 aPTliJe/ErsOP+xAHNeNn5TQbuiEX0c4XbS9uQ5wR1fwhhPNYVOan7d0nMt1BSRPvDY3qsJqqMRBO
 bSDQq+GscgXZ8chGTFtkDMzo0SHt11dEMLJKgnUvzmmoHAvVZ9R/10qnV7UsKLmR0BjwUAy7qGof9
 QCfw+8VZXSXbX67O+AjQ0LB8eomS472u/W64FfTCmPZzsu/XyzmvSq/IVr2Ht+VhYZPibP3dcaByS
 NGd468WQ==;
Received: from [2602:306:37b0:7840:3026:8ad1:a7be:5db7]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZzHj-0007S3-GB; Sat, 16 May 2020 16:03:35 +0000
Subject: Re: [PATCH v2 7/9] powerpc/ps3: Add check for otheros image size
To: Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1589049250.git.geoff@infradead.org>
 <4e8defeb49d62dd9d435e5ea3ddc5668e56fa496.1589049250.git.geoff@infradead.org>
 <87y2pu9cqd.fsf@mpe.ellerman.id.au>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <65353693-f082-42eb-aa89-ab11ea5f623b@infradead.org>
Date: Sat, 16 May 2020 09:03:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87y2pu9cqd.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 5/14/20 7:02 PM, Michael Ellerman wrote:
> Geoff Levand <geoff@infradead.org> writes:
...
>> +    # The ps3's flash loader has a size limit of 16 MiB for the uncompressed
>> +    # image.  If a compressed image that exceeded this limit is written to
>> +    # flash the loader will decompress that image until the 16 MiB limit is
>> +    # reached, then enter the system reset vector of the partially decompressed
>> +    # image.  No warning is issued.
>> +    rm -f "$odir"/{otheros,otheros-too-big}.bld
>> +    size=$(${CROSS}nm --no-sort --radix=d "$ofile" | egrep ' _end$' | cut -d' ' -f1)
>> +    bld="otheros.bld"
>> +    if [ $size -gt $((0x1000000)) ]; then
>> +        bld="otheros-too-big.bld"
>> +        echo "  INFO: Uncompressed kernel is too large to program into PS3 flash memory;" \
> 
> This now appears on all my ppc64_defconfig builds, which I don't really
> like.

No, neither do I.  I didn't think of that case.

> That does highlight the fact that ppc64_defconfig including
> CONFIG_PPC_PS3 is not really helpful for people actually wanting to run
> the kernel on a PS3.

No, this is just for the bootloader image (.bld) that can be
programed into flash memory.  This is what is used to create,
for example, a petitboot bootloader image.

Normal usage is for the bootloader in flash to load a vmlinux
image from disk or network, in which case running a ppc64_defconfig
image would be fine.

> So I wonder if we should drop CONFIG_PPC_PS3 from ppc64_defconfig, in
> which case I'd be happy to keep the INFO message because it should only
> appear on ps3 specific builds.

I'd like to keep CONFIG_PPC_PS3 set in ppc64_defconfig.  I feel it
useful to get some build testing of the PS3 platform code.

> The other option would be to drop the message, or only print it when
> we're doing a verbose build.

Building a boatloader image to program into flash memory is
something only very advanced users would be doing.  I don't
think they would need this message.  They would see the file
name and understand the situation.  I'll post a v3 patch that
removes the message.

-Geoff 
