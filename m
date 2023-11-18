Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC27EFE45
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 08:32:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BRWWkaBW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXQV06CMYz3dRt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 18:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BRWWkaBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3qchyzqckdcmll9tqdqfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXJP33FCYz3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 13:58:14 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5bc3be6a91bso29617227b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 18:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700276288; x=1700881088; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ua0IE78OI3V4iuwp2QSoKWUWADgF+ZXc9DJoA62znV8=;
        b=BRWWkaBW51IeeHFS1PCRR6ir2Nz+c7OF5XYLFb5MBip9pUshL4T3fJnPuVsJtDgd+u
         rYi/n0IOjMdtQQOsTwOHa6lbp4QEc7vKf+nKA9JSq0JPQPCGP+S3zOuAn1dC35I5Kfml
         8L/mYCGtqFx4LfhqZw4IZZQix21vJ9IuS+5HT4qiZQ21RGhon8AmfyckxxeMRoHPRYPW
         fx+yz0nWqmXr1hVCy6rUkJfQMqW9u06oCXmRgVZSCEvu7KJ8vNTFikdF9tJ7J0yC78Af
         b32rKQasycffkdCs4W+rNrq/xHLm3PU34nulBIGY2zw8JLl5btbeZiEF3/J9SdWAStMv
         yvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700276288; x=1700881088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ua0IE78OI3V4iuwp2QSoKWUWADgF+ZXc9DJoA62znV8=;
        b=rUmHjshqfX9dSGg/wlk3MaEo78iax4cQbsAAv2kZglhCJjNr2/X3eO7ECnhyeW+TKF
         uA27Yrw1tLquNZ7x85dEwD3enUU4++MKaO5qlDLzX3Q57rX3DW3Ep0eYH55v3te1jAdV
         g80W7FOJS6dMGqLbMoV/SPFmSG8OABgiSll1dg6/1EHd9QNnXBVMXCSpjCI98+FjWyTi
         CnDdhZMq4ey1BrvMIJRoF8X8eWLAlR2otW4w15mXHeDT4oR0HJot3fPdYrtL2tsOFT5R
         duz8A/7J8NsMejjeK95QXlvapSROaBYtTgWuOM1i7Z/mls55XHjgaut3QVog9/AOm7eZ
         OhWQ==
X-Gm-Message-State: AOJu0YzptsSvXRTQOPbB9Zc5sfoIkpwWiIMZ1Qlkgjl1DnO1Ojst4LhE
	AeCk08nEk2Hzj0eLEXcvsT9PpKZqVXyD
X-Google-Smtp-Source: AGHT+IERm4l8aRNMXSza7sGbPFbUkdTe33rpYyqpHWn57Z3BfKIw6SvQM+EZkHQPY3+Yu4peV7KukI7LkV3P
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:e6c1:0:b0:daf:3e84:d016 with SMTP id
 d184-20020a25e6c1000000b00daf3e84d016mr29963ybh.2.1700276288083; Fri, 17 Nov
 2023 18:58:08 -0800 (PST)
Date: Sat, 18 Nov 2023 02:54:42 +0000
In-Reply-To: <20231118025748.2778044-1-mmaurer@google.com>
Mime-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118025748.2778044-2-mmaurer@google.com>
Subject: [PATCH v2 1/5] export_report: Rehabilitate script
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 18 Nov 2023 18:31:25 +1100
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* modules.order has .o files when in a build dir, support this
* .mod.c source layout has changed, update regexes to match
* Add a stage 3, to be more robust against additional .mod.c content

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index feb3d5542a62..dcef915405f3 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -55,6 +55,7 @@ sub collectcfiles {
     open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
     while (<$fh>) {
 	s/\.ko$/.mod.c/;
+	s/\.o$/.mod.c/;
 	push (@file, $_)
     }
     close($fh);
@@ -120,10 +121,14 @@ foreach my $thismod (@allcfiles) {
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
 			next;
 		}
 		if ($state == 2) {
+			if ( $_ =~ /};/ ) {
+				$state = 3;
+				next;
+			}
 			if ( $_ !~ /0x[0-9a-f]+,/ ) {
 				next;
 			}
@@ -133,7 +138,7 @@ foreach my $thismod (@allcfiles) {
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 2) {
+	if ($state != 3) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.43.0.rc0.421.g78406f8d94-goog

