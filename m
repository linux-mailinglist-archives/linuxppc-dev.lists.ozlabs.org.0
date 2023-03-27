Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5FB6CA502
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXt83n05z3fwZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:58:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g8nZvqhQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g8nZvqhQ;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXcS3KqMz3f6K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:46:16 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so8665020pjt.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsaua7blaj4slx6G/pjAPsZzllQw2eT67bEuq+/vhBQ=;
        b=g8nZvqhQ81DeWCAYCmHwXEWwlZ8oG143q7tCezhLiol6BeuJT0o04oteNXda+H/6h4
         lXDEXnGBxGTV/FnWlDzBiF2Cdb3lkGpiBy4aM2C+wJiVWmtlglKRa6GAKpVNJUnztRSX
         PEMTz9T+0GHD++ivGp6hWcC5Uwe2DKuR9GVo8fkfwCOyB2x2NA1f5SlmUY9n+xpOKwa+
         +p4GpButq2nsLe/U48JpdOOyaYBUF6lAZBiT+MjQbNicyH+8aA3KnyJSVUxDyelVeaG8
         9PaZ78ft0jQly+8ZjpItSYEkqWTBRih9fer58PdU5fbDxu4zht9N114I3JNDqxMi6hgH
         6qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsaua7blaj4slx6G/pjAPsZzllQw2eT67bEuq+/vhBQ=;
        b=ZZkbSZmZJSOuw74j+wp9+p3q0eEuFp42WTb7SD3uyhuBoD2oW51L2psopgGY8PbT+q
         lyjHyktXR7E+aQt5x0jpw7ntj20L/wfHODCKSRlGkx+w1rqAE9mq2NlKjUaGDDzBZjmW
         WlWn6H3Ngl7pUewohMyqpsghFrElh5+Kf104k0LdtbHK5uAayGFfuQG3fQLyb6V5d3aX
         C6/VED7sCHzPVV2SxgEsD13t5wjXZz/kKzoRBTHchkMkf9xsAS+WhVbTBSabnZpOTnB7
         VHmdkZ9Ni53RVHPWANgbThT1ET9PXOXRDsf3oK7QpUCy5Mu3vtclSdZU1Ks+bxzxBc5W
         r1ag==
X-Gm-Message-State: AAQBX9cD8Cs5XJaLPWsTtH3P8bbhBr+HOiAGt/pfbE6KQmcf8/6XykoH
	L6nLE6Alko98cXfg6SWSmL3x53jfcZA=
X-Google-Smtp-Source: AKy350ZqqCNhdHy5dN7TneKop3XAUuoIVIYVPdueQWnxdb6dRGyf+T+HmPK9JaTmoSlKRtvf+OA9fw==
X-Received: by 2002:a17:902:cf47:b0:1a1:a830:cef8 with SMTP id e7-20020a170902cf4700b001a1a830cef8mr10258979plg.27.1679921174465;
        Mon, 27 Mar 2023 05:46:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:46:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 13/13] powerpc/sprs: Test hypervisor registers on powernv machine
Date: Mon, 27 Mar 2023 22:45:20 +1000
Message-Id: <20230327124520.2707537-14-npiggin@gmail.com>
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

This enables HV privilege registers to be tested with the powernv
machine.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index d566420..07a4e75 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -199,16 +199,16 @@ static const struct spr sprs_power_common[1024] = {
 [190] = {"HFSCR",	64,	HV_RW, },
 [256] = {"VRSAVE",	32,	RW, },
 [259] = {"SPRG3",	64,	RO, },
-[284] = {"TBL",		32,	HV_WO, },
-[285] = {"TBU",		32,	HV_WO, },
-[286] = {"TBU40",	64,	HV_WO, },
+[284] = {"TBL",		32,	HV_WO, }, /* Things can go a bit wonky with */
+[285] = {"TBU",		32,	HV_WO, }, /* Timebase changing. Should save */
+[286] = {"TBU40",	64,	HV_WO, }, /* and restore it. */
 [304] = {"HSPRG0",	64,	HV_RW, },
 [305] = {"HSPRG1",	64,	HV_RW, },
 [306] = {"HDSISR",	32,	HV_RW,		SPR_INT, },
 [307] = {"HDAR",	64,	HV_RW,		SPR_INT, },
 [308] = {"SPURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
 [309] = {"PURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
-[313] = {"HRMOR",	64,	HV_RW, },
+[313] = {"HRMOR",	64,	HV_RW,		SPR_HARNESS, }, /* Harness can't cope with HRMOR changing */
 [314] = {"HSRR0",	64,	HV_RW,		SPR_INT, },
 [315] = {"HSRR1",	64,	HV_RW,		SPR_INT, },
 [318] = {"LPCR",	64,	HV_RW, },
@@ -306,7 +306,7 @@ static const struct spr sprs_power9_10[1024] = {
 [921] = {"TSCR",	32,	HV_RW, },
 [922] = {"TTR",		64,	HV_RW, },
 [1006]= {"TRACE",	64,	WO, },
-[1008]= {"HID",		64,	HV_RW, },
+[1008]= {"HID",		64,	HV_RW,		SPR_HARNESS, }, /* At least HILE would be unhelpful to change */
 };
 
 /* This covers POWER8 and POWER9 PMUs */
@@ -350,6 +350,22 @@ static const struct spr sprs_power10_pmu[1024] = {
 
 static struct spr sprs[1024];
 
+static bool spr_read_perms(int spr)
+{
+	if (machine_is_powernv())
+		return !!(sprs[spr].access & SPR_HV_READ);
+	else
+		return !!(sprs[spr].access & SPR_OS_READ);
+}
+
+static bool spr_write_perms(int spr)
+{
+	if (machine_is_powernv())
+		return !!(sprs[spr].access & SPR_HV_WRITE);
+	else
+		return !!(sprs[spr].access & SPR_OS_WRITE);
+}
+
 static void setup_sprs(void)
 {
 	uint32_t pvr = mfspr(287);	/* Processor Version Register */
@@ -466,7 +482,7 @@ static void get_sprs(uint64_t *v)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 		v[i] = __mfspr(i);
 	}
@@ -477,8 +493,9 @@ static void set_sprs(uint64_t val)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_WRITE))
+		if (!spr_write_perms(i))
 			continue;
+
 		if (sprs[i].type & SPR_HARNESS)
 			continue;
 		if (!strcmp(sprs[i].name, "MMCR0")) {
@@ -550,7 +567,7 @@ int main(int argc, char **argv)
 	for (i = 0; i < 1024; i++) {
 		bool pass = true;
 
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 
 		if (sprs[i].width == 32) {
-- 
2.37.2

