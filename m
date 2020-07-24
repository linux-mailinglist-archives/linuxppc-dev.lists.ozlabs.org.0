Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534722D200
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:51:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD4Dr6mzzzF1Ss
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 08:51:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com;
 envelope-from=3bgubxwukdkmpruerjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OZt7b6iS; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD4Bt0FwhzF1S5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 08:49:21 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id q70so6940347pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 15:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=654h8qs4qi2dRGd48JtY3+FWW0DFr++n9T6RqKJJSes=;
 b=OZt7b6iSP9qxqzXZjE/uPdzBCOc2fehuQ8n/MyWw2lufthOSnMdVgPidBGrEbWU00K
 LM+4sqBedusfEnIMVxg1ss0KVvZUnh0sqYWBLxFcRL2G46a1fOMTa0oP+0Tv8Cr2LHcE
 vvoMSYbFYqb4A1JuNF8u7p2en5YmBFQk/AJq0x/8hp1WZUkpBDrYIe/zKO+h/FB0bMlA
 FwTdlGLhOavOM6QwPw+po9XHO9oRrEO1GCP+NulQk4Iwob/NcVP82UZ9+y0vT8/U2dJ4
 ySoJTXRnd6AXB/yPDzkfwpoMweYATuAMwQSv5pQuIXOGLaF8v/pciJXxZ8jqQUMyNG8J
 7OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=654h8qs4qi2dRGd48JtY3+FWW0DFr++n9T6RqKJJSes=;
 b=Lw5DvdZtyXmnCNasOesxuvTEnoqqTQV4umOuvVVIRHepilnfPxB3A++BbFUavwof5t
 iwy24iaALjMlQJiMBu5IHJ5jGPY+OTymBInWkS0NaBQrMuKKrBUyyYgaFNIKtSfZXCEb
 9vMV0PtR2VFeh6UzOhyegXu+XeGXxXwhv7ULkMURHgv9buSQW98Bi97/P4muHt3l7yll
 5FHUTMme1wSPIlSC1dU3k5kM68RFiOv7OW1YN2O2VsS1MvJ7khqBP4GWioiFOxpgnVKp
 7uI5g6yznuCxMFSNYZ3c2Y0J3JvY41I22jBBBdOISEg3z0syNGksXykIdb4/QkzQggWb
 W3eg==
X-Gm-Message-State: AOAM531b58F9MP40rWST2K8YdlaT7DAvgRVpOZoQhA88ZxHWB9QKUjeS
 hDG+3Y7PbkfjMYFGQtTuZ2xT3a3Q
X-Google-Smtp-Source: ABdhPJzxGgRZ2vNeudr/uTVXe0F1pCDLrDMLMoUr8DLL+NaB+25XI0c0PtrrLQKiWlqnvBOz71fi260Cvw==
X-Received: by 2002:aa7:8f08:: with SMTP id x8mr10336563pfr.41.1595630956048; 
 Fri, 24 Jul 2020 15:49:16 -0700 (PDT)
Date: Fri, 24 Jul 2020 15:49:01 -0700
In-Reply-To: <CAGG=3QW4=SmOEY=9mdtZUPBBvHHzVD4UN7hAz9wC83ctr8XsXQ@mail.gmail.com>
Message-Id: <191c67db31264b69cf6b566fd69851beb3dd0abb.1595630874.git.morbo@google.com>
Mime-Version: 1.0
References: <CAGG=3QW4=SmOEY=9mdtZUPBBvHHzVD4UN7hAz9wC83ctr8XsXQ@mail.gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [PATCH v2] powerpc/64s: allow for clang's objdump differences
From: Bill Wendling <morbo@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang's objdump emits slightly different output from GNU's objdump,
causing a list of warnings to be emitted during relocatable builds.
E.g., clang's objdump emits this:

   c000000000000004: 2c 00 00 48  b  0xc000000000000030
   ...
   c000000000005c6c: 10 00 82 40  bf 2, 0xc000000000005c7c

while GNU objdump emits:

   c000000000000004: 2c 00 00 48  b    c000000000000030 <__start+0x30>
   ...
   c000000000005c6c: 10 00 82 40  bne  c000000000005c7c <masked_interrupt+0x3c>

Adjust llvm-objdump's output to remove the extraneous '0x' and convert
'bf' and 'bt' to 'bne' and 'beq' resp. to more closely match GNU
objdump's output.

Note that clang's objdump doesn't yet output the relocation symbols on
PPC.

Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/powerpc/tools/unrel_branch_check.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index 77114755dc6f..6e6a30aea3ed 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -31,7 +31,10 @@ grep -e "^c[0-9a-f]*:[[:space:]]*\([0-9a-f][0-9a-f][[:space:]]\)\{4\}[[:space:]]
 grep -v '\<__start_initialization_multiplatform>' |
 grep -v -e 'b.\?.\?ctr' |
 grep -v -e 'b.\?.\?lr' |
-sed 's/://' |
+sed -e 's/\bbt.\?[[:space:]]*[[:digit:]][[:digit:]]*,/beq/' \
+	-e 's/\bbf.\?[[:space:]]*[[:digit:]][[:digit:]]*,/bne/' \
+	-e 's/[[:space:]]0x/ /' \
+	-e 's/://' |
 awk '{ print $1 ":" $6 ":0x" $7 ":" $8 " "}'
 )
 
