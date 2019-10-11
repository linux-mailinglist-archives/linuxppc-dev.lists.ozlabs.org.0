Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF6D3B4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 10:37:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qLtQ6X5xzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 19:37:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qLfg2dpHzDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 19:27:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="MXLBopwZ"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46qLff52K5z9sPF;
 Fri, 11 Oct 2019 19:27:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1570782442;
 bh=TQWscCQZrv8dWhGb1t8nqO+BTCaGRvGG2f3iz/N32TI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MXLBopwZbP77m5qzU/JjASDvknvbjq3UPQf0x1vyTd+tQSY4Wcv7hHP9uHMl6e+RI
 zvcPWMGricW97lzjOMhrCIXSsNgAf2Z2posZOFNDNWPi5xz5j2TPYxfc3H5rxrdSuV
 LKY33Ri7gafu0mijgN6wE98ED9ZglOfH9kZ8aSVa4y73ONeRSXamqW8YCYevZpLiQE
 CVYSgQnHMykJsUF30r7U+4RHvbqZa0l8V/f1uo4NsOZfBnlTkuYDIqQnqfBSvkF7rb
 esTJzWDfkSPqOGeG4fnBYezKwGvTTLDiDkclzMybA731Rv5wtnpSGTmN3vGL9uAfzH
 PPGGdThZkYYbA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 1/3] powernv/iov: Ensure the pdn for VFs always contains a
 valid PE number
In-Reply-To: <CAOSf1CH0hmhrDNpi0TVeGD2uKfcEnv8+hd_z+KLuL-4=sOVeeA@mail.gmail.com>
References: <20190930020848.25767-2-oohall@gmail.com>
 <20190930170948.GA154567@google.com>
 <CAOSf1CH0hmhrDNpi0TVeGD2uKfcEnv8+hd_z+KLuL-4=sOVeeA@mail.gmail.com>
Date: Fri, 11 Oct 2019 19:27:09 +1100
Message-ID: <8736fzwuua.fsf@mpe.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shawn Anastasio <shawn@anastas.io>, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Oliver O'Halloran" <oohall@gmail.com> writes:
> On Tue, Oct 1, 2019 at 3:09 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>> On Mon, Sep 30, 2019 at 12:08:46PM +1000, Oliver O'Halloran wrote:
>> This is all powerpc, so I assume Michael will handle this.  Just
>> random things I noticed; ignore if they don't make sense:
>>
>> > On PowerNV we use the pcibios_sriov_enable() hook to do two things:
>> >
>> > 1. Create a pci_dn structure for each of the VFs, and
>> > 2. Configure the PHB's internal BARs that map MMIO ranges to PEs
>> >    so that each VF has it's own PE. Note that the PE also determines
>>
>> s/it's/its/
>>
>> >    the IOMMU table the HW uses for the device.
>> >
>> > Currently we do not set the pe_number field of the pci_dn immediately after
>> > assigning the PE number for the VF that it represents. Instead, we do that
>> > in a fixup (see pnv_pci_dma_dev_setup) which is run inside the
>> > pcibios_add_device() hook which is run prior to adding the device to the
>> > bus.
>> >
>> > On PowerNV we add the device to it's IOMMU group using a bus notifier and
>>
>> s/it's/its/
>>
>> > in order for this to work the PE number needs to be known when the bus
>> > notifier is run. This works today since the PE number is set in the fixup
>> > which runs before adding the device to the bus. However, if we want to move
>> > the fixup to a later stage this will break.
>> >
>> > We can fix this by setting the pdn->pe_number inside of
>> > pcibios_sriov_enable(). There's no good to avoid this since we already have
>>
>> s/no good/no good reason/ ?
>>
>> Not quite sure what "this" refers to ... "no good reason to avoid
>> setting pdn->pe_number in pcibios_sriov_enable()"?  The double
>> negative makes it a little hard to parse.
>
> I agree it's a bit vague, I'll re-word it.

So I'm expecting a v2?

cheers
