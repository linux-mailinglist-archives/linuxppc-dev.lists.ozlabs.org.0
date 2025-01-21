Return-Path: <linuxppc-dev+bounces-5451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B162DA17EFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 14:40:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcpHn6ycbz30RK;
	Wed, 22 Jan 2025 00:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737466837;
	cv=none; b=VjHydsxfltCLDMSB7fPGso4XsZGop6K8afmAge/tWG9NafWYI/Jhk2SQ907mE/u5osc5wmEV6qhC2wqAaV4v5pWvlsA1xGEqYkHofCWZ6sv9JrSaznRUzp+PCyo+O6DG+gLcDqq2uKHf84b5BU5EaCTvbbLNnmD4+Wdr3b0vD2IC7R7QxUbNFG+lZu4yakqLnl/971ae3KKQHHoBF9I/Qfp8aN52aTvhYLByWQjklSH1Wc+jTjC8Nq+AXEp1DXZ1MXlkXgjuyw5+qpIlMiN/D30yHCN/ANwHMRT+YwbkegfunCflcXiV91EccZJAv5Cr9rq0pnfUCL4R+10FBYg+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737466837; c=relaxed/relaxed;
	bh=1XuHjAhe+6crgeyPxGiThULHkHEa/QwDtL3yiBvZqn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECK6hZpQeJ6WjWpPzci2OGAwT3vL/HlkTrWWhVSmDh5Xf8oN3a20m2Zx4DNKyNK9zrMrn58C79BwYuZi3brzDrmqm0UN+yQn9wnhVNLkQCLn15u4by2H9HWZaKSNnIRMx87a7iJzgGjt7IVhpiK/W2kVkyKxbZsKsCHxMjOeC5bzdLWH5pISYxRt/g34yqonKhMWPsQ6lo1BZdu0E/0y8P5pribqdUpNk8+tb2wcQyibJ1R/2XRejIhLnwmmxXIYcbGQ+p07jUpb+6/ft3iG/1EF2gFN3ENODUZ2mhG9yj4br7taNHfo/Kqwge/a96cp7dkcck5HooyIOz2FmMotxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XXJc1fjY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XXJc1fjY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcpHm6sd4z30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 00:40:36 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LBcWDl021758;
	Tue, 21 Jan 2025 13:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=1XuHjAhe+6crgeyPxGiThULHkHEa/Q
	wDtL3yiBvZqn4=; b=XXJc1fjY1LEte8uWYOHY0rVlVq4wX9PCcoXpIbn1EYs9EL
	OD4/8pPTNQ9wGah7zwpokGzeZLvKhyS2XwyswSQynQSvx4Pq0nVXT5v0PMm1KdzN
	F6FmU2v9zN3MF0dGtVIr8337iz/SeaELL+AkChcaIBTAfjVK9Q1TKCVQHZUYF4b8
	lkEmavTZcGG7bcRDLLuw9HOFrKWm+iyEw+rBb1iDcR2ksQakFyzbWZB9l+0n9NZH
	7bFXS3CXhWJ3qAfxFUQeEb9d90I2xBmDXS8qIuY9SsKjzzFL1VStL4eYIhJR/WhB
	kacwVPn3TvuRt93neu9S0HZxZA9oxnhjkLM3qkFg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a1n9b0sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 13:40:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LAtOsq021012;
	Tue, 21 Jan 2025 13:40:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1b14q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 13:40:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LDeIWj60031254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 13:40:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25C3B2004B;
	Tue, 21 Jan 2025 13:40:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FD1A20040;
	Tue, 21 Jan 2025 13:40:17 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 21 Jan 2025 13:40:17 +0000 (GMT)
Date: Tue, 21 Jan 2025 14:40:16 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-aio@kvack.org,
        linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
        codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
        linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
        fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
        io-uring@vger.kernel.org, bpf@vger.kernel.org,
        kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        Song Liu <song@kernel.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
Message-ID: <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mWjZL4Eizm--6YwnTI2RlL8astD0-e-i
X-Proofpoint-GUID: mWjZL4Eizm--6YwnTI2RlL8astD0-e-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210112
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:

Hi Joel,

> Add the const qualifier to all the ctl_tables in the tree except for
> watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
> loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
> drivers/inifiniband dirs). These are special cases as they use a
> registration function with a non-const qualified ctl_table argument or
> modify the arrays before passing them on to the registration function.
> 
> Constifying ctl_table structs will prevent the modification of
> proc_handler function pointers as the arrays would reside in .rodata.
> This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> constify the ctl_table argument of proc_handlers") constified all the
> proc_handlers.

I could identify at least these occurences in s390 code as well:

diff --git a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
index dd7ba7587dd5..9b83c318f919 100644
--- a/arch/s390/appldata/appldata_base.c
+++ b/arch/s390/appldata/appldata_base.c
@@ -204,7 +204,7 @@ appldata_timer_handler(const struct ctl_table *ctl, int write,
 {
 	int timer_active = appldata_timer_active;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &timer_active,
 		.maxlen		= sizeof(int),
@@ -237,7 +237,7 @@ appldata_interval_handler(const struct ctl_table *ctl, int write,
 {
 	int interval = appldata_interval;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &interval,
 		.maxlen		= sizeof(int),
@@ -269,7 +269,7 @@ appldata_generic_handler(const struct ctl_table *ctl, int write,
 	struct list_head *lh;
 	int rc, found;
 	int active;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.data		= &active,
 		.maxlen		= sizeof(int),
 		.extra1		= SYSCTL_ZERO,
diff --git a/arch/s390/kernel/hiperdispatch.c b/arch/s390/kernel/hiperdispatch.c
index 7857a7e8e56c..7d0ba16085c1 100644
--- a/arch/s390/kernel/hiperdispatch.c
+++ b/arch/s390/kernel/hiperdispatch.c
@@ -273,7 +273,7 @@ static int hiperdispatch_ctl_handler(const struct ctl_table *ctl, int write,
 {
 	int hiperdispatch;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &hiperdispatch,
 		.maxlen		= sizeof(int),
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 6691808bf50a..26e50de83d80 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -629,7 +629,7 @@ static int topology_ctl_handler(const struct ctl_table *ctl, int write,
 	int enabled = topology_is_enabled();
 	int new_mode;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &enabled,
 		.maxlen		= sizeof(int),
@@ -658,7 +658,7 @@ static int polarization_ctl_handler(const struct ctl_table *ctl, int write,
 {
 	int polarization;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &polarization,
 		.maxlen		= sizeof(int),
diff --git a/arch/s390/mm/cmm.c b/arch/s390/mm/cmm.c
index 939e3bec2db7..8e354c90a3dd 100644
--- a/arch/s390/mm/cmm.c
+++ b/arch/s390/mm/cmm.c
@@ -263,7 +263,7 @@ static int cmm_pages_handler(const struct ctl_table *ctl, int write,
 			     void *buffer, size_t *lenp, loff_t *ppos)
 {
 	long nr = cmm_get_pages();
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &nr,
 		.maxlen		= sizeof(long),
@@ -283,7 +283,7 @@ static int cmm_timed_pages_handler(const struct ctl_table *ctl, int write,
 				   loff_t *ppos)
 {
 	long nr = cmm_get_timed_pages();
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &nr,
 		.maxlen		= sizeof(long),


> Best regards,
> -- 
> Joel Granados <joel.granados@kernel.org>

Thanks!

