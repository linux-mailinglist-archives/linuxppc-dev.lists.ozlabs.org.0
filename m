Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B54DA125
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 18:28:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ0k35Wftz3bb8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 04:28:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eqT/ENsE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eqT/ENsE; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ0jL5nkgz2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 04:27:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647365271; x=1678901271;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ziFZXhnT03uuTOlbqC0mwUAOAr35MoEzqvS9Lt46bRY=;
 b=eqT/ENsE5cBjxKhYyiG0gwvmJD/AN7zNbL8PRWDL7B/H83LYyZYauYFm
 uNgCJUDUrx9fP913P4tjDCJVeusUuiS9T++E+ZNZYvgqkj25bpMvxR66m
 a+w/dXsIYHnEsio7A+uoHeD6IetSrdOiE3pBSP/7GxZO9hF/VVTfkoA7b
 eAMrMMcxZ1TtKUG3MKxo3n9Na5HPLZpMGuucWTnQl353R/cfRVxFFFT3y
 8FF5D9ANjIWWf/QsW3Ghi7nGdxWrs4oi8r+OOid7y5FE+/80wDtFcbWEK
 Ru8z+zzy+EKYT6ufvwUA1TSnDeVq41y+uqK6DraM6bZtRV+3s8Snv52xl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256095974"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="256095974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 10:26:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="512690836"
Received: from rariley-mobl.amr.corp.intel.com (HELO [10.209.120.225])
 ([10.209.120.225])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 10:26:46 -0700
Message-ID: <2d4e8811-dce6-c891-e92d-e3746434685e@linux.intel.com>
Date: Tue, 15 Mar 2022 10:26:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Content-Language: en-US
To: Eric Badger <ebadger@purestorage.com>
References: <20220315050842.120063-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20220315171425.GA1521135@ebps>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220315171425.GA1521135@ebps>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver OHalloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/15/22 10:14 AM, Eric Badger wrote:
>>   # Prep injection data for a correctable error.
>>   $ cd /sys/kernel/debug/apei/einj
>>   $ echo 0x00000040 > error_type
>>   $ echo 0x4 > flags
>>   $ echo 0x891000 > param4
>>
>>   # Root Error Status is initially clear
>>   $ setpci -s <Dev ID> ECAP0001+0x30.w
>>   0000
>>
>>   # Inject one error
>>   $ echo 1 > error_inject
>>
>>   # Interrupt received
>>   pcieport <Dev ID>: AER: Root Error Status 0001
>>
>>   # Inject another error (within 5 seconds)
>>   $ echo 1 > error_inject
>>
>>   # No interrupt received, but "multiple ERR_COR" is now set
>>   $ setpci -s <Dev ID> ECAP0001+0x30.w
>>   0003
>>
>>   # Wait for a while, then clear ERR_COR. A new interrupt immediately
>>     fires.
>>   $ setpci -s <Dev ID> ECAP0001+0x30.w=0x1
>>   pcieport <Dev ID>: AER: Root Error Status 0002
>>
>> Currently, the above issue has been only reproduced in the ICL server
>> platform.
>>
>> [Eric: proposed reproducing steps]
> Hmm, this differs from the procedure I described on v1, and I don't
> think will work as described here.

I have attempted to modify the steps to reproduce it without returning
IRQ_NONE for all cases (which will break the functionality). But I
think I did not correct the last few steps.

How about replacing the last 3 steps with following?

  # Inject another error (within 5 seconds)
  $ echo 1 > error_inject

  # You will get a new IRQ with only multiple ERR_COR bit set
  pcieport <Dev ID>: AER: Root Error Status 0002

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
