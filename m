Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 810DE10CF46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 21:32:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P8T04SpMzDqCp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 07:32:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="J7X91QbV"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P8KH1RyPzDr7m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 07:25:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574972736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2FRKI5+6EDUKwn2QzAstv2u6dW0Q8/ilQLcz5atGxuE=;
 b=J7X91QbVadkgvT4zo5d7j6HP3NcO1WFQYGmogATwcnINpNAOaDzxqbQLWIxh6pYFOCfwO3
 +5ijEcM1+7jAVaPvCj1AxZ/+Gw/j382BLoTLtOkK/A3FlnESDeNyEDNlK7kNU5f+e4VLzc
 ZGyFz85ValuBB0gbUHyHTHQa/9ZSrqA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-IZk4VceSMNy7e-WThbJgzA-1; Thu, 28 Nov 2019 15:25:35 -0500
Received: by mail-pf1-f199.google.com with SMTP id e62so3506210pfh.14
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 12:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BgAr5VVOQXh1yien5qVgdgmIL5RHbScoYGF2ala0/ak=;
 b=WRgdBuIN4sjoMhEuzbEzziFA+GtLjWBvyhdsfT3Hj9VtAP6qY9kWCwsrgGsJUMQufQ
 2XAzUBXr+EQ2WAgBegiCOpVl33n1WEzgbXh7aClQ+O3BnjdiFFRm59gVvok1n8xd/2Ae
 7KbXTmgkzbdRkRYny9Sy7Y8qwTf8VuxRrFRX6qhgrDE6jfAU1gfdKwiB4rp221EI8DWr
 VtjFXZp0JIQzpV/Ml3AbSSljQhaxfGxhhb3dh8+7pGA5G7xj2D0Xte4/SFzsItP1+dFa
 ynGXJC96q8ue81OJterYfrUJ/TijBH65sIuJd0CmuTpg0WjgUClq6yafrhdi6una/0+S
 +IAw==
X-Gm-Message-State: APjAAAWu6QhSlbQjtEQJVwZsVwmZR+l+Dc/AKuJnA6kD7FWRWZHyILKD
 VRi8XyGu7FaqTjRScWv+NskRS6VGdQnxivugpn38Lm3zQ4pMM60vZWq+LVrQRNu5e3kNL1iRCa/
 GNQhoPjpLNI2brylrxy2WZmtf/g==
X-Received: by 2002:a17:90a:9bc7:: with SMTP id
 b7mr2779317pjw.72.1574972734227; 
 Thu, 28 Nov 2019 12:25:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGw9W2BseetWuCKGjOOk2X1gZmHcotzHkh3qc0nDt9y8frA3vEMk0c5zDGq7c6I7jA3cnCbg==
X-Received: by 2002:a17:90a:9bc7:: with SMTP id
 b7mr2779308pjw.72.1574972734045; 
 Thu, 28 Nov 2019 12:25:34 -0800 (PST)
Received: from localhost ([122.177.85.74])
 by smtp.gmail.com with ESMTPSA id hi2sm11225511pjb.22.2019.11.28.12.25.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Nov 2019 12:25:33 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] Documentation/arm64: Fix a simple typo in memory.rst
Date: Fri, 29 Nov 2019 01:55:14 +0530
Message-Id: <1574972716-25858-2-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
References: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: IZk4VceSMNy7e-WThbJgzA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, bhsharma@redhat.com, x86@kernel.org,
 kexec@lists.infradead.org, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, bhupesh.linux@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix a simple typo in arm64/memory.rst

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 Documentation/arm64/memory.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rs=
t
index 02e02175e6f5..cf03b3290800 100644
--- a/Documentation/arm64/memory.rst
+++ b/Documentation/arm64/memory.rst
@@ -129,7 +129,7 @@ this logic.
=20
 As a single binary will need to support both 48-bit and 52-bit VA
 spaces, the VMEMMAP must be sized large enough for 52-bit VAs and
-also must be sized large enought to accommodate a fixed PAGE_OFFSET.
+also must be sized large enough to accommodate a fixed PAGE_OFFSET.
=20
 Most code in the kernel should not need to consider the VA_BITS, for
 code that does need to know the VA size the variables are
--=20
2.7.4

