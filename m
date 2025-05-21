Return-Path: <linuxppc-dev+bounces-8856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD1AAC007E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 01:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2nLQ5V9Kz2yg0;
	Thu, 22 May 2025 09:14:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747869262;
	cv=none; b=F2sbYkq+MIcNRGc8bxtugckzNJhCbpZtjwVRO8fHo2WkHCqda1jdRxVqNKpgTntxs5n7txhVsycjchLuW9HN4PS7E63DEkccyJlL4TBEoSXCRen0sPwqw9zti7SoRLUeyqQ7qk6nkYPqzLL/logPibc/Rtg069BX24/zOnNFuG0WR3KE1GfrLNEsIzRTWsP5g864lpcmJaePzmU80E6/NAMscyzLU1G09l85cNj3fGYjtgIrqLXdgjI9qtB4JMHNaAcMAgdR2WKl8cy3CxNx1cjwFFoz3cMZHFA6k8uVZIOokU/DF+wM3l7KQLiIZOGje4oKkI8Mx1DTrZaZ4yI/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747869262; c=relaxed/relaxed;
	bh=unishcxoDwsJ3QQ2jn+a7LkLTrGePM9nYjhykSmAARE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Aku4tbt8sCkKAYEzi1puYMyPZuWWkXtVSVKwn9nUG/BrEiLqh/SRxGWogMxEfk2BMsq0dephzkH17/1F6l0FKBECHev2xcpevmqRmTSfpSADpP3hF0kfKAeOvLH5yfffrNk5efdf59vsrYjHvp3XSHcdzxYu/Rlx8C2YyOrawYDo8ysd9E8PjBXGw/whtPZE5yN4SrZkkUQ/Q/3E1bokUlVn+LEM/5uXZAuQJPHpQ6VTzvmfKHJCgbo0vaDUeUe+QJMyb40+OCQHnZGrO8S+TK2hj5SO/WIiM7my+P8bldN59TNdcbAt3eYdSmF+lbkUxJ1mwgNiaKgnGah2jQzPUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RdJ0c0s9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RdJ0c0s9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2nLP651zz2yf5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 09:14:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC5D05C2773;
	Wed, 21 May 2025 23:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4D2C4CEE4;
	Wed, 21 May 2025 23:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747869259;
	bh=Voi7I3S+A0StWAxqXEP+uWXA3AEGImT0GetIfq3rdNI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RdJ0c0s9E/j+A//tCE8ylFaKiFYOpVx0L6xMmNLMjEQxg86r8gEpv7yJuTpW5wTuB
	 +6Yp8wiLwGD8yO9FgE6QOPdIDkDaazUwFBuss6bTE+MWozbBaNFp2HQvE843+oAlpO
	 YYVGpEDg/6qbybPv6W2z/axXg1rMpQBszy6mndiSO6aZiHmfOiKmb3B52+Y2qErixB
	 dMspmnYWcyU4l5hWaSFHW21vJWMRlrUHfvXXYJOfZiTt1EkppGZsacbHiMGVeHFusD
	 ZQEt5GN5moKzJDk074zNku6zWEmk9LOsQ8qMiqTxYj2DYA9M0c/0ibhW3x7e+xoywZ
	 VB5yAtRo9XEBw==
Date: Wed, 21 May 2025 18:14:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v7 00/17] Rate limit AER logs
Message-ID: <20250521231418.GA1454532@bhelgaas>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520215047.1350603-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 04:50:17PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This work is mostly due to Jon Pan-Doh and Karolina Stolarek.  I rebased
> this to v6.15-rc1, factored out some of the trace and statistics updates,
> and added some minor cleanups.
> 
> I'm sorry to post a v7 so soon after v6, but I really want to get this in
> v6.16 so it needs to get into pci/next soonish.  I pushed this to pci/aer
> at https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=aer
> (head cbde036e5615 ("PCI/AER: Add sysfs attributes for log ratelimits"))
> and appended the interdiff from v6 to v7 below.

Thank you ever so much for all your reviewing time.  I addressed most
of the comments (except Sathy's comments about the sysfs
cor/uncor/nonfatal names), but I hate to deluge you all with another
full posting.

So for now I updated the "aer" branch above (current head d41e0decb7d7
("PCI/AER: Add sysfs attributes for log ratelimits")) and attached the
interdiff between v7 and d41e0decb7d7 below.


diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index a3261e842d6d..eca2812cfd25 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -587,13 +587,14 @@ static inline bool pci_dev_test_and_set_removed(struct pci_dev *dev)
 
 struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
+	int ratelimit_print[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
 	const char *level;		/* printk level */
 
 	unsigned int id:16;
 
 	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
-	unsigned int ratelimit:1;	/* 0=skip, 1=print */
+	unsigned int root_ratelimit_print:1;	/* 0=skip, 1=print */
 	unsigned int __pad1:4;
 	unsigned int multi_error_valid:1;
 
@@ -606,15 +607,16 @@ struct aer_err_info {
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
-int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
-void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
+int aer_get_device_error_info(struct aer_err_info *info, int i);
+void aer_print_error(struct aer_err_info *info, int i);
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      unsigned int tlp_len, bool flit,
 		      struct pcie_tlp_log *log);
 unsigned int aer_tlp_log_len(struct pci_dev *dev, u32 aercc);
 void pcie_print_tlp_log(const struct pci_dev *dev,
-			const struct pcie_tlp_log *log, const char *pfx);
+			const struct pcie_tlp_log *log, const char *level,
+			const char *pfx);
 #endif	/* CONFIG_PCIEAER */
 
 #ifdef CONFIG_PCIEPORTBUS
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9b8dea317a79..48014010dc8b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -672,31 +672,31 @@ static DEVICE_ATTR_RW(ratelimit_log_enable);
 	static ssize_t							\
 	name##_show(struct device *dev, struct device_attribute *attr,	\
 		    char *buf)						\
-{									\
-	struct pci_dev *pdev = to_pci_dev(dev);				\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
 									\
-	return sysfs_emit(buf, "%d\n",					\
-			  pdev->aer_info->ratelimit.burst);		\
-}									\
+		return sysfs_emit(buf, "%d\n",				\
+				  pdev->aer_info->ratelimit.burst);	\
+	}								\
 									\
 	static ssize_t							\
 	name##_store(struct device *dev, struct device_attribute *attr,	\
 		     const char *buf, size_t count)			\
-{									\
-	struct pci_dev *pdev = to_pci_dev(dev);				\
-	int burst;							\
+	{								\
+		struct pci_dev *pdev = to_pci_dev(dev);			\
+		int burst;						\
 									\
-	if (!capable(CAP_SYS_ADMIN))					\
-		return -EPERM;						\
+		if (!capable(CAP_SYS_ADMIN))				\
+			return -EPERM;					\
 									\
-	if (kstrtoint(buf, 0, &burst) < 0)				\
-		return -EINVAL;						\
+		if (kstrtoint(buf, 0, &burst) < 0)			\
+			return -EINVAL;					\
 									\
-	pdev->aer_info->ratelimit.burst = burst;			\
+		pdev->aer_info->ratelimit.burst = burst;		\
 									\
-	return count;							\
-}									\
-static DEVICE_ATTR_RW(name)
+		return count;						\
+	}								\
+	static DEVICE_ATTR_RW(name)
 
 aer_ratelimit_burst_attr(ratelimit_burst_cor_log, cor_log_ratelimit);
 aer_ratelimit_burst_attr(ratelimit_burst_uncor_log, uncor_log_ratelimit);
@@ -734,9 +734,6 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 	u64 *counter = NULL;
 	struct aer_info *aer_info = pdev->aer_info;
 
-	trace_aer_event(pci_name(pdev), (info->status & ~info->mask),
-			info->severity, info->tlp_header_valid, &info->tlp);
-
 	if (!aer_info)
 		return;
 
@@ -785,6 +782,9 @@ static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 {
 	struct ratelimit_state *ratelimit;
 
+	if (severity == AER_FATAL)
+		return 1;	/* AER_FATAL not ratelimited */
+
 	if (severity == AER_CORRECTABLE)
 		ratelimit = &dev->aer_info->cor_log_ratelimit;
 	else
@@ -817,7 +817,7 @@ static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 }
 
 static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
-			     const char *details)
+			     bool found)
 {
 	u16 source = info->id;
 
@@ -825,18 +825,27 @@ static void aer_print_source(struct pci_dev *dev, struct aer_err_info *info,
 		 info->multi_error_valid ? "Multiple " : "",
 		 aer_error_severity_string[info->severity],
 		 pci_domain_nr(dev->bus), PCI_BUS_NUM(source),
-		 PCI_SLOT(source), PCI_FUNC(source), details);
+		 PCI_SLOT(source), PCI_FUNC(source),
+		 found ? "" : " (no details found");
 }
 
-void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
+void aer_print_error(struct aer_err_info *info, int i)
 {
-	int layer, agent;
-	int id = pci_dev_id(dev);
+	struct pci_dev *dev;
+	int layer, agent, id;
 	const char *level = info->level;
 
-	pci_dev_aer_stats_incr(dev, info);
+	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+		return;
 
-	if (!info->ratelimit)
+	dev = info->dev[i];
+	id = pci_dev_id(dev);
+
+	pci_dev_aer_stats_incr(dev, info);
+	trace_aer_event(pci_name(dev), (info->status & ~info->mask),
+			info->severity, info->tlp_header_valid, &info->tlp);
+
+	if (!info->ratelimit_print[i])
 		return;
 
 	if (!info->status) {
@@ -858,7 +867,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	__aer_print_error(dev, info);
 
 	if (info->tlp_header_valid)
-		pcie_print_tlp_log(dev, &info->tlp, dev_fmt("  "));
+		pcie_print_tlp_log(dev, &info->tlp, level, dev_fmt("  "));
 
 out:
 	if (info->id && info->error_dev_num > 1 && info->id == id)
@@ -903,11 +912,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 
 	info.status = status;
 	info.mask = mask;
-	info.tlp_header_valid = tlp_header_valid;
-	if (tlp_header_valid)
-		info.tlp = aer->header_log;
 
 	pci_dev_aer_stats_incr(dev, &info);
+	trace_aer_event(pci_name(dev), (status & ~mask),
+			aer_severity, tlp_header_valid, &aer->header_log);
 
 	if (!aer_ratelimit(dev, info.severity))
 		return;
@@ -925,13 +933,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 		aer_printk(info.level, dev, "aer_uncor_severity: 0x%08x\n",
 			   aer->uncor_severity);
 
-	/*
-	 * pcie_print_tlp_log() uses KERN_ERR, but we only call it when
-	 * tlp_header_valid is set, and info.level is always KERN_ERR in
-	 * that case.
-	 */
 	if (tlp_header_valid)
-		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
+		pcie_print_tlp_log(dev, &aer->header_log, info.level,
+				   dev_fmt("  "));
 }
 EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
 
@@ -942,23 +946,27 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
  */
 static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
 {
+	int i = e_info->error_dev_num;
+
+	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+		return -ENOSPC;
+
+	e_info->dev[i] = pci_dev_get(dev);
+	e_info->error_dev_num++;
+
 	/*
 	 * Ratelimit AER log messages.  "dev" is either the source
 	 * identified by the root's Error Source ID or it has an unmasked
-	 * error logged in its own AER Capability.  If any of these devices
-	 * has not reached its ratelimit, log messages for all of them.
-	 * Messages are emitted when "e_info->ratelimit" is non-zero.
-	 *
-	 * Note that "e_info->ratelimit" was already initialized to 1 for the
-	 * ERR_FATAL case.
+	 * error logged in its own AER Capability.  Messages are emitted
+	 * when "ratelimit_print[i]" is non-zero.  If we will print detail
+	 * for a downstream device, make sure we print the Error Source ID
+	 * from the root as well.
 	 */
-	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
-		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
-		e_info->ratelimit |= aer_ratelimit(dev, e_info->severity);
-		e_info->error_dev_num++;
-		return 0;
+	if (aer_ratelimit(dev, e_info->severity)) {
+		e_info->ratelimit_print[i] = 1;
+		e_info->root_ratelimit_print = 1;
 	}
-	return -ENOSPC;
+	return 0;
 }
 
 /**
@@ -1337,19 +1345,26 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
 
 /**
  * aer_get_device_error_info - read error status from dev and store it to info
- * @dev: pointer to the device expected to have an error record
  * @info: pointer to structure to store the error record
+ * @i: index into info->dev[]
  *
  * Return: 1 on success, 0 on error.
  *
  * Note that @info is reused among all error devices. Clear fields properly.
  */
-int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
+int aer_get_device_error_info(struct aer_err_info *info, int i)
 {
-	int type = pci_pcie_type(dev);
-	int aer = dev->aer_cap;
+	struct pci_dev *dev;
+	int type, aer;
 	u32 aercc;
 
+	if (i >= AER_MAX_MULTI_ERR_DEVICES)
+		return 0;
+
+	dev = info->dev[i];
+	aer = dev->aer_cap;
+	type = pci_pcie_type(dev);
+
 	/* Must reset in this function */
 	info->status = 0;
 	info->tlp_header_valid = 0;
@@ -1401,11 +1416,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 
 	/* Report all before handling them, to not lose records by reset etc. */
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
-			aer_print_error(e_info->dev[i], e_info);
+		if (aer_get_device_error_info(e_info, i))
+			aer_print_error(e_info, i);
 	}
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
+		if (aer_get_device_error_info(e_info, i))
 			handle_error_source(e_info->dev[i], e_info);
 	}
 }
@@ -1425,17 +1440,18 @@ static void aer_isr_one_error_type(struct pci_dev *root,
 
 	/*
 	 * If we're going to log error messages, we've already set
-	 * "info->ratelimit" to non-zero (which enables printing) because
-	 * this is either an ERR_FATAL or we found a device with an error
-	 * logged in its AER Capability.
+	 * "info->root_ratelimit_print" and "info->ratelimit_print[i]" to
+	 * non-zero (which enables printing) because this is either an
+	 * ERR_FATAL or we found a device with an error logged in its AER
+	 * Capability.
 	 *
 	 * If we didn't find the Error Source device, at least log the
 	 * Requester ID from the ERR_* Message received by the Root Port or
 	 * RCEC, ratelimited by the RP or RCEC.
 	 */
-	if (info->ratelimit ||
+	if (info->root_ratelimit_print ||
 	    (!found && aer_ratelimit(root, info->severity)))
-		aer_print_source(root, info, found ? "" : " (no details found");
+		aer_print_source(root, info, found);
 
 	if (found)
 		aer_process_err_devices(info);
@@ -1470,14 +1486,12 @@ static void aer_isr_one_error(struct pci_dev *root,
 		aer_isr_one_error_type(root, &e_info);
 	}
 
-	/* Note that messages for ERR_FATAL are never ratelimited */
 	if (status & PCI_ERR_ROOT_UNCOR_RCV) {
 		int fatal = status & PCI_ERR_ROOT_FATAL_RCV;
 		int multi = status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
 		struct aer_err_info e_info = {
 			.id = ERR_UNCOR_ID(e_src->id),
 			.severity = fatal ? AER_FATAL : AER_NONFATAL,
-			.ratelimit = fatal ? 1 : 0,
 			.level = KERN_ERR,
 			.multi_error_valid = multi ? 1 : 0,
 		};
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 530c5e2cf7e8..fc18349614d7 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -222,7 +222,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
 			  dpc_tlp_log_len(pdev),
 			  pdev->subordinate->flit_mode,
 			  &tlp_log);
-	pcie_print_tlp_log(pdev, &tlp_log, dev_fmt(""));
+	pcie_print_tlp_log(pdev, &tlp_log, KERN_ERR, dev_fmt(""));
 
 	if (pdev->dpc_rp_log_size < PCIE_STD_NUM_TLP_HEADERLOG + 1)
 		goto clear_status;
@@ -253,6 +253,10 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 		info->severity = AER_NONFATAL;
 
 	info->level = KERN_ERR;
+
+	info->dev[0] = dev;
+	info->error_dev_num = 1;
+
 	return 1;
 }
 
@@ -270,9 +274,8 @@ void dpc_process_error(struct pci_dev *pdev)
 		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
 			 status);
 		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
-		    aer_get_device_error_info(pdev, &info)) {
-			info.ratelimit = 1;	/* ERR_FATAL; no ratelimit */
-			aer_print_error(pdev, &info);
+		    aer_get_device_error_info(&info, 0)) {
+			aer_print_error(&info, 0);
 			pci_aer_clear_nonfatal_status(pdev);
 			pci_aer_clear_fatal_status(pdev);
 		}
diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 890d5391d7f5..71f8fc9ea2ed 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -98,12 +98,14 @@ int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
  * pcie_print_tlp_log - Print TLP Header / Prefix Log contents
  * @dev: PCIe device
  * @log: TLP Log structure
+ * @level: Printk log level
  * @pfx: String prefix
  *
  * Prints TLP Header and Prefix Log information held by @log.
  */
 void pcie_print_tlp_log(const struct pci_dev *dev,
-			const struct pcie_tlp_log *log, const char *pfx)
+			const struct pcie_tlp_log *log, const char *level,
+			const char *pfx)
 {
 	/* EE_PREFIX_STR fits the extended DW space needed for the Flit mode */
 	char buf[11 * PCIE_STD_MAX_TLP_HEADERLOG + 1];
@@ -130,6 +132,6 @@ void pcie_print_tlp_log(const struct pci_dev *dev,
 		}
 	}
 
-	pci_err(dev, "%sTLP Header%s: %s\n", pfx,
+	dev_printk(level, &dev->dev, "%sTLP Header%s: %s\n", pfx,
 		log->flit ? " (Flit)" : "", buf);
 }

