Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D60027FE94D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 07:44:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fVNyT4RF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgmr12SvVz3cTr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 17:44:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fVNyT4RF;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgmqB3gn4z2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 17:43:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701326598;
	bh=JV+Uq9AWYl20iCpbafakbmi2AOPMRDgKBt3T8H0kpeI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=fVNyT4RF2YCRP6Zyvy00GyewGUnJuOUUck2jAXZ/T0OrnW3ottnGDYW84RgZGMAUZ
	 CT14Qs4FeC6SA7kcdJvCAUzaiJX3SSQBUQcQ0zum3NPbSUmS4nKauYtgHZkFQblvaD
	 sfBLTvAysGpZmB/tWPI8greHjRrNMMc9ThG5eprVwmNe1CZwpuoIUIzoHjkpiRPPqt
	 nl4JZaYb/5aZxxTJgQsTfKMan4rZ9oN3OY1wYBByq6W/dmiWn1WsW5h4mK7owr01U+
	 Fm5d6idlsj5lISXKjOVwUn6IqHvXI2wuSDwvTsWfZaYsJGTExDo2CTDw/3kLrLiX9h
	 9H85yiR8/oI1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgmqB26R5z4xWp;
	Thu, 30 Nov 2023 17:43:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/64s: Fix CONFIG_NUMA=n build
In-Reply-To: <f85d34dc-e310-4766-9161-deae7acb340e@app.fastmail.com>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
 <20231129131919.2528517-5-mpe@ellerman.id.au>
 <f85d34dc-e310-4766-9161-deae7acb340e@app.fastmail.com>
Date: Thu, 30 Nov 2023 17:43:17 +1100
Message-ID: <87v89j212y.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Wed, Nov 29, 2023, at 14:19, Michael Ellerman wrote:
>> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
>> index 7f9ff0640124..72341b9fb552 100644
>> --- a/arch/powerpc/mm/mmu_decl.h
>> +++ b/arch/powerpc/mm/mmu_decl.h
>> +
>> +#ifdef CONFIG_MEMORY_HOTPLUG
>> +int create_section_mapping(unsigned long start, unsigned long end,
>> +			   int nid, pgprot_t prot);
>> +#endif
>
> This one should probably go next to the remove_section_mapping()
> declaration in arch/powerpc/include/asm/sparsemem.h for consistency.
=20
That doesn't work due to:

In file included from ../include/linux/numa.h:26,
                 from ../include/linux/async.h:13,
                 from ../init/initramfs.c:3:
../arch/powerpc/include/asm/sparsemem.h:19:44: error: unknown type name =E2=
=80=98pgprot_t=E2=80=99
   19 |                                   int nid, pgprot_t prot);
      |                                            ^~~~~~~~

Which might be fixable, but I'd rather just move
remove_section_mapping() into mmu_decl.h as well.

cheers
