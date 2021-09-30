Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031141DB7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 15:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKvkg0xmNz3c63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 23:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lQgzyUqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lQgzyUqX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKvjs1np8z2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 23:49:20 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UCBxYt019958; 
 Thu, 30 Sep 2021 09:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Q+AzT0Ijwdw7ICtovDN1my42gJlkON+amsvj9v8ooiM=;
 b=lQgzyUqXVkfGYfIt0Ch8RaKtlmIO6gizazSCeTsQzOdqLwcuzmMl4mFsZAnyWbwIp4FP
 6DPoyR44kXJJZ7lmHh9ozPD83SUDnbwObYunomLIOYbRNofigHr7W9owQJVPIP2u5PDl
 scdMAbKBB/ZsfyiQfRjbBG3urvEypmfqvptUmDx86XfEU90JuutbQpCroOqtimmJ09Gh
 ViMuqNernMb0exN9vnb0YA6w6iPkNqWWei+kMGtd6YDcHT8Ydk3Yta5cyWRODcb4ZK7k
 RURHAnrkOzxAIeIYtMoDQcv/ZnZ+yEWpBxNEfXrPaFCZxPwzSjZH+em+PjODNqawGzU7 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bdd18tfqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 09:48:44 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18UDMbpq025093;
 Thu, 30 Sep 2021 09:48:43 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bdd18tfq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 09:48:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18UDlI4r026910;
 Thu, 30 Sep 2021 13:48:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3b9u1k4bx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 13:48:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18UDmc3x46334294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 13:48:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8532A4040;
 Thu, 30 Sep 2021 13:48:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA81EA405D;
 Thu, 30 Sep 2021 13:48:37 +0000 (GMT)
Received: from [9.145.153.93] (unknown [9.145.153.93])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 13:48:37 +0000 (GMT)
Message-ID: <e53a8113-5037-db2a-7313-d1ef5e430682@linux.ibm.com>
Date: Thu, 30 Sep 2021 15:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 10/11] PCI: Replace pci_dev::driver usage by
 pci_dev::dev.driver
Content-Language: en-US
To: Andrew Donnellan <ajd@linux.ibm.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
 <20210929085306.2203850-11-u.kleine-koenig@pengutronix.de>
 <75dd6d60-08b9-fa68-352c-3a0c5a04c0ab@linux.ibm.com>
 <20210929134330.e5c57t7mtwu5iner@pengutronix.de>
 <1414b3c5-167c-c271-baed-d3d7f6cd0309@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <1414b3c5-167c-c271-baed-d3d7f6cd0309@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ydDkSS-JwggQoWGJmx2KVo1ai4eV3eaN
X-Proofpoint-ORIG-GUID: _H8ui1Jc9Hf375ilmtd2tw6D1AxPAzql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_04,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109300085
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Oliver O'Halloran <oohall@gmail.com>,
 Jiri Olsa <jolsa@redhat.com>, Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kernel@pengutronix.de,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/09/2021 17:44, Andrew Donnellan wrote:
> On 29/9/21 11:43 pm, Uwe Kleine-König wrote:> I'm not a huge fan either, 
> I used it to keep the control flow as is and
>> without introducing several calls to to_pci_driver.
>>
>> The whole code looks as follows:
>>
>>     list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
>>         struct pci_driver *afu_drv;
>>         if (afu_dev->dev.driver &&
>>             (afu_drv = 
>> to_pci_driver(afu_dev->dev.driver))->err_handler &&
>>             afu_drv->err_handler->resume)
>>             afu_drv->err_handler->resume(afu_dev);
>>     }
>>
>> Without assignment in the if it could look as follows:
>>
>>     list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
>>         struct pci_driver *afu_drv;
>>
>>         if (!afu_dev->dev.driver)
>>             continue;
>>
>>         afu_drv = to_pci_driver(afu_dev->dev.driver));
>>
>>         if (afu_drv->err_handler && afu_drv->err_handler->resume)
>>             afu_drv->err_handler->resume(afu_dev);
>>     }
>>
>> Fine for me.
> 
> This looks fine.
> 
> As an aside while writing my email I discovered the existence of 
> container_of_safe(), a version of container_of() that handles the null 
> and err ptr cases... if to_pci_driver() used that, the null check in the 
> caller could be moved until after the to_pci_driver() call which would 
> be neater.
> 
> But then, grep tells me that container_of_safe() is used precisely zero 
> times in the entire tree. Interesting.
> 
>> (Sidenote: What happens if the device is unbound directly after the
>> check for afu_dev->dev.driver? This is a problem the old code had, too
>> (assuming it is a real problem, didn't check deeply).)
> 
> Looking at any of the cxl PCI error handling paths brings back 
> nightmares from a few years ago... Fred: I wonder if we need to add a 
> lock here?

Yes, it's indeed a potential issue, there's nothing to prevent the afu 
driver to unbind during that window. Sigh..

   Fred

