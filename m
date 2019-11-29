Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC3910DA77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 21:10:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PlxM1VddzDrFr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 07:10:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="B8Qyy3Zw"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Plj16CtgzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 06:59:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575057587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2FRKI5+6EDUKwn2QzAstv2u6dW0Q8/ilQLcz5atGxuE=;
 b=B8Qyy3ZwqX1aKoo9QY+0r/F4xriA8glP+aBdWc4fGEKWl7zFQP9mtmf1bQ1TCkZaKATqgF
 UG3gBc0yRgdaoXAYJy9C2UigbTFr0MlMjndq11X/gZW+wFDvV0LJoqJqOpidQ23+niT2fZ
 pyed1rdA0fF4UCSBEop9ba9XcK0Qf7A=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-a83V2uh9Mn6gXcEMkXHJQQ-1; Fri, 29 Nov 2019 14:59:45 -0500
Received: by mail-pg1-f199.google.com with SMTP id e16so17050039pgi.22
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 11:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BgAr5VVOQXh1yien5qVgdgmIL5RHbScoYGF2ala0/ak=;
 b=KTCjOD0Jk/OxxkgvAXDOOzbznZxhtf5PhWKSaGV9YZhPBxTrK60g43yp/k1Fc4DEXu
 7ngLpcOrCJq2Pta5LnIalMybVsz1s9f/evwYKTKncHHRM8QOKtzNmXZ0T30bIdHjPpew
 hVkxGaE2Exm31D6Crq+iA76QYDZ8JYThDXFCX4wi97z/ATAUZB0KasMH/UUCCWQEcNSE
 lPMh16lGhEeEJtJ0K8qUUbJHFGZ+xjjODV7dvADi5HP7bXpo8HZZjK51S7QrH8oF5T1z
 Q7Qj6ttPC0hgE/99mgDL3qnEc6JgY+3n6YSSKMmDzq1RZrhEs1sCZVOP6PRh3zYOzspM
 8GfA==
X-Gm-Message-State: APjAAAWmHnNKsWDDxzd83SI1OhFpctQBj+RRDUzW5KWmbFAVnsWFaW0w
 ioLKgFIcgaz7mArE9S3EX0/NF3H+WhpeVkuDhPNReeIl97aHG4yOPheewPNvrwVP+84Glfd9Zc8
 A1CGgpq9tRXVqDYhq0XL/Xuy98g==
X-Received: by 2002:a17:90a:fb53:: with SMTP id
 iq19mr20314629pjb.138.1575057584293; 
 Fri, 29 Nov 2019 11:59:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4gnI9c2bYrtjkLwMhPYvWHvZw+YasEX6lAkryf7HpqeVi2n8s5GR/Ai2re8lnbcSS3E4aLw==
X-Received: by 2002:a17:90a:fb53:: with SMTP id
 iq19mr20314608pjb.138.1575057584113; 
 Fri, 29 Nov 2019 11:59:44 -0800 (PST)
Received: from localhost ([122.177.85.74])
 by smtp.gmail.com with ESMTPSA id 67sm15725427pfw.82.2019.11.29.11.59.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 11:59:43 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 3/5] Documentation/arm64: Fix a simple typo in
 memory.rst
Date: Sat, 30 Nov 2019 01:29:17 +0530
Message-Id: <1575057559-25496-4-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: a83V2uh9Mn6gXcEMkXHJQQ-1
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

