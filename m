Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F467B80FF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 15:32:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=gPerOzCb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0wbp3RXmz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 00:32:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=gPerOzCb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0wZt5hyLz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 00:31:49 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1252D381;
	Wed,  4 Oct 2023 13:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1252D381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1696426307; bh=sC0LHUI2i/VOkBSihVVbnuIN3LRhiyHfuQI+/ge6LnQ=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=gPerOzCb2TxaxqtLNVmpTmHrfVXfZPgs4plx0KBo4VM5iu9HsCU/GD+XeDa1ZwifI
	 cMK/+tF5afJWcVsp30wR/qQ4S+xX4JUdwBZEHXTX+bTSAmZndhyaEYGuqTt6NKd1u/
	 gLDhgdTdcUToRJLrwQipPLu3/zmDx3FwRYpbVhA4/LGnAM45fkjbmJTTope5LetHfj
	 EbBIU+VJMyITt9JR9pw5Fl+JgY1D8p31zWpzocL4TyyHK1REr2cb6yKKRsOXkWq1AH
	 u3P4l6AiXH4xZpcFcyMArEqQP4U6aHLkUPXrWfAetx/VQ4AAcuQt0hzDfyFsAUlS+w
	 bgsKJhbxbWONQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Michael Ellerman <michael@ellerman.id.au>, Costa Shulyupin
 <costa.shul@redhat.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Linas Vepstas
 <linasvepstas@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Manoj N.
 Kumar" <manoj@linux.ibm.com>, "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Qiang Zhao <qiang.zhao@nxp.com>, Li
 Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Yanteng Si <siyanteng@loongson.cn>, Heiko
 Carstens <hca@linux.ibm.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>, Benjamin Gray
 <bgray@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Segher Boessenkool
 <segher@kernel.crashing.org>, Rohan McLure <rmclure@linux.ibm.com>, Josh
 Poimboeuf <jpoimboe@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Laurent Dufour <laurent.dufour@fr.ibm.com>, Nathan Lynch
 <nathanl@linux.ibm.com>, Brian King <brking@linux.vnet.ibm.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, Al Viro
 <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH] docs: move powerpc under arch
In-Reply-To: <46705070-17B2-4BDA-9524-1BB2F7BDBACA@ellerman.id.au>
References: <169052340516.4355.10339828466636149348@legolas.ozlabs.org>
 <20230826165737.2101199-1-costa.shul@redhat.com>
 <87cyxvelnn.fsf@meer.lwn.net>
 <46705070-17B2-4BDA-9524-1BB2F7BDBACA@ellerman.id.au>
Date: Wed, 04 Oct 2023 07:31:46 -0600
Message-ID: <878r8i4ipp.fsf@meer.lwn.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <michael@ellerman.id.au> writes:

> On October 4, 2023 3:05:48 AM GMT+11:00, Jonathan Corbet <corbet@lwn.net> wrote:
>>Costa Shulyupin <costa.shul@redhat.com> writes:
>>
>>> and fix all in-tree references.
>>>
>>> Architecture-specific documentation is being moved into Documentation/arch/
>>> as a way of cleaning up the top-level documentation directory and making
>>> the docs hierarchy more closely match the source hierarchy.
>>>
>>> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>>
>>So this patch appears to have not been picked up, and to have received
>>no comments.  I'll happily carry it in docs-next, but it would be nice
>>to have an ack from the powerpc folks...?
>
> I acked it a few months back, and said I assumed you were merging it:
>
> https://lore.kernel.org/linuxppc-dev/87bkfwem93.fsf@mail.lhotse/
>
> I don't mind who merges it, I figured you merging it would generate fewer conflicts, but I'm happy to take it if you think that would be better.
>
> Anyway here's another:
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

OK, sorry, somehow I missed that.  I'll apply it shortly.

Thanks,

jon
