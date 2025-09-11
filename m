Return-Path: <linuxppc-dev+bounces-12031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78319B533CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 15:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMz2n4cXtz2yRZ;
	Thu, 11 Sep 2025 23:30:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757597441;
	cv=none; b=NV1+bvT0Bg+mHydqno/Lo6tHJrCnBu/Rwkug0PXaJysTUDHRsLnAaRR6S+fIwFwJzl7I5tAep5Os//1l1Zr5wFLuJSPIvvN7SVTKCWQqvC9EcA0tlcYadPGsqSNoPulZazpWpfBrxi7G1GvSfXxo2UXTgpKZkzNwTnzWQ1vgvJ1EuiLeH07Fx7W4JaF0K8GygvJDmr66KwADFauXHZlLkTGT7BgUEky180zBmMnd1pnpXjRUFqR9yAl8GPlm0k0bVH+Kn0K/o+RZTkdac3OmKiPbZv+YzsZxyzKao0ls3lZB2MkNH7UKONQMnQDny6VH+JX3cj2Vuzr8yBgOTme3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757597441; c=relaxed/relaxed;
	bh=aQlqSojSlf46BQjiH3sjU/ACFvA22QBgGPmMDQkag0Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cenWN9em6Vtbh2CiK2g6l0ZeENgfD1+Q90hC9LuskoPrXzyThoX6qG38lu7NUmdAus1wrG0DqAir1ZKoWxACJbVqe5IbFdBkNOguXGQ2lI6QAGi0QqRaa7uvO3j7QJIhezbxpYxdgcfXvkCE87WYq2ZPTWgqAXkt45e47I4HG414fRAZXaWgVmBXe5+qc8gp+btMwpfasysBVRaLcvw9irF3B1jK9978L2u7es7ug+0ZQl1+/D02xa6h6cHc79Q2aRP3x+uMMNCax6IL0rriegHc4wfc8tCwHwfwfDLL+TF/9MwoOZLOkKIjVpBPunnKDgTwvhDGD+xp2YXStNGsRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BWFqG0kf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=vernon2gm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BWFqG0kf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=vernon2gm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMz2m2NBBz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 23:30:39 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-244582738b5so5551585ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757597437; x=1758202237; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQlqSojSlf46BQjiH3sjU/ACFvA22QBgGPmMDQkag0Y=;
        b=BWFqG0kfaoi6uyt0VyyPlW7xzfhSQ/zEUVbzJCMn+aDBoXNcm+iRlk3QmFBagGcyuc
         FSakfMPXF4ShGaJtWWdPKQaL0dkwvz3Krb/SLXjIGn1UQCgp+yQLjnugUXjZIJ3jIXS8
         vpxJ68fsps8QOpFuFOu5fy2xTzH/X2+MXWAevAqGPY7sPj3EyfVvuti19ohAPFJDtExo
         iKdgp7XuKcCJeljk2b97+YdDHSpMERYhGKsUdUB5S04jQGTAzDGZU7S3UhSdiCzLOAEo
         P2RzDMaTCpiXe3iJCqPcFWltGYKklKEOb7bAjHMHAIfbVnRNJQ4LgRQ7RJ26eR38SC1E
         I+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597437; x=1758202237;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQlqSojSlf46BQjiH3sjU/ACFvA22QBgGPmMDQkag0Y=;
        b=YV2WsRjFQuxGYtSnvnvw2IYRc6ZLMJX0tAcaMCYoOpsKY0ehVF6K73k1aPBc/nOpbg
         UrtGz9D9xZZ77qEI/P8H7k+8EgNmmnwET4llpJioDOU8lx2EFpST/4g0Cpvl13A+XVT7
         BfJ9D15BxLLJDNsr/J6N75atN0pBCx1sih0qIWXBek01srilkcQr8RE4MB8If4pzyiFa
         1xPNyfRYsu5Rs0vqZ9vVDzN+QkqxqZVED1EuhSgBLMKAMHKQYxH9SweG0PgBzFNF3KUE
         aUUcjDe7bjHUWXqY2dZGBplD18h4MMRCXraHHgOO5gbIiGR6N07JEUdSo28T9PuYzXps
         o1sw==
X-Forwarded-Encrypted: i=1; AJvYcCUjswB0XPXVUzhSGwOg0+oET74nVK1UjC12ALCvkjv7GTQ6VVxiniR/kYWjsPTdcUeiiXmA4EMQUQyPNzI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxR6PcY9ABs5h4RPe2lzO0hkRzY/1UM/tiPIVTeb7GL1a57iMJ3
	oPrAdQMy3KmyDg8aPwGkotzh7+c515pAHb3rj1SLP5lmhvRjk1opnrRK
X-Gm-Gg: ASbGncuIssLA3asF7XG18dyt59C3CdNoG7oGtLZSCA/drArRc+1qU0nJWRUw+w1R6nm
	jXfeFYBGtPZDPJFuS4CbkZZWIkOk4aP3ilJfYcUUl3zVTxNfqBZg34Sr4q2gtmDI39WX7G8O+MR
	Gw+Ed/HmibUc89I0+Xif+sNgtwjwlS0eCYGSdgpxQre5nBHvQMbE3itqB1SIon0jBmK1bTsKDe8
	quG1pBe/eWWUmBsFmrvKL4w5XlCQR1lrnWRuf7fLq+bpBkDqpOwBY7jd3XIs6s2Lwi7WlHEyIbB
	3hbp3XDRKOix0LL8iVI6/uad8AdzjfNFMYXyuaj9/f4/gHMioNdOEYliwiiri1RO+FQKox2uUJ3
	9Ho86TnaxvMD2vCYiONTl6jFcNQ/XS6l7Ctw1AiUrO3q9iSTbJLDM1OvwwpCVdjr/ajiC6Ck+zu
	DRcHTGum21Lj/0U5h8nCFAZabsY/E6vIbFjg==
X-Google-Smtp-Source: AGHT+IEvq1Wxj+yFs910EdFrhvXlDsCmNs8TvQolpRuRoaPAKsaZEGIySdytgcl1djatf0VUcxyO9A==
X-Received: by 2002:a17:902:e886:b0:25c:a9a0:ea60 with SMTP id d9443c01a7336-25ca9a0ee09mr9586555ad.42.1757597436331;
        Thu, 11 Sep 2025 06:30:36 -0700 (PDT)
Received: from smtpclient.apple (n058152022194.netvigator.com. [58.152.22.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a772sm19067405ad.70.2025.09.11.06.30.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Sep 2025 06:30:35 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] PCI/AER: Fix NULL pointer access by aer_info
From: Vernon Yang <vernon2gm@gmail.com>
In-Reply-To: <20250904182527.67371-1-vernon2gm@gmail.com>
Date: Thu, 11 Sep 2025 21:30:22 +0800
Cc: Vernon Yang <vernon2gm@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vernon Yang <yanglincheng@kylinos.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <3CCB9A4F-3DEB-4E68-BF04-7063AC2E9614@gmail.com>
References: <20250904182527.67371-1-vernon2gm@gmail.com>
To: mahesh@linux.ibm.com,
 bhelgaas@google.com,
 oohall@gmail.com
X-Mailer: Apple Mail (2.3826.700.81)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Friendly ping.

> On Sep 5, 2025, at 02:25, Vernon Yang <vernon2gm@gmail.com> wrote:
> 
> From: Vernon Yang <yanglincheng@kylinos.cn>
> 
> The kzalloc(GFP_KERNEL) may return NULL, so all accesses to
> aer_info->xxx will result in kernel panic. Fix it.
> 
> Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
> ---
> drivers/pci/pcie/aer.c | 4 ++++
> 1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d716..aeb2534f50dd 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -383,6 +383,10 @@ void pci_aer_init(struct pci_dev *dev)
> return;
> 
> dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
> + if (!dev->aer_info) {
> + dev->aer_cap = 0;
> + return;
> + }
> 
> ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
>     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> -- 
> 2.51.0
> 


