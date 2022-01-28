Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1049F196
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:58:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlMbz6d0Kz3cDw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 13:58:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OO2yL5O5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=baolu.lu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OO2yL5O5; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlMbD6pj9z2ypY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 13:58:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643338697; x=1674874697;
 h=cc:subject:to:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lQzpVBgtczAn5sAewXENYJpIAUiWWZKcbyftWJFiTnk=;
 b=OO2yL5O5GfNRIP+BHQHdQwMjXRtF4C2b0SEyqKFNIzPXow+g61Ymzpra
 n8VSTzpjxwotH15jqJX501NvXcZzc3qNJuJGF3bwnBOrMpPKRp4Kl5XdL
 q3nc7t4YWQuvA32RS7UZKi2XCHKw7LaZpPK5UNASDTrwop617t668es+Z
 ahI5L6TOxgyETiY02sdD0UPug9AWtT9SysCG3uGYnykqIBa5PL2bKeMAD
 wt7e9UiyDBwkHjtz3krtiYlSNEu6kyi6Yptkm8NLDTMwTl8kcmS6mzTeD
 B7KJ+SzG6xvLuRDpQWqQjqBRXX6g/LCbD85tQMPe9mLQfBVtKkozj5hid Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="246803225"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="246803225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 18:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="535953637"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 27 Jan 2022 18:54:10 -0800
Subject: Re: [PATCH v2 1/2] PCI/AER: Disable AER service when link is in L2/L3
 ready, L2 and L3 state
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
 <0259955f-8bbb-1778-f234-398f1356db8b@linux.intel.com>
 <CAAd53p6+KPAJchh9Jx59Fkkj5FidSxsW0yHjLqooFjvu-Y9u7w@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <11891652-40c6-f111-46b7-e96d1729815e@linux.intel.com>
Date: Fri, 28 Jan 2022 10:53:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAd53p6+KPAJchh9Jx59Fkkj5FidSxsW0yHjLqooFjvu-Y9u7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Joerg Roedel <jroedel@suse.de>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 mika.westerberg@linux.intel.com, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/22 7:14 PM, Kai-Heng Feng wrote:
> On Thu, Jan 27, 2022 at 3:01 PM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>>
>> On 2022/1/27 10:54, Kai-Heng Feng wrote:
>>> Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
>>> hint") enables ACS, and some platforms lose its NVMe after resume from
>>> S3:
>>> [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
>>> [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
>>> [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
>>> [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
>>> [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
>>> [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
>>> [   50.947843] nvme nvme0: frozen state error detected, reset controller
>>>
>>> It happens right after ACS gets enabled during resume.
>>>
>>> There's another case, when Thunderbolt reaches D3cold:
>>> [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
>>> [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
>>> [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
>>> [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
>>> [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
>>> [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
>>> [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
>>> [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
>>>
>>> So disable AER service to avoid the noises from turning power rails
>>> on/off when the device is in low power states (D3hot and D3cold), as
>>> PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
>>> transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
>>> with aux power) and L3 (D3cold).
>>>
>>> Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=209149
>>> Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=215453
>>> Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
>>
>> I don't know what this fix has to do with the commit 50310600ebda.
> 
> Commit 50310600ebda only exposed the underlying issue. Do you think
> "Fixes:" tag should change to other commits?
> 
>> Commit 50310600ebda only makes sure that PCI ACS is enabled whenever
>> Intel IOMMU is on. Before this commit, PCI ACS could also be enabled
>> and result in the same problem. Or anything I missed?
> 
> The system in question didn't enable ACS before commit 50310600ebda.

This commit exposed the issue on your configuration doesn't mean the
fix should be back ported as far as that commit. I believe if you add
intel-iommu=on in the kernel parameter, the issue still exists even you
revert commit 50310600ebda or checkout a tag before it.

Best regards,
baolu
