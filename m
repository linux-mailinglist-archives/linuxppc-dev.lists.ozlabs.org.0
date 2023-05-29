Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FAC714869
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 13:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVCd75qKRz3fHF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 21:15:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=VOgFM1V4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.33; helo=mailout3.samsung.com; envelope-from=maninder1.s@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=VOgFM1V4;
	dkim-atps=neutral
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVCbN3hQ7z3f6T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 21:14:24 +1000 (AEST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20230529111414epoutp036c0cf56da06737f05ccc563c82882bf9~jmPLd4CGv0923309233epoutp03H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 11:14:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20230529111414epoutp036c0cf56da06737f05ccc563c82882bf9~jmPLd4CGv0923309233epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1685358854;
	bh=nFYqgya5b+48MlA+S9yA8hdVhuiXp1AXTaJCiqdhPwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOgFM1V4qcZwZ8vsBMA9LoLMlgoUuETPxncFK0SPdVCsjw1Ghx4aV0gt6P9mGf+Jk
	 8YZIpUbAMRsFzlq+9S+afpr/CFYG8takm7gMaysfH1LA3pJdfsGvyO7vQs+zEw/uQP
	 B3QWof1Kk/R6WCAUjprorl8fuvlEO0jLBtcHQoZ0=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20230529111413epcas5p4d0506d2d94d74a6f6d057e8153fbfeb3~jmPK7gicZ1149511495epcas5p4Q;
	Mon, 29 May 2023 11:14:13 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	49.B3.04567.50984746; Mon, 29 May 2023 20:14:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5~jmPCRWKek2607826078epcas5p2y;
	Mon, 29 May 2023 11:14:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230529111404epsmtrp239eb7b3d01e1d317ed1bee4850a666b7~jmPCQGplT2617326173epsmtrp2N;
	Mon, 29 May 2023 11:14:04 +0000 (GMT)
X-AuditID: b6c32a49-943ff700000011d7-26-647489059eb0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D8.32.27706.CF884746; Mon, 29 May 2023 20:14:04 +0900 (KST)
Received: from localhost.localdomain (unknown [107.109.224.44]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230529111401epsmtip1f7be17df8f56a26e756da0d5a7b41e96~jmO-efKyL2687226872epsmtip1F;
	Mon, 29 May 2023 11:14:01 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: bcain@quicinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, keescook@chromium.org, nathanl@linux.ibm.com,
	ustavoars@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	ojeda@kernel.org, pmladek@suse.com, wedsonaf@google.com
Subject: [PATCH 2/2] powerpc/xmon: use KSYM_NAME_LEN in array size
Date: Mon, 29 May 2023 16:43:37 +0530
Message-Id: <20230529111337.352990-2-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529111337.352990-1-maninder1.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7bCmui5rZ0mKwf7XehZ/Z29nt3i4u4XF
	4s6k5+wWF8+8ZrQ4051r8b5lB5vF5V1z2Cx+f//HanF4fhuLxZaGQ2wWG44GW/x8cYPFYuX8
	5YwWK3o+sFr8f/wVSLw7wmTRsXglo4Ogx+yGiyweX2+eY/JY9LKBxWNJ5y8mj52z7rJ7LNhU
	6rFpVSebx4RFBxg9zs9YyOgxcU+dR9+WVYwe67dcZfH4vEkugDeKyyYlNSezLLVI3y6BK6Px
	0CS2gsscFQ9Ob2RsYFzM3sXIySEhYCLx7GU3cxcjF4eQwG5Gid0XDzFBOJ8YJZ7Mm8UI4Xxj
	lHiz6g1QhgOspWuPFER8L6PEzC9PWSCcL4wS29e9AZvLJqAnsWrXHrCEiEArk8SNw6fZQBxm
	gY2MEn/3rGIEGSUs4CTRuz8LpIFFQFVix7dVzCA2r4CtxOS7l1ggDpSXmHnpO9hQTgE7iVmH
	W9ggagQlTs58AlbDDFTTvHU22BMSAi84JE5t3AjV7CKxrOElE4QtLPHq+Baor6UkPr/bywbx
	TrnE1gn1EL0tjBL750xhg6ixl3hycSErSA2zgKbE+l36EGFZiamn1jFB7OWT6P39BGo8r8SO
	eTC2qkTLzQ2sELa0xOePH1kgVnlI3PxSBQmsiYwS8yf3sk1gVJiF5J1ZSN6ZhbB5ASPzKkbJ
	1ILi3PTUYtMCw7zUcr3ixNzi0rx0veT83E2M4PSo5bmD8e6DD3qHGJk4GA8xSnAwK4nw2iYW
	pwjxpiRWVqUW5ccXleakFh9ilOZgURLnVbc9mSwkkJ5YkpqdmlqQWgSTZeLglGpgMhGS21bw
	wDhySRhD0vQHU+tYrvsxFerdOX9ibVXAwvVGDl1zTrAqJ/0Ki7LY7P1qu1fMaoujf4PmlJT7
	XlqU+tgwYbp4VzLn6xkzf99ZMsGDl3VTzJKdvf5ng4+m2Bh9WNj5QkB31bSH/rMm39+k0qZx
	qu/x8ovtbKcanZ5c8GrhaHL+o3evk0sv8O0efoeOhOcnbLXfzcwpmfua2XXVhWcTJrV8tHnj
	znTcpjySwyV9+lzFY+vKlwQdN901lyfVuKZ2/x29hVOjkwIO/WFwVWjTqj4XV2FWu2pBQbXK
	unu6h77aTV5tlKjDV6F4406iRJWipcT9Fs7blpWe3Zks7Y9YHmd7Tonh41ZyUHyjxFKckWio
	xVxUnAgAeiMedv4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsWy7bCSnO6fjpIUg+Nt0hZ/Z29nt3i4u4XF
	4s6k5+wWF8+8ZrQ4051r8b5lB5vF5V1z2Cx+f//HanF4fhuLxZaGQ2wWG44GW/x8cYPFYuX8
	5YwWK3o+sFr8f/wVSLw7wmTRsXglo4Ogx+yGiyweX2+eY/JY9LKBxWNJ5y8mj52z7rJ7LNhU
	6rFpVSebx4RFBxg9zs9YyOgxcU+dR9+WVYwe67dcZfH4vEkugDeKyyYlNSezLLVI3y6BK6Px
	0CS2gsscFQ9Ob2RsYFzM3sXIwSEhYCLRtUeqi5GLQ0hgN6PE7peHWbsYOYHi0hI//71ngbCF
	JVb+e84OUfSJUaJ50SSwBJuAnsSqXXtYQBIiAlOZJKa8vs8GkmAW2MooseRKPcgGYQEnid79
	WSBhFgFViR3fVjGD2LwCthKT716CWiAvMfPSd3YQm1PATmLW4RawMUJANSv7j7JC1AtKnJz5
	hAVivLxE89bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4
	ArU0dzBuX/VB7xAjEwfjIUYJDmYlEV7bxOIUId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7G
	CwmkJ5akZqemFqQWwWSZODilGpg6S4wMnm2cefW7/ffdKzfU+ORdv9rKx3hkwues27lZEyw7
	Nsjv//DC5M6Gi9OWXFp7VOUcl+qyo5l1k3a27WG3Krr1hcF6Q/lyTobyj4+dZYJ3rXDb+CQw
	cOEJoY9eK69mv4+pPin+X6z9isfbTaeeRfGHdi5XbJLOeBdcJ2v09laRqfy8i5FWq36dqrN7
	GF3ruGFJRCnfki/7yxKc3xS/usa3U3aXPkPplPCQ8onr5v+ett/8ePmbVRN28gVtZufMkf5Z
	sbtktlj26yc8F7/7id5R+XXMnevM9eV9Ph3HAzN9VTy/zy+yZpDNrF/wMvBJ7mqG/X+dj1t9
	FDD+18F8ek/JIY+TpmJZEXXyotI6SizFGYmGWsxFxYkAD4HklS8DAAA=
X-CMS-MailID: 20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5
References: <20230529111337.352990-1-maninder1.s@samsung.com>
	<CGME20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5@epcas5p2.samsung.com>
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

for powerpc it was defined as "128" directly.
and commit '61968dbc2d5d' changed define value to 512,
So both were missed to update with new size.

Fixes: 61968dbc2d5d ("kallsyms: increase maximum kernel symbol length to 512")

Co-developed-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 728d3c257e4a..70c4c59a1a8f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -88,7 +88,7 @@ static unsigned long ndump = 64;
 static unsigned long nidump = 16;
 static unsigned long ncsum = 4096;
 static int termch;
-static char tmpstr[128];
+static char tmpstr[KSYM_NAME_LEN];
 static int tracing_enabled;
 
 static long bus_error_jmp[JMP_BUF_LEN];
-- 
2.17.1

