Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D63AEEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 08:18:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mjcv1JzzzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 16:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gBDc6s5w"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MjbJ0zLYzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 16:17:13 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id p184so1361503pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=QUcM2bfCpfs+CF5Q3MEY89CqL+kCuIGlPKR4lAGQQUE=;
 b=gBDc6s5wefUKJtnMQTjQlBkkBMula3LNzwu5ME6utMbGVzJqi2ERsUVzab2XgCGaqv
 DQJ7aci9f7H4UxABCmtK3IE2t8OCIG662iAbqbilxNeqS0dImhTkOdQHbMhey38dlu7s
 PqfAltLOAHAzHYFnBJttsikw1L9OCZE32ELJUTXo6NbGTBY4EJWHKsIZWbjH8QdjZ4ji
 mHYGdGjvjHo305WfGXJMbWPHUTRwh5L6q/9f5A5e71SrlX9R1JG594iKIVUHm0Sq/KGn
 FcrgeoxtVcPtQACR+Fk9WCSjtKK/cisrT2gfbd54KXApIEX6H/VO8hAhENIFVIXdYOWv
 T9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=QUcM2bfCpfs+CF5Q3MEY89CqL+kCuIGlPKR4lAGQQUE=;
 b=NMdSJsjZ84aglbM9ZeKXJ9RlsS0LR5neMU1zLq/igsA48yVINGlzmn2hs3pLYY3IyV
 IxEzQNUe6EJG55koPjHXHkFtaEJAdU6jaxk8hQhrwIwpO2rV0NHpzs2xR5ZnZ1qi5p1B
 LR/6Ktzxs4QPybwxnrusMzZMVzEADQdgcSo6UDGHzyFTF+apF8/4LjnqJE/foIR9cPBS
 /jILk8loUCoVHb4f9pKX5KfDVHPq1YH+lG23K8Aj7E2VQPAx6/u/zXIoH0HHgZWdW4C7
 tKTsUJ+3sXBUpeNBp24pKdq4kEoCNi8sy+mx7ZHkn1Bfzg9Cpv9ewy2cCr5dSIuoDn+P
 fCMQ==
X-Gm-Message-State: APjAAAUFLCHmxPpkIKkpV/OLmwVJqNvi2h+lz1GezOa48FuobAzQaL8e
 kB3W2cGmn5476MJDoVrFb0k=
X-Google-Smtp-Source: APXvYqw34wde3ng/Qx9tQNG4a1tJVYDA4kMn2ZLcc1X5fYZq17VRglbkiBgljRp0MRwhwJZOeiXzvg==
X-Received: by 2002:a63:de43:: with SMTP id y3mr14823919pgi.271.1560147431601; 
 Sun, 09 Jun 2019 23:17:11 -0700 (PDT)
Received: from localhost (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id q1sm15483011pfb.156.2019.06.09.23.17.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 23:17:10 -0700 (PDT)
Date: Mon, 10 Jun 2019 16:14:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/4] arm64: support huge vmap vmalloc
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
 <20190610043838.27916-2-npiggin@gmail.com>
 <c49a8fa7-c700-b45b-31b8-1d49afc42136@arm.com>
In-Reply-To: <c49a8fa7-c700-b45b-31b8-1d49afc42136@arm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560147087.rpy7pimoej.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual's on June 10, 2019 3:47 pm:
>=20
>=20
> On 06/10/2019 10:08 AM, Nicholas Piggin wrote:
>> Applying huge vmap to vmalloc requires vmalloc_to_page to walk huge
>> pages. Define pud_large and pmd_large to support this.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/p=
gtable.h
>> index 2c41b04708fe..30fe7b344bf7 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -428,6 +428,7 @@ extern pgprot_t phys_mem_access_prot(struct file *fi=
le, unsigned long pfn,
>>  				 PMD_TYPE_TABLE)
>>  #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) =3D=3D \
>>  				 PMD_TYPE_SECT)
>> +#define pmd_large(pmd)		pmd_sect(pmd)
>> =20
>>  #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
>>  #define pud_sect(pud)		(0)
>> @@ -438,6 +439,7 @@ extern pgprot_t phys_mem_access_prot(struct file *fi=
le, unsigned long pfn,
>>  #define pud_table(pud)		((pud_val(pud) & PUD_TYPE_MASK) =3D=3D \
>>  				 PUD_TYPE_TABLE)
>>  #endif
>> +#define pud_large(pud)		pud_sect(pud)
>> =20
>>  extern pgd_t init_pg_dir[PTRS_PER_PGD];
>>  extern pgd_t init_pg_end[];
>=20
> Another series (I guess not merged yet) is trying to add these wrappers
> on arm64 (https://patchwork.kernel.org/patch/10883887/).
>=20

Okay good, I'll just cherry pick it for the series.

Thanks,
Nick

=
