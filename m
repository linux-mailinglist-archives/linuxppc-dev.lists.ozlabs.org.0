Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD028D28A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 18:47:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9hLB4pqzzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 03:47:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M0G5/idk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9hJT3LKhzDqZB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 03:46:16 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09DGXMqU165007; Tue, 13 Oct 2020 12:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=sjJID2OIHZzArz/nQ6l5yNCTkjThYM/EUEbxpLbM6Sc=;
 b=M0G5/idk55jAC9fvZAxYZlEdSJN611so7huv2zS9dfPKebXygr9AoVwNvAZrRloFVgx1
 NtPMBg5oUJToiPvSYVF+L2pFjT874uSlWAavH3xBunQBlfBDm0S9HARxoibelymdpB0M
 7ESqw7dntuoQD3ZgvlB4Ek3P++caLRgB5LDDQxD1Q/H5LBggvWGrpKiYDWtOhofVIXhT
 Xjah2tjMwaanXzzVjYZYadNrZTv5eDYZ0FL8TwYeMIWZTRJP7TRcftS4pu7E0Uk+yOAv
 VN8bUmxYgDDPuWcsscSJSx90VHvXEHvRLFIv+sYHkp9PjGyUH8HCmJOzc/4XPurUt6lU kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 345fkqrtx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 12:46:08 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09DGYotE169823;
 Tue, 13 Oct 2020 12:46:08 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 345fkqrtw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 12:46:08 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09DGWV9a020429;
 Tue, 13 Oct 2020 16:46:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3434k7spqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 16:46:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09DGk3uX23396752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Oct 2020 16:46:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66905A4054;
 Tue, 13 Oct 2020 16:46:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84AF9A4060;
 Tue, 13 Oct 2020 16:46:01 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.65.195])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Oct 2020 16:46:01 +0000 (GMT)
Message-ID: <ae9ab2560f6d7b114726efb1ec26f0a36f695335.camel@linux.ibm.com>
Subject: Re: [PATCH v2] ima: defer arch_ima_get_secureboot() call to IMA
 init time
From: Mimi Zohar <zohar@linux.ibm.com>
To: Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org
Date: Tue, 13 Oct 2020 12:46:00 -0400
In-Reply-To: <20201013081804.17332-1-ardb@kernel.org>
References: <20201013081804.17332-1-ardb@kernel.org>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_08:2020-10-13,
 2020-10-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010130118
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
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 James Morris <jmorris@namei.org>, Chester Lin <clin@suse.com>,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Cc'ing linuxppc-dev@lists.ozlabs.org]

On Tue, 2020-10-13 at 10:18 +0200, Ard Biesheuvel wrote:
> Chester reports that it is necessary to introduce a new way to pass
> the EFI secure boot status between the EFI stub and the core kernel
> on ARM systems. The usual way of obtaining this information is by
> checking the SecureBoot and SetupMode EFI variables, but this can
> only be done after the EFI variable workqueue is created, which
> occurs in a subsys_initcall(), whereas arch_ima_get_secureboot()
> is called much earlier by the IMA framework.
> 
> However, the IMA framework itself is started as a late_initcall,
> and the only reason the call to arch_ima_get_secureboot() occurs
> so early is because it happens in the context of a __setup()
> callback that parses the ima_appraise= command line parameter.
> 
> So let's refactor this code a little bit, by using a core_param()
> callback to capture the command line argument, and deferring any
> reasoning based on its contents to the IMA init routine.
> 
> Cc: Chester Lin <clin@suse.com>
> Cc: Mimi Zohar <zohar@linux.ibm.com>
> Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20200904072905.25332-2-clin@suse.com/
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v2: rebase onto series 'integrity: improve user feedback for invalid bootparams'

Thanks, Ard.  Based on my initial, limited testing on Power, it looks
good, but I'm hesistant to include it in the integrity 5.10 pull
request without it having been in linux-next and some additional
testing.  It's now queued in the next-integrity-testing branch awaiting
some tags.

thanks,

Mimi

