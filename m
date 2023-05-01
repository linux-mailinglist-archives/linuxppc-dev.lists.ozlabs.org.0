Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8846F30FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 14:39:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q92pr1zjDz3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 22:39:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QqU2UNe+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QqU2UNe+;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q92nz0bfDz2xdv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 May 2023 22:39:01 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94f7a7a3351so494585266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 05:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944737; x=1685536737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VFL3iZxIdOgDdsPxwYNOecpa455WH41HpG7wDJvLnU=;
        b=QqU2UNe+paNeYGSdfcTar7S50/+Okp8oJPdt3wPhFzSSiyCOPSSWedHlduNqvaunHM
         gaKS5N8nixqV0jQFEY4CYw/c39iK+z7F+TpS5E4AOTnMAN0leHAcNRngWaORXlZjRXoF
         eAXCgvP9a33GSDtlqXwTma3h7mmlo4iNwTji8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944737; x=1685536737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VFL3iZxIdOgDdsPxwYNOecpa455WH41HpG7wDJvLnU=;
        b=ebkAa8Js1I5xt7/jPqWYWzbrALu3LOX2VJQvog7EEIo2SZ44bWDf2xQWOiRfAAx6DJ
         EIqSm4LFOBt5U51Ft29+SkmmqrWMdfGo1ctxeUDMdVei12FPa5+TN0E5z92exF4Zkj72
         fk4S1j1JXzdSHBo2sIZr2DBOMTROqP8skiyjMidsvZCtS8aIwlSgfag0zzXoW1T52/Kl
         iOxZ4nLI7M0rFybZsPUQ1VGCxcC6SplGuw8152x78tUIVDNqKLLlKz4q/oJUtTDVwzcS
         3OYQSed5V+aMEToMEBJaesPigGPr/6K5prFSVN4V1ImjMgbCH4DrJtqZITKu5G+W2YUl
         9dSw==
X-Gm-Message-State: AC+VfDzJPPIXvOj12aa7WaFske0CEhoreRbQgbuNJDGcAsCc6sO2Ewjq
	xMbdVFuaIOUSMqtmf+5DoFpv5g==
X-Google-Smtp-Source: ACHHUZ7Sm1MkSUcauJj3TyiAS4ke/e27uEIroXxWW9bKlxiyF0B+q3MupnTKf2mi9GMDqNf5mkXR6Q==
X-Received: by 2002:a17:907:930a:b0:94f:39b4:e32c with SMTP id bu10-20020a170907930a00b0094f39b4e32cmr13020825ejc.43.1682944737007;
        Mon, 01 May 2023 05:38:57 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:38:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 01 May 2023 14:38:19 +0200
Subject: [PATCH v6 1/4] kexec: Support purgatories with .text.hot sections
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230321-kexec_clang16-v6-1-a2255e81ab45@chromium.org>
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
In-Reply-To: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>, 
 Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave Young <dyoung@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2611; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=QL4lqGDXv6U/lMmg6BrW/gmw+SWb8Lpn29mxv2CH5Ys=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7LW0lkg4WYXTXiMAsHN2EkcqdL4dtFZm9xSg
 6i4AKy1VW+JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+y1gAKCRDRN9E+zzrE
 iNN+D/wIXMf38vUASc8jnlonv4XZMh98w77gcVeWjzT85pk5hEROQNNJ+sITsbwoQMjqHhTSeQj
 CiQUS66k93/5RZMhtZ1RL6+gK7uT6m7ke1wNabDo/lQ7SSoDHAcxbG26NAPBuqqPU8b7FtdxYEX
 oIhYNhCKPrn5RVbk977URc/gDgpB7fpZmVZSAluSx0lXssskFwF0x7RCqcGnT1r0bKrPrKBbw8Z
 r9Dt2L7kT1GM3yno8Ce2UhEDyf+4EiIqTPuT2YI+3+/ibS2wAW3fhXbNnBvQCGDl8iJF9w4raTn
 hx6MGu+HCWhUu80lIZmGwc7XortdwMX8SgfnUHHw7p50Rbmj6rTYMJQUY6wx3fzG39SBY6P/kUc
 0vb7u/MPeJW+UGs/9XEVz1vRFtj1ibYfEJHlpbrtxY9JyX5iW0Dt0z8whd9wvNV0UM5qmOyUbNt
 Yt6gVYsK5ZPlgSKN7slxzHGWZe1wrFHDBy7nb1/lm4t3mf0iSGBo8rEFtl13xdZhPzpBZQkpF2N
 SqyX79/AnDIhq8N69fkU9Ka/PE2VKQq8uejp1B8/la8Xmxbc9Jxx5vDivniFN91grNqRBDCZh9C
 dmEovSTRvu6E+Ul7b2G+CZQDPWRUmK6Z3uqC0vcpV+doS3cWaQyFwSFpIaR64JkNuBXhIpAkx5n
 U9gEEpJ/GSMnlvg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, llvm@lists.linux.dev, Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, stable@vger.kernel.org, Simon Horman <horms@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang16 links the purgatory text in two sections when PGO is in use:

  [ 1] .text             PROGBITS         0000000000000000  00000040
       00000000000011a1  0000000000000000  AX       0     0     16
  [ 2] .rela.text        RELA             0000000000000000  00003498
       0000000000000648  0000000000000018   I      24     1     8
  ...
  [17] .text.hot.        PROGBITS         0000000000000000  00003220
       000000000000020b  0000000000000000  AX       0     0     1
  [18] .rela.text.hot.   RELA             0000000000000000  00004428
       0000000000000078  0000000000000018   I      24    17     8

And both of them have their range [sh_addr ... sh_addr+sh_size] on the
area pointed by `e_entry`.

This causes that image->start is calculated twice, once for .text and
another time for .text.hot. The second calculation leaves image->start
in a random location.

Because of this, the system crashes immediately after:

kexec_core: Starting new kernel

Cc: stable@vger.kernel.org
Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
Reviewed-by: Ross Zwisler <zwisler@google.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Philipp Rudo <prudo@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 kernel/kexec_file.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index f989f5f1933b..69ee4a29136f 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -901,10 +901,22 @@ static int kexec_purgatory_setup_sechdrs(struct purgatory_info *pi,
 		}
 
 		offset = ALIGN(offset, align);
+
+		/*
+		 * Check if the segment contains the entry point, if so,
+		 * calculate the value of image->start based on it.
+		 * If the compiler has produced more than one .text section
+		 * (Eg: .text.hot), they are generally after the main .text
+		 * section, and they shall not be used to calculate
+		 * image->start. So do not re-calculate image->start if it
+		 * is not set to the initial value, and warn the user so they
+		 * have a chance to fix their purgatory's linker script.
+		 */
 		if (sechdrs[i].sh_flags & SHF_EXECINSTR &&
 		    pi->ehdr->e_entry >= sechdrs[i].sh_addr &&
 		    pi->ehdr->e_entry < (sechdrs[i].sh_addr
-					 + sechdrs[i].sh_size)) {
+					 + sechdrs[i].sh_size) &&
+		    !WARN_ON(kbuf->image->start != pi->ehdr->e_entry)) {
 			kbuf->image->start -= sechdrs[i].sh_addr;
 			kbuf->image->start += kbuf->mem + offset;
 		}

-- 
2.40.1.495.gc816e09b53d-goog

