Return-Path: <linuxppc-dev+bounces-4149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FC9F2E92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 11:52:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBcGx0wtQz2yVb;
	Mon, 16 Dec 2024 21:52:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734346377;
	cv=none; b=m5Z9ycXGI794uThuqQIcTNgKcq6FJ64r+Hnr5bjo4Fo1Vql2VXd4OtG4H8mfPMiQmCBNIhnhfIDyWYSLoGzNgiPUThfeigNPuHQ4+CKs7919q5C0ra2ciK6YVAvVdzl2Qfd74FvbW7Oi7SLLgU6WoNrXsLuhiSpod2NsZAQ+MpddkrQ4YQADssZ2iS3hu5PRSL2Oj/U92TBjJpOnkX+wdEtg50VWcoG4tY3tZReQwuVKMwEUhAiiE9ofqqQflF9lSLd7fdYMnLGhGaEU1bq1ORGwWY30p9gG5yuMxr9cqkBA8mdiLrwlLpddyog4ynqAmOOVVXfdxfzJCl+JdjtnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734346377; c=relaxed/relaxed;
	bh=/IOYRGCuJyL4W5aS5tIFFhGj7u336MTqvrcn+JIIAm8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=fmoLwQ2U3r7AeXRIB8XDWAWpQzMO/k5pmX31xWIvnvIc8sZZeHO4y709dDg9fHuVwvhbRW5o+JKbGCtYDkIoTj3prVeCdg4nJKq2TPlalDCsMShLPZV0mvfWNXogIlt5JMRzQxLCcSoC3v2SsNm5EWKXW5lmaX3dVU2sXC4NKlmJD79A5p2wxJBsdNiTrBydwZLD15H8dCi0TEQftQKdrxi+Tdc45R0EtG3lLryOlUEsrH2KKlntN1Ry2Z3dwoTYHSlQU67o5y8QUb5tXjqjuIBpr3rZP9An4H4AYrFRdBQx5sk+X9neD7b8QLp2I13PaF1T7MBkPuMYz2DCZ9QmyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NuGf11f1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NuGf11f1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBcGv0KCqz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 21:52:53 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2165cb60719so29446425ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 02:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734346371; x=1734951171; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/IOYRGCuJyL4W5aS5tIFFhGj7u336MTqvrcn+JIIAm8=;
        b=NuGf11f1NOkivwYlBOBHIHFvEFG0WQc2Qf+mNmIfvOduLBSDzIeZvXs08Za2v3PprD
         GcR6FQnWy25l74YS1nJm8ParTblDBKvU8+8AEf6PqesJ//9jT/MiHgDPnJWE46+FR8iT
         b3+fXQ0eFHMm5Vp6BnaJ6t4dLxep+Lu+Nf2/y4D9fitCsTLahn40L1Ek6rHKEGCN7V4v
         Oa3EZztndng7VCCTRzEyvOaCdDBl535uf88qdFcZ+rL2BWYtrsPW0XIyGLmjeUeNccPl
         TM2Efsv3GX6F42jQqnRtN9yqe9ybWUYO/Gr/XqwSasmnLlA2Aa3+cFq55VJzjyFkghYi
         RRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346371; x=1734951171;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IOYRGCuJyL4W5aS5tIFFhGj7u336MTqvrcn+JIIAm8=;
        b=m0adEhPVcX2hNKXg3EO+i3Bm9uckgwocbHLXUo6fZpiJZ3QlWGPP9nHgYNsHhhcuhN
         U1tgW3V+JtDnQKhmHRdxmU4W+lUNYZMuqU6feTOUbtrsKHRoFHso6/dtSf1c4HatXeFC
         n6JWYeWdrq8FocRwXQAYX8yP9DiATFzOgidjp4CQ4X7YCEYYaWj8ZvVbZOBRuOqfo6Nx
         cpYzjwPjPxF9oJVTTAwz2UJH1r3sV/miepjDOM+RVg3mDO02bMe2dAA6c1ncLjChWGwn
         9cezYug/jBg14Axc20M9imfV5BxkPTuVXQGmCRKtIzZ92/zbo/DaLLk9vstu+Kgz5m85
         6TLg==
X-Gm-Message-State: AOJu0YyCZGP9298hDgNBXiKF6yoBAav0GngxTwrUrYmY/+4OJSdS5WCY
	RVvV8oJs1CM5snQdHe+Jy3UT5dlMBUNi1DuzWvj/SW4LoIBxCoY5
X-Gm-Gg: ASbGnctR2BWW4c1RhthSBCv4UIG6LOD6TpngTbjNOZMsPb4JukAVJmT1pVtTw88GIkj
	6sYrKZewhSgcuvK1AUgktokn4eLSib6Zupel5i4tmUdbZNpzshBMmzx8GMXZ9S+W2tdytVnvugh
	5SrwMhIpO+Yc2IwPEcEz17R8LDaZJZLiNapHGFiUvCLxq0D79Jb6BJG8+YeQh+KIesnhS5/f5yE
	nrHfBD6DBJD/kLN9J7U1s9VAYFkTF+oze1tKvGqwoIVPtzZeA==
X-Google-Smtp-Source: AGHT+IFJiAlnaF9JAZcPmO5jw8NyHNzP1w/c76TAR3axPfE/oqiSHzw63fHzw/0e/V7mrANpQjWIRQ==
X-Received: by 2002:a17:902:da8b:b0:216:4b6f:ddda with SMTP id d9443c01a7336-21892a20f71mr165923095ad.35.1734346370592;
        Mon, 16 Dec 2024 02:52:50 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb43csm40230895ad.64.2024.12.16.02.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 02:52:49 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 1/3] selftest/powerpc/ptrace/core-pkey: Remove duplicate macros
In-Reply-To: <20241209151418.348085-1-maddy@linux.ibm.com>
Date: Mon, 16 Dec 2024 16:17:56 +0530
Message-ID: <87pllr52g3.fsf@gmail.com>
References: <20241209151418.348085-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> core-pkey.c test has couple of macros defined which
> are part of "pkeys.h" header file. Remove those
> duplicates and include "pkeys.h"
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  .../selftests/powerpc/ptrace/core-pkey.c      | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)

.../powerpc/ptrace/Makefile includes flags.mk. In
.../powerpc/flags.mk we anyways add -I$(selfdir)/powerpc/include in
CFLAGS - so it will pick up the header files defined in powerpc/include.

It make sense to clean this up and consolidate the common header definitions
into pkeys.h header file. The changes looks good to me. Please feel free
to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

