Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8D1D6786
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 12:49:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PzRk4DvMzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 20:49:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EDX0dqcz; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PzQ54zzdzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 20:48:13 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id v17so5658760ote.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=78HVtjMqTh93tK1vuJRbze49auQywGkoG+/SSz5PYgw=;
 b=EDX0dqczuUvbC905cidBI7FCWLMsW7cpKwoCTIdaCB8OMptMBJajBLoy5YwQalVVcq
 UOylWWkxArOQyn/m8rBs69SO0W+npeDOgJ1tyUGLyA4hHF7eSJbf5clTy8EpUeJbp7I6
 1fFS7pzPEczfkppq33+H0zm9TvFDTcm4PWPJbKREpGpHEs0HkBym54mpRqbZ8q0cpM41
 /LnrLY/b06OmVB4YlrewvG2G8gXWDcwqYdC3miYbb4ZWmtgtGbmRq4D7RyLkeieR9lQ2
 PG1bMWsOASrd+pugYjEtdyXlTnSdeMxGy5WuYZIhDrzGCX4U3mc8WkYTbr9W/VtOl+U8
 loOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=78HVtjMqTh93tK1vuJRbze49auQywGkoG+/SSz5PYgw=;
 b=COKNb2sfdzK2EiVMhZyWXGb1GMB31VsGrdjK/PnaE7hn0tfUWVy8nD4dvG33axD3BE
 YlLsWu2q66Q1xhr3qrF6K8VZHKs9f/NKOFIHjQ9gKLRrU7OqFkkEklv4YUqG3QrGDCgm
 vutXi0tlNFbSQCdpvwzAD8fnLOTYUhYhqCgT0ugttre0KN+n0DTOto89aU5uEKD1kk5y
 UqPtNIWsRGb5dFBdm7Z1pgf96ViREclvDa8iwEAemqlIiS42ngblff7msX3tospKYV/4
 vcgU6yGUOdHzqoJwHUfpNnsNuZ4Sp2qgMh7E+msnmEc+SrS6PO1l213eSonYqepL+lNv
 weUA==
X-Gm-Message-State: AOAM532YWPOueH8NRG72VY1h/a3TbygLLvHmgTD4WLqzPg+Rp2Vf6jSF
 Rhx3r9FX/0BqUeZVouxB7zrzs47LtdTxotVRG7o0/rky40Y=
X-Google-Smtp-Source: ABdhPJw4N3PGeTO0WhfJL/gbFCPn9STH/throWSqLkb5myn7LFUICedSbXPKIPQ1/hASRbv2UDMOD5/rKW22AEjfUQM=
X-Received: by 2002:a9d:172a:: with SMTP id i42mr3710531ota.28.1589712491404; 
 Sun, 17 May 2020 03:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-12-jniethe5@gmail.com>
In-Reply-To: <20200506034050.24806-12-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sun, 17 May 2020 20:48:00 +1000
Message-ID: <CACzsE9pc07weCnYjL2BoP2mon3QWiUz5KOqPZgr63Vj5kiYSKg@mail.gmail.com>
Subject: Re: [PATCH v8 11/30] powerpc: Use a datatype for instructions
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mpe, this is to go with the fixup I posted for mmu_patch_addis() in
[PATCH v8 12/30] powerpc: Use a function for reading instructions.
Thanks to Christophe pointing it out.

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -98,11 +98,12 @@ static void mmu_patch_cmp_limit(s32 *site,
unsigned long mapped)

 static void mmu_patch_addis(s32 *site, long simm)
 {
-    unsigned int instr = *(unsigned int *)patch_site_addr(site);
+    struct ppc_inst instr = *(struct ppc_inst *)patch_site_addr(site);
+    unsigned int val = ppc_inst_val(instr);

-    instr &= 0xffff0000;
-    instr |= ((unsigned long)simm) >> 16;
-    patch_instruction_site(site, ppc_inst(instr));
+    val &= 0xffff0000;
+    val |= ((unsigned long)simm) >> 16;
+    patch_instruction_site(site, ppc_inst(val));
 }

 static void mmu_mapin_ram_chunk(unsigned long offset, unsigned long
top, pgprot_t prot)
--
