Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A69267E19ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 07:07:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=blvpfEmG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP19H4LJvz3cLk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 17:07:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=blvpfEmG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP18P43Fvz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 17:07:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699250815;
	bh=gv51mywp9ecOX1RzxcZintnhCsjrqp3x4ZC5Y3ZTTNk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=blvpfEmGE+F3r0Fuw6ybL9XiF7bRdCdhL0xCmScANvLLocPL5eJpTsbOysaUJychF
	 9EVAypYfGN5Jpnw6/bjQzpz1yuCnsIyx6XqfLeFhc3LrdL9N/13gadKies37NVe4Al
	 uDtIAebgpKKAdDyR2iFoRS81YIlEagqJsBD2ZK37QryXxjmaxT7Dn42mP+0wohL7pj
	 /1M1OoP8ZgitJbhdYR86vIpvWyWq0GyaIJ/3ra1rsw5pvN2eKIi8i7H1gDsAhMk8JR
	 6RqMDqBcz7czNexkVLMY4E3vrCZVXe055JmCuKUjOfcgrtYCC+0NvxT9tylfoqE3yw
	 MJbvWOb49lHYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SP18B6F9xz4wd0;
	Mon,  6 Nov 2023 17:06:50 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "Daniel Walker
 (danielwa)" <danielwa@cisco.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Aneesh Kumar K . V"
 <aneesh.kumar@linux.ibm.com>, david@redhat.com
Subject: Re: mm/debug_vm_pgtable.c:860 warning triggered
In-Reply-To: <dc5a1072-0c2b-4f49-8a5f-de3dcfb8c06e@arm.com>
References: <ZUV+W9bwUBjahL15@goliath>
 <dc5a1072-0c2b-4f49-8a5f-de3dcfb8c06e@arm.com>
Date: Mon, 06 Nov 2023 17:06:46 +1100
Message-ID: <87sf5jqutl.fsf@mail.lhotse>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "David Beazley \(dbeazley\)" <dbeazley@cisco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual <anshuman.khandual@arm.com> writes:
> Hello Daniel,
>
> This test just ensures that PFN is preserved during pte <--> swap pte transformations
> , and the warning here seems to have been caused by powerpc platform specific helpers
> and/or its pte_t representation. Adding powerpc folks and platform mailing list here.

Doesn't the test need a similar treatment to:

  2321ba3e3733 ("mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks")

Which said:
    Especially, the pfn_pte() is dodgy when the swap PTE layout differs
    heavily from ordinary PTEs.  Let's properly construct a swap PTE from swap
    type+offset.


cheers
