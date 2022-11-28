Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D963A07E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC0V11TPz3f89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:19:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YuK7cDIw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YuK7cDIw;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLBwf27Dqz3cMf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:16:01 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 136so8895309pga.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 20:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UNoFZjpqfGudip0kcMOvEq1qB17vDLLLPW/9fqGP8Y=;
        b=YuK7cDIwgwKHS54DS4Csqsf2PgHKcd+EzUrKIzTIOyFfwZQrvdE0uDkn+9KhMAoj3S
         a0ERrSjVjDlTlZ31bJYHoPevbIuM1TDx4wiuRnjz4cIPPnzGoShwCycQi47hbEFJm/XC
         1AH472k1D1nLuVeKdk0GVy4CCFLYjxViV8NabpFQYRhwVQjwvWtUEMSrlpBVA8aZnKpl
         tEy079TDOK29ao83qCBagqZeyK/WsbqF7qksG6ziI5IHnTnglfimdQcqykS6GjVaqhVs
         X4rSgEcvq51PhI3uwSzqrnTRS2km8j3PnskPWovDZecg1aHz25RpSw/BsYCJXXmOchQZ
         2sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UNoFZjpqfGudip0kcMOvEq1qB17vDLLLPW/9fqGP8Y=;
        b=w/6lDDpbu83mvxvZ1KCM4YQWQKB/6YPxMYQs9GUVUGYFn0NIKTFBhJhAmLGWo50CpT
         gwJA1bnSeF6CUM3eMLh4LDs46q/zWhJrztNifhG3Bhot7MYZUi4CQ0zm5M8G2DKHVuVC
         Ast866d72BoUFSzGPE+eqKNcKIj5IWwxkivBuVfjUdMf6j8SHEQ5fI14klFeQtENFQbw
         Ml0EUN6BMpsW/5xHlrFx1wuW/90KwuQX02I3/EZdTBe+KTV460SUNhnNpW6oiU2G2Jt+
         tc3kz7zG/HmVC2sQAK/kJLNDHCc/NhNdnI5joyVQNeCAz79pxRoyg3vhLb6sI8Zpz7GN
         wORg==
X-Gm-Message-State: ANoB5plc25Ue8Z2+tg0+RSchSv5mTr6yN6v5pn9HQm8qmyn3U2Eb33Wb
	Pd4Yrdt55EGYla68rMbLP0aNxiBIZSc=
X-Google-Smtp-Source: AA0mqf4LO1D2cXSejQO9SQP9ABk2k9Efb00/Uwli0Zfe3d2tGwmou2ft5Rky9inB6JOJtKR9talZDA==
X-Received: by 2002:a63:b01:0:b0:477:d8c5:3ac2 with SMTP id 1-20020a630b01000000b00477d8c53ac2mr14694421pgl.339.1669608959518;
        Sun, 27 Nov 2022 20:15:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79afc000000b0057489a78979sm6905670pfp.21.2022.11.27.20.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 20:15:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 3/4] powerpc/64: Add big-endian ELFv2 flavour to crypto VMX asm generation
Date: Mon, 28 Nov 2022 14:15:38 +1000
Message-Id: <20221128041539.1742489-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221128041539.1742489-1-npiggin@gmail.com>
References: <20221128041539.1742489-1-npiggin@gmail.com>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows asm generation for big-endian ELFv2 builds.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 drivers/crypto/vmx/Makefile     | 12 +++++++++++-
 drivers/crypto/vmx/ppc-xlate.pl | 10 ++++++----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 2560cfea1dec..e33c7238e7f8 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -2,8 +2,18 @@
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 
+ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
+override flavour := linux-ppc64le
+else
+ifdef CONFIG_PPC64_ELF_ABI_V2
+override flavour := linux-ppc64-elfv2
+else
+override flavour := linux-ppc64
+endif
+endif
+
 quiet_cmd_perl = PERL    $@
-      cmd_perl = $(PERL) $< $(if $(CONFIG_CPU_LITTLE_ENDIAN), linux-ppc64le, linux-ppc64) > $@
+      cmd_perl = $(PERL) $< $(flavour) > $@
 
 targets += aesp8-ppc.S ghashp8-ppc.S
 
diff --git a/drivers/crypto/vmx/ppc-xlate.pl b/drivers/crypto/vmx/ppc-xlate.pl
index 36db2ef09e5b..b583898c11ae 100644
--- a/drivers/crypto/vmx/ppc-xlate.pl
+++ b/drivers/crypto/vmx/ppc-xlate.pl
@@ -9,6 +9,8 @@ open STDOUT,">$output" || die "can't open $output: $!";
 
 my %GLOBALS;
 my $dotinlocallabels=($flavour=~/linux/)?1:0;
+my $elfv2abi=(($flavour =~ /linux-ppc64le/) or ($flavour =~ /linux-ppc64-elfv2/))?1:0;
+my $dotfunctions=($elfv2abi=~1)?0:1;
 
 ################################################################
 # directives which need special treatment on different platforms
@@ -40,7 +42,7 @@ my $globl = sub {
 };
 my $text = sub {
     my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
-    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
+    $ret = ".abiversion	2\n".$ret	if ($elfv2abi);
     $ret;
 };
 my $machine = sub {
@@ -56,8 +58,8 @@ my $size = sub {
     if ($flavour =~ /linux/)
     {	shift;
 	my $name = shift; $name =~ s|^[\.\_]||;
-	my $ret  = ".size	$name,.-".($flavour=~/64$/?".":"").$name;
-	$ret .= "\n.size	.$name,.-.$name" if ($flavour=~/64$/);
+	my $ret  = ".size	$name,.-".($dotfunctions?".":"").$name;
+	$ret .= "\n.size	.$name,.-.$name" if ($dotfunctions);
 	$ret;
     }
     else
@@ -142,7 +144,7 @@ my $vmr = sub {
 
 # Some ABIs specify vrsave, special-purpose register #256, as reserved
 # for system use.
-my $no_vrsave = ($flavour =~ /linux-ppc64le/);
+my $no_vrsave = ($elfv2abi);
 my $mtspr = sub {
     my ($f,$idx,$ra) = @_;
     if ($idx == 256 && $no_vrsave) {
-- 
2.37.2

