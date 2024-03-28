Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B910188FB74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 10:29:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JiO2FC7b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4ysb3Mk6z3vdy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 20:29:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JiO2FC7b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4yrp6vNbz3dX1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 20:28:25 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a44665605f3so77057966b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711618098; x=1712222898; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhDsgsoAO60u3k10g2MJLo0MvaSsM4SCLf4CmYbwMnU=;
        b=JiO2FC7bIuMZUi1DmLkv5ypbEl93C2Ltu/iRVdfFr/wcCu5MbqykCnHLTlIyTBKiTw
         eMkWRi82tbBoRfREpVcUUD8EtaxxsPS7VRKVkp+jMd4WApcqXyXVbPGNgXhd5SeWrFUw
         OKr9dPC/yLQyvgoaEDlE7gIojpVwEuQUyQX2ppYQOktIvQt10ETRuUepxBSLOZqBtQgG
         dkqI3waVcDurR7wWoTmZMUcObGRFfbGQcyKqmWYji0/BfHWopvR29faVWIjBhuELXpV4
         uLAQmiHEcipDUU2nB9FS4LFPchzrROnj/IT2uItW3toZQVi5JPHt8lR6zZZXuMOiSfq5
         kV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618098; x=1712222898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhDsgsoAO60u3k10g2MJLo0MvaSsM4SCLf4CmYbwMnU=;
        b=DUEBOUsfRl7rsct8VrQ7xbjwr9IP0GOTfLxoCyNaax4RTPpiF9V54fhr21jDXOewYq
         hIRL14fJs3IFgveK+ILU4IGOpHlPDQkJjxwLgd+AAY3cN+pEuJYbQHM0W41Tckci2t5x
         eZ4bZukAybP9k1cGCimQcQI1lCMgG8nmZ1aMGMPlxBTiB54rkn8ofdkekw9gKqNxooUK
         opM0i+cwh65edtC0eyTkJsknY6Bk0MBdEHt49QMImq7o+PuPiAKbY5bFYthI3AwRSche
         W0eA4YXhF0u3IT6cR6Tozv2K+DnlxDLDIT9TS8jfOVSH/ZERDR8MnBuTKWEe8S1PIaj6
         Zkxw==
X-Gm-Message-State: AOJu0Yw1SRQXzgQWVPb92C++jlEdaLXo2eVGmAZF38E/QAUJn7Bh9XbM
	IPodj6kehQ4yKr5OGPgXD4NTeA+1PgGdaroFZa6CtOj57fhlkUrH
X-Google-Smtp-Source: AGHT+IF4nGJMSNCV5u3DgVbXNZEHPac9H6U3miurlYMwBj65T7W35FEsQTMN3m6K4hqypNhM2eag0g==
X-Received: by 2002:a17:906:41b:b0:a46:8856:e6bf with SMTP id d27-20020a170906041b00b00a468856e6bfmr1287546eja.44.1711618097410;
        Thu, 28 Mar 2024 02:28:17 -0700 (PDT)
Received: from gmail.com (195-38-112-2.pool.digikabel.hu. [195.38.112.2])
        by smtp.gmail.com with ESMTPSA id qx27-20020a170906fcdb00b00a4750b2e0f0sm519801ejb.164.2024.03.28.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 02:28:16 -0700 (PDT)
Date: Thu, 28 Mar 2024 10:28:14 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH v11 00/11] Support page table check PowerPC
Message-ID: <ZgU4LoWBXDeJY8VS@gmail.com>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328045535.194800-3-rmclure@linux.ibm.com>
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


* Rohan McLure <rmclure@linux.ibm.com> wrote:

> Rohan McLure (11):
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pud_set"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pmd_set"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pud_clear"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pmd_clear"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pte_clear"

Just a process request: please give these commits proper titles, they 
are not really 'reverts' in the classical sense, and this title hides 
what is being done in the commit. The typical use of reverts is to 
revert a bad change because it broke something. Here the goal is to 
reintroduce functionality.

So please name these 5 patches accordingly, to shed light on what is 
being reintroduced. You can mention it at the end of the changelog that 
it's a functional revert of commit XYZ, but that's not the primary 
purpose of the commit.

Thanks,

	Ingo
