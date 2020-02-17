Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E44C9160D3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 09:29:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LcbT6KPDzDqn1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 19:29:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=alexey.budankov@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LcFV5xjDzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 19:13:50 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 00:13:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,451,1574150400"; d="scan'208";a="435475567"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2020 00:13:47 -0800
Received: from [10.125.252.180] (abudanko-mobl.ccr.corp.intel.com
 [10.125.252.180])
 by linux.intel.com (Postfix) with ESMTP id 1684E5804A2;
 Mon, 17 Feb 2020 00:13:40 -0800 (PST)
Subject: [PATCH v7 12/12] doc/admin-guide: update kernel.rst with CAP_PERFMON
 information
From: Alexey Budankov <alexey.budankov@linux.intel.com>
To: James Morris <jmorris@namei.org>, Serge Hallyn <serge@hallyn.com>,
 Stephen Smalley <sds@tycho.nsa.gov>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Helge Deller <deller@gmx.de>,
 Thomas Gleixner <tglx@linutronix.de>
References: <c8de937a-0b3a-7147-f5ef-69f467e87a13@linux.intel.com>
Organization: Intel Corp.
Message-ID: <ab933480-ac99-2e22-ed91-f25d2b23ef38@linux.intel.com>
Date: Mon, 17 Feb 2020 11:13:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c8de937a-0b3a-7147-f5ef-69f467e87a13@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-man@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Igor Lubashev <ilubashe@akamai.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, oprofile-list@lists.sf.net,
 Jiri Olsa <jolsa@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Update kernel.rst documentation file with the information
related to usage of CAP_PERFMON capability to secure performance
monitoring and observability operations in system.

Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index def074807cee..b06ae9389809 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -720,20 +720,26 @@ perf_event_paranoid:
 ====================
 
 Controls use of the performance events system by unprivileged
-users (without CAP_SYS_ADMIN).  The default value is 2.
+users (without CAP_PERFMON). The default value is 2.
+
+For backward compatibility reasons access to system performance
+monitoring and observability remains open for CAP_SYS_ADMIN
+privileged processes but CAP_SYS_ADMIN usage for secure system
+performance monitoring and observability operations is discouraged
+with respect to CAP_PERFMON use cases.
 
 ===  ==================================================================
  -1  Allow use of (almost) all events by all users
 
      Ignore mlock limit after perf_event_mlock_kb without CAP_IPC_LOCK
 
->=0  Disallow ftrace function tracepoint by users without CAP_SYS_ADMIN
+>=0  Disallow ftrace function tracepoint by users without CAP_PERFMON
 
-     Disallow raw tracepoint access by users without CAP_SYS_ADMIN
+     Disallow raw tracepoint access by users without CAP_PERFMON
 
->=1  Disallow CPU event access by users without CAP_SYS_ADMIN
+>=1  Disallow CPU event access by users without CAP_PERFMON
 
->=2  Disallow kernel profiling by users without CAP_SYS_ADMIN
+>=2  Disallow kernel profiling by users without CAP_PERFMON
 ===  ==================================================================
 
 
-- 
2.20.1


