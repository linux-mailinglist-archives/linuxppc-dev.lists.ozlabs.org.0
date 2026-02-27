Return-Path: <linuxppc-dev+bounces-17388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GoCMcGNoWnouAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 13:27:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29E1B7100
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 13:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMnf35MMBz3bmR;
	Fri, 27 Feb 2026 23:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772195259;
	cv=none; b=lZ/JZWswm+eVl3H+lSuc5dy9LGIdXhkanpw3KEIFcNCBt2VEH0+G49sBPmOAXt01HWEM+/Zavg9Lfsp91FPpQuV9hx49Uf1RiVpwSqsPjrHBqZbRngy+58hgWxoDZ6akmo13uGT05u/XX5R9RQZjBGnX9IEqNyjOaYzfKpeoyAbOGrMGr5KoTIeEWuoUTZIF3tnkETKsWc3wQA0ZdH3kRJepa87+veYAmvpGEJ7DGI+dGpxBIrNmtl5fCMYnjs961oIYJF9cOPFlsrNk71WrcVJv6CZdn/feJ9jg2Go4F1WfMvlZZIeyn5VOm3dDn63CpHMJzc8RSco7ELHJVkxW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772195259; c=relaxed/relaxed;
	bh=BBCa2Iq0/hu0sJwRb681qcL3bM1nOatkl9qB4gJ48xY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=UDB+FLpAriBUc1MAFI6MOvKe9so46dFbhHm0r1bib6uKhZZvdI2txtbUgbFGqbfBi824wq+9x6X3IRxltcXqYdMgpLNQvEw7T8UFRBlPuBvvc82eODu9Syo57K9ipkaWM6BWbbFkJZjYGZCSn1ptB3s6I5SpmnEgO+jK/gM4FdrE8iLuvlaFZVJpzQ8EHUFZ1Retn5/SguMWLlUPKUzJ8lqu9+oZxb3C6LZd83iXMaOG8UZX6uMuQaDsn7FYRQCMekqf+eRZzzD7e4sTe3qgo4gTks7vgiYlQJQtFfJ0/Wn93dCVBaqooMKzyTUQg+3/Hwo/LiG43kpqqup03uUU1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jv692TgY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jv692TgY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMnf21mgvz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 23:27:37 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-824af5e5c81so2207315b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 04:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772195255; x=1772800055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBCa2Iq0/hu0sJwRb681qcL3bM1nOatkl9qB4gJ48xY=;
        b=jv692TgYARhIg/pnOhFvZf9pNyY9vdSEYWUa9LEAxJYW6c4g+dNHiXuOUhBrCD7yRo
         /JaPxa9d9HRdJ0s+3hOTV3MWsEb6UJfgPoQaTAAGDVOG7M1lfHuWrscT7DXN/aP7q70E
         jqhLPXu10WxvFm8UumY45BPtsHoN/NOJ/7TqelM6yMqEHoVeqG0MFYfOZ7CRRRmRcTIq
         8gWPTgt/Pxk2S2ktcBWDEcVzdH8UnyHYtQL0cSOhcmXoknOs2YF2Q0YO+cine0wewejV
         8cvn3tF1IQUFXwfKGgJNRZr+gxABlCtpl9D2VUcf35hYAdkIVCLN0ZreKzsNGxkMDSNE
         w+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772195255; x=1772800055;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBCa2Iq0/hu0sJwRb681qcL3bM1nOatkl9qB4gJ48xY=;
        b=JqKllkEoP0BgVQlotxbjUounl4HPM8Z2Cvabm7LAbh2EzhEberVTAEuuyVr/GfbS2y
         azdLcILoKDwrmFUNCfMBDCTdP/HNTwydTf/ISZQxNVnKsti2816Y6AFSWMG+Yfveb2cD
         qSsHdwWKBy9T6HQ1UTq4ESjTHwTvdnKOFw99FGU6iQEvJzORsGsA5X7YjQLJjx7pW2/O
         IKPjcXmUZBcIPQk9bv/JqztG+TB9oADTOh0nULTdVyep9gJMezmYLRlSdYmJfbULXKmk
         DruaYue4NdMDv5FnQPVVqrNu2fV+XEbg59D0nNgbBBjPG2r5XkdXKu7DXkphioN8q96V
         2KkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/j3xPj3lvCb/DY0FJY2DnSvz/0My48qilzPz4XKOyJ5A98IEGanU7zM9axK/iamfjF1SzcR1deeeb5k4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfyBf/zNdNboMNbNTyMROnMktFQ8QhrhjOTltLg0jOO6YqulDt
	M3k9oCMBBP2UujcrPyaMyNbQUx6IQX/aPA8LHF7Jer13SXc9NM5QxlSg
X-Gm-Gg: ATEYQzySFXEkG/Qigm+uYm+4PE5vnK/e82pBSpAvPf14YtewpGK8w+sBUoqIzcI2DxY
	mVExLc3sYophrFyeBVqjyfUpWswp3wKtwPJCu7s7j9rSuHoPKPimesuH0i7oZgi73PLfETaczLn
	7R9PGZBjBKHpj/2aQrK5rsVaq8O9l5Cz++cckP5RGokBUrN2DjAjAv5FtvCouEzrtc6uTNOftCv
	LxmrMOFJ76PmXdqjM8fI6XyjanSJ2Z+AmdtGSzyESyKpLnIO1sfYbKutkJuC8n3hGjik+T7ATb1
	iPUaHpsqe//dwJKIEWQuGM0FYuWXcyOO5uSgXwrI0AMSP/mWvqKHgGVn25h+vAzDYkgr57Ihtre
	SYaf3bT4AeUT+/PkiBInHENSjsBoImqYahNFguCcT8dPX9OVLtxjn2spGnxddZ5ovfvVoy5u4BD
	aMoqAfkvylV7RpWpJ+wQ==
X-Received: by 2002:a05:6a00:4c81:b0:81f:3ae9:3f71 with SMTP id d2e1a72fcca58-8274d9d0704mr2242350b3a.28.1772195255179;
        Fri, 27 Feb 2026 04:27:35 -0800 (PST)
Received: from dw-tp ([203.81.240.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff1c9esm5479908b3a.32.2026.02.27.04.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:27:34 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, Alex Williamson <alex@shazbot.org>, Peter Xu <peterx@redhat.com>
Subject: Re: [RFC v1 2/2] powerpc/64s: Add support for huge pfnmaps
In-Reply-To: <abfbe83b-23fb-400d-9069-b8bf4ad21d95@kernel.org>
Date: Fri, 27 Feb 2026 16:02:25 +0530
Message-ID: <87pl5qh3ye.ritesh.list@gmail.com>
References: <0b8fce7a61561640634317a5e287cdb4794715fd.1772170860.git.ritesh.list@gmail.com> <d159058a45ac5e225f2e64cc7c8bbbd1583e51f3.1772170860.git.ritesh.list@gmail.com> <abfbe83b-23fb-400d-9069-b8bf4ad21d95@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17388-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:alex@shazbot.org,m:peterx@redhat.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: EE29E1B7100
X-Rspamd-Action: no action

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 27/02/2026 à 07:16, Ritesh Harjani (IBM) a écrit :
>> This uses _RPAGE_SW2 bit for the PMD and PUDs similar to PTEs.
>> This also adds support for {pte,pmd,pud}_pgprot helpers needed for
>> follow_pfnmap APIs.
>> 
>> This allows us to extend the PFN mappings, e.g. PCI MMIO bars where
>> it can grow as large as 8GB or even bigger, to map at PMD / PUD level.
>> VFIO PCI core driver already supports fault handling at PMD / PUD level
>> for more efficient BAR mappings.
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>
>

Thanks for the review!

>>   #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
>>   extern int pmdp_set_access_flags(struct vm_area_struct *vma,
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> index dcd3a88caaf6..2d27cb1c2334 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -63,6 +63,18 @@ static inline pgprot_t pte_pgprot(pte_t pte)
>>   	return __pgprot(pte_flags);
>>   }
>> 
>> +#define pmd_pgprot pmd_pgprot
>> +static inline pgprot_t pmd_pgprot(pmd_t pmd)
>> +{
>> +	return pte_pgprot(pmd_pte(pmd));
>> +}
>> +
>> +#define pud_pgprot pud_pgprot
>> +static inline pgprot_t pud_pgprot(pud_t pud)
>> +{
>> +	return pte_pgprot(pud_pte(pud));
>> +}
>> +

In v2 - I will add above under #ifdef CONFIG_PPC_BOOK3S_64 
to avoid build issues with 32-bit PPC.

-ritesh

