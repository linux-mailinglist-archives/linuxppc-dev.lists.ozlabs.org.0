Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269FE907E85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0by70cvCz3fmj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0P536y2nz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:53:27 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W0Ncy4kpHzxSCx;
	Thu, 13 Jun 2024 21:32:34 +0800 (CST)
Received: from dggpeml500012.china.huawei.com (unknown [7.185.36.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 5229B140258;
	Thu, 13 Jun 2024 21:36:40 +0800 (CST)
Received: from localhost.localdomain (10.67.175.61) by
 dggpeml500012.china.huawei.com (7.185.36.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 21:36:39 +0800
From: Zheng Yejian <zhengyejian1@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen.n.rao@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <mcgrof@kernel.org>, <mathieu.desnoyers@efficios.com>,
	<masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas@fjasle.eu>,
	<kees@kernel.org>, <james.clark@arm.com>, <kent.overstreet@linux.dev>,
	<yhs@fb.com>, <jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH 1/6] kallsyms: Optimize multiple times of realloc() to one time of malloc()
Date: Thu, 13 Jun 2024 21:37:06 +0800
Message-ID: <20240613133711.2867745-2-zhengyejian1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613133711.2867745-1-zhengyejian1@huawei.com>
References: <20240613133711.2867745-1-zhengyejian1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.61]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500012.china.huawei.com (7.185.36.15)
X-Mailman-Approved-At: Fri, 14 Jun 2024 08:01:41 +1000
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
Cc: zhengyejian1@huawei.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Array 'table' is used to store pointers of symbols that read from in.map
file, and its size depends on the number of symbols. Currently 'table'
is expanded by calling realloc() every 10000 symbols read.

However, there generally are around 100000+ symbols, which means that
the expansion is generally 10+ times.

As an optimization, introduce linked list 'sym_list' to associate and
count all symbols, then store them into 'table' at one time.

Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>
---
 scripts/kallsyms.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 47978efe4797..6559a9802f6e 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -33,6 +33,7 @@
 #define KSYM_NAME_LEN		512
 
 struct sym_entry {
+	struct sym_entry *next;
 	unsigned long long addr;
 	unsigned int len;
 	unsigned int seq;
@@ -60,7 +61,8 @@ static struct addr_range percpu_range = {
 };
 
 static struct sym_entry **table;
-static unsigned int table_size, table_cnt;
+static struct sym_entry *sym_list;
+static unsigned int table_cnt;
 static int all_symbols;
 static int absolute_percpu;
 static int base_relative;
@@ -273,6 +275,7 @@ static void read_map(const char *in)
 	struct sym_entry *sym;
 	char *buf = NULL;
 	size_t buflen = 0;
+	int i;
 
 	fp = fopen(in, "r");
 	if (!fp) {
@@ -286,18 +289,22 @@ static void read_map(const char *in)
 			continue;
 
 		sym->start_pos = table_cnt;
-
-		if (table_cnt >= table_size) {
-			table_size += 10000;
-			table = realloc(table, sizeof(*table) * table_size);
-			if (!table) {
-				fprintf(stderr, "out of memory\n");
-				fclose(fp);
-				exit (1);
-			}
-		}
-
-		table[table_cnt++] = sym;
+		table_cnt++;
+		sym->next = sym_list;
+		sym_list = sym;
+	}
+	table = malloc(sizeof(*table) * table_cnt);
+	if (!table) {
+		fprintf(stderr, "unable to allocate memory for table\n");
+		free(buf);
+		fclose(fp);
+		exit(EXIT_FAILURE);
+	}
+	sym = sym_list;
+	i = table_cnt - 1;
+	while (sym) {
+		table[i--] = sym;
+		sym = sym->next;
 	}
 
 	free(buf);
-- 
2.25.1

