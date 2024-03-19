Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D25887F922
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:13:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTW132GW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPcP18sdz3wJ7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:13:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTW132GW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPKn58rVz3vZK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:45 +1100 (AEDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5a46b28a77dso3015228eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835242; x=1711440042; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56iBudlm9U8d1gus42bi1dKHG12FVRnvk/I1w3JRqyc=;
        b=gTW132GWCPpwozDNi9hB6+1wtGLj7QATdz/yqSJ6rXXOvq6nSZOedT2QKfYACHFDzY
         WSJGOR6Grr+0yiq4XV2kWFAwpfgZk5KRP/uoe8UlRA/H78vBSaHuAGmmdeEXzsruAKmH
         dqAkTfE919aX0ZFKPMTREnTXzy1PVH7cplNUW42aEFNkkcuGYU+qS16eG5Z9+C2dc+OM
         oNGtXVajCLQwOrJGvEt/PjJiTekNw8siONmR2NA3vCBYpDUv8N9E2nSk5L5VKy5loeJE
         7vZYOyQ7SUNrEonWEQT/UR/AnutsCIgpAjy3Wjo5ytvuZMszFkDQiUMEsn/efRuAnVZB
         yAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835242; x=1711440042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56iBudlm9U8d1gus42bi1dKHG12FVRnvk/I1w3JRqyc=;
        b=KiG4D6e5yg/G9JaJqgzRma0YAsSxMa0kEGWf79C86QVsQrioYXALWJPduEjOUe0NpO
         b5WzWyTmPOfu8mfeyuYnYue8zNmw4A1jnjUah5JyGER72TS3BCgjvuX3HUVbchjOVk/M
         /3gK0DmaiouR0bUaPbxva1rUfkDtH4OpwWCawFZ5v+vSKldG0sbcQhJ7VMUvViS6w0nb
         SgTxg7yUdpxuE6YBkJIV1cDUTO/bohm6GO0FkWjP1IswXKpy96OmbK1Bnc1OGeIBYG+N
         ALAzflKYUAIGd/jzHQXH57KM2E7FS7oXMmUXlJLwynAuZPNt1/pPLaUdcNdrX7GMugfc
         jFJg==
X-Forwarded-Encrypted: i=1; AJvYcCU47WIDVwxTW6ETvshfHCz+sd8u0oeNK+jZwJ47t1eaK3XuuG7yOsyKfLon91CWlkeuPTAus3aiO95EMgPw2Jl4c9mMLHeJ7XDKwcuiOw==
X-Gm-Message-State: AOJu0YznneTW9KqwJ4/J9qhpV++cmIYN/AObozTDJxcex7h/UT+uRAp8
	uTUVycpVOZ66fS9yc7kUAZc0CXf/IBar3XfTRVG3ER2P3+LdwQAc
X-Google-Smtp-Source: AGHT+IENcluRYOn764yX9kdrqhDitabVcoLdDZNFBA6m80FQCe8kH+MHmByOwdqnFMJLcUcM2UVYxw==
X-Received: by 2002:a05:6870:40c7:b0:21e:b2ee:75a4 with SMTP id l7-20020a05687040c700b0021eb2ee75a4mr1948697oal.15.1710835242665;
        Tue, 19 Mar 2024 01:00:42 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 18/35] powerpc/sprs: Test hypervisor registers on powernv machine
Date: Tue, 19 Mar 2024 17:59:09 +1000
Message-ID: <20240319075926.2422707-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
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
index cb1d6c980..0a82418d6 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -199,16 +199,16 @@ static const struct spr sprs_power_common[1024] = {
 [190] = { "HFSCR",	64,	HV_RW, },
 [256] = { "VRSAVE",	32,	RW, },
 [259] = { "SPRG3",	64,	RO, },
-[284] = { "TBL",	32,	HV_WO, },
-[285] = { "TBU",	32,	HV_WO, },
-[286] = { "TBU40",	64,	HV_WO, },
+[284] = { "TBL",	32,	HV_WO, }, /* Things can go a bit wonky with */
+[285] = { "TBU",	32,	HV_WO, }, /* Timebase changing. Should save */
+[286] = { "TBU40",	64,	HV_WO, }, /* and restore it. */
 [304] = { "HSPRG0",	64,	HV_RW, },
 [305] = { "HSPRG1",	64,	HV_RW, },
 [306] = { "HDSISR",	32,	HV_RW,		SPR_INT, },
 [307] = { "HDAR",	64,	HV_RW,		SPR_INT, },
 [308] = { "SPURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
 [309] = { "PURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
-[313] = { "HRMOR",	64,	HV_RW, },
+[313] = { "HRMOR",	64,	HV_RW,		SPR_HARNESS, }, /* Harness can't cope with HRMOR changing */
 [314] = { "HSRR0",	64,	HV_RW,		SPR_INT, },
 [315] = { "HSRR1",	64,	HV_RW,		SPR_INT, },
 [318] = { "LPCR",	64,	HV_RW, },
@@ -306,7 +306,7 @@ static const struct spr sprs_power9_10[1024] = {
 [921] = { "TSCR",	32,	HV_RW, },
 [922] = { "TTR",	64,	HV_RW, },
 [1006]= { "TRACE",	64,	WO, },
-[1008]= { "HID",	64,	HV_RW, },
+[1008]= { "HID",	64,	HV_RW,		SPR_HARNESS, }, /* HILE would be unhelpful to change */
 };
 
 /* This covers POWER8 and POWER9 PMUs */
@@ -350,6 +350,22 @@ static const struct spr sprs_power10_pmu[1024] = {
 
 static struct spr sprs[1024];
 
+static bool spr_read_perms(int spr)
+{
+	if (cpu_has_hv)
+		return !!(sprs[spr].access & SPR_HV_READ);
+	else
+		return !!(sprs[spr].access & SPR_OS_READ);
+}
+
+static bool spr_write_perms(int spr)
+{
+	if (cpu_has_hv)
+		return !!(sprs[spr].access & SPR_HV_WRITE);
+	else
+		return !!(sprs[spr].access & SPR_OS_WRITE);
+}
+
 static void setup_sprs(void)
 {
 	int i;
@@ -461,7 +477,7 @@ static void get_sprs(uint64_t *v)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 		v[i] = __mfspr(i);
 	}
@@ -472,8 +488,9 @@ static void set_sprs(uint64_t val)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_WRITE))
+		if (!spr_write_perms(i))
 			continue;
+
 		if (sprs[i].type & SPR_HARNESS)
 			continue;
 		__mtspr(i, val);
@@ -561,7 +578,7 @@ int main(int argc, char **argv)
 	for (i = 0; i < 1024; i++) {
 		bool pass = true;
 
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 
 		if (sprs[i].width == 32) {
-- 
2.42.0

