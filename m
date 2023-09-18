Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F27A4632
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 11:40:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq0CV0H90z3cSg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 19:40:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq0Bx716Sz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 19:40:07 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0VsKThJJ_1695029998;
Received: from 30.240.112.49(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0VsKThJJ_1695029998)
          by smtp.aliyun-inc.com;
          Mon, 18 Sep 2023 17:40:00 +0800
Message-ID: <e486db16-d36d-9e14-4f10-dc755c0ef97d@linux.alibaba.com>
Date: Mon, 18 Sep 2023 17:39:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Content-Language: en-US
From: Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Questions: Should kernel panic when PCIe fatal error occurs?
To: "lenb@kernel.org" <lenb@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 mahesh@linux.ibm.com, bhelgaas@google.com,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, gregkh@linuxfoundation.org
Content-Type: text/plain; charset=UTF-8
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
Cc: Linux PCI <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, all folks,

Error reporting and recovery are one of the important features of PCIe, and
the kernel has been supporting them since version 2.6, 17 years ago.
I am very curious about the expected behavior of the software.
I first recap the error classification and then list my questions bellow it.

## Recap: Error classification

- Fatal Errors

Fatal errors are uncorrectable error conditions which render the particular
Link and related hardware unreliable. For Fatal errors, a reset of the
components on the Link may be required to return to reliable operation.
Platform handling of Fatal errors, and any efforts to limit the effects of
these errors, is platform implementation specific. (PCIe 6.0.1, sec
6.2.2.2.1 Fatal Errors).

- Non-Fatal Errors

Non-fatal errors are uncorrectable errors which cause a particular
transaction to be unreliable but the Link is otherwise fully functional.
Isolating Non-fatal from Fatal errors provides Requester/Receiver logic in
a device or system management software the opportunity to recover from the
error without resetting the components on the Link and disturbing other
transactions in progress. Devices not associated with the transaction in
error are not impacted by the error.  (PCIe 6.0.1, sec 6.2.2.2.1 Non-Fatal
Errors).

## What the kernel do?

The Linux kernel supports both the OS native and firmware first modes in
AER and DPC drivers. The error recovery API is defined in `struct
pci_error_handlers`, and the recovery process is performed in several
stages in pcie_do_recovery(). One main difference in handling PCIe errors
is that the kernel only resets the link when a fatal error is detected.

## Questions

1. Should kernel panic when fatal errors occur without AER recovery?

IMHO, the answer is NO. The AER driver handles both fatal and non-fatal
errors, and I have not found any panic changes in the recovery path in OS
native mode.

As far as I know, on many X86 platforms, struct `acpi_hest_generic_status::error_severity`
is set as CPER_SEV_FATAL in firmware first mode. As a result, kernel will
panic immediately in ghes_proc() when fatal AER errors occur, and there
is no chance to handle the error and perform recovery in AER driver.

For fatal and non-fatal errors, struct `acpi_hest_generic_status::error_severity`
should as CPER_SEV_RECOVERABLE, and struct `acpi_hest_generic_data::error_severity`
should reflect its real severity. Then, the kernel is equivalent to handling
PCIe errors in Firmware first mode as it does in OS native mode.
Please correct me if I am wrong.

However, I have changed my mind on this issue as I encounter a case where
a error propagation is detected due to fatal DLLP (Data Link Protocol
Error) error. A DLLP error occurred in the Compute node, causing the
node to panic because `struct acpi_hest_generic_status::error_severity` was
set as CPER_SEV_FATAL. However, data corruption was still detected in the
storage node by CRC.

2. Should kernel panic when AER recovery failed?

This question is actually a TODO that was added when the AER driver was
first upstreamed 17 years ago, and it is still relevant today. The kernel
does not proactively panic regardless of the error types occurring in OS
native mode. The DLLP error propagation case indicates that the kernel
might should panic when recovery failed?

3. Should DPC be enabled by default to contain fatal and non-fatal error?

According to the PCIe specification, DPC halts PCIe traffic below a
Downstream Port after an unmasked uncorrectable error is detected at or
below the Port, avoiding the potential spread of any data corruption.

The kernel configures DPC to be triggered only on ERR_FATAL. Literally
speaking, only fatal error have the potential spread of any data
corruption? In addition, the AER Severity is programable by the
Uncorrectable Error Severity Register (Offset 0Ch in PCIe AER cap). If a
default fatal error, e.g. DLLP, set as non-fatal, DPC will not be
triggered.


Looking forward to any comments and reply :)

Thank you.

Best Regards,
Shuai


[1] https://github.com/torvalds/linux/commit/6c2b374d74857e892080ee726184ec1d15e7d4e4#diff-fea64904d30501b59d2e948189bbedc476fc270ed4c15e4ae29d7f0efd06771aR438









