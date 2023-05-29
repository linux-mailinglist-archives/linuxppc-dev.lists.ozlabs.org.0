Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A27143D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 07:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV4Rf27p8z3fBT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 15:52:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NTyT/sjd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.24; helo=mailout1.samsung.com; envelope-from=maninder1.s@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NTyT/sjd;
	dkim-atps=neutral
X-Greylist: delayed 390 seconds by postgrey-1.36 at boromir; Mon, 29 May 2023 15:51:28 AEST
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV4Qm1fmtz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 15:51:25 +1000 (AEST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20230529054442epoutp018a14210f2e49528f61372a31bbfea188~jhvdgFbYH2208922089epoutp01J
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 05:44:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20230529054442epoutp018a14210f2e49528f61372a31bbfea188~jhvdgFbYH2208922089epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1685339082;
	bh=VKGA7JRShMZpv9qQksUeVQx6cayrYtRJ5ilKYNP0jmE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=NTyT/sjdXwOKF36GE+jkfCeAiwH+K4Kuu30gYW2CjFH9kJUBMCWhPCIGtMREsV+VA
	 mii2WKxOc2VcXwW9IdMeqzthQ5ZZkb4f12JwphMQpquVRKfXqXlqIQzKP6+EluPXMW
	 tKY99UVdtTIY4FsXy10t/zSoIQ3ZURNiUmI3OuFA=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20230529054442epcas5p174f7f1efb7ecaa25dcb51543f75c5f46~jhvc-Ls2d0107001070epcas5p1E;
	Mon, 29 May 2023 05:44:42 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EA.1D.16380.9CB34746; Mon, 29 May 2023 14:44:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3~jhhVsx2dC0673106731epcas5p4b;
	Mon, 29 May 2023 05:28:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230529052832epsmtrp1af9353d7aba59de1154e69418a46b28f~jhhVrzAe12525125251epsmtrp1M;
	Mon, 29 May 2023 05:28:32 +0000 (GMT)
X-AuditID: b6c32a4b-7dffd70000013ffc-a3-64743bc96d39
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	9B.40.28392.FF734746; Mon, 29 May 2023 14:28:31 +0900 (KST)
Received: from localhost.localdomain (unknown [107.109.224.44]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20230529052828epsmtip2ec3d5bb5aec6f5fcd83577c21270d0c9~jhhSnoNsd1095910959epsmtip2J;
	Mon, 29 May 2023 05:28:28 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: bcain@quicinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, keescook@chromium.org, nathanl@linux.ibm.com,
	ustavoars@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	ojeda@kernel.org, pmladek@suse.com, wedsonaf@google.com
Subject: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array size
Date: Mon, 29 May 2023 10:58:21 +0530
Message-Id: <20230529052821.58175-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPKsWRmVeSWpSXmKPExsWy7bCmlu5J65IUg77/lhZ/Z29nt3i4u4XF
	4s6k5+wWF8+8ZrQ4051r8b5lB5vF5V1z2Cx+f//HanF4fhuLxZaGQ2wWG44GW/x8cYPFYuX8
	5YwWK3o+sFr8f/wVSLw7wmTRsXglo4Ogx+yGiyweX2+eY/JY9LKBxWNJ5y8mj52z7rJ7LNhU
	6rFpVSebx4RFBxg9zs9YyOgxcU+dR9+WVYwe67dcZfH4vEkugDeKyyYlNSezLLVI3y6BK+P3
	om+sBe08FdPP3WBpYOzh6mLk5JAQMJFYdHMhWxcjF4eQwG5GiVlzdjJBOJ8YJVq2XoNyPjNK
	vNozkxmm5fDvn2C2kMAuRonOvhqIoi+MEtfvnwdLsAnoSazatYcFJCEi0MokcePwabAlzAIb
	GSX+7lnFCFIlLOAl8eHrfFYQm0VAVeLi0w52EJtXwEbiyaxGVoh18hIzL32HigtKnJz5hAXE
	ZgaKN2+dzQwyVELgDIdE087pQEM5gBwXiUVzCiB6hSVeHd/CDmFLSbzsb2OHKCmX2DqhHqK1
	hVFi/5wpbBA19hJPLi5kBalhFtCUWL9LHyIsKzH11DomiLV8Er2/nzBBxHkldsyDsVUlWm5u
	gDpZWuLzx48sELaHxKnvq1ghoRUrse/MIuYJjPKzkHwzC8k3sxA2L2BkXsUomVpQnJueWmxa
	YJyXWq5XnJhbXJqXrpecn7uJEZwGtbx3MD568EHvECMTB+MhRgkOZiURXtvE4hQh3pTEyqrU
	ovz4otKc1OJDjNIcLErivOq2J5OFBNITS1KzU1MLUotgskwcnFINTIuFN0aYrT3lPXV7/LeO
	oPZSlULpPvWvjnW9sz/OWTyN99+3M3PObYwLOeLC9jCbuyCPY/lVbv6ZzYZakxcUcPwKcuhL
	NzIy2mqbsuPk1dAjQZ6HujKZ9bb0hTUdmZ2+M75cwuHn/LceSx55iGUofcn0vLOgc/HBx5zq
	EknnZb6uVz9r+eFYzm2xwhelyWXrA2yW5SXvnfPzwLRDYVF6z7TmH89Vec5vxu9o8Olvu4xU
	GsdMrpksTnN2dEzvcp2z6eos6W/64R/vv2ebs/dV1l+15w9zlERnt+5drBMSduPGbW/b3gxL
	Lp8j7//UqPEuvPp37jXhgxwB7qkNUU5ubNuf/XG4cb0oT/GyqbNqqxJLcUaioRZzUXEiAJrs
	hsPyAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJXve/eUmKwZPrNhZ/Z29nt3i4u4XF
	4s6k5+wWF8+8ZrQ4051r8b5lB5vF5V1z2Cx+f//HanF4fhuLxZaGQ2wWG44GW/x8cYPFYuX8
	5YwWK3o+sFr8f/wVSLw7wmTRsXglo4Ogx+yGiyweX2+eY/JY9LKBxWNJ5y8mj52z7rJ7LNhU
	6rFpVSebx4RFBxg9zs9YyOgxcU+dR9+WVYwe67dcZfH4vEkugDeKyyYlNSezLLVI3y6BK+P3
	om+sBe08FdPP3WBpYOzh6mLk5JAQMJE4/PsncxcjF4eQwA5GiYW7X7FCJKQlfv57zwJhC0us
	/PecHaLoE6PE7tdnwRJsAnoSq3btYQFJiAhMZZKY8vo+G0iCWWAro8SSK/UgtrCAl8SHr/PB
	prIIqEpcfNrBDmLzCthIPJnVCLVNXmLmpe9QcUGJkzOfsEDMkZdo3jqbeQIj3ywkqVlIUgsY
	mVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgRHlZbWDsY9qz7oHWJk4mA8xCjBwawk
	wmubWJwixJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA9Ne
	E2HTExmS6ce+nW786zprzUHdGNPWp0pnYkqu3/6Zf1DZmU/50PHz23T2+Kz0auuaGFRwpHej
	5NyebVI5OlMEpq8UE663XFu8/Pe/WVVLtwhemmzgpeypsLp+Uva8CazrWDuOf5m+9ambMd8h
	zR2F649/FTNjfzJv4Q0hbpn+0g+JonyikVFyNxcUveKNuF8m69lxR3Txl8ArlaUchm/cZyw6
	6FLAaXLMmaWCrVrWJaf3fOyCZRfuCHU+SZMzTNn6Ym5L+oWwC5N5P/qH9lyyr+j0Nym+civu
	FKf9nrjyOcv/fZyTuHuqzsTfadIS7hsslp/buUk5PcVCZMuHX5Osv26zFpTrdk/60fNehV2J
	pTgj0VCLuag4EQDXWk9QGQMAAA==
X-CMS-MailID: 20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3
References: <CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcas5p4.samsung.com>
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

for powerpc and hexagon it was defined as "128" directly.
and commit '61968dbc2d5d' changed define value to 512,
So both were missed to update with new size.

Fixes: 61968dbc2d5d ("kallsyms: increase maximum kernel symbol length to 512")
Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/hexagon/kernel/traps.c | 2 +-
 arch/powerpc/xmon/xmon.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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

