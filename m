Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7407EFE4E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 08:36:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qgeWwczt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXQYm3hg2z3vjs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 18:36:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qgeWwczt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ryhyzqckdcossgaxkxmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXJP63l8hz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 13:58:18 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da07b5e6f75so3291477276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 18:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700276295; x=1700881095; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6470cZa62MbyzT9ybBeTXZeWGQJ3Ep0Ies1ZAhH/GQQ=;
        b=qgeWwcztk7Rjyb856l7lL8r1kciTlhFjJjPuDOF6UvI99u+etRutVzpRvYzIOF/epk
         tFx6Nm6ZOc2OyFvelaosXtEdT8vibsEmnVPPzjUQ9PvDB4Ul/VK+22bLy9anE2xBx/LQ
         vNXeWQNtD4xH+AwnTUULulOMuANndcmevrt+3TNikUUc2+SCdTbsywTavPrMvXX84Y2e
         6te3M1zb+JpaMqOAnf3/NOWA1VXMuQZRyPGiVgZ95aV/0XWl7wiI6dPxpawc3fyuvp0Z
         Eu3RI6o82h8b/xO6SvcSW5efEeir8nfZBIBf1ETFpsgz40xktLI3qs3XD30AmJTmRtYm
         vHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700276295; x=1700881095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6470cZa62MbyzT9ybBeTXZeWGQJ3Ep0Ies1ZAhH/GQQ=;
        b=b4vf4gaXiNhJOYzdiWukqGccQn655EbqRwHfOimd/EcCLilUCEOXXnKgM9do6NVrlb
         fAozwNtHrzas5Pcr/0Jqy5xfflhasoCV+2ESErIKCsC3/prSoYifnMpt/cnpnANypjM8
         vOCks8Tg5kod7goWiz85KnNZjSRMNk3WOtJM0ziBReFbJjR5Lmyggi5F8HYzpcsPcwKM
         azDEF77Hf5ER9ByhnpQyhLQFQfF4WfVU03MgkUYZDVstp/fU8kFXYxTcwWSbtoK9ZMcL
         23iTh1NQw5zCRfCb9oXRr/gt+ekQqKMz1rogMHOD9RmAg7BHKxqhfOPXyaMdCWPC7ubA
         9Qyw==
X-Gm-Message-State: AOJu0YwRf62BTBLRGDCYOfTFkyBgEk4boTmwJoOg5KAGDnWIluiT66cH
	0jUQ0CSiACi8DcWE4q/Q5QwZCMdz2xKm
X-Google-Smtp-Source: AGHT+IE0p+YtnUfNXyViuu9ji/lc0sYzrwa5eOwzdtBv1fKlqv6arjeB7wtV3bdeWily94YGEBFtqUBG97qg
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a5b:cc9:0:b0:da0:37e1:558e with SMTP id
 e9-20020a5b0cc9000000b00da037e1558emr26098ybr.6.1700276295405; Fri, 17 Nov
 2023 18:58:15 -0800 (PST)
Date: Sat, 18 Nov 2023 02:54:46 +0000
In-Reply-To: <20231118025748.2778044-1-mmaurer@google.com>
Mime-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118025748.2778044-6-mmaurer@google.com>
Subject: [PATCH v2 5/5] export_report: Use new version info format
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

The new version info format has a superset of symbols in the old format.
Since this is a tool for in-tree modules, we don't need to parse the old
one with this tool any longer.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index dcef915405f3..6a37df6f947f 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -114,31 +114,29 @@ foreach my $thismod (@allcfiles) {
 	}
 
 	my $state=0;
+	# State map:
+	# 0 - Looking for names
+	# 1 - Scanning names
+	# 2 - Done
 	while ( <$module> ) {
 		chomp;
 		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
+			$state = 1 if ($_ =~ /__used __section\("__version_ext_names"\)/);
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
-			next;
-		}
-		if ($state == 2) {
-			if ( $_ =~ /};/ ) {
-				$state = 3;
-				next;
-			}
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
+			if ( $_ =~ /;/ ) {
+				$state = 2;
 				next;
 			}
-			my $sym = (split /([,"])/,)[4];
+			$_ =~ /"(.*)\\0"/;
+			my $sym = $1;
 			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
 			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 3) {
+	if ($state != 2) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.43.0.rc0.421.g78406f8d94-goog

