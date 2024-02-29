Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39586BFA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:53:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rne5CSNE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlcl36qc7z3vXb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:53:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rne5CSNE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlckL3pKvz3c9N
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 14:52:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF9A9CE21A8;
	Thu, 29 Feb 2024 03:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEC1C433C7;
	Thu, 29 Feb 2024 03:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709178757;
	bh=yH4w3KkVCaD1LzUfUcTHguk7T7n3tQ9C/jrL4yRKV2Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rne5CSNEbrCuAvMIy9L8aj3RaP76gvIKhcvYyEDQnfSvXYeE44McntiUxD2ZxjCSI
	 ahRfHcLZ5L3tOwkI+nrW/SslxK2n8ZMl97MF9S6fc7z3ci2+1z/iJ5dWkAjM+G/rJk
	 Az8XmkafDYhn101oldaQWz3ds74I5TsJL0pqHFAhrX9PRTi0OvrCa/mgLNgiKO7ptj
	 rgwgHVLSHvSzw02KdSAzfoA4Z31LzyE1eGe/BaI7F/yn+hoEx6dL3k3AP9YJBypUsa
	 zjvdsQjAKc8UdNwAw2V4oX47MEDyc6CwJXOLB1RdSeOdr0drpGkqueWnltKYWH2ngH
	 eYnXrUvUbJ0Tw==
X-Mailer: emacs 29.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Kunwu Chan <chentao@kylinos.cn>,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH] powerpc/mm: Code cleanup for __hash_page_thp
In-Reply-To: <87jzmq5tjr.fsf@mail.lhotse>
References: <20240125092624.537564-1-chentao@kylinos.cn>
 <87h6hva4b0.fsf@mail.lhotse>
 <f3b53f0e-58ce-4b2d-ba91-f347da73f9f3@kylinos.cn>
 <87jzmq5tjr.fsf@mail.lhotse>
Date: Thu, 29 Feb 2024 09:22:30 +0530
Message-ID: <87bk80kjup.fsf@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Kunwu Chan <chentao@kylinos.cn> writes:
>> Thanks for the reply.
>>
>> On 2024/2/26 18:49, Michael Ellerman wrote:
>>> Kunwu Chan <chentao@kylinos.cn> writes:
>>>> This part was commented from commit 6d492ecc6489
>>>> ("powerpc/THP: Add code to handle HPTE faults for hugepages")
>>>> in about 11 years before.
>>>>
>>>> If there are no plans to enable this part code in the future,
>>>> we can remove this dead code.
>>> 
>>> I agree the code can go. But I'd like it to be replaced with a comment
>>> explaining what the dead code was trying to say.
>
>> Thanks, i'll update a new patch with the following comment:
>>      /*
>>      * No CPU has hugepages but lacks no execute, so we
>>      * don't need to worry about cpu no CPU_FTR_COHERENT_ICACHE feature case
>>      */
>
> Maybe wait until we can get some input from Aneesh. I'm not sure the
> code/comment are really up to date.
>
> cheers

How about?

modified   arch/powerpc/mm/book3s64/hash_hugepage.c
@@ -58,17 +58,13 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
 		return 0;
 
 	rflags = htab_convert_pte_flags(new_pmd, flags);
+	/*
+	 * THPs are only supported on platforms that can do mixed page size
+	 * segments (MPSS) and all such platforms have coherent icache. Hence we
+	 * don't need to do lazy icache flush (hash_page_do_lazy_icache()) on
+	 * noexecute fault.
+	 */
 
-#if 0
-	if (!cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
-
-		/*
-		 * No CPU has hugepages but lacks no execute, so we
-		 * don't need to worry about that case
-		 */
-		rflags = hash_page_do_lazy_icache(rflags, __pte(old_pte), trap);
-	}
-#endif
 	/*
 	 * Find the slot index details for this ea, using base page size.
 	 */

