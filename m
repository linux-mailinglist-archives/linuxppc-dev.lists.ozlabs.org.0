Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7588D539
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 04:51:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GmSRCuBR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4CQD0blQz3dXb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 14:51:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GmSRCuBR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=haifeng.zhao@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4CPT10h5z3c4C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 14:50:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711511437; x=1743047437;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8FuvHj1lo7MqFCoSr7VmIEgHXsnZYyUvy3bJUnQm6yI=;
  b=GmSRCuBRVNPaodXaA2hn+aYde0J5vsSEjTTNRl6ocCGx/f/9fWe8clX1
   dh8VfC7g0RGxsjX/XKyik3syl6fGGx5xTPZo9Za9T3Y1MatsTCJmcF271
   mat27cAdaeg/RbpzEYCZIeJ+sXGBiakLFRlV6tCqpEvyg6xsFTp21Cchr
   BluOxJnq+sSpwO6jsGFXlmN1TxJjJl89F3eec3DC3mbbwfbmVTglUMqzj
   h58kl2NfEq3Bn6h8sBdps1mOCLrOKzdzfwKNII7dVHU/nBuIVpAe6E0dc
   cA1agZ47mYGcws52MfoOsdeUn/VUdeEjeM1021BkZ2SF4CTrH2o6XfAp1
   g==;
X-CSE-ConnectionGUID: c+mZkkHwQUeFsYl7vpj9KQ==
X-CSE-MsgGUID: H3YOLnbMSG+77tc+Q4w5KA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6449944"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6449944"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 20:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16095770"
Received: from zjiang7-mobl.ccr.corp.intel.com (HELO [10.254.212.75]) ([10.254.212.75])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 20:50:10 -0700
Message-ID: <ac855191-1289-40f5-b910-fb9558d5df76@linux.intel.com>
Date: Wed, 27 Mar 2024 11:49:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20240326211705.GA1497507@bhelgaas>
From: Ethan Zhao <haifeng.zhao@linux.intel.com>
In-Reply-To: <20240326211705.GA1497507@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com, Xi Ruoyao <xry111@xry111.site>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/27/2024 5:17 AM, Bjorn Helgaas wrote:
> On Tue, Mar 26, 2024 at 09:39:54AM +0800, Ethan Zhao wrote:
>> On 3/25/2024 6:15 PM, Xi Ruoyao wrote:
>>> On Mon, 2024-03-25 at 16:45 +0800, Ethan Zhao wrote:
>>>> On 3/25/2024 1:19 AM, Xi Ruoyao wrote:
>>>>> On Mon, 2023-09-18 at 14:39 -0500, Bjorn Helgaas wrote:
>>>>>> On Mon, Sep 18, 2023 at 07:42:30PM +0800, Xi Ruoyao wrote:
>>>>>>> ...
>>>>>>> My workstation suffers from too much correctable AER reporting as well
>>>>>>> (related to Intel's errata "RPL013: Incorrectly Formed PCIe Packets May
>>>>>>> Generate Correctable Errors" and/or the motherboard design, I guess).
>>>>>> We should rate-limit correctable error reporting so it's not
>>>>>> overwhelming.
>>>>>>
>>>>>> At the same time, I'm *also* interested in the cause of these errors,
>>>>>> in case there's a Linux defect or a hardware erratum that we can work
>>>>>> around.  Do you have a bug report with any more details, e.g., a dmesg
>>>>>> log and "sudo lspci -vv" output?
>>>>> Hi Bjorn,
>>>>>
>>>>> Sorry for the *very* late reply (somehow I didn't see the reply at all
>>>>> before it was removed by my cron job, and now I just savaged it from
>>>>> lore.kernel.org...)
>>>>>
>>>>> The dmesg is like:
>>>>>
>>>>> [  882.456994] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:00:1c.1
>>>>> [  882.457002] pcieport 0000:00:1c.1: AER: found no error details for 0000:00:1c.1
>>>>> [  882.457003] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:06:00.0
>>>>> [  883.545763] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:00:1c.1
>>>>> [  883.545789] pcieport 0000:00:1c.1: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Receiver ID)
>>>>> [  883.545790] pcieport 0000:00:1c.1:   device [8086:7a39] error status/mask=00000001/00002000
>>>>> [  883.545792] pcieport 0000:00:1c.1:    [ 0] RxErr                  (First)
>>>>> [  883.545794] pcieport 0000:00:1c.1: AER:   Error of this Agent is reported first
>>>>> [  883.545798] r8169 0000:06:00.0: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Transmitter ID)
>>>>> [  883.545799] r8169 0000:06:00.0:   device [10ec:8125] error status/mask=00001101/0000e000
>>>>> [  883.545800] r8169 0000:06:00.0:    [ 0] RxErr                  (First)
>>>>> [  883.545801] r8169 0000:06:00.0:    [ 8] Rollover
>>>>> [  883.545802] r8169 0000:06:00.0:    [12] Timeout
>>>>> [  883.545815] pcieport 0000:00:1c.1: AER: Correctable error message received from 0000:00:1c.1
>>>>> [  883.545823] pcieport 0000:00:1c.1: AER: found no error details for 0000:00:1c.1
>>>>> [  883.545824] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:06:00.0
>>>>>
>>>>> lspci output attached.
>>>>>
>>>>> Intel has issued an errata "RPL013" saying:
>>>>>
>>>>> "Under complex microarchitectural conditions, the PCIe controller may
>>>>> transmit an incorrectly formed Transaction Layer Packet (TLP), which
>>>>> will fail CRC checks. When this erratum occurs, the PCIe end point may
>>>>> record correctable errors resulting in either a NAK or link recovery.
>>>>> Intel® has not observed any functional impact due to this erratum."
>>>>>
>>>>> But I'm really unsure if it describes my issue.
>>>>>
>>>>> Do you think I have some broken hardware and I should replace the CPU
>>>>> and/or the motherboard (where the r8169 is soldered)?  I've noticed that
>>>>> my 13900K is almost impossible to overclock (despite it's a K), but I've
>>>>> not encountered any issue other than these AER reporting so far after I
>>>>> gave up overclocking.
>>>> Seems there are two r8169 nics on your board, only 0000:06:00.0 reports
>>>> aer errors, how about another one the 0000:07:00.0 nic ?
>>> It never happens to 0000:07:00.0, even if I plug the ethernet cable into
>>> it instead of 0000:06:00.0.
>> So something is wrong with the physical layer, I guess.
>>
>>> Maybe I should just use 0000:07:00.0 and blacklist 0000:06:00.0 as I
>>> don't need two NICs?
>> Yup,
>> ratelimit the AER warning is another choice instead of change WARN to INFO.
>> if corrected error flood happens, even the function is working, suggests
>> something was already wrong, likely will be worse, that is the meaning of
>> WARN I think.
> We should fix this.  IMHO Correctable Errors should be "info" level,
> non-alarming, and rate-limited.  They're basically hints about link
> integrity.

This case, hit following errors:

[  883.545800] r8169 0000:06:00.0:    [ 0] RxErr
[  883.545801] r8169 0000:06:00.0:    [ 8] Rollover
[  883.545802] r8169 0000:06:00.0:    [12] Timeout

#1 Timeout -- replay timer timeout, means endpoint didn't response with ACK DLLP or
NACK in time, that caused the re-send timer timeout, the sender will re-send the
packet.

#2 Rollover -- the counter of re-transmission reaches 0 (from 11b ->00b), means the
sender had tried 3 times. that would trigger link retraining to recover.

#1 & #2 happened together, but no uncorrected errors reported, means the link was
recovered, the issue mostly caused by improper TxEQ, receiver equalization, bad
signal integrity.

#3 RxErr -- bad DLLP, bad TLP, clock issue, signal integrity issue etc.

so, yup, basically, the signal integrity is not good enough.
Though the function could work, its performance will be impacted.

If we change it to "info" level, by default, users wouldn't see such errors, they
might hit more serious data corruption/malfunction in the future without WARN
precaution to them.

Thanks,
Ethan

> Bjorn
>
