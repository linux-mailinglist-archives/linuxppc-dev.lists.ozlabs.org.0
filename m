Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFA802E74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 10:23:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MG1AbMiG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkJB62vYNz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 20:23:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MG1AbMiG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkJ9H0cRdz3bZM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 20:22:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8710860F6E;
	Mon,  4 Dec 2023 09:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A810C433C8;
	Mon,  4 Dec 2023 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701681758;
	bh=5FEbE9qsx2GJHGLUodYReUa2g2wRjgj8NKWyM50I94c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MG1AbMiGu5mwnetb5Mk/sm7lH7xK7CkoQ6PLMUEJcHsu3Si6guCwk3E7y8FtJ8+Mf
	 HWSOsAv9fvRBgEZkYpZaia+odwJKLu8iM+1+WiGBJjwq0RR/WsAsTl3wSg3zxlNg0o
	 u2qgPm/zlwX2EqEEJmj0oUwyob+/QczyxiqBGyLNJcN+tAFRV3vdu43E5lnRFj22d2
	 IdLTpwiVjwLBc/pucIytSwvLD/EC7Ru1NB75dOyUZU2Xrc0tuNXjXu6b98IrydPTl4
	 WNW7oWdf1hFonnHbk7AZLkg6aH0VxWcfSRzWABR8j9Th/UHZWa6y23FBYh4ugJ4N3H
	 R2aHyHp/BloAQ==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH v2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
In-Reply-To: <87a5qu1a7k.fsf@mail.lhotse>
References: <20231114071130.197966-1-aneesh.kumar@linux.ibm.com>
 <87a5qu1a7k.fsf@mail.lhotse>
Date: Mon, 04 Dec 2023 14:52:32 +0530
Message-ID: <87cyvm2ug7.fsf@kernel.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
>> But that got dropped by
>> commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite")
>>
>> With the change in this patch numa fault pte (pte_protnone()) gets mapped as regular user pte
>> with RWX cleared (no-access) whereas earlier it used to be mapped _PAGE_PRIVILEGED.
>>
>> Hash fault handling code did get some WARN_ON added because those
>> functions are not expected to get called with _PAGE_READ cleared.
>> commit 18061c17c8ec ("powerpc/mm: Update PROTFAULT handling in the page fault path")
>> explains the details.
>  
> You say "did get" which makes me think you're talking about the past.
> But I think you're referring to the WARN_ON you are adding in this patch?

That is correct. Will update this as "Hash fault handing code gets some
WARN_ON added in this patch ..." ?
>

>
>> Also revert commit 1abce0580b89 ("powerpc/64s: Fix __pte_needs_flush() false positive warning")
>
> That could be done separately as a follow-up couldn't it? Would reduce
> the diff size.
>

Will split that to a separate patch.


>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 9 +++------
>>  arch/powerpc/include/asm/book3s/64/tlbflush.h | 9 ++-------
>>  arch/powerpc/mm/book3s64/hash_utils.c         | 7 +++++++
>>  3 files changed, 12 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index cb77eddca54b..2cc58ac74080 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -17,12 +17,6 @@
>>  #define _PAGE_EXEC		0x00001 /* execute permission */
>>  #define _PAGE_WRITE		0x00002 /* write access allowed */
>>  #define _PAGE_READ		0x00004	/* read access allowed */
>> -#define _PAGE_NA		_PAGE_PRIVILEGED
>  
>> -#define _PAGE_NAX		_PAGE_EXEC
>> -#define _PAGE_RO		_PAGE_READ
>> -#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
>> -#define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
>> -#define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
>  
> Those are unrelated I think?
>

If we don't require _PAGE_NA we can fallback to generic version.


>>  #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
>>  #define _PAGE_SAO		0x00010 /* Strong access order */
>>  #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
>> @@ -529,6 +523,9 @@ static inline bool pte_user(pte_t pte)
>>  }
>>  
>>  #define pte_access_permitted pte_access_permitted
>> +/*
>> + * execute-only mappings return false
>> + */
>
> That would fit better in the existing comment block inside the function
> I think. Normally this location would be a function description comment.
>

Will move.

>>  static inline bool pte_access_permitted(pte_t pte, bool write)
>>  {
>>  	/*
>           ie. here
>
> cheers

Thanks
-aneesh
