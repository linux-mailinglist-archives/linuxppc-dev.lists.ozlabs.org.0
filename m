Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA795F986
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 16:00:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ffkt72qgzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 00:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fffV73xbzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 23:56:49 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x64DblWf098839
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jul 2019 09:56:45 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2thhn3ap2x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2019 09:56:45 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Thu, 4 Jul 2019 14:56:43 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Jul 2019 14:56:41 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x64DudPB50593958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jul 2019 13:56:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1C035204E;
 Thu,  4 Jul 2019 13:56:39 +0000 (GMT)
Received: from [9.102.27.58] (unknown [9.102.27.58])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C821B52052;
 Thu,  4 Jul 2019 13:56:37 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <1562241547.6165.81.camel@linux.ibm.com>
Date: Thu, 4 Jul 2019 19:26:36 +0530
Content-Transfer-Encoding: 7bit
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
 <1562241547.6165.81.camel@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19070413-0016-0000-0000-0000028F398A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070413-0017-0000-0000-000032ECD8C2
Message-Id: <0EDE02C7-3716-47A2-B7B0-007025F28567@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=920 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907040171
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
Cc: Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 04-Jul-2019, at 5:29 PM, Mimi Zohar <zohar@linux.ibm.com> wrote:
> 
> On Wed, 2019-07-03 at 23:32 -0400, Nayna Jain wrote:
>> The nr_allocated_banks and allocated banks are initialized as part of
>> tpm_chip_register. Currently, this is done as part of auto startup
>> function. However, some drivers, like the ibm vtpm driver, do not run
>> auto startup during initialization. This results in uninitialized memory
>> issue and causes a kernel panic during boot.
>> 
>> This patch moves the pcr allocation outside the auto startup function
>> into tpm_chip_register. This ensures that allocated banks are initialized
>> in any case.
>> 
>> Fixes: 879b589210a9 ("tpm: retrieve digest size of unknown algorithms with
>> PCR read")
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Thanks for the fix. Kernel boots fine with this fix.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin

