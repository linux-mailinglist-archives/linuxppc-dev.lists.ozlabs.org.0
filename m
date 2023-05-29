Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA1714865
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 13:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVCcC5jqqz3fDH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 21:15:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=DND7sJm2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.25; helo=mailout2.samsung.com; envelope-from=maninder1.s@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=DND7sJm2;
	dkim-atps=neutral
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVCbL1Gkxz3f6T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 21:14:21 +1000 (AEST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20230529111410epoutp02819cb5344da77760848e63c7e1797847~jmPIPS03N2515825158epoutp02F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 11:14:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20230529111410epoutp02819cb5344da77760848e63c7e1797847~jmPIPS03N2515825158epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1685358851;
	bh=qk7FA9xN87p6FJZ2Z10A3WhlL1LEP+O+6ySBHhTKuX4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=DND7sJm2sq7q4rMerIdycPSPVQhLOtjeo4UpHceABdHDMumw7lLeFu5rZr0TW5miU
	 YTCB9E5fqUw4QfL5OABuXth+WI95Ebm2rPVRT/dQ1vspzsbsiK/ojJBFnJNRXnR7W0
	 ZveRLlLXNxxf23fYD2JKbIU80UCV55GzvQMgdezI=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20230529111410epcas5p43817881489b4702ad5978f694515c8ed~jmPHgcqSr1145411454epcas5p42;
	Mon, 29 May 2023 11:14:10 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B1.A3.04567.20984746; Mon, 29 May 2023 20:14:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20230529111350epcas5p46a1fa16ffb2a39008c26d03c5c63f109~jmO1KgnDu1149511495epcas5p4g;
	Mon, 29 May 2023 11:13:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230529111350epsmtrp20f175ccc83f2ede52688eb27242b05dc~jmO1Jez3z2617326173epsmtrp2F;
	Mon, 29 May 2023 11:13:50 +0000 (GMT)
X-AuditID: b6c32a49-943ff700000011d7-18-64748902095d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	95.32.27706.EE884746; Mon, 29 May 2023 20:13:50 +0900 (KST)
Received: from localhost.localdomain (unknown [107.109.224.44]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230529111347epsmtip155f874de39e74a0189464dce0e25c3d3~jmOyMM5d32333123331epsmtip1S;
	Mon, 29 May 2023 11:13:47 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: bcain@quicinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, keescook@chromium.org, nathanl@linux.ibm.com,
	ustavoars@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	ojeda@kernel.org, pmladek@suse.com, wedsonaf@google.com
Subject: [PATCH 1/2] hexagon/traps.c: use KSYM_NAME_LEN in array size
Date: Mon, 29 May 2023 16:43:36 +0530
Message-Id: <20230529111337.352990-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPKsWRmVeSWpSXmKPExsWy7bCmhi5TZ0mKwbTjrBZ/Z29nt3i4u4XF
	4s6k5+wWF8+8ZrQ4051r8b5lB5vF5V1z2Cx+f//HanF4fhuLxZaGQ2wWG44GW/x8cYPFYuX8
	5YwWK3o+sFr8f/wVSLw7wmTRsXglo4Ogx+yGiyweX2+eY/JY9LKBxWNJ5y8mj52z7rJ7LNhU
	6rFpVSebx4RFBxg9zs9YyOgxcU+dR9+WVYwe67dcZfH4vEkugDeKyyYlNSezLLVI3y6BK+PQ
	vPcsBYc5Kp4uMW1gnMjexcjJISFgIvF19QKWLkYuDiGB3YwS87+cYYNwPjFKvD78iw2kSkjg
	G6PEm+ecMB0PvvQzQRTtZZR4/uIVlPOFUaL3+gUmkCo2AT2JVbv2gM0VEWhlkrhx+DTYXGaB
	jYwSf/esYgSpEhZwlbjwcQvYJSwCqhL3rhxlBrF5BWwlevo2sEDsk5eYeek7O0RcUOLkzCdg
	cWagePPW2cwgQyUEznBIfH3bwwrR4CJx+c8jKFtY4tXxLVCvSkl8frcX6AoOILtcYuuEeoje
	FkaJ/XOmsEHU2Es8ubiQFaSGWUBTYv0ufYiwrMTUU+uYIPbySfT+fsIEEeeV2DEPxlaVaLm5
	AWqttMTnjx+h7veQ2H9gJQskHGMlbr1cxDaBUX4WkndmIXlnFsLmBYzMqxglUwuKc9NTi00L
	DPNSy/WKE3OLS/PS9ZLzczcxgtOglucOxrsPPugdYmTiYDzEKMHBrCTCa5tYnCLEm5JYWZVa
	lB9fVJqTWnyIUZqDRUmcV932ZLKQQHpiSWp2ampBahFMlomDU6qBqafF8MmGfuZ1SXEHzp8+
	4vC2boX/xBiJvK6D7KEK1z9seFq3/1u1yOtEbUYLN/5/U/YmMjTUeOiyXDnk8Xg3Z5Sz/YJz
	77c8VWxrcNLKOxtbG5q9S2Xp3qW6+5bGptr6RVQseR587oUlX9vxTon8onDd/o1NC6xyHZYH
	sc7Keure5iv1MSeAm/f16Sbue3Ga4RcyD/Kvjv+x0KutSHje+brtqpdLy8OWPl7lOCH+yhSF
	FqsJ284v+5qa7nb8z4s+0zN/d26InmC0aLaN08/M26vf5W2Zx/zdMuf8u6N/3B0OX+v1mDDn
	Quy2A8Eu3e6/GZ4flki/t79ovfPVKKFUUbOAjP0zVn9oPJHtzSE9RYmlOCPRUIu5qDgRAOpP
	M2zyAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LZdlhJTvddR0mKwfI1IhZ/Z29nt3i4u4XF
	4s6k5+wWF8+8ZrQ4051r8b5lB5vF5V1z2Cx+f//HanF4fhuLxZaGQ2wWG44GW/x8cYPFYuX8
	5YwWK3o+sFr8f/wVSLw7wmTRsXglo4Ogx+yGiyweX2+eY/JY9LKBxWNJ5y8mj52z7rJ7LNhU
	6rFpVSebx4RFBxg9zs9YyOgxcU+dR9+WVYwe67dcZfH4vEkugDeKyyYlNSezLLVI3y6BK+PQ
	vPcsBYc5Kp4uMW1gnMjexcjJISFgIvHgSz8TiC0ksJtR4u71PIi4tMTPf+9ZIGxhiZX/ngPV
	cwHVfGKUOLP4LSNIgk1AT2LVrj0sIAkRgalMElNe32cDSTALbGWUWHKlHsQWFnCVuPBxC9g2
	FgFViXtXjjKD2LwCthI9fRugNshLzLz0nR0iLihxcuYTFog58hLNW2czT2Dkm4UkNQtJagEj
	0ypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOCI0tLcwbh91Qe9Q4xMHIyHGCU4mJVE
	eG0Ti1OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYFKb
	mHYhymXtboXbrkXrf/aK/q7KVb288p7LlDsHDsx9XtT8elbClqKFqvX1E7udH8p8WOd+94bk
	a0k13Wdf3BjkVq8Te9qdsiWYoWJdl3DTAoFXPzqWbze89uTNLbMdtnMX9/Vacn/9cX67YbTs
	vILgyvx362ddi+OafnnP2+qTvR1K/vHbOHd6LGuab7fp1mb5K9cY3Kpj4jjc2jsncG0xXX5M
	e3vYySWG3zaEHb8tEKOj7ir81XjqB7vLTU1LtTOr15rtvFE9W15h+Tzl3JMhkrO0w9akPKyu
	7tHVtY0JkL66v3KS3vUpChXmq3MuuGfUBah/yjX2yE3g/aQ4vb06uDeX51pkx9TU1S+sJyqx
	FGckGmoxFxUnAgBKuCP+FwMAAA==
X-CMS-MailID: 20230529111350epcas5p46a1fa16ffb2a39008c26d03c5c63f109
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20230529111350epcas5p46a1fa16ffb2a39008c26d03c5c63f109
References: <CGME20230529111350epcas5p46a1fa16ffb2a39008c26d03c5c63f109@epcas5p4.samsung.com>
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
Cc: Maninder Singh <maninder1.s@samsung.com>, linux-hexagon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Onkarnath <onkarnath.1@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kallsyms_lookup which in turn calls for kallsyms_lookup_buildid()
writes on index "KSYM_NAME_LEN - 1".

Thus array size should be KSYM_NAME_LEN.

for hexagon it was defined as "128" directly.
and commit '61968dbc2d5d' changed define value to 512,
So both were missed to update with new size.

Fixes: 61968dbc2d5d ("kallsyms: increase maximum kernel symbol length to 512")

Co-developed-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/hexagon/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
index 6447763ce5a9..65b30b6ea226 100644
--- a/arch/hexagon/kernel/traps.c
+++ b/arch/hexagon/kernel/traps.c
@@ -82,7 +82,7 @@ static void do_show_stack(struct task_struct *task, unsigned long *fp,
 	const char *name = NULL;
 	unsigned long *newfp;
 	unsigned long low, high;
-	char tmpstr[128];
+	char tmpstr[KSYM_NAME_LEN];
 	char *modname;
 	int i;
 
-- 
2.17.1

