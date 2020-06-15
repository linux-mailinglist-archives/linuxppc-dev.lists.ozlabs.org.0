Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7561FA22E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 22:59:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m3bk40VnzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 06:59:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m3Xh0RhvzDqdn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 06:56:33 +1000 (AEST)
IronPort-SDR: fJngvNbpjQCJ0mkjTtsnleKkYVhfo4LDfbnAmS/CLzgCUU4WE8yt75EM3BZOqD86nsBqyDBI+y
 vqBcoyPnaSjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 13:56:27 -0700
IronPort-SDR: muuOGndW6l2twqgKRUp5gHj+I6DHwdVVXjshaVMnzZ31gcVkdJsq7yUI+1XuAIXfF8xffWXCmG
 4mfjL2O9CNyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,516,1583222400"; d="scan'208";a="261210056"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2020 13:56:26 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.56]) by
 ORSMSX107.amr.corp.intel.com ([169.254.1.92]) with mapi id 14.03.0439.000;
 Mon, 15 Jun 2020 13:56:15 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Andy Lutomirski <luto@amacapital.net>, "Yu, Fenghua" <fenghua.yu@intel.com>
Subject: RE: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Thread-Topic: [PATCH v2 12/12] x86/traps: Fix up invalid PASID
Thread-Index: AQHWQRt0fMmHYsE9aUKb3rSjyAIL46jZyC2AgACD5gCAAAQ1gIAAJA2AgAAFHACAAAbEgIAAA+gAgAATCICAAAmFgP//iy/g
Date: Mon, 15 Jun 2020 20:56:15 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F7F66C849@ORSMSX115.amr.corp.intel.com>
References: <20200615201735.GE13792@romley-ivt3.sc.intel.com>
 <C41D099B-BE2E-4D0E-A7B5-7CE587E11930@amacapital.net>
In-Reply-To: <C41D099B-BE2E-4D0E-A7B5-7CE587E11930@amacapital.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Peter Zijlstra <peterz@infradead.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Yu, 
 Yu-cheng" <yu-cheng.yu@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, "Mehta, Sohil" <sohil.mehta@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBBcmUgd2UgcGxhbm5pbmcgdG8ga2VlcCBQQVNJRCBsaXZlIG9uY2UgYSB0YXNrIGhhcyB1c2Vk
IGl0IG9uY2Ugb3IgYXJlIHdlIGdvaW5nIHRvIHN3YXAgaXQgbGF6aWx5PyAgSWYgdGhlIGxhdHRl
ciwgYSBwZXJjcHUgdmFyaWFibGUgbWlnaHQgYmUgYmV0dGVyLg0KDQpDdXJyZW50IHBsYW4gaXMg
InRvdWNoIGl0IG9uY2UgYW5kIHRoZSB0YXNrIG93bnMgaXQgdW50aWwgZXhpdCgyKSINCg0KTWF5
YmUgc29tZWRheSBpbiB0aGUgZnV0dXJlIHdoZW4gd2UgaGF2ZSBkYXRhIG9uIGhvdyBhcHBsaWNh
dGlvbnMNCmFjdHVhbGx5IHVzZSBhY2NlbGVyYXRvcnMgd2UgY291bGQgbG9vayBhdCBzb21ldGhp
bmcgbW9yZSBjb21wbGV4DQppZiB1c2FnZSBwYXR0ZXJucyBsb29rIGxpa2UgaXQgd291bGQgYmUg
YmVuZWZpY2lhbC4NCg0KLVRvbnkNCg==
