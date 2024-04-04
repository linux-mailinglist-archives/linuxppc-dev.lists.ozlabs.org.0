Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCF897CE5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 02:18:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AL0vWByp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V92Jh3B36z3vXr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AL0vWByp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V92Hz0DBXz2xFt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 11:17:34 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-430acf667afso2522471cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 17:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712189851; x=1712794651; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSVBno2xCtCV3lEPrUaIPS0RwP9BPDEg1a+b7h+02fA=;
        b=AL0vWBypR1P59Wmv0wKbhjJBZdRW84+fTecSoTnUdzzpLHWBu0NSu8/7/VvwbC8YKp
         ZbfJFe2YVv4ZVubKJEKMCoqghpHwESYSJAOjlz/WPSvmkoBGBYG2Y/4ICnHod4GoJRbL
         hr2l2t8wkOX/1n0PLzYFOMnPRnNOpFHM/QiQj3IpHGLoE4cvgsm6kDbzlGPnY2CXus1u
         WFz3vYsFlkhZ4VbE1P6y/w56b/HbD2A4xmEaUWF7H6frZLzId0MR7+WKkljazL1bypf9
         Gn7B+fbZ2MXDBKmFTFah2HwPfOZ7v5+WXZzDN7G0CWvCdqN/6DMQS7Ach7Ea7+6rgdxz
         R98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712189851; x=1712794651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSVBno2xCtCV3lEPrUaIPS0RwP9BPDEg1a+b7h+02fA=;
        b=RA2BZ6nmFqraQpBjCiBdrV6Dl3L7TfquIQAgpXFvug7IJ55aIstlo0IaV+97rtXXBN
         UVFabpqPUR/YuZnIrkk1UEt/s0z451fYdcSTsoRjLkyBgTsUyDNZqBQ2aCJCwYEXqPkD
         J5rxUZ4XszMh3LRFZOX78DJCRRLOmsDNdM5gKmvfNyq5aPOZQHkRe85SlCFLn9MlYuAC
         iPG4N7GRSo/NPPXj9c326o/eBto1YQ4hXEZWYrX7w20dCuZ+c46KhxS96kBT2zyRMLtB
         3LJ+hUyBkoVTbQV2pebL9kn7OR/ldE4OHEWmm4RE+I1KgqtnpHB9z+DFZ1aLMSNesDeb
         aHFw==
X-Gm-Message-State: AOJu0Yz+tQSuSk/caIlMmUDJGl54HnToFIqfAQPM/CUMVEn2Ne6qj4Se
	gRJiyc91AUyTQkStbs5iiqy4ZwNyWDd/N9yZF2VfJMRF3Nfay3vfMQiMd/FyWeGNoig6Q3sR2c4
	vUV3x+u4ZimJr/PIZ2HCoTa+H3b7AN24p9JOrag==
X-Google-Smtp-Source: AGHT+IHeyRQcXRicFrSlT78VEU+Vzn8mFeWtih7N+0UKFhl1TiJbXhDluQaV4kTzz7cFxWm7uIPajzR+MoCnf8A5Y2k=
X-Received: by 2002:a05:622a:411:b0:432:f652:1a52 with SMTP id
 n17-20020a05622a041100b00432f6521a52mr1067238qtx.55.1712189851730; Wed, 03
 Apr 2024 17:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-12-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-12-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 20:16:54 -0400
Message-ID: <CA+CK2bC-ua6DVAwZ5oM3X9v3PJx1oKWtbOdBfEdeLHQasXx0Pw@mail.gmail.com>
Subject: Re: [PATCH v12 11/11] powerpc: mm: Support page table check
To: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 2, 2024 at 1:13=E2=80=AFAM Rohan McLure <rmclure@linux.ibm.com>=
 wrote:
>
> On creation and clearing of a page table mapping, instrument such calls
> by invoking page_table_check_pte_set and page_table_check_pte_clear
> respectively. These calls serve as a sanity check against illegal
> mappings.
>
> Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK for all platforms.
>
> See also:
>
> riscv support in commit 3fee229a8eb9 ("riscv/mm: enable
> ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> arm64 in commit 42b2547137f5 ("arm64/mm: enable
> ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page tabl=
e
> check")
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thank you for this work!

Pasha
