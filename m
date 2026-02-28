Return-Path: <linuxppc-dev+bounces-17457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELQlKq9do2lxBQUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 22:27:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF61C9124
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 22:27:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNdZ15Kstz2xQs;
	Sun, 01 Mar 2026 08:27:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772314025;
	cv=none; b=WzQiZLqKzsGq7+W6AEqB8hLovH2MK6ON1l4Hiw2S71sYNivdF5F5t6LsnccTTM/US3xHm4kSGrP+zpdKn41/zRIlObHvMw/GjKL0qaJO+xdTpHCN5OBq9KsaY+k9VdWUB7KT5105bluqtDcK9LoBQJ8HpvHVEwGlgS3jxrkpQYCM+6AtpQAJey8VPHAkCD+pzHYeZHK2LQOtQt0wVzHGoSt7OjUyAIbNvOg03FjT/T7wk6GeiULWxJXSmpf89m4Spp0bEfv3AQoo7oDR/79SIB4nV5Ns86qXZpbGa6qu3indEcFw+aRNV0D6jhpaqTQrHXyKHquqm4rFrxLKhb4t2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772314025; c=relaxed/relaxed;
	bh=3u+tbCKuiO12lFJH2PgWftBt3LrL7T3icieNzOkjqcE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=AYHkyCJHwJNC7ttCwsuCBxhTKrJLCFav+eI343GjX5l63uWjOemHXDV/pscSApSzc32cL0ESLSZL0r6djL4hJpsioWTOAJ44t7GCS/uD65RAdf349/BRftsfAyIjlVELQyZqlvUPhDxDrn6wdJ0grOVVQJIYREhBKvM/X37pl2EUVK2h8/bV5/7/PCth5QXnHs68ioRZb+jmGbC3y72VMIpPjFwiHeJphIt60011BzwDDBjZ0VDVQ3yJG1te3jLH64W4K380fELW6fPz7jdROxyTVMsEkzyn5wOb1mhkrEywZnepHsbSwPtqEQaZb2Sw6BaMImxZ1jAt3aOmMeWw+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UWpY7E6x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UWpY7E6x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNdZ028wLz2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 08:27:03 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ab39b111b9so15929885ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 13:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772314020; x=1772918820; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3u+tbCKuiO12lFJH2PgWftBt3LrL7T3icieNzOkjqcE=;
        b=UWpY7E6xNLSSQhdXHFbf4fCT2zLYwRwy87AtA2RCgyAwhZ3EvUN94Mma5jRhOSVEZ0
         u0zCWnjj3D1jrxfW6UYjwpN2PoMmN1oJbX1hzIxkgfjhw3GJ9LgMzgP4ubhsX5b2pS3l
         1ZXdpAVxzd23b9hMtcYd4cG3tJpGHxQGlI8h31pO5IxAfrYibscf34NyC+7Zb//EKkJi
         ct5cG+QOTstg87podQXgKUc3JXG1zKRV1yGPWNXHcpF0GAr4FjXPOIgfMEyYVdake85n
         cRSgFN8rSKG5lVd7D4oF6L2Mmq7hJ+9OuwfaD/oe5xABQuren9z3trKzxBDAiXo7sRrN
         Nn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772314020; x=1772918820;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3u+tbCKuiO12lFJH2PgWftBt3LrL7T3icieNzOkjqcE=;
        b=ZlTN2OHLC3IRpJV9PbsvQtChkpNRRkcbdq9BJdaBpNawsj91+pXpzIih68/p0Vj0HI
         0tzxy3hB0Anb8tE354obRDJchhE4OPulQleH/lUQqCkWvvADt15P8SNdFSU87R1h2wHV
         ZlvcUSzTT9v/+zHnXhOURHAjMNLYii9TNvri2scCR4/toRANSgEtdwPTOVFvQUmKeiEk
         R2865ksAp9m0fGc1E++q7J8Tv95Bk5MqizOxC4vDJuobMZ44DqgoS2WzrYvls+6AMmnK
         sIxL940wwXZqLVfWq0OvNnoCkfk7figSuEkv6NcCh6QLoTHCaKeNOS9/XTaO+rKz1epj
         KEvA==
X-Forwarded-Encrypted: i=1; AJvYcCV5un60AIjAOgieALOjtrM4B+SDiorAJu9M2TM6jhMYSxERep+Bu6qOJFFuf33ZAiOqtOqvGT0Mxauyrpw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8iXFU9OVzSxm/3lrlR0PX7xU2ePqASoftrG8A/eIpgX6TKl7x
	et4qv8TRrgje4yy2qZMj/JGemos5hYNhv/3vi0nxUAsh+RsW5T2rAQqW
X-Gm-Gg: ATEYQzz6fQU89fwPW/sZFtkNzbt+lXIPL06eWxzKEa52j39zZWrXRBmsWiiueFrkuU0
	0500IshHVIrrrgfwc7Lpuv+RjfnbZtJgKr9z2Zvb+/WOdsY/tBfIdTkJdpdrHkPhT5fjlIbcKYD
	4WVdxlf2J9+h+29DJJ855SymqgUk+jZOEo/0vdO6+H1Dgld9nr+gZN77ys1ADKMUbx0uImauONN
	jka/soXxiUDUni8mBLQUvzZR7a/X9jUV9LiSXnGBTzgOeGRMDaK3Jf0X7rRRx5mkiWJTkh+TMB7
	ifBYs/k7jpqgx+0g6fz91WKydOn//OJalE9cbEhgNRFMV21lhpyU6kW9hqbmAKLfjCka0SbZ6Lh
	OrXQj6iiTzEAZvHGu3D8Uw4qXnuDgoDJ05Zdt/VUCQqYFJ7aHmG/l4lI+wgmFVLGY7Lh+CnHyy6
	rAnOkGWfvbo/YpbLFd
X-Received: by 2002:a17:903:1aad:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ae2e401f52mr62465095ad.21.1772314019931;
        Sat, 28 Feb 2026 13:26:59 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34e6sm26334335ad.30.2026.02.28.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 13:26:58 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, Alex Williamson <alex@shazbot.org>, Peter Xu <peterx@redhat.com>
Subject: Re: [RFC v1 2/2] powerpc/64s: Add support for huge pfnmaps
In-Reply-To: <87pl5qh3ye.ritesh.list@gmail.com>
Date: Sun, 01 Mar 2026 02:44:32 +0530
Message-ID: <87tsv0in9j.ritesh.list@gmail.com>
References: <0b8fce7a61561640634317a5e287cdb4794715fd.1772170860.git.ritesh.list@gmail.com> <d159058a45ac5e225f2e64cc7c8bbbd1583e51f3.1772170860.git.ritesh.list@gmail.com> <abfbe83b-23fb-400d-9069-b8bf4ad21d95@kernel.org> <87pl5qh3ye.ritesh.list@gmail.com>
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
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:alex@shazbot.org,m:peterx@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17457-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A5EF61C9124
X-Rspamd-Action: no action

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:
>
>> Le 27/02/2026 à 07:16, Ritesh Harjani (IBM) a écrit :
>>> This uses _RPAGE_SW2 bit for the PMD and PUDs similar to PTEs.
>>> This also adds support for {pte,pmd,pud}_pgprot helpers needed for
>>> follow_pfnmap APIs.
>>> 
>>> This allows us to extend the PFN mappings, e.g. PCI MMIO bars where
>>> it can grow as large as 8GB or even bigger, to map at PMD / PUD level.
>>> VFIO PCI core driver already supports fault handling at PMD / PUD level
>>> for more efficient BAR mappings.
>>> 
>>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>
>> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>>
>>
>
> Thanks for the review!
>
>>>   #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
>>>   extern int pmdp_set_access_flags(struct vm_area_struct *vma,
>>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>>> index dcd3a88caaf6..2d27cb1c2334 100644
>>> --- a/arch/powerpc/include/asm/pgtable.h
>>> +++ b/arch/powerpc/include/asm/pgtable.h
>>> @@ -63,6 +63,18 @@ static inline pgprot_t pte_pgprot(pte_t pte)
>>>   	return __pgprot(pte_flags);
>>>   }
>>> 
>>> +#define pmd_pgprot pmd_pgprot
>>> +static inline pgprot_t pmd_pgprot(pmd_t pmd)
>>> +{
>>> +	return pte_pgprot(pmd_pte(pmd));
>>> +}
>>> +
>>> +#define pud_pgprot pud_pgprot
>>> +static inline pgprot_t pud_pgprot(pud_t pud)
>>> +{
>>> +	return pte_pgprot(pud_pte(pud));
>>> +}
>>> +
>
> In v2 - I will add above under #ifdef CONFIG_PPC_BOOK3S_64 
> to avoid build issues with 32-bit PPC.
>

On second thoughts, I am thinking maybe we should guard it with CONFIG_PPC64.  
Currently the build fails on 32-bit since no definitions of pmd_pte()
and pud_pte().  Though, we could open-code that, but I think as of
today, this only gets excercised from follow_pfnmap_start() which gates
it with VM_PFNMAP | VM_IO, which I think could only happen for THP which
is only true for book3s/64. 
But to keep the generic definitions of pXd_pgprot() and since pmd_pte()
and pud_pte() are anyways available on book3s/64 & nohash/64, so let's
just guard this with PPC64.

I will amend this change in RFC-v2 and will keep the RB from Christophe.


+#ifdef CONFIG_PPC64
+#define pmd_pgprot pmd_pgprot
+static inline pgprot_t pmd_pgprot(pmd_t pmd)
+{
+       return pte_pgprot(pmd_pte(pmd));
+}
+
+#define pud_pgprot pud_pgprot
+static inline pgprot_t pud_pgprot(pud_t pud)
+{
+       return pte_pgprot(pud_pte(pud));
+}
+#endif /* CONFIG_PPC64 */
+


-ritesh


