Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7396C0B15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:05:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg5Nc3RT0z3cC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:05:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kh1EYrYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kh1EYrYa;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5Lg1fpXz3bm6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:03:54 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso11341143pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679295832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5PF3sqkFmxXngJQJQHQ0RIO725f9lA9+mqcaHUiq3c=;
        b=Kh1EYrYamt/CU/BWMDEotcNXoaE3D8KsDeFv2RPQxsT1dCLE0RIQVuu7qHd1yRQhKY
         yR0htgul6y3HUSxgbEa1lZ1o6S2p9g6nEAa5WP0xxtquOwqW9O9IkpLVmQqNSiQzW+l+
         eYwhPLa6ZKWTRMjU6ZYQDdZNBzI/dKuJjpcdvUmlLdY4ZLYFUzxGjXIhyA82YyqEf/B2
         B2Wb9i5Q/kgaio8yioK3tEoXfclrT+71zMffp2jVwM2ICj5KA5YdCZIHLJb9ECe53I6Z
         4P4niikC9zG3fOCDTagQ5q0wVCZweU7Ged1W8cCNd/CpkpVE7YbAA95nU26Jyghb1Te4
         aJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5PF3sqkFmxXngJQJQHQ0RIO725f9lA9+mqcaHUiq3c=;
        b=o16aaqtMNR6oweNhJ8dvir3ZThvtx9sWby+09UDt5Uv8oPw1W9bf2uJ/3aq8uFY33N
         H97PL7zN9YcvXelADAo8+8pKQ+OpR5qPgDYUhoVQR3eqioQODgmGklWX+rrzsLLTaIRS
         XqU2PVzF4J/XzepKPDzr+wBP/W+rdG8jequF3TnmBcdb0QYKIgj/SW225KKZt3cnjnTh
         z22YC7TNMSVLyYhrN+BK+UkiU75hB3wymGic5/t3etCN1gm6Un3TYus4HLxMxgcUuKCU
         o0ccsol/u7/IIKkH5B88TTpAcynFEivkLO965rBSMvjWV1pcaNlwhUlclViKUXaCYedA
         iyDg==
X-Gm-Message-State: AO0yUKV/nFDDZP+Foku/ujy4XwfRzuGO4poum6VJfLx4j+Aee/1zcs8q
	1CsmaQdXEfKObWwVQKdi4ZRrUAlALfs=
X-Google-Smtp-Source: AK7set8ITskZVGXO4N98vL/NAW3CoS9AAbk6UAN1ecdRjB3Myxm+U2Cn0p5sO+iUsxrX8gtzowstFw==
X-Received: by 2002:a05:6a20:609:b0:d3:c972:9a83 with SMTP id 9-20020a056a20060900b000d3c9729a83mr13550453pzl.56.1679295832063;
        Mon, 20 Mar 2023 00:03:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a632b11000000b0050f7f783ff0sm1039414pgr.76.2023.03.20.00.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:03:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v2 01/10] MAINTAINERS: Update powerpc list
Date: Mon, 20 Mar 2023 17:03:30 +1000
Message-Id: <20230320070339.915172-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320070339.915172-1-npiggin@gmail.com>
References: <20230320070339.915172-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM development on powerpc has moved to the Linux on Power mailing list,
as per linux.git commit 19b27f37ca97d ("MAINTAINERS: Update powerpc KVM
entry").

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 649de50..b545a45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -79,7 +79,7 @@ M: Laurent Vivier <lvivier@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Maintained
 L: kvm@vger.kernel.org
-L: kvm-ppc@vger.kernel.org
+L: linuxppc-dev@lists.ozlabs.org
 F: powerpc/
 F: lib/powerpc/
 F: lib/ppc64/
-- 
2.37.2

