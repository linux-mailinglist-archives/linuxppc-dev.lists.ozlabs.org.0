Return-Path: <linuxppc-dev+bounces-14882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E80CCD058
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 18:51:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXJBQ05Xjz2y6G;
	Fri, 19 Dec 2025 04:51:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766080285;
	cv=none; b=KR/4RGoAYsefwETtMQpy3uMGH4n44lVrwx4TmcVKhkkAmCA1NuAqDWUPDrVZr+JaoB6z6uqI8gePz1uKcW1Uzo7ADwrjd/A43OoNvhVSgvM2VBsqAt8wbE3HvDz4xn6qUKoVkUddIiHh9Zllsli/1VES/auHDB0bdCD7IRlMyrdJfKlgJ6BhJknoqSfiRdgador166Syi4P5zTQIEmWwbpabsXU3qq2Ux2dMMffX2CPNAFPo/QUjN4rUcoJU1rk3LbNhpRF1wwcq5rhPFcRBGP/rFD3ife7i2Hlxp/ztGh+1bKMNkuuAFv2F3QzMXPxd8U/Znh1l0zIj4tWboLA3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766080285; c=relaxed/relaxed;
	bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK8s2H/O3Hr9Ch+rQ7sstZ58g96+716pKdAXmuSJoYcvf6dSG7piDZbYLdiFsHK/e/MoCURAHg5Usy5HOsK8M90hsgS8uZipL7aE5Lte9hvK5CJMDr+BhHKb5buHCib0V09PH6/sMd2Z6y/gBox8+IYMAMk98nH9bxb8mVKaw9JuFYNIof4FMHWV9BOjFr2XjdbxIGXDMtg1sLfmAwMnXlAtDe9rKv1I65hDFhN9gLMKQ27//u8rFCk1lrCBvfAbf90yV1swkaXgUCi0K9BDN2xlpI1V0R7QiTnvMi7k5OOvNXsh5/jD6ICg8DUxxJRzUqXKiYdYPmj4wAKko841OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=GSM77Y4a; dkim-atps=neutral; spf=pass (client-ip=209.85.208.46; helo=mail-ed1-f46.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org) smtp.mailfrom=soleen.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=GSM77Y4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=209.85.208.46; helo=mail-ed1-f46.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXJBN75kmz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 04:51:24 +1100 (AEDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1385813a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 09:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080222; x=1766685022; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=;
        b=GSM77Y4aTPyTAcUE4dKW2BtUfyFk8jI7eX2GcE1bmluBnJ/oqdgLehR5cD/iQm7XH1
         qI8mc5UR674U67l5E9TLdW7wYSYheOavDDn2Xi9LAji54Oh2YRQTqSevewtmeogRo9cy
         e4vfRgeTqCExaOE5D4mol4e34wsc5MxbZjQeTl6iJMcHBTSJdcQ4kmBeXR3MagSva0/J
         urVibrHQM80CwqcWAFssO2xUMlh3u9XN9hNL1U/sL4fscFFevfc52k40IaaBQH0EPPjP
         HjQ2lPP3Jkn7AbEOyXubwV79IQu2+jb3sqy84kU3BOB/KXBMZMqmr7OMkNtwixaXnhJf
         aHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080222; x=1766685022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=34kJXR8Z1l9xoA5XQbc7lSV8iSBzpyKM6gKf5HXGiIw=;
        b=XSFEU5aW+HzDL8G7DLn6iMcOtZgxBiWEV/kxEEQiGHx71uI/oXAbMCzusLtpaAGul0
         pfcu4s/3xqgW46ix/zcqnQ2XWZnFNKx6NJ74/z4bH0pkWcmZWDWVIOc28EwP1to6RiJw
         vKcsbgBDdxnbAzR042+w2AuylKM88mb4uKJ/LKqbA7/xNZQCLnG6ThJ17EkQfe8ZoE49
         QCPS1p0Kb2q72pkgX2iGb6upwH6P+3xDWclclYsDd1lEth4BYIE0OPxiWN1kFDasKAvM
         43AM5nDUAqsjpur6z8HX7pDRucGbkG2wjgvn1Wa0YEL9OaLMffY7K8H1SUiq0lWFLpk6
         LSXg==
X-Forwarded-Encrypted: i=1; AJvYcCWRVEUwoz9URFaV1x/dVMDVannXgsifoAmd3LNIb7YesSTKAkrkWXhWR6nEFME0BiGFs8K5INf//ZSzBfE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyvO1Zm8NWjglo3WnqPEBv3HYridxRzCi0CNJwDmychZ0867mPK
	jdZgxQ9R+/BKHyHFd5/L/ij5p3PL57eykwRAnNYsM/p4hB3KtTnRmu6DQKKGlkB+fzpfrpInCZe
	if4GikjlNi5w7G+vFhP2RsdHGUU5yGcGia2BVOpRq8Q==
X-Gm-Gg: AY/fxX7IDwjuT9nC8qZuDvS3CN10vPd5+Tf/hcP2jX7LNpta9hZtBhcmYCPxrZFa06k
	Xq1cjqe3JLIDGosaqh4OCTTt/xJocfVog8IHOJ2aOJIs6Srh0bcOXXiPlmvxCeNho4jHgos3DXw
	N5Ws8blcAQaO3waprFPfWCO2pI/ot2qwY8QUmcITeXMZwfwAFIBSMD1IWMnlqzzPGVBibqx/A04
	2JBxlyr2ey1cBKLvnPBh2nFrsxdTiLJruhYV7duQP8UdXcf712HhKS0gJ5lBFhsdHGdT3qMzpRX
	DyovLfl4Qz4C1EibpZbfsnKg
X-Google-Smtp-Source: AGHT+IENlmR0sc0Xb7DhLwn0Vq765F8OyXjE3fAqqAeGP9hcTJDm+HMWSnu0fNRLLx3SXw/1GBSLkwKC99ivJnubJVM=
X-Received: by 2002:a05:6402:34cf:b0:641:15d:6b97 with SMTP id
 4fb4d7f45d1cf-64b8e94713bmr224102a12.2.1766080222160; Thu, 18 Dec 2025
 09:50:22 -0800 (PST)
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
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <20251219-pgtable_check_v18rebase-v18-2-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-2-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:49:45 -0500
X-Gm-Features: AQt7F2oazAcKk3yq-_8d8SYNXUmWrpPknuvuaCQSw2vGEhneFPgafk9uUlx-JHE
Message-ID: <CA+CK2bD2FdFdM+=tcvf6L2x-j=b4HnixUwf4irWp-eNwQUeFrg@mail.gmail.com>
Subject: Re: [PATCH v18 02/12] arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 18, 2025 at 12:10=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.co=
m> wrote:
>
> To provide support for page table check on powerpc, we need to reinstate =
the
> address parameter in several functions, including
> page_table_check_{pte,pmd,pud}_clear().
>
> In preparation for this, add the addr parameter to arm64's
> __ptep_get_and_clear_anysz() and change its callsites accordingly.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

