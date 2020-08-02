Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D222356FC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:14:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKM123B6SzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKLyx2ckNzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:12:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pLZ9eajS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKLyw2vsLz9sSG;
 Sun,  2 Aug 2020 23:12:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596373945;
 bh=sID5jF4Cu2LpdpacmAhMr1D7+zsw/1wVUJQCRoKU2pw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pLZ9eajSVS4qgYJQKhNcUksxKk/8C7qANvG5h5prgyyNHtQT60vGtH5vFsrfGdRZY
 MKjAW41ESpqg0jMryxeyS8t5EYMafKLbZqxlJr18IQClJtS7kV5fFlymKS9WxCSwOi
 33macqLgP4+mVgL5rU/oQkcicvRMC+5+DyapdY8cuyIw30ilD3q/xUBmTQNkj0Sta6
 lK2Yvu8ARddKluuKpgSttVyUULSCkX6ProZFtcLNqHMtkUccVlDeHQTMEtE4tfMLrF
 IPJYrTjjUwPEc/qYPLu4QSI0R3ka3ueMlLTmnRdDLf3rgUhaypbfPmAjyM4kchxhHz
 QCsXwpECoBFSw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v2 15/16] powerpc/powernv/sriov: Make single PE mode a
 per-BAR setting
In-Reply-To: <20200801061823.GA1203340@ubuntu-n2-xlarge-x86>
References: <20200722065715.1432738-1-oohall@gmail.com>
 <20200722065715.1432738-15-oohall@gmail.com>
 <20200801061823.GA1203340@ubuntu-n2-xlarge-x86>
Date: Sun, 02 Aug 2020 23:12:23 +1000
Message-ID: <87r1sp19ag.fsf@mpe.ellerman.id.au>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <natechancellor@gmail.com> writes:
> On Wed, Jul 22, 2020 at 04:57:14PM +1000, Oliver O'Halloran wrote:
>> Using single PE BARs to map an SR-IOV BAR is really a choice about what
>> strategy to use when mapping a BAR. It doesn't make much sense for this to
>> be a global setting since a device might have one large BAR which needs to
>> be mapped with single PE windows and another smaller BAR that can be mapped
>> with a regular segmented window. Make the segmented vs single decision a
>> per-BAR setting and clean up the logic that decides which mode to use.
>> 
>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>> ---
>> v2: Dropped unused total_vfs variables in pnv_pci_ioda_fixup_iov_resources()
>>     Dropped bar_no from pnv_pci_iov_resource_alignment()
>>     Minor re-wording of comments.
>> ---
>>  arch/powerpc/platforms/powernv/pci-sriov.c | 131 ++++++++++-----------
>>  arch/powerpc/platforms/powernv/pci.h       |  11 +-
>>  2 files changed, 73 insertions(+), 69 deletions(-)
>> 
>> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
>> index ce8ad6851d73..76215d01405b 100644
>> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
>> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
>> @@ -260,42 +256,40 @@ void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
>>  resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
>>  						      int resno)
>>  {
>> -	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
>>  	struct pnv_iov_data *iov = pnv_iov_get(pdev);
>>  	resource_size_t align;
>>  
>> +	/*
>> +	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
>> +	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
>> +	 * In that case we don't allow VFs to be enabled since one of their
>> +	 * BARs would not be placed in the correct PE.
>> +	 */
>> +	if (!iov)
>> +		return align;
>> +	if (!iov->vfs_expanded)
>> +		return align;
>> +
>> +	align = pci_iov_resource_size(pdev, resno);

That's, oof.

> I am not sure if it has been reported yet but clang points out that
> align is initialized after its use:
>
> arch/powerpc/platforms/powernv/pci-sriov.c:267:10: warning: variable 'align' is uninitialized when used here [-Wuninitialized]
>                 return align;
>                        ^~~~~
> arch/powerpc/platforms/powernv/pci-sriov.c:258:23: note: initialize the variable 'align' to silence this warning
>         resource_size_t align;
>                              ^
>                               = 0
> 1 warning generated.

But I can't get gcc to warn about it?

It produces some code, so it's not like the whole function has been
elided or something. I'm confused.

cheers
