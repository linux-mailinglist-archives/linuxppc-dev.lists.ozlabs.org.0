Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C813230E70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 17:53:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGLn55hxTzDr24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 01:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGLkM5JyvzDr1m
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 01:51:07 +1000 (AEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1k0Rsb-0007kg-96; Tue, 28 Jul 2020 15:51:01 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] selftests/powerpc: return skip code for spectre_v2
Date: Tue, 28 Jul 2020 12:50:39 -0300
Message-Id: <20200728155039.401445-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.25.1
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
Cc: cascardo@canonical.com, Shuah Khan <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When running under older versions of qemu of under newer versions with old
machine types, some security features will not be reported to the guest.
This will lead the guest OS to consider itself Vulnerable to spectre_v2.

So, spectre_v2 test fails in such cases when the host is mitigated and miss
predictions cannot be detected as expected by the test.

Make it return the skip code instead, for this particular case. We don't
want to miss the case when the test fails and the system reports as
mitigated or not affected. But it is not a problem to miss failures when
the system reports as Vulnerable.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 tools/testing/selftests/powerpc/security/spectre_v2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
index 8c6b982af2a8..d5445bfd63ed 100644
--- a/tools/testing/selftests/powerpc/security/spectre_v2.c
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -183,6 +183,14 @@ int spectre_v2_test(void)
 		if (miss_percent > 15) {
 			printf("Branch misses > 15%% unexpected in this configuration!\n");
 			printf("Possible mis-match between reported & actual mitigation\n");
+			/* Such a mismatch may be caused by a guest system
+			 * reporting as vulnerable when the host is mitigated.
+			 * Return skip code to avoid detecting this as an
+			 * error. We are not vulnerable and reporting otherwise,
+			 * so missing such a mismatch is safe.
+			 */
+			if (state == VULNERABLE)
+				return 4;
 			return 1;
 		}
 		break;
-- 
2.25.1

