Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D182A5CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 03:09:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IH1ZeZrj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9Sm30qL9z3cVM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 13:09:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IH1ZeZrj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9SlB0n7nz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 13:08:50 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1704938917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmEEcsA0fyriEKAX8TlwhNLaVQANlK3RwRydup4EB8s=;
	b=IH1ZeZrj6G+es7br9lTnFYyTgS8/NZ0PXntEb9/Z50vjKtlOktUF47bs/H13CEyBNEL2G4
	Rtdm1BiJg+oE9KqACaizjUPUDDtYR5OwEN4CIDMNootAWjFqNFtLBWJ976MsR1q1AcffSr
	nHPjaiVp52YhioD9c5kbusjZypUg/44=
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] selftests: mm: hugepage-vmemmap fails on 64K page
 size systems.
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240110075351.f4b6f43e31629ddcb96503cc@linux-foundation.org>
Date: Thu, 11 Jan 2024 10:07:58 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3CE35A3-7663-4B8E-9E85-8F0C3CD7D9EC@linux.dev>
References: <3b3a3ae37ba21218481c482a872bbf7526031600.1704865754.git.donettom@linux.vnet.ibm.com>
 <20240110075351.f4b6f43e31629ddcb96503cc@linux-foundation.org>
To: Donet Tom <donettom@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-kselftest@vger.kernel.org, Aneesh Kumar <aneesh.kumar@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, Geetika Moolchandani <geetika@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 10, 2024, at 23:53, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> (cc Muchun)
> On Wed, 10 Jan 2024 14:03:35 +0530 Donet Tom =
<donettom@linux.vnet.ibm.com> wrote:
>=20
>> The kernel sefltest mm/hugepage-vmemmap fails on architectures
>> which has different page size other than 4K. In hugepage-vmemmap
>> page size used is 4k so the pfn calculation will go wrong on systems
>> which has different page size .The length of MAP_HUGETLB memory must
>> be hugepage aligned but in hugepage-vmemmap map length is 2M so this
>> will not get aligned if the system has differnet hugepage size.
>>=20
>> Added  psize() to get the page size and default_huge_page_size() to
>> get the default hugepage size at run time, hugepage-vmemmap test pass
>> on powerpc with 64K page size and x86 with 4K page size.
>>=20
>> Result on powerpc without patch (page size 64K)
>> *# ./hugepage-vmemmap
>> Returned address is 0x7effff000000 whose pfn is 0
>> Head page flags (100000000) is invalid
>> check_page_flags: Invalid argument
>> *#
>>=20
>> Result on powerpc with patch (page size 64K)
>> *# ./hugepage-vmemmap
>> Returned address is 0x7effff000000 whose pfn is 600
>> *#
>>=20
>> Result on x86 with patch (page size 4K)
>> *# ./hugepage-vmemmap
>> Returned address is 0x7fc7c2c00000 whose pfn is 1dac00
>> *#
>>=20
>> Signed-off-by: Donet Tom <donettom@linux.vnet.ibm.com>
>> Reported-by : Geetika Moolchandani (geetika@linux.ibm.com)
>> Tested-by : Geetika Moolchandani (geetika@linux.ibm.com)

Acked-by: Muchun Song <muchun.song@linux.dev>

>=20
> I'll add=20
>=20
> Fixes: b147c89cd429 ("selftests: vm: add a hugetlb test case")
> Cc: <stable@vger.kernel.org>

Yes. It should be a real bug fix.

Thanks.

