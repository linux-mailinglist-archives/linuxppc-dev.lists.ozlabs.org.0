Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 637036C91D7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 01:25:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkcDK2YjGz3f6r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 11:25:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hgctAiPu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hgctAiPu;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkcCN041Wz3bWw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 11:24:45 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id u38so3466966pfg.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679790283;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4Q2NTyLoojITNxzc3JyEzySGYWN7cs2pVbyR9zoqIw=;
        b=hgctAiPuKSVKgNptfg2ian+z7zIjVQaoDH5nNcr1IGHFZcBMWGHnszsmng9Vb/QSPd
         6Wz5lYnQTSnCP9sf3Ezu2m1k74jRrAx78Le8DfDUnB+mdKD5m/4LgFNabTsgVXCLECfw
         i5GE2+Ve4uq6qkvXGPWq/ltzwtr6xI/jrfW+rIaZ7wG+hLN4zn0pAQbhvrMliIC4cVf7
         OgSgWUuAqv57e4iAJtk06ISlyh5AHuAaCz2lyZIK+h7O7Osao1cF8kNl1rG5wwJwzKpg
         Z2v8eLpDmGPHeQ9v6EQE6cvAGpeZY5YrM/iNaDzDu/+LFDkZQ5XRJzD6F1j9Je47AON0
         lNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679790283;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4Q2NTyLoojITNxzc3JyEzySGYWN7cs2pVbyR9zoqIw=;
        b=PAK/v+qGpggJ9ck5V+7cjwoXOkDLdMjTko0jTswDlvoKy3fp740rq3NxaW8IzeeNnj
         neHKogN/DMhH0buGye9KzQhvUXcjrUIzl/LqajE+vNhdJA9hlJ7MkmOg2ERt0Xq4itPi
         KmQGfeQOyaHirdzJuleGl7JoH3f3aFNyvH9hsqO1PE8PYroJg7m4dcr1T+xtt4xR/RDi
         s//gaZGWPMKdobDZIVRobNZ0Cm1AiLRa6pUrOiFGUoNscujfiVKo1VhHjz6+g11hV3wa
         3EWR4CzR6zP7t5qWOdQZKOkMKPJeptUn+w4uNbbuMJ3cMLMG/SJ1TBFZd00Zp8qReSQZ
         8Nrw==
X-Gm-Message-State: AAQBX9c7l+9VaVXMgqau9nFg1lyjeyKo/m9+TbmaZIPnaTKHmJXGL2Pz
	wXBKinXUR0dIADZWzbxpHZkSglxVFW71FD05
X-Google-Smtp-Source: AKy350blDB7yT8bEf7Yw6Lf59U5uoiiHGxIsRG5zhG3POgNjQkWpfksTqVOV0fNKYwsagKz8I2bHlQ==
X-Received: by 2002:aa7:8bc2:0:b0:623:2bba:dd9 with SMTP id s2-20020aa78bc2000000b006232bba0dd9mr7090071pfd.14.1679790282959;
        Sat, 25 Mar 2023 17:24:42 -0700 (PDT)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id j13-20020aa78dcd000000b0062809b2cb05sm10673889pfr.155.2023.03.25.17.24.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Mar 2023 17:24:42 -0700 (PDT)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	rcu@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org
Subject: [PATCH] rcu: torture: ppc: Remove duplicated argument --enable-kvm
Date: Sun, 26 Mar 2023 08:24:34 +0800
Message-Id: <1679790274-1309-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

The argument --enable-kvm is duplicated because qemu_args
in kvm-test-1-run.sh has already give this.
          
Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear RCU and PPC developers

I discover this possible minor flaw when I am performing RCU torture
test in PPC VM of of Open Source Lab of Oregon State University.

But I can't test my patch because I am in a VM.

Thanks for your time

Cheers ;-)
Zhouyi                                           
--    
 tools/testing/selftests/rcutorture/bin/functions.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rcutorture/bin/functions.sh b/tools/testing/selftests/rcutorture/bin/functions.sh
index b52d5069563c..48b9147e8c91 100644
--- a/tools/testing/selftests/rcutorture/bin/functions.sh
+++ b/tools/testing/selftests/rcutorture/bin/functions.sh
@@ -250,7 +250,7 @@ identify_qemu_args () {
 		echo -machine virt,gic-version=host -cpu host
 		;;
 	qemu-system-ppc64)
-		echo -enable-kvm -M pseries -nodefaults
+		echo -M pseries -nodefaults
 		echo -device spapr-vscsi
 		if test -n "$TORTURE_QEMU_INTERACTIVE" -a -n "$TORTURE_QEMU_MAC"
 		then
-- 
2.34.1

