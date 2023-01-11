Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAD6665D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 22:48:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NshC23hw9z3bWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:48:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=cj6OYVDy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=garyguo.net (client-ip=40.107.10.131; helo=gbr01-lo2-obe.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=cj6OYVDy;
	dkim-atps=neutral
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2131.outbound.protection.outlook.com [40.107.10.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsXlm13Blz306l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 03:13:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QC1hqiAJHYH5+bIKXeodj9Icq6eHv6+qeDKz4AOflShcu/3zRFmz0M5za1/AgI5ThUuXoS7gECMK3LmqWfeMZQULc6ucZ+2p6NMaOFWpvmYKLtVsFlQOyykrsWy3ptIXgehUjNnsl2dD4dEpXGaden0rvc31DXjw9ZBe7WGfIeL0RcppzpiuEWdT88D9d82P0tEov19loQKu7t8E7sFhY+MilIIItlyg2nnkXeG+6pBtjkJx3JK7b8VUibrwsCpB/E+JsumQd2HBUDcCGH3lQBmon3Jn7z7CXbm/GUSqNwtkkZ9joT2CjatCJZMpSwklvzazVr6pgkfGIC8nuNYiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/cq4syBM13khIYt0eqs+Kr3V5n1BlMlzvV04z7ICwk=;
 b=Ujv6Pz/Qqd5/GCBZjWs3dRw0vTNR8aIKpezc3mqYYyBtgU7dU6RVce2ejJzE3XGQVBMOKnppsCtAGnFqcXXntGn/oIAPfe3gRfQkI4hyCl2DWhXecxLPjornP6+0rt303CTTAX2z3GRgDl2lpAy8KeVXtWDTg2H6maxUcmKF/ztm2OGdAaLL1hAdb73x8n3L4eHNHMKFK25sF+OIjU+DhZV/VZPsFM5zZYyz24EGLsFFmAsfWqcA6ByHXJlUBgeS7fpXimvfqDebKc3mCqv8FSex3IwWRLCeDepd8G/k/pijfukh5rf6X4SX3fpM/fBVMZYEKcREq+veqPvudlLUlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/cq4syBM13khIYt0eqs+Kr3V5n1BlMlzvV04z7ICwk=;
 b=cj6OYVDytQ/whMk8jahTqaTfXoxqdyKmEKNo1p7hYeju24zO48dnKH8pYozPSYOmCub0+/NQBnfdqRrrbnPP+KjPuBhJysPuSHc8rPU6Gi0H6cFBkCKVYAVNLqlNqQBO2w+4p+Z4CEvTmdMG4yGXGC+aiEeUeGC4qWCcpFi7jr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB5370.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 16:12:47 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f24:8099:5588:8ba8]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f24:8099:5588:8ba8%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 16:12:47 +0000
From: Gary Guo <gary@garyguo.net>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Kees Cook <keescook@chromium.org>,
	Joel Stanley <joel@jms.id.au>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Guo Zhengkui <guozhengkui@vivo.com>
Subject: [PATCH] modpost: support arbitrary symbol length in modversion
Date: Wed, 11 Jan 2023 16:11:51 +0000
Message-Id: <20230111161155.1349375-1-gary@garyguo.net>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0658.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::7) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: f6811b3c-3412-4454-ece1-08daf3eeadba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/qJs+ZDvWZ9cC0Ut9vOREaRYPAIDJA0HF3Svy983Qc/JSHcYnTlBbudX+deV05fAxoXjNbo3oIM9pwCHim4Hb0AC4/i9lkGVqbqz4fFliIF5XsKe4RV2MZzEjErw1tLFCv85aeDeTbg1DDFlL9AQT/TTXdWSWLn2eTZLb3eF9j96dFxa2shz1D7FvDbOVSbFXE2W+hG3iMPH2uCNNlCmRHLkyM6jFIDnGOtnxmgLXIb4MNBoXEFnyNg2CY4QEuqAGJ0dM+uFIyBdS8bazTQNOVvokaoJYd/oLV6ORzOcQIpX9qSKGOLMQcT1SdGOZGOOHV1uSRhKIpYB1c1NS+QkdkBbrMLmo4ihJSXiYgZYH9V9BG4h7uvohqH+UW3UOQWQONSFWjV0+d5qbNzV5w2/BNWqc5fLG6KcjPvPsjVhKtzmqu+9iTpYMfQ1d8FJ3ITX7b/woHWEgEiqGyUolwzBJ7K47ddZ+nnRPMlG6YRSs8WJvqfv6ze/w6Wycje6xb189pqxRlnKKMeVFl4LRAVTtl0ijjaYRgrxCFBgaxO43k9FSqhcvf9a+I0hYYagqP1kQ8Y9DZZFqJthjHLDsEHbPh5ytBww/DRoN4jiqtzBz1xwFYdAkTBk0iZ+Q4W2iZBFBzlo4zEYXDOoA9rmpV1Mo9Qs7tPS4d1Ple3hBLH4cJBFhApYGl2BCMpK42EY5u+VZw9anvp++K3RvPV4EmHjEQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(39830400003)(366004)(136003)(376002)(451199015)(921005)(6512007)(38100700002)(966005)(478600001)(36756003)(6486002)(6666004)(6506007)(86362001)(186003)(26005)(41300700001)(5660300002)(66556008)(66476007)(8676002)(66946007)(4326008)(8936002)(7416002)(83380400001)(1076003)(2616005)(316002)(110136005)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?P6e9S4wEVC0Cek+xD1IsJLwkPDy4u7I/H768I+2KIeUF4+h+cr2VRtP0aeVK?=
 =?us-ascii?Q?+YGlcgrbqNim+rG5qz3TV4wM7am/90vRrzekI1lyH8R+ZHgRi/7G5krGr+o6?=
 =?us-ascii?Q?2IOvfq0qeUP8jkqRH3cEYUmVgE2Ibcn6/p0qZFeBppOXT3QgmSJomj4P6aKV?=
 =?us-ascii?Q?wYoo06rlZHVqpQHj0GI0Kpeb2aJE+Gu70hgl8UQthkXVUcg33Mqfs8fY4auC?=
 =?us-ascii?Q?+PsfMfVCo9SVKFYDSAsTlZ+/jFOwyt6KUnArwqqKXjNzHljcxsG/Olj+SU+Z?=
 =?us-ascii?Q?ps7hv6uTrG2/pv0BxKfMmiXrJJCtVA2KVp1E+pcJaY6tbCULerNdb1wTneVT?=
 =?us-ascii?Q?08VXK2xpDNWGlcxIxzLgVQtD1x8VsxpH9ZMVGNE9jnaoiSaqzzIfoIwVVXqB?=
 =?us-ascii?Q?JFwHzaEV1VVXt8DQbFRSJz+RzxT8UFwvafdS5d0RqZWubfKYZuW2epIp251b?=
 =?us-ascii?Q?TNZuMklQRufMChX88/mUfKsIQq0WczUSyLpWLn+dgCT/z9eKwHPm6gzYqefX?=
 =?us-ascii?Q?NB4sOmDmPbpAfHNvkHySgXX/1tt4PlLUP6GlriRRKy/w34MDs61CAEL98Fj/?=
 =?us-ascii?Q?vcrUtJcaPL61AkR0rjiJpqSLy7bT8kfv4q9b0zUiypzi7S6gWWu6/qti3dgA?=
 =?us-ascii?Q?YM611XXFf15D8qrFERgsg3uD9Ij8KwX4QroNTlOyfB9HIk2DTptP6qZ/UDQo?=
 =?us-ascii?Q?EZL2+EL38tBzqsC7sGLhlQeurmS3rV6IHfThvG+rq2MFBYlNkkvkk01yaLRO?=
 =?us-ascii?Q?vHhHqEjdKcHnLauSz8wnvnTFZfHebdiSowtQ/2KX0lbAHJluBJJOUZ5W3Bhv?=
 =?us-ascii?Q?HPDpQV4lvHTYj+ZLgfMFM1Z4ihS+gDHLZBVDvv3QDo+edg8qDFdAYS/YXZpX?=
 =?us-ascii?Q?zvq7KLVDc1wyafF2zM+Ydw0Le93peLLWINAkemQPTI6KkY5Vi+rzlsbcNeKt?=
 =?us-ascii?Q?1wwzcVGC5s+NoPNsSYugMf41+qfg4pn2/jRENzYfhgDdQr40oFSHg+7JpeiG?=
 =?us-ascii?Q?OTgk9v626O3ZfroamtDSaQqbvCy5XcOW4a2NYl4iC+HRkYLyvPTZV6vU553s?=
 =?us-ascii?Q?6dl32SrHsrK824xYvUv7g29DEBFENjoumdcJmSYmXOy3gBUPlcb2wexBIEah?=
 =?us-ascii?Q?5Jo25/1nMVz0VXNx7A+YEZoMerRDuBD6JLsmI6Y2Wtrmu38SMDsN6JAhLPzL?=
 =?us-ascii?Q?BgvmOEcOrIwjP10wVnk2v8ZJfohMFS96Y4ALm3OMFSDGQc/3r4X0TlEmkeCr?=
 =?us-ascii?Q?+jMWeJdv4Xl3gZmkbKCZ5fhEwwur8G9szzTht18kGKK6Bh6i3zOuWjSJW642?=
 =?us-ascii?Q?TUCUeS3X4qGyLzbg1G2MMEQNPMNClJXyVXrpNPjzCup9Ov6QlGV4y+MOpnVS?=
 =?us-ascii?Q?DwiV6mUemajCUx9YYUlk4mI/uYE2gCeUhapprKOvaQ4k/8ReEd18O+8qq6Pi?=
 =?us-ascii?Q?GIIhkez0sgqeJ/qFTY741jpUMVDzk7NrlQjlkXYzNRTW3SxHquLg93k59Fto?=
 =?us-ascii?Q?BapOr5YbnpT53JEcUkU62leryBObXGMz9OiIk8rxjT+9maYxuSDxbzrxF/PW?=
 =?us-ascii?Q?5rvypSFAm+1GaPljuRM=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f6811b3c-3412-4454-ece1-08daf3eeadba
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 16:12:47.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w64zcsaEhjHr1U+lSpEHJyUYIgLmv2PEqn1tUDZwh8vK0coCbJwo3IiWJ7cBGa/iVoOP7H+YYC29qOL7zTmsHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5370
X-Mailman-Approved-At: Thu, 12 Jan 2023 08:46:12 +1100
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
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Wedson Almeida Filho <wedsonaf@google.com>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently modversion uses a fixed size array of size (64 - sizeof(long))
to store symbol names, thus placing a hard limit on length of symbols.
Rust symbols (which encodes crate and module names) can be quite a bit
longer. The length limit in kallsyms is increased to 512 for this reason.

It's a waste of space to simply expand the fixed array size to 512 in
modversion info entries. I therefore make it variably sized, with offset
to the next entry indicated by the initial "next" field.

In addition to supporting longer-than-56/60 byte symbols, this patch also
reduce the size for short symbols by getting rid of excessive 0 paddings.
There are still some zero paddings to ensure "next" and "crc" fields are
properly aligned.

This patch does have a tiny drawback that it makes ".mod.c" files generated
a bit less easy to read, as code like

	"\x08\x00\x00\x00\x78\x56\x34\x12"
	"symbol\0\0"

is generated as opposed to

	{ 0x12345678, "symbol" },

because the structure is now variable-length. But hopefully nobody reads
the generated file :)

Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
Link: https://github.com/Rust-for-Linux/linux/pull/379

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 arch/powerpc/kernel/module_64.c |  3 ++-
 include/linux/module.h          |  6 ++++--
 kernel/module/version.c         | 21 +++++++++------------
 scripts/export_report.pl        |  9 +++++----
 scripts/mod/modpost.c           | 33 +++++++++++++++++++++++----------
 5 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index ff045644f13f..eac23c11d579 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -236,10 +236,11 @@ static void dedotify_versions(struct modversion_info *vers,
 {
 	struct modversion_info *end;
 
-	for (end = (void *)vers + size; vers < end; vers++)
+	for (end = (void *)vers + size; vers < end; vers = (void *)vers + vers->next) {
 		if (vers->name[0] == '.') {
 			memmove(vers->name, vers->name+1, strlen(vers->name));
 		}
+	}
 }
 
 /*
diff --git a/include/linux/module.h b/include/linux/module.h
index 8c5909c0076c..37cb25af9099 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -34,8 +34,10 @@
 #define MODULE_NAME_LEN MAX_PARAM_PREFIX_LEN
 
 struct modversion_info {
-	unsigned long crc;
-	char name[MODULE_NAME_LEN];
+	/* Offset of the next modversion entry in relation to this one. */
+	u32 next;
+	u32 crc;
+	char name[0];
 };
 
 struct module;
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e..af7478dcc158 100644
--- a/kernel/module/version.c
+++ b/kernel/module/version.c
@@ -17,32 +17,29 @@ int check_version(const struct load_info *info,
 {
 	Elf_Shdr *sechdrs = info->sechdrs;
 	unsigned int versindex = info->index.vers;
-	unsigned int i, num_versions;
-	struct modversion_info *versions;
+	struct modversion_info *versions, *end;
+	u32 crcval;
 
 	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
 	if (!crc)
 		return 1;
+	crcval = *crc;
 
 	/* No versions at all?  modprobe --force does this. */
 	if (versindex == 0)
 		return try_to_force_load(mod, symname) == 0;
 
 	versions = (void *)sechdrs[versindex].sh_addr;
-	num_versions = sechdrs[versindex].sh_size
-		/ sizeof(struct modversion_info);
+	end = (void *)versions + sechdrs[versindex].sh_size;
 
-	for (i = 0; i < num_versions; i++) {
-		u32 crcval;
-
-		if (strcmp(versions[i].name, symname) != 0)
+	for (; versions < end; versions = (void *)versions + versions->next) {
+		if (strcmp(versions->name, symname) != 0)
 			continue;
 
-		crcval = *crc;
-		if (versions[i].crc == crcval)
+		if (versions->crc == crcval)
 			return 1;
-		pr_debug("Found checksum %X vs module %lX\n",
-			 crcval, versions[i].crc);
+		pr_debug("Found checksum %X vs module %X\n",
+			 crcval, versions->crc);
 		goto bad_version;
 	}
 
diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index feb3d5542a62..1117646f3141 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -116,18 +116,19 @@ foreach my $thismod (@allcfiles) {
 	while ( <$module> ) {
 		chomp;
 		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
+			$state = 1 if ($_ =~ /static const char ____versions/);
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
 			next;
 		}
 		if ($state == 2) {
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
+			if ( $_ !~ /\\0"/ ) {
+				last if ($_ =~ /;/);
 				next;
 			}
-			my $sym = (split /([,"])/,)[4];
+			my $sym = (split /(["\\])/,)[2];
 			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
 			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
 			push(@{$MODULE{$thismod}} , $sym);
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index efff8078e395..334d170de31f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2046,13 +2046,17 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
+	unsigned int name_len;
+	unsigned int name_len_padded;
+	unsigned int tmp;
+	unsigned char *tmp_view = (unsigned char *)&tmp;
 
 	if (!modversions)
 		return;
 
 	buf_printf(b, "\n");
-	buf_printf(b, "static const struct modversion_info ____versions[]\n");
-	buf_printf(b, "__used __section(\"__versions\") = {\n");
+	buf_printf(b, "static const char ____versions[]\n");
+	buf_printf(b, "__used __section(\"__versions\") =\n");
 
 	list_for_each_entry(s, &mod->unresolved_symbols, list) {
 		if (!s->module)
@@ -2062,16 +2066,25 @@ static void add_versions(struct buffer *b, struct module *mod)
 				s->name, mod->name);
 			continue;
 		}
-		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
-		}
-		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
-			   s->crc, s->name);
+		name_len = strlen(s->name);
+		name_len_padded = (name_len + 1 + 3) & ~3;
+
+		/* Offset to next entry */
+		tmp = TO_NATIVE(8 + name_len_padded);
+		buf_printf(b, "\t\"\\x%02x\\x%02x\\x%02x\\x%02x",
+			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
+
+		tmp = TO_NATIVE(s->crc);
+		buf_printf(b, "\\x%02x\\x%02x\\x%02x\\x%02x\"\n",
+			   tmp_view[0], tmp_view[1], tmp_view[2], tmp_view[3]);
+
+		buf_printf(b, "\t\"%s", s->name);
+		for (; name_len < name_len_padded; name_len++)
+			buf_printf(b, "\\0");
+		buf_printf(b, "\"\n");
 	}
 
-	buf_printf(b, "};\n");
+	buf_printf(b, ";\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.34.1

