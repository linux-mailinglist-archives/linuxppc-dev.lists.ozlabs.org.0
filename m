Return-Path: <linuxppc-dev+bounces-5278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF9A1193D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 06:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXw6N39qSz3bYd;
	Wed, 15 Jan 2025 16:49:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736920140;
	cv=none; b=M3iAS6z/3u4ysiEGB/Uo7N3XZ25TKgHCSzhTuYn1zVQKXkYqsdKnKfCk38XpFN8cUmb3SESTfJ6MAG1q3Kt55NOhfkad3Tk3Hy2KCGnRBF9JYEIGo23BlEhB/Edn4wUFEBB5wdsgaXh8ZyTrYQkRUiRYTortu2X5Osz9DKjT72vOeH9K4FDJoQvv3u7UrId9HzBPT0XWiK426Ld4/TIOJBgWSfHmDCVREGzT6N95/sM2P6iZ+EwZA/uqmbEiv4RpaU9di0QlGTqsVqWrE5BvUhHJXqhPxqbeOn5EPSufmpvzVkmQd/RqNO3XYTm283m2wwqGm6JLTvv4hz6t0+aBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736920140; c=relaxed/relaxed;
	bh=I4SRmWOkQdk58NJ10wmqwv5TrRHdqCAxdQV3fT7eobo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ryd9NU3VGsPpg3XWE4S03jSOgn1BCN8FhtTEKItheczUwdknHsXtp0nfivP/8uh1KPxbIzH/IWpJwWsoCM6GlHHbvBWA+y2Fyw6tTSz+x8OMN367sc4EJfayR2VJ9THLtOVyaaQ+KbgqxNHx/jx7Gr7dmXEKWfRowEXggRtjjI1WHJn9Se0vCW7kUYkF8hifGKmLHlsIMPhgebFXMizwlSdsheETbe1GJ9w51YCuaBM2CU9mKHdc6P8wQucdF/EtdZyrFU+GU+uvJyEKW5Qy0aYvtJM+iMq+rWKv6gqT9CA89TkaDWyPgDhkmJO5XkkFpE6kxUOGXWKarI0HLI3+8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=GqYrMHJF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=GqYrMHJF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXw6M4GYNz3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:48:59 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2165448243fso137570015ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736920137; x=1737524937; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4SRmWOkQdk58NJ10wmqwv5TrRHdqCAxdQV3fT7eobo=;
        b=GqYrMHJFecqa/I4OtGlFgH48C/hLMCyhWNbZwlwb381fJc1vN5HuOeGGbeqNtqJDVd
         UAUTYCxPXoYHGswYd9BPiiIGzIuGVusg+J3ImJ19LrVihfgRugpPuh8I3TlzOqYYB8TR
         OQMDcpGaKAl9NlG5Mixj90Vs8HYp5A0l62QCWUemct6eLKN0fhrknrzY3OJgKwJUNiCQ
         HwIW3LV3EgVglgP3Q0QPfwpJR/5749sGHgm6emQuXilJGQJInnsPEYdkLIk2SBBnk1Tl
         YpSp1y2PyEEsKoL8qMhT6QMBuw/jndX6tz4eKKjfQAo8yHLK94Vp+extg//cog7wfNy1
         92sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736920137; x=1737524937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4SRmWOkQdk58NJ10wmqwv5TrRHdqCAxdQV3fT7eobo=;
        b=VR1JIzsbaH3iIMhULW18oL55bi9odCAqFfknRHBYk0HWVKDRXOg3Qb7l5Nn9Q+t5aY
         2sPzag2Gnvp35NXUs1ezxK+8GwUURqkpLemsaZn0gJitAMhQNBWLIgvNuSRctBWR0p78
         A6F7sJZQHhoN0E0Ct37tq3q26j7RwKnsaeELgPpJGnePfboqi8H8T+8gUI58s+GjKp6Z
         uqMP65L6MVv0f86VqiAccEWnfMtVndEREKUS6DnFkj1xiXDyFKIzQXoC53PaL3EM02J6
         jJ/NL02GXteTAPZTHsxf2NnTUye7AzVEfESbFJSi/iTkG1lnDr6oM1zCSV9g7ZzWLQu5
         adGg==
X-Forwarded-Encrypted: i=1; AJvYcCXntA1R8DPWljKkG2oTW7a/GE5/+3o7Tv02zxaxCmMBcwgKkFVz85etuLEzvXJ6fagkPryaMwbc5aJxhrw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVotwTP3oQQRjIfXK2t2jrh8opYD7qRCamMdmfzpspG2YUrnec
	hTXZjJCqv1q/pMNLMb7gjLaINflqBAZRdk9g00Sut22wF30RmxqtCUVB7+iS0is=
X-Gm-Gg: ASbGnctoombZmLWezeWl8ekagHYbLnHMrO/woNMRRrqGSe07V7aoT1lMYq/Tjhkk55J
	itxbVSTED0zLsY6VsHQSQMW2bgxTEEzRv+GsiLuM5po15WufyJkUli28imBNtbfX4Xv2yeRYwIs
	j3iUs07lvqiIJyrJQmanFTAKvphM1pWikLYSFNaXAyDftMOmgGXWLDhiUzcZrxYQ8k/t+pkK+rc
	LO2mqhI1sQbgFnAdDC/QciG7l0iEbzZX5hVLAv4Ix+0PsXX+0hCbCzzbU8=
X-Google-Smtp-Source: AGHT+IELo9CjdL+yrG4BCg5jbLzJxkebkveFvc3aZpHyweclYXLk3OeSuIMKxGoccunx18mtoTdJlQ==
X-Received: by 2002:a17:902:f644:b0:216:48f4:4f3d with SMTP id d9443c01a7336-21a83f56bdfmr398040455ad.13.1736920137397;
        Tue, 14 Jan 2025 21:48:57 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f111b82sm75035235ad.35.2025.01.14.21.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 21:48:57 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 15 Jan 2025 14:48:00 +0900
Subject: [PATCH v5 3/6] powerpc: Use note name macros
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-elf-v5-3-0f9e55bbb2fc@daynix.com>
References: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
In-Reply-To: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
 LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use note name macros to match with the userspace's expectation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Dave Martin <Dave.Martin@arm.com>
---
 arch/powerpc/kernel/fadump.c               | 2 +-
 arch/powerpc/platforms/powernv/opal-core.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..d44349fe8e2b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -751,7 +751,7 @@ u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
 	 * prstatus.pr_pid = ????
 	 */
 	elf_core_copy_regs(&prstatus.pr_reg, regs);
-	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+	buf = append_elf_note(buf, NN_PRSTATUS, NT_PRSTATUS,
 			      &prstatus, sizeof(prstatus));
 	return buf;
 }
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index c9a9b759cc92..a379ff86c120 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -149,7 +149,7 @@ static Elf64_Word *__init auxv_to_elf64_notes(Elf64_Word *buf,
 	/* end of vector */
 	bufp[idx++] = cpu_to_be64(AT_NULL);
 
-	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_AUXV,
+	buf = append_elf64_note(buf, NN_AUXV, NT_AUXV,
 				oc_conf->auxv_buf, AUXV_DESC_SZ);
 	return buf;
 }
@@ -252,7 +252,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 	 * crashing CPU's prstatus.
 	 */
 	first_cpu_note = buf;
-	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+	buf = append_elf64_note(buf, NN_PRSTATUS, NT_PRSTATUS,
 				&prstatus, sizeof(prstatus));
 
 	for (i = 0; i < oc_conf->num_cpus; i++, bufp += size_per_thread) {
@@ -279,7 +279,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 		fill_prstatus(&prstatus, thread_pir, &regs);
 
 		if (thread_pir != oc_conf->crashing_cpu) {
-			buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME,
+			buf = append_elf64_note(buf, NN_PRSTATUS,
 						NT_PRSTATUS, &prstatus,
 						sizeof(prstatus));
 		} else {
@@ -287,7 +287,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
 			 * Add crashing CPU as the first NT_PRSTATUS note for
 			 * GDB to process the core file appropriately.
 			 */
-			append_elf64_note(first_cpu_note, CRASH_CORE_NOTE_NAME,
+			append_elf64_note(first_cpu_note, NN_PRSTATUS,
 					  NT_PRSTATUS, &prstatus,
 					  sizeof(prstatus));
 		}

-- 
2.47.1


