Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107D889CC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 12:28:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M9vcMUQl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V39fH0PC1z3dmy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 22:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M9vcMUQl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=haifeng.zhao@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 25 Mar 2024 19:46:39 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V363z2pXPz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 19:46:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711356399; x=1742892399;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=knUdCX/JOXqL4snKEL002fjNHL5rz0BFYkaGhcfpTvA=;
  b=M9vcMUQlGn7X0kkfp95zxzWnKddDAY/rVxWZhxmKenHLfKHEnXiAVTu1
   X4TrTqhO1XTSKXMW6KWE6SM3Yn7v1tE7VThYqrDhu4Gw/R6H+luYteLS2
   LTmp892Qqv05Bu7iEt7GY/SrAliEgwTvCiSOZJ49+PL6Pe/VllVecbc1i
   n5Q9GxSrX9NuuGMg7k3sqQP04RaqJOUaa6m37HMBn2Jmdk7heWbaLwYgf
   of9Wej84on00zP6O8c4Zy5sRN0zYEpHuVFFMV1jtgqogl1SgWnpk+Xb7q
   yFgc2AovmmkiN+bQdXbgTHonIEcCc9g63Z9MBJyvBv5YH4ZOKy1lPOKdG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10139252"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="10139252"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 01:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="15601892"
Received: from zhaohaif-mobl.ccr.corp.intel.com (HELO [10.254.215.245]) ([10.254.215.245])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 01:45:27 -0700
Message-ID: <38601aef-b082-463f-8e41-f73a4307de21@linux.intel.com>
Date: Mon, 25 Mar 2024 16:45:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
To: Xi Ruoyao <xry111@xry111.site>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230918193913.GA203601@bhelgaas>
 <0a44fd663e93ac5b36865b0080da52d94252791a.camel@xry111.site>
From: Ethan Zhao <haifeng.zhao@linux.intel.com>
In-Reply-To: <0a44fd663e93ac5b36865b0080da52d94252791a.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Mar 2024 22:27:31 +1100
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/25/2024 1:19 AM, Xi Ruoyao wrote:
> On Mon, 2023-09-18 at 14:39 -0500, Bjorn Helgaas wrote:
>> On Mon, Sep 18, 2023 at 07:42:30PM +0800, Xi Ruoyao wrote:
>>> ...
>>> My workstation suffers from too much correctable AER reporting as well
>>> (related to Intel's errata "RPL013: Incorrectly Formed PCIe Packets May
>>> Generate Correctable Errors" and/or the motherboard design, I guess).
>> We should rate-limit correctable error reporting so it's not
>> overwhelming.
>>
>> At the same time, I'm *also* interested in the cause of these errors,
>> in case there's a Linux defect or a hardware erratum that we can work
>> around.  Do you have a bug report with any more details, e.g., a dmesg
>> log and "sudo lspci -vv" output?
> Hi Bjorn,
>
> Sorry for the *very* late reply (somehow I didn't see the reply at all
> before it was removed by my cron job, and now I just savaged it from
> lore.kernel.org...)
>
> The dmesg is like:
>
> [  882.456994] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:00:1c.1
> [  882.457002] pcieport 0000:00:1c.1: AER: found no error details for 0000:00:1c.1
> [  882.457003] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:06:00.0
> [  883.545763] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:00:1c.1
> [  883.545789] pcieport 0000:00:1c.1: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Receiver ID)
> [  883.545790] pcieport 0000:00:1c.1:   device [8086:7a39] error status/mask=00000001/00002000
> [  883.545792] pcieport 0000:00:1c.1:    [ 0] RxErr                  (First)
> [  883.545794] pcieport 0000:00:1c.1: AER:   Error of this Agent is reported first
> [  883.545798] r8169 0000:06:00.0: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Transmitter ID)
> [  883.545799] r8169 0000:06:00.0:   device [10ec:8125] error status/mask=00001101/0000e000
> [  883.545800] r8169 0000:06:00.0:    [ 0] RxErr                  (First)
> [  883.545801] r8169 0000:06:00.0:    [ 8] Rollover
> [  883.545802] r8169 0000:06:00.0:    [12] Timeout
> [  883.545815] pcieport 0000:00:1c.1: AER: Correctable error message received from 0000:00:1c.1
> [  883.545823] pcieport 0000:00:1c.1: AER: found no error details for 0000:00:1c.1
> [  883.545824] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:06:00.0
>
> lspci output attached.
>
> Intel has issued an errata "RPL013" saying:
>
> "Under complex microarchitectural conditions, the PCIe controller may
> transmit an incorrectly formed Transaction Layer Packet (TLP), which
> will fail CRC checks. When this erratum occurs, the PCIe end point may
> record correctable errors resulting in either a NAK or link recovery.
> Intel® has not observed any functional impact due to this erratum."
>
> But I'm really unsure if it describes my issue.
>
> Do you think I have some broken hardware and I should replace the CPU
> and/or the motherboard (where the r8169 is soldered)?  I've noticed that
> my 13900K is almost impossible to overclock (despite it's a K), but I've
> not encountered any issue other than these AER reporting so far after I
> gave up overclocking.

Seems there are two r8169 nics on your board, only 0000:06:00.0 reports
aer errors, how about another one the 0000:07:00.0 nic ?


Thanks,
Ethan

