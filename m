Return-Path: <linuxppc-dev+bounces-10740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DBB1DB83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 18:17:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byXPS0xLyz3cBW;
	Fri,  8 Aug 2025 02:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754583452;
	cv=none; b=bgKJ7Beeflocxvsp9D0lnyG/Ct8C/917EBa/uSWYZya7KJhZ9BZ6M0aK3FJ8LwcfmDSwFBn8VKRAdCucoNlvow5h5RVsemAXV55i0THJda4LLvYXaiKpiwHxa8hgIpzUc5pP4J4hbRjTX0pg3euczup2kaFC4mZL4Ypyl1IPfJZUqDpJuLPE2r4EBTKBmaZGsmqeB6/Nt7gJQAUWDcxazTQK8yJg3C1TJgpUbzRIpJKuahwfAVFCLPFqy0KIAVc1CM26Vbfq5iYD+foHVP6D8v6VaL2qRKWmy/hqHDTWnnonS9por5BnViOoA4RyLzULHIFuiL9+zSMhJxfoNn3xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754583452; c=relaxed/relaxed;
	bh=5P34sbRN8JqrkSMzkABFLGj6ONg3zRBkEiDpzeYGy4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlZ2MPxFW2XCzHl1IlnS8gFVIn48CH9AcpgDlDlIDbZnLLfPOLv88YGKlgIhMrhuCi+OR+2xGePxEiG7+/s+OnZ2L4UB8jx2gBbx5Ujkjqn62Vu9e5R9NcfSvOQFmsw8JoalZDvpA9wq82xinvyUKbbRjZQKjcZKEgFN5YMlY+I3UTN74/og2Z3o/UfsHa8WqqyhwXNl5LiX1TcK6Om4B2xjc1RPTpdgXLycpmTV/IPzo6WnT2+so43Iojz6vC5wkUgjkm8H2If1MKuN4iXd23W5iR02UjYkmui6/JvIyXvuddKLop6ddfDHKJ83xeQlccXIh3cYLJ/VTy7vRvFqHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXkhBPI0; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXkhBPI0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byXPQ1Lc1z30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 02:17:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754583450; x=1786119450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KXJ0W+Rq8+ZxkmoRIeTdA/TynKxtfU0rBAxR7DcWJ/U=;
  b=gXkhBPI0hS5ZKd6ht03VQkLwi3iHJJBhYdAUe1Pv5XWImb70+wvy0bmU
   wdHPI6EtDOb8AHTfChaiBG6Mp/F9y4UI0IEKyQgR1dRbDBwI4+IcZ5y4a
   7Vdm5Rfd2GKQ4DDBlDGf+ol3iBUQ2pEvdkWqDGwgbB9n1Qn5rDC4K87As
   5T/3SRNLbGwykasyOI5xF5S6kXlH3LDdVhAEuSE2Y/M6Eka+Ph11y4i14
   FlFXG6j0UXXMzOwwQd6v19u9fiILvvISzWqh4dLyHIqvOfC2xkNQcfak9
   pYgFzLGypSK/OC2NyqHbckOUrQZchSMvnINOVuDxz+VU5oJOXHtfN2Q0I
   g==;
X-CSE-ConnectionGUID: ohNUcdKHQza4Td+W4jUPOQ==
X-CSE-MsgGUID: TZmnDzYWRI2ICd2gMKhjig==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55961736"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55961736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:17:27 -0700
X-CSE-ConnectionGUID: 8mkpCRJiRXydb7NU38x8CA==
X-CSE-MsgGUID: OhVh0fWGS5KxXNRWyyZs+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169230907"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:17:26 -0700
Received: from [10.124.220.198] (unknown [10.124.220.198])
	by linux.intel.com (Postfix) with ESMTP id 928B720B571C;
	Thu,  7 Aug 2025 09:17:24 -0700 (PDT)
Message-ID: <64741634-6e61-48eb-84f3-2e8da6aea2b7@linux.intel.com>
Date: Thu, 7 Aug 2025 09:17:24 -0700
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] powerpc/eeh: Use result of error_detected() in
 uevent
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Linas Vepstas <linasvepstas@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Oliver O'Halloran
 <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>
References: <20250807-add_err_uevents-v5-0-adf85b0620b0@linux.ibm.com>
 <20250807-add_err_uevents-v5-3-adf85b0620b0@linux.ibm.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250807-add_err_uevents-v5-3-adf85b0620b0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/7/25 6:55 AM, Niklas Schnelle wrote:
> Ever since uevent support was added for AER and EEH with commit
> 856e1eb9bdd4 ("PCI/AER: Add uevents in AER and EEH error/resume"), it
> reported PCI_ERS_RESULT_NONE as uevent when recovery begins.
>
> Commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery status for
> udev") subsequently amended AER to report the actual return value of
> error_detected().
>
> Make the same change to EEH to align it with AER and s390.
>
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Link: https://lore.kernel.org/linux-pci/aIp6LiKJor9KLVpv@wunner.de/
> Reviewed-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   arch/powerpc/kernel/eeh_driver.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index 7efe04c68f0fe3fb1c3c13d97d58e79e47cf103b..20ed9685da8b7e6d419a4b02f715b52acfe715d3 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -334,7 +334,7 @@ static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
>   	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
>   
>   	edev->in_error = true;
> -	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
> +	pci_uevent_ers(pdev, rc);
>   	return rc;
>   }
>   
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


