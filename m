Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F32E9EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 02:59:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dq4442vwzDqSP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 10:59:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=blackgod016574@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rR6DVP6i"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dq2m5kTGzDq9C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 10:58:40 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g21so1813357plq.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 17:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=+73xvdlcJ2eRJCM1UROZ+oXQ5VEB4CGineXnjJmLoCU=;
 b=rR6DVP6iekA4Srk7Rc/isdvP+qxvJsUoGtrpYqRGyb91Nc7U1gGWmhu7cQP0uaz4tf
 Rzj3J1AILdzyLJuSQN9qSJTwrdc6ww8s161DFllflfKdms/JJuj/yLYhp0kpbcniI8MV
 FNN/p6wJ/ZzJg1tTeAvTIi7WROUBz+RHNd+8vU1o5N/VLF/6tcO1mA0dbMXxnAp641ut
 AKvubsGEhalc5JY459/1Layiq4LibuWFqrnv6GOti10fgIJu5V//+PS/lnkx1Fp6ZSJp
 kjqFKGxL2r+oJfrmLAAoyiwG7idmnGVHEqKghiAbtjHkxsvo7WFG4U/Ehl2NuBtjpBio
 C22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=+73xvdlcJ2eRJCM1UROZ+oXQ5VEB4CGineXnjJmLoCU=;
 b=amI0wQ361fhWARYvKsUbomC/5h9IOBOh83FOvfjWtlPOOF79dcgFDhsI2t+XJ3yrmY
 1o9s/r8iX12ZXNgE4qyHcC8LXECOv/ts85yi6uIaPc6P0ecgqAMw1qWpqqPdXIENqvkA
 qb53qWnWADDERIYEZr5O4ovfODozeZOOrl0alzjMjf/p8UmUh3uXuNakCZkLyHIoC7P8
 oY8QpJQB/1fNFgnTXQihacXZ400UvONWjfzAEy6pX3U/pQ50J7IzVXo/kCss1WNf53G9
 JKKtvH8EqXMk+HbrzD556wQMeLvGKbhH/hT2j5pc6Ax10okJOxfIP+E4sIs19eOi01qJ
 3DFQ==
X-Gm-Message-State: APjAAAVYOrKYvEVPt8uBhm/vaCy4vxeB50oM4y0hfeC6kzOYPEPhaE4s
 zppLPs2BmECwsh2faoYVc94=
X-Google-Smtp-Source: APXvYqyOEDUjVwZVh3I1SmKM6dFRgomEnU+HMaj4eKj9Hvhiu9AvpipD06Wl/aZe+Shq9nLaVW+Flw==
X-Received: by 2002:a17:902:9348:: with SMTP id
 g8mr957256plp.174.1559177917778; 
 Wed, 29 May 2019 17:58:37 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id u3sm857766pfn.29.2019.05.29.17.58.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 17:58:37 -0700 (PDT)
Date: Thu, 30 May 2019 08:58:22 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH] dlpar: Fix a missing-check bug in dlpar_parse_cc_property()
Message-ID: <20190530005822.GA5942@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In dlpar_parse_cc_property(), 'prop->name' is allocated by kstrdup().
kstrdup() may return NULL, so it should be checked and handle error.
And prop should be freed if 'prop->name' is NULL.

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
---
diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 1795804..c852024 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -61,6 +61,10 @@ static struct property *dlpar_parse_cc_property(struct cc_workarea *ccwa)
 
 	name = (char *)ccwa + be32_to_cpu(ccwa->name_offset);
 	prop->name = kstrdup(name, GFP_KERNEL);
+	if (!prop->name) {
+		dlpar_free_cc_property(prop);
+		return NULL;
+	}
 
 	prop->length = be32_to_cpu(ccwa->prop_length);
 	value = (char *)ccwa + be32_to_cpu(ccwa->prop_offset);
---
