Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8518D2AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:19:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kS9v1NSwzDscR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 02:19:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=jMVdDgVT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kS0F4SxbzDrS7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 02:11:09 +1100 (AEDT)
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de
 [95.90.212.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A35162072D;
 Fri, 20 Mar 2020 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584717066;
 bh=qz6nxjt+oHRdtFK5DtUf8W3pt7MtXBjKeLpdYT+SXj4=;
 h=From:To:Cc:Subject:Date:From;
 b=jMVdDgVTlPr9q4qgOQX+s+/uNPsSTDhfGiESnAjI2AGmzXCyl3PkU1dSvU2b2I1Vu
 CGQA+Ezuq0o70vsmAIKPEauiCmAHHE0cYxQfeWLwYuups0vVmKNTcxChn7S4KXSOvq
 4g6dIhGnq0ArXroR/CxDRUgHb/DLqWbXrZyQEEaQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jFJIe-000ukc-Gx; Fri, 20 Mar 2020 16:11:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/2] Don't generate thousands of new warnings when building
 docs
Date: Fri, 20 Mar 2020 16:11:01 +0100
Message-Id: <cover.1584716446.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>, target-devel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Alex Shi <alex.shi@linux.alibaba.com>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Tyler Hicks <code@tyhicks.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Luca Ceresoli <luca@lucaceresoli.net>, Johannes Berg <johannes.berg@intel.com>,
 ecryptfs@vger.kernel.org, Matthias Maennich <maennich@google.com>,
 dmaengine@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Harry Wei <harryxiyou@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This small series address a regression caused by a new patch at
docs-next (and at linux-next).

Before this patch, when a cross-reference to a chapter within the
documentation is needed, we had to add a markup like:

	.. _foo:

	foo
	===

This behavor is now different after this patch:

	58ad30cf91f0 ("docs: fix reference to core-api/namespaces.rst")

As a Sphinx extension now creates automatically a reference
like the above, without requiring any extra markup.

That, however, comes with a price: it is not possible anymore to have
two sections with the same name within the entire Kernel docs!

This causes thousands of warnings, as we have sections named
"introduction" on lots of places.

This series solve this regression by doing two changes:

1) The references are now prefixed by the document name. So,
   a file named "bar" would have the "foo" reference as "bar:foo".

2) It will only use the first two levels. The first one is (usually) the
   name of the document, and the second one the chapter name.

This solves almost all problems we have. Still, there are a few places
where we have two chapters at the same document with the
same name. The first patch addresses this problem.

The second patch limits the escope of the autosectionlabel.

Mauro Carvalho Chehab (2):
  docs: prevent warnings due to autosectionlabel
  docs: conf.py: avoid thousands of duplicate label warning on Sphinx

 Documentation/conf.py                                 |  4 ++++
 Documentation/driver-api/80211/mac80211-advanced.rst  |  8 ++++----
 Documentation/driver-api/dmaengine/index.rst          |  4 ++--
 Documentation/filesystems/ecryptfs.rst                | 11 +++++------
 Documentation/kernel-hacking/hacking.rst              |  4 ++--
 Documentation/media/kapi/v4l2-controls.rst            |  8 ++++----
 Documentation/networking/snmp_counter.rst             |  4 ++--
 Documentation/powerpc/ultravisor.rst                  |  4 ++--
 Documentation/security/siphash.rst                    |  8 ++++----
 Documentation/target/tcmu-design.rst                  |  6 +++---
 .../translations/zh_CN/process/5.Posting.rst          |  2 +-
 Documentation/x86/intel-iommu.rst                     |  3 ++-
 12 files changed, 35 insertions(+), 31 deletions(-)

-- 
2.24.1


