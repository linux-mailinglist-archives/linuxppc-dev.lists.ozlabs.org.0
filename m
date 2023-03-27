Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A846CA492
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXjn4hXbz3cLs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:50:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fx1ImSpL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fx1ImSpL;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXby4qHsz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:45:50 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id f22so4187763plr.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzsWj+eiYcxcLoP7GVIK4WX+7kW2UTqsrzodaGYiHmg=;
        b=fx1ImSpLScjRgWY3kUgOn6xktNGpbpddsJWPjUXEwpfjYRZyKxfBn3FEd3K4usqAXN
         Afof64W69yr2jaAkSwSGaF92U/IuT7JGgYFVlDRXqpg07OYaFJFkAq7lRKnjJz6k63Tn
         DGxItozWjBYoG/7JVTlzpVml57RxmiBtKagVpyqpIrf959R1DFKa52UAjmU9JYQAUn6x
         KXqTUpM3ysRZyp3KFo6/jRJkrXxEHSsMsPGP+q4ms0WON3/S1MPeGHQSDqjjVOR/hijr
         RDzU6KWo6/2cni17lnA+nHemczxhWRLnwKfZt/91BI1+NoRWhVT9BxIdSU/N6GkT+Azu
         euhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzsWj+eiYcxcLoP7GVIK4WX+7kW2UTqsrzodaGYiHmg=;
        b=XBoN1m8184ooUrDDnTXUefIJ0MdwtKw6LonqpGgQsMyIkSov2NVMfi4PXhs07m9xDU
         ZNFK6rSmp6bePa5dErWOG0+zDgAfqXIjd7PFAYCk2KcOa10f0Su/p2xmjvRRNXXOxeQA
         ysvNzB0iekhSrPC8zPSdI3g67Cz6RT6YwyOFzan0PxbE2IN/GlHqHxxz7XnwiFVswy8B
         p072zMM39fglAoEJZ5N48ASw1pAroQ85vgNjQhvEYoi3yWikN+uUsGShC4vxTwb8TTRG
         jBUQQArP16+kXzAiODriYhK1jGNoRCgQ4l80qmU1rzoOeeRzx1C5YBAzfgeaSOHz3/vd
         CPjQ==
X-Gm-Message-State: AAQBX9fzJfLP9yiMO/BcHEF3TDlGtGZ0dKdLK83ioYE9MMNISESG88wZ
	gIPsuUxzp2oTsLh20uvyb3xGDMJpZoQ=
X-Google-Smtp-Source: AKy350bw9djJHToyI+OAtsOmMLKPafwZaaRIUttaH6uy+R+I/Ot4rFpt6ZmYb/iO2rdjX7BwqOjiRg==
X-Received: by 2002:a17:902:e548:b0:1a1:241a:9bd0 with SMTP id n8-20020a170902e54800b001a1241a9bd0mr12257194plf.5.1679921148694;
        Mon, 27 Mar 2023 05:45:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:45:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 05/13] powerpc: Add ISA v3.1 (POWER10) support to SPR test
Date: Mon, 27 Mar 2023 22:45:12 +1000
Message-Id: <20230327124520.2707537-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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

This is a very basic detection that does not include all new SPRs.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index ba4ddee..6ee6dba 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -117,6 +117,15 @@ static void set_sprs_book3s_300(uint64_t val)
 	mtspr(823, val);	/* PSSCR */
 }
 
+/* SPRs from Power ISA Version 3.1B */
+static void set_sprs_book3s_31(uint64_t val)
+{
+	set_sprs_book3s_207(val);
+	mtspr(48, val);		/* PIDR */
+	/* 3.1 removes TIDR */
+	mtspr(823, val);	/* PSSCR */
+}
+
 static void set_sprs(uint64_t val)
 {
 	uint32_t pvr = mfspr(287);	/* Processor Version Register */
@@ -137,6 +146,9 @@ static void set_sprs(uint64_t val)
 	case 0x4e:			/* POWER9 */
 		set_sprs_book3s_300(val);
 		break;
+	case 0x80:                      /* POWER10 */
+		set_sprs_book3s_31(val);
+		break;
 	default:
 		puts("Warning: Unknown processor version!\n");
 	}
@@ -220,6 +232,13 @@ static void get_sprs_book3s_300(uint64_t *v)
 	v[823] = mfspr(823);	/* PSSCR */
 }
 
+static void get_sprs_book3s_31(uint64_t *v)
+{
+	get_sprs_book3s_207(v);
+	v[48] = mfspr(48);	/* PIDR */
+	v[823] = mfspr(823);	/* PSSCR */
+}
+
 static void get_sprs(uint64_t *v)
 {
 	uint32_t pvr = mfspr(287);	/* Processor Version Register */
@@ -240,6 +259,9 @@ static void get_sprs(uint64_t *v)
 	case 0x4e:			/* POWER9 */
 		get_sprs_book3s_300(v);
 		break;
+	case 0x80:                      /* POWER10 */
+		get_sprs_book3s_31(v);
+		break;
 	}
 }
 
-- 
2.37.2

